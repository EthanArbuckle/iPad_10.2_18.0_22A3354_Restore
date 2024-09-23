void type metadata accessor for SISchemaCallAppType(uint64_t a1)
{
  sub_2144E4B70(a1, &qword_254D78BC0);
}

void type metadata accessor for SISchemaCallState(uint64_t a1)
{
  sub_2144E4B70(a1, &qword_254D78BC8);
}

void type metadata accessor for SISchemaCallType(uint64_t a1)
{
  sub_2144E4B70(a1, &qword_254D78BD0);
}

void type metadata accessor for SICSchemaSICParticipantCountBucket(uint64_t a1)
{
  sub_2144E4B70(a1, &qword_254D78BD8);
}

void type metadata accessor for TUConversationAVMode(uint64_t a1)
{
  sub_2144E4B70(a1, (unint64_t *)&unk_254D78BE0);
}

void sub_2144E4B70(uint64_t a1, unint64_t *a2)
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

uint64_t SICCall.isMuted.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t SICCall.mediaType.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_1(*(unsigned int *)(v0 + 4));
}

unint64_t SICCall.status.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_1(*(unsigned int *)(v0 + 12));
}

unint64_t SICCall.providerType.getter()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_1(*(unsigned int *)(v0 + 28));
}

uint64_t SICCall.init(isMuted:mediaType:status:participantCount:providerType:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_BYTE *)a6 = result;
  *(_DWORD *)(a6 + 4) = a2;
  *(_BYTE *)(a6 + 8) = BYTE4(a2) & 1;
  *(_DWORD *)(a6 + 12) = a3;
  *(_BYTE *)(a6 + 16) = BYTE4(a3) & 1;
  *(_DWORD *)(a6 + 20) = a4;
  *(_BYTE *)(a6 + 24) = BYTE4(a4) & 1;
  *(_DWORD *)(a6 + 28) = a5;
  *(_BYTE *)(a6 + 32) = BYTE4(a5) & 1;
  return result;
}

uint64_t SICCall.participantCountBucket.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = sub_2144E4C60(*(unsigned int *)(v0 + 20) | ((unint64_t)*(unsigned __int8 *)(v0 + 24) << 32));
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t sub_2144E4C60(unint64_t a1)
{
  os_log_type_t v1;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  if ((a1 & 0x100000000) == 0)
  {
    if ((int)a1 > 20)
    {
      v3 = 6;
      return v3 | ((HIDWORD(a1) & 1) << 32);
    }
    if ((int)a1 > 10)
    {
      v3 = 5;
      return v3 | ((HIDWORD(a1) & 1) << 32);
    }
    if ((int)a1 > 5)
    {
      v3 = 4;
      return v3 | ((HIDWORD(a1) & 1) << 32);
    }
    if ((int)a1 > 2)
    {
      v3 = 3;
      return v3 | ((HIDWORD(a1) & 1) << 32);
    }
    if ((_DWORD)a1 == 2)
    {
      v3 = 2;
      return v3 | ((HIDWORD(a1) & 1) << 32);
    }
    if ((_DWORD)a1 == 1)
    {
      v3 = 1;
      return v3 | ((HIDWORD(a1) & 1) << 32);
    }
    if ((a1 & 0x80000000) != 0)
    {
      if (qword_254D78B58 != -1)
        swift_once();
      v5 = OUTLINED_FUNCTION_4();
      v6 = OUTLINED_FUNCTION_3(v5, (uint64_t)qword_254D78FB0);
      v7 = sub_2144EB5E4();
      if (OUTLINED_FUNCTION_5(v7))
      {
        v8 = (uint8_t *)OUTLINED_FUNCTION_2();
        *(_DWORD *)v8 = 67109120;
        sub_2144EB620();
        _os_log_impl(&dword_2144E3000, v6, v1, "Unknown participantCount=%d", v8, 8u);
        OUTLINED_FUNCTION_0();
      }

    }
  }
  v3 = 0;
  return v3 | ((HIDWORD(a1) & 1) << 32);
}

uint64_t sub_2144E4DB8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  char v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  int v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;

  sub_2144EB59C();
  sub_2144EB590();
  sub_2144EB578();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v5 + 8))(&v26, v4, v5);
  if (v27)
  {
    sub_2144E57DC(&v26, (uint64_t)v28);
    v6 = v29;
    v7 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7);
    if (qword_254D78B58 != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_4();
    v10 = OUTLINED_FUNCTION_3(v9, (uint64_t)qword_254D78FB0);
    v11 = sub_2144EB5D8();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)OUTLINED_FUNCTION_2();
      *(_DWORD *)v12 = 134283521;
      sub_2144EB590();
      sub_2144EB578();
      if ((swift_task_isCurrentExecutor() & 1) == 0)
        swift_task_reportUnexpectedExecutor();
      swift_release();
      *(_QWORD *)&v26 = v8;
      sub_2144EB620();
      _os_log_impl(&dword_2144E3000, v10, v11, "partcipantCount=%{private}ld", v12, 0xCu);
      OUTLINED_FUNCTION_0();
    }

    v13 = v29;
    v14 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
    v16 = sub_2144E50FC(v28);
    v17 = v29;
    v18 = v30;
    __swift_project_boxed_opaque_existential_1(v28, v29);
    v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
    result = sub_2144E53F0(v19);
    if (v8 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (v8 <= 0x7FFFFFFF)
    {
      v21 = result;
      v22 = v15 & 1;
      v23 = v29;
      v24 = v30;
      __swift_project_boxed_opaque_existential_1(v28, v29);
      v25 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v24 + 32))(v23, v24);
      LODWORD(v23) = sub_2144E5590(v25);

      *(_BYTE *)a2 = v22;
      *(_DWORD *)(a2 + 4) = v16;
      *(_BYTE *)(a2 + 8) = 0;
      *(_DWORD *)(a2 + 12) = v21;
      *(_BYTE *)(a2 + 16) = 0;
      *(_DWORD *)(a2 + 20) = v8;
      *(_BYTE *)(a2 + 24) = 0;
      *(_DWORD *)(a2 + 28) = v23;
      *(_BYTE *)(a2 + 32) = 0;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      return swift_release();
    }
    __break(1u);
  }
  else
  {
    sub_2144E582C((uint64_t)&v26, &qword_254D78C50);
    result = swift_release();
    *(_BYTE *)a2 = 2;
    *(_DWORD *)(a2 + 4) = 0;
    *(_BYTE *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 12) = 0;
    *(_BYTE *)(a2 + 16) = 0;
    *(_DWORD *)(a2 + 20) = 0;
    *(_BYTE *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = 0;
    *(_BYTE *)(a2 + 32) = 0;
  }
  return result;
}

uint64_t sub_2144E50FC(_QWORD *a1)
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
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36;

  v2 = a1[3];
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v3 + 48))(&v31, v2, v3);
  if (!v32)
  {
    sub_2144E582C((uint64_t)&v31, (uint64_t *)&unk_254D78C58);
    v21 = a1[3];
    v22 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v21);
    v23 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 32))(v21, v22);
    LODWORD(v22) = objc_msgSend(v23, sel_supportsAudioAndVideo);
    v24 = objc_msgSend(v23, sel_supportsAudioOnly);
    v25 = v24;
    if (!(_DWORD)v22)
    {

      return (uint64_t)v25;
    }
    if ((_DWORD)v24)
    {
      v26 = a1[3];
      v27 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v26);
      v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 40))(v26, v27);

      if ((v28 & 1) != 0)
        return 2;
      else
        return 1;
    }

    return 2;
  }
  sub_2144E57DC(&v31, (uint64_t)v34);
  v4 = v35;
  v5 = v36;
  __swift_project_boxed_opaque_existential_1(v34, v35);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  if (v6 == 2)
  {
    OUTLINED_FUNCTION_6(2, v7, v8, v9, v10, v11, v12);
    return 2;
  }
  if (v6 == 1)
  {
    OUTLINED_FUNCTION_6(1, v7, v8, v9, v10, v11, v12);
    return 1;
  }
  else
  {
    if (v6)
    {
      if (qword_254D78B58 != -1)
        swift_once();
      v13 = OUTLINED_FUNCTION_4();
      __swift_project_value_buffer(v13, (uint64_t)qword_254D78FB0);
      sub_2144E5868((uint64_t)v34, (uint64_t)&v31);
      v14 = sub_2144EB4C4();
      v15 = sub_2144EB5E4();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)OUTLINED_FUNCTION_2();
        v30 = OUTLINED_FUNCTION_2();
        *(_DWORD *)v16 = 136315138;
        v17 = v32;
        v18 = v33;
        __swift_project_boxed_opaque_existential_1(&v31, v32);
        (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
        type metadata accessor for TUConversationAVMode(0);
        v19 = sub_2144EB53C();
        sub_2144EA53C(v19, v20, &v30);
        sub_2144EB620();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
        _os_log_impl(&dword_2144E3000, v14, v15, "Unknown TUConversationAVMode encountered avMode=%s", v16, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);

    }
    OUTLINED_FUNCTION_6(v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
}

uint64_t sub_2144E53F0(uint64_t a1)
{
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  v2 = a1;
  switch((int)a1)
  {
    case 0:
      if (qword_254D78B58 != -1)
        swift_once();
      v3 = OUTLINED_FUNCTION_4();
      v4 = OUTLINED_FUNCTION_3(v3, (uint64_t)qword_254D78FB0);
      v5 = sub_2144EB5E4();
      if (OUTLINED_FUNCTION_5(v5))
      {
        v6 = (uint8_t *)OUTLINED_FUNCTION_2();
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_2144E3000, v4, v1, "Encountered callStatus=idle mapping to disconnected", v6, 2u);
        OUTLINED_FUNCTION_0();
      }

      goto LABEL_16;
    case 1:
      return v2;
    case 2:
      v2 = 5;
      break;
    case 3:
      v2 = 4;
      break;
    case 4:
      v2 = 3;
      break;
    case 5:
      if (qword_254D78B58 != -1)
        swift_once();
      v7 = OUTLINED_FUNCTION_4();
      v8 = OUTLINED_FUNCTION_3(v7, (uint64_t)qword_254D78FB0);
      v9 = sub_2144EB5D8();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)OUTLINED_FUNCTION_2();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_2144E3000, v8, v9, "Encountered callStatus=disconnecting mapping to connected", v10, 2u);
        OUTLINED_FUNCTION_0();
      }

      v2 = 1;
      break;
    case 6:
LABEL_16:
      v2 = 2;
      break;
    default:
      v2 = 0;
      break;
  }
  return v2;
}

uint64_t sub_2144E5590(void *a1)
{
  if (!objc_msgSend(a1, sel_isSystemProvider))
    return 3;
  if ((objc_msgSend(a1, sel_isFaceTimeProvider) & 1) != 0)
    return 2;
  return (uint64_t)objc_msgSend(a1, sel_isTelephonyProvider);
}

uint64_t SICSchemaSICParticipantCountBucket.debugDescription.getter(int a1)
{
  uint64_t result;

  result = 50;
  switch(a1)
  {
    case 1:
      result = 49;
      break;
    case 2:
      return result;
    case 3:
      result = 3484979;
      break;
    case 4:
      result = 808529206;
      break;
    case 5:
      result = 0x30322D3131;
      break;
    case 6:
      result = 3158590;
      break;
    default:
      result = 63;
      break;
  }
  return result;
}

uint64_t sub_2144E5678()
{
  int *v0;

  return SICSchemaSICParticipantCountBucket.debugDescription.getter(*v0);
}

uint64_t initializeBufferWithCopyOfBuffer for SICCall(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy33_4(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for SICCall(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && a1[33])
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *a1;
      if (v3 >= 2)
        v2 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
      else
        v2 = -2;
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

uint64_t storeEnumTagSinglePayload for SICCall(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SICCall()
{
  return &type metadata for SICCall;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199D05D0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2144E57DC(__int128 *a1, uint64_t a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
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

uint64_t sub_2144E582C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2144E5868(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x2199D0648);
}

unint64_t OUTLINED_FUNCTION_1@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 v1;

  return a1 | ((unint64_t)v1 << 32);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_2144EB4C4();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_2144EB4DC();
}

BOOL OUTLINED_FUNCTION_5(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

uint64_t sub_2144E5908(uint64_t a1)
{
  return sub_2144E5920(a1, MEMORY[0x24BE9AF18]);
}

uint64_t sub_2144E5914(uint64_t a1)
{
  return sub_2144E5920(a1, MEMORY[0x24BE9AED0]);
}

uint64_t sub_2144E5920(uint64_t a1, unsigned int *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v4 = OUTLINED_FUNCTION_3_0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *a2, v4);
  v8 = v2 + qword_253F0F870;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  swift_endAccess();
  v9 = sub_2144EB428();
  sub_2144E59EC(v9, v10);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2144E59EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  _QWORD *v6;

  v5 = (void *)sub_2144EB41C();
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  static ButterflyCallStateManager.isUserOnACall(_:_:completion:)(v5, a1, a2, (uint64_t)sub_2144E64B4, (uint64_t)v6);
  swift_unknownObjectRelease();
  return swift_release();
}

void sub_2144E5A7C(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  int v28;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0F840);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2144EB50C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(a2 + qword_253F0F860) = a1;
  if (qword_253F0F800 != -1)
    swift_once();
  v14 = sub_2144EB4DC();
  __swift_project_value_buffer(v14, (uint64_t)qword_253F0F890);
  v15 = sub_2144EB4C4();
  v16 = sub_2144EB5D8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v27 = v11;
    v18 = v10;
    v19 = v9;
    v20 = a2;
    v21 = a3;
    v22 = v17;
    *(_DWORD *)v17 = 67109120;
    v28 = a1 & 1;
    sub_2144EB620();
    _os_log_impl(&dword_2144E3000, v15, v16, "Phone call state retrieved: %{BOOL}d", v22, 8u);
    v23 = v22;
    a3 = v21;
    a2 = v20;
    v9 = v19;
    v10 = v18;
    v11 = v27;
    MEMORY[0x2199D0648](v23, -1, -1);
  }

  if ((a1 & 1) != 0)
  {
    sub_2144EB4F4();
    v24 = sub_2144EB500();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v25 = sub_2144EB5B4();
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v25);
    v26 = (_QWORD *)swift_allocObject();
    v26[2] = 0;
    v26[3] = 0;
    v26[4] = a2;
    v26[5] = a3;
    v26[6] = a4;
    v26[7] = v24;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_2144E5E4C((uint64_t)v9, (uint64_t)&unk_254D78C80, (uint64_t)v26);
    swift_release();
  }
}

uint64_t sub_2144E5CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  return swift_task_switch();
}

uint64_t sub_2144E5CF4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = qword_253F0F868;
  sub_2144EB59C();
  *(_QWORD *)(v0 + 56) = sub_2144EB590();
  sub_2144EB578();
  return swift_task_switch();
}

uint64_t sub_2144E5D68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 16);
  swift_release();
  sub_2144E4DB8((_QWORD *)(v2 + v1), v0 + 64);
  return swift_task_switch();
}

uint64_t sub_2144E5DC0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  char v5;
  int v6;
  char v7;
  int v8;
  char v9;
  int v10;
  char v11;
  unsigned __int8 v13[4];
  int v14;
  char v15;
  int v16;
  char v17;
  int v18;
  char v19;
  int v20;
  char v21;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_DWORD *)(v0 + 68);
  v5 = *(_BYTE *)(v0 + 72);
  v6 = *(_DWORD *)(v0 + 76);
  v7 = *(_BYTE *)(v0 + 80);
  v8 = *(_DWORD *)(v0 + 84);
  v9 = *(_BYTE *)(v0 + 88);
  v10 = *(_DWORD *)(v0 + 92);
  v11 = *(_BYTE *)(v0 + 96);
  v13[0] = *(_BYTE *)(v0 + 64);
  v14 = v4;
  v15 = v5;
  v16 = v6;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  SiriInCallInstrumentationUtil.logInvocationContext(occurringFor:at:callMetadata:)(v3, v1, v2, v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2144E5E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2144EB5B4();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2144E65C4(a1);
  }
  else
  {
    sub_2144EB5A8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2144EB578();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_2144E5F88(Swift::String endedFor, char a2)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  int v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  object = endedFor._object;
  countAndFlagsBits = endedFor._countAndFlagsBits;
  v5 = *(unsigned __int8 *)(v2 + qword_253F0F860);
  if (v5 == 2)
  {
    if (qword_253F0F800 != -1)
      swift_once();
    v6 = sub_2144EB4DC();
    __swift_project_value_buffer(v6, (uint64_t)qword_253F0F890);
    swift_bridgeObjectRetain_n();
    v7 = sub_2144EB4C4();
    v8 = sub_2144EB5E4();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      *(_DWORD *)v9 = 136315138;
      swift_bridgeObjectRetain();
      sub_2144EA53C(countAndFlagsBits, (unint64_t)object, &v10);
      sub_2144EB620();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2144E3000, v7, v8, "Phone call state unknown at time of request completion requestId=%s", v9, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    swift_bridgeObjectRelease_n();
  }
  else if ((v5 & 1) != 0)
  {
    SiriInCallInstrumentationUtil.logInvocationContext(endedFor:isCancelled:)(endedFor, a2 & 1);
  }
}

void ButterflyRequestProcessor.__allocating_init(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

void ButterflyRequestProcessor.init(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

void ButterflyRequestProcessor.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

void ButterflyRequestProcessor.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootRequestId:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

void ButterflyRequestProcessor.__allocating_init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

void ButterflyRequestProcessor.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

uint64_t sub_2144E623C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_253F0F870;
  v2 = OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1(v0 + qword_253F0F868);
}

uint64_t ButterflyRequestProcessor.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_2144EB434();
  v1 = v0 + qword_253F0F870;
  v2 = OUTLINED_FUNCTION_3_0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + qword_253F0F868);
  return v0;
}

uint64_t ButterflyRequestProcessor.__deallocating_deinit()
{
  ButterflyRequestProcessor.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ButterflyRequestProcessor()
{
  uint64_t result;

  result = qword_253F0F7C0;
  if (!qword_253F0F7C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2144E6354()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2144EB404();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ButterflyRequestProcessor()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2144E63F4()
{
  return type metadata accessor for ButterflyRequestProcessor();
}

uint64_t sub_2144E63FC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2144E6460;
  return v6(a1);
}

uint64_t sub_2144E6460()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  return OUTLINED_FUNCTION_2_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2144E6488()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2144E64B4(char a1)
{
  uint64_t *v1;

  sub_2144E5A7C(a1, v1[2], v1[3], v1[4]);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2144E64CC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2144E6500(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_2144E658C;
  return sub_2144E5CD8(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_2144E658C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_2144E65C4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0F840);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2144E6604()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2144E6628(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2144E6698;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254D78C88 + dword_254D78C88))(a1, v4);
}

uint64_t sub_2144E6698()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  return OUTLINED_FUNCTION_2_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_2144EB404();
}

double sub_2144E66F8@<D0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  id v4;
  double result;

  v3 = objc_msgSend(v1, sel_frontmostAudioOrVideoCall);
  if (v3)
  {
    v4 = v3;
    *(_QWORD *)(a1 + 24) = sub_2144E6C4C(0, &qword_254D78CC0);
    *(_QWORD *)(a1 + 32) = &off_24D1A5E78;
    *(_QWORD *)a1 = v4;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

double sub_2144E676C@<D0>(uint64_t a1@<X8>)
{
  return sub_2144E66F8(a1);
}

char *sub_2144E678C()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v1 = v0;
  if (objc_msgSend(v0, sel_isConversation))
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v3 = objc_msgSend(v2, sel_activeConversationForCall_, v0);

    if (v3)
    {
      v4 = objc_msgSend(v3, sel_activeRemoteParticipants);
      sub_2144E6C4C(0, &qword_254D78CB0);
      sub_2144E6C0C(&qword_254D78CB8, &qword_254D78CB0);
      v5 = sub_2144EB5CC();

      v1 = (char *)sub_2144E69DC(v5);
      swift_bridgeObjectRelease();

      result = v1 + 1;
      if (!__OFADD__(v1, 1))
        return result;
      __break(1u);
    }
  }
  if (qword_254D78B58 != -1)
    swift_once();
  v7 = sub_2144EB4DC();
  __swift_project_value_buffer(v7, (uint64_t)qword_254D78FB0);
  v8 = sub_2144EB4C4();
  v9 = sub_2144EB5E4();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2144E3000, v8, v9, "Call not backed by conversation.  Using alternate partcipantCount method.", v10, 2u);
    MEMORY[0x2199D0648](v10, -1, -1);
  }

  v11 = objc_msgSend(v1, sel_remoteParticipantHandles);
  sub_2144E6C4C(0, &qword_254D78CA0);
  sub_2144E6C0C(&qword_254D78CA8, &qword_254D78CA0);
  v12 = sub_2144EB5CC();

  v13 = sub_2144E69DC(v12);
  swift_bridgeObjectRelease();
  result = (char *)(v13 + 1);
  if (__OFADD__(v13, 1))
    __break(1u);
  return result;
}

uint64_t sub_2144E69DC(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
    return sub_2144EB638();
  else
    return *(_QWORD *)(a1 + 16);
}

double sub_2144E69FC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v3;
  id v4;
  double result;

  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_activeConversationForCall_, v1);

  if (v4)
  {
    *(_QWORD *)(a1 + 24) = sub_2144E6C4C(0, &qword_254D78C98);
    *(_QWORD *)(a1 + 32) = &off_24D1A5EB0;
    *(_QWORD *)a1 = v4;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

unint64_t sub_2144E6AA0()
{
  return (unint64_t)sub_2144E6AC4() & 1;
}

id sub_2144E6AC4()
{
  void *v0;

  return objc_msgSend(v0, sel_isUplinkMuted);
}

id sub_2144E6AE4()
{
  return sub_2144E6B04();
}

id sub_2144E6B04()
{
  void *v0;

  return objc_msgSend(v0, sel_status);
}

char *sub_2144E6B14()
{
  return sub_2144E678C();
}

id sub_2144E6B34()
{
  return sub_2144E6B54();
}

id sub_2144E6B54()
{
  void *v0;

  return objc_msgSend(v0, sel_provider);
}

unint64_t sub_2144E6B78()
{
  return (unint64_t)sub_2144E6B9C() & 1;
}

id sub_2144E6B9C()
{
  void *v0;

  return objc_msgSend(v0, sel_isVideo);
}

double sub_2144E6BBC@<D0>(uint64_t a1@<X8>)
{
  return sub_2144E69FC(a1);
}

id sub_2144E6BDC()
{
  return sub_2144E6BFC();
}

id sub_2144E6BFC()
{
  void *v0;

  return objc_msgSend(v0, sel_avMode);
}

uint64_t sub_2144E6C0C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_2144E6C4C(255, a2);
    result = MEMORY[0x2199D05DC](MEMORY[0x24BEE5BD8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2144E6C4C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2144E6C84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_2144EB308();
  v6 = objc_msgSend(v4, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, a1, v5);

  if (v6)
  {
    sub_2144EB314();

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  v8 = sub_2144EB320();
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v8);
}

void static ButterflyCallStateManager.isUserOnACall(_:_:completion:)(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t inited;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t aBlock[6];

  if (qword_253F0F800 != -1)
    swift_once();
  v9 = sub_2144EB4DC();
  __swift_project_value_buffer(v9, (uint64_t)qword_253F0F890);
  swift_bridgeObjectRetain_n();
  v10 = sub_2144EB4C4();
  v11 = sub_2144EB5D8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    swift_bridgeObjectRetain();
    sub_2144EA53C(a2, a3, aBlock);
    sub_2144EB620();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2144E3000, v10, v11, "Fetching isUserOnACall status for requestId: %s", v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  swift_bridgeObjectRelease_n();
  if ((objc_msgSend(a1, sel_respondsToSelector_, sel_fetchContextsForKeys_forRequestID_includesNearbyDevices_completion_) & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0F830);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2144EBC80;
    *(_QWORD *)(inited + 32) = sub_2144EB530();
    *(_QWORD *)(inited + 40) = v14;
    swift_unknownObjectRetain();
    sub_2144E76F4(inited);
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = a2;
    v15[3] = a3;
    v15[4] = a4;
    v15[5] = a5;
    swift_bridgeObjectRetain();
    swift_retain();
    v16 = (void *)sub_2144EB5C0();
    v17 = (void *)sub_2144EB524();
    aBlock[4] = (uint64_t)sub_2144E78EC;
    aBlock[5] = (uint64_t)v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2144E72B4;
    aBlock[3] = (uint64_t)&block_descriptor;
    v18 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_fetchContextsForKeys_forRequestID_includesNearbyDevices_completion_, v16, v17, 0, v18);
    _Block_release(v18);
    swift_bridgeObjectRelease();
    swift_release();
    swift_unknownObjectRelease();

  }
}

uint64_t static ButterflyCallStateManager.isUserOnACall(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2144E705C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;

  v1 = *(_QWORD *)(v0 + 32);
  v5 = *(_OWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v5;
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_2144E7114;
  return sub_2144EB6B0();
}

uint64_t sub_2144E7114()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2144E7170()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 56));
}

uint64_t sub_2144E717C(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D78CD0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  static ButterflyCallStateManager.isUserOnACall(_:_:completion:)(a2, a3, a4, (uint64_t)sub_2144E7990, v12);
  return swift_release();
}

uint64_t sub_2144E7274()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D78CD0);
  return sub_2144EB584();
}

uint64_t sub_2144E72B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  v2 = a2;
  v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    sub_2144E79D0();
    v2 = sub_2144EB56C();
  }
  swift_retain();
  v3(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2144E7314(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(BOOL))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _BOOL4 v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];
  BOOL v29;

  if (!a1)
    goto LABEL_12;
  v8 = a1 & 0xFFFFFFFFFFFFFF8;
  if (!(a1 >> 62))
  {
    v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_4;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  result = sub_2144EB698();
  if (!result)
  {
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    v26 = 0u;
    v27 = 0u;
    goto LABEL_13;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v11 = (id)MEMORY[0x2199D0348](0, a1);
  }
  else
  {
    if (!*(_QWORD *)(v8 + 16))
    {
      __break(1u);
      return result;
    }
    v11 = *(id *)(a1 + 32);
  }
  v12 = v11;
  swift_bridgeObjectRelease();
  v13 = sub_2144E7B90(v12);
  if (!v13)
    goto LABEL_12;
  v14 = v13;
  v15 = sub_2144EB530();
  sub_2144E763C(v15, v16, v14, &v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v27 + 1))
  {
LABEL_13:
    sub_2144E7A0C((uint64_t)&v26);
    v29 = 0;
    goto LABEL_14;
  }
  sub_2144E7C04(&v26, v28);
  sub_2144E7C14((uint64_t)v28, (uint64_t)&v26);
  v17 = objc_allocWithZone(MEMORY[0x24BE09120]);
  v18 = sub_2144E768C(&v26);
  v19 = objc_msgSend(v18, sel_callState);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  v29 = v19 != 0;
LABEL_14:
  if (qword_253F0F800 != -1)
    swift_once();
  v20 = sub_2144EB4DC();
  __swift_project_value_buffer(v20, (uint64_t)qword_253F0F890);
  v21 = v29;
  swift_bridgeObjectRetain_n();
  v22 = sub_2144EB4C4();
  v23 = sub_2144EB5D8();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    *(_QWORD *)&v28[0] = v25;
    *(_DWORD *)v24 = 67109378;
    LODWORD(v26) = v21;
    sub_2144EB620();
    *(_WORD *)(v24 + 8) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v26 = sub_2144EA53C(a2, a3, (uint64_t *)v28);
    sub_2144EB620();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2144E3000, v22, v23, "Retrieved isUserOnACall status: %{BOOL}d for requestId: %s", (uint8_t *)v24, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x2199D0648](v25, -1, -1);
    MEMORY[0x2199D0648](v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  return a4(v29);
}

double sub_2144E763C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_2144E7A4C(a1, a2), (v7 & 1) != 0))
  {
    sub_2144E7C14(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

id sub_2144E768C(_QWORD *a1)
{
  void *v1;
  id v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v3 = objc_msgSend(v1, sel_initWithSerializedBackingStore_, sub_2144EB6BC());
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_2144E76F4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F0F828);
  result = sub_2144EB644();
  v3 = result;
  v24 = *(_QWORD *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  v4 = 0;
  v5 = result + 56;
  while (v4 < *(_QWORD *)(a1 + 16))
  {
    v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    v8 = *v6;
    v7 = v6[1];
    sub_2144EB6D4();
    swift_bridgeObjectRetain();
    sub_2144EB548();
    result = sub_2144EB6EC();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = result & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = *(_QWORD *)(v3 + 48);
      v15 = (_QWORD *)(v14 + 16 * v10);
      v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (result = sub_2144EB6C8(), (result & 1) != 0))
      {
LABEL_11:
        result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      v17 = ~v9;
      while (1)
      {
        v10 = (v10 + 1) & v17;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          result = sub_2144EB6C8();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_11;
      }
    }
    *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
    v20 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    *v20 = v8;
    v20[1] = v7;
    v21 = *(_QWORD *)(v3 + 16);
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24)
      goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2144E78C0()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2144E78EC(unint64_t a1)
{
  uint64_t v1;

  return sub_2144E7314(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(uint64_t (**)(BOOL))(v1 + 32));
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

uint64_t sub_2144E7910(uint64_t a1)
{
  uint64_t v1;

  return sub_2144E717C(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

ValueMetadata *type metadata accessor for ButterflyCallStateManager()
{
  return &type metadata for ButterflyCallStateManager;
}

uint64_t sub_2144E792C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D78CD0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2144E7990()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D78CD0);
  return sub_2144E7274();
}

unint64_t sub_2144E79D0()
{
  unint64_t result;

  result = qword_253F0F810;
  if (!qword_253F0F810)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F0F810);
  }
  return result;
}

uint64_t sub_2144E7A0C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F0F838);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2144E7A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2144EB6D4();
  sub_2144EB548();
  v4 = sub_2144EB6EC();
  return sub_2144E7AB0(a1, a2, v4);
}

unint64_t sub_2144E7AB0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2144EB6C8() & 1) == 0)
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
      while (!v14 && (sub_2144EB6C8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2144E7B90(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_serializedContextByKey);

  if (!v2)
    return 0;
  v3 = sub_2144EB518();

  return v3;
}

_OWORD *sub_2144E7C04(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2144E7C14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void ButterflyBridge.__allocating_init(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  swift_allocObject();
  ButterflyBridge.init(_:_:_:_:_:)(a1, a2, a3, a4, a5, a6);
}

void ButterflyBridge.init(_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[40];
  _BYTE v22[40];

  v10 = sub_2144EB4DC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_4_0();
  v14 = v13 - v12;
  v15 = sub_2144EB4B8();
  v19 = *(_QWORD *)(v15 - 8);
  v20 = v15;
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_5_0();
  sub_2144E7EA4();
  sub_2144EB47C();
  sub_2144E5868(a3, (uint64_t)v22);
  sub_2144E5868(a6, (uint64_t)v21);
  v16 = qword_253F0F800;
  swift_unknownObjectRetain();
  v17 = a5;
  if (v16 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v10, (uint64_t)qword_253F0F890);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v14, v18, v10);
  sub_2144EB44C();
  swift_retain();
  sub_2144E7EE0();
  sub_2144EB464();
  swift_unknownObjectRelease();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a6);
  __swift_destroy_boxed_opaque_existential_1(a3);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v6, v20);
  OUTLINED_FUNCTION_1_1();
}

unint64_t sub_2144E7EA4()
{
  unint64_t result;

  result = qword_253F0F7B8;
  if (!qword_253F0F7B8)
  {
    result = MEMORY[0x2199D05DC](&unk_2144EBCE4, &type metadata for ButterflyBridgeLog);
    atomic_store(result, (unint64_t *)&qword_253F0F7B8);
  }
  return result;
}

uint64_t sub_2144E7EE0()
{
  sub_2144EB3BC();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB3B0();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB35C();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB368();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB350();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB3EC();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB3D4();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB3A4();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB398();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB38C();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB338();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB344();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB380();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB3C8();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB3E0();
  OUTLINED_FUNCTION_0_1();
  sub_2144EB374();
  return sub_2144EB440();
}

uint64_t (*sub_2144E8070())(void *a1)
{
  swift_retain();
  return sub_2144E8B28;
}

uint64_t (*sub_2144E80A4())(void *a1)
{
  swift_retain();
  return sub_2144E8BC8;
}

uint64_t sub_2144E80D4(void *a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_2144EB404();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_4_0();
  v10 = v9 - v8;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v9 - v8, *a3, v6);
  sub_2144E85BC(v10, a1, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t (*sub_2144E8174())(void *a1)
{
  swift_retain();
  return sub_2144E8BA8;
}

uint64_t (*sub_2144E81A8())(void *a1)
{
  swift_retain();
  return sub_2144E8B48;
}

uint64_t (*sub_2144E81DC())(void *a1)
{
  swift_retain();
  return sub_2144E8B88;
}

uint64_t (*sub_2144E8210())(void *a1)
{
  swift_retain();
  return sub_2144E8B68;
}

uint64_t (*sub_2144E8244())()
{
  swift_retain();
  return sub_2144E8B20;
}

uint64_t sub_2144E8274()
{
  Swift::String v1;

  v1._countAndFlagsBits = sub_2144EB428();
  sub_2144E5F88(v1, 1);
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2144E82A8())()
{
  swift_retain();
  return sub_2144E8B08;
}

uint64_t sub_2144E82DC()
{
  Swift::String v1;

  v1._countAndFlagsBits = sub_2144EB428();
  sub_2144E5F88(v1, 0);
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2144E830C())(uint64_t)
{
  swift_retain();
  return sub_2144E8B04;
}

uint64_t (*sub_2144E8340())(uint64_t)
{
  swift_retain();
  return sub_2144E8B00;
}

uint64_t (*sub_2144E8374())()
{
  swift_retain();
  return sub_2144E8AF8;
}

void sub_2144E83A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[40];

  v10 = sub_2144EB320();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5_0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v5, a3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = sub_2144EB4AC();
  v14 = v13;
  sub_2144EB4A0();
  v15 = sub_2144EB494();
  v16 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (qword_253F0F698 != -1)
    swift_once();
  v17 = qword_253F0F6D0;
  type metadata accessor for ButterflyRequestProcessor();
  v18 = swift_allocObject();
  swift_retain();
  sub_2144E8880(a1, a2, v5, a4, a5, 0, 0xE000000000000000, v12, v14, (uint64_t)v20, v15, (uint64_t)v16, v17, v18);
  OUTLINED_FUNCTION_1_1();
}

void ButterflyBridge.__allocating_init(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

void ButterflyBridge.init(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

void ButterflyBridge.__allocating_init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

void ButterflyBridge.init(withName:messagePublisher:serviceHelper:bridgeQueue:conversationSessionsManaging:autoRegisterStartRequestMessageBase:logger:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

uint64_t ButterflyBridge.__deallocating_deinit()
{
  _s10SiriInCall15ButterflyBridgeCfd_0();
  return swift_deallocClassInstance();
}

uint64_t sub_2144E85BC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24[3];

  v6 = sub_2144EB404();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_4_0();
  v10 = v9 - v8;
  if (qword_253F0F800 != -1)
    swift_once();
  v11 = sub_2144EB4DC();
  __swift_project_value_buffer(v11, (uint64_t)qword_253F0F890);
  v12 = a2;
  v13 = sub_2144EB4C4();
  v14 = sub_2144EB5D8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = OUTLINED_FUNCTION_2();
    v16 = (_QWORD *)OUTLINED_FUNCTION_2();
    v24[0] = OUTLINED_FUNCTION_2();
    *(_DWORD *)v15 = 138412546;
    v17 = v12;
    sub_2144EB620();
    *v16 = v12;

    *(_WORD *)(v15 + 12) = 2080;
    v18 = sub_2144EB3F8();
    sub_2144EA53C(v18, v19, v24);
    sub_2144EB620();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2144E3000, v13, v14, "ButterflyRequestProcessor handling message: %@, requestId: %s", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F0F818);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
  v20 = a3 + qword_253F0F870;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(v20, v10, v6);
  swift_endAccess();
  v21 = sub_2144EB3F8();
  sub_2144E59EC(v21, v22);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2144E8880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[9];
  _BYTE v26[40];
  _QWORD v27[6];

  v25[7] = a5;
  v25[8] = a8;
  v25[5] = a6;
  v25[6] = a4;
  v25[2] = a1;
  v25[3] = a2;
  v25[4] = a9;
  v25[1] = a11;
  v15 = sub_2144EB320();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_2144E8ABC();
  v27[4] = &off_24D1A5E68;
  v27[3] = v19;
  v27[0] = a12;
  v20 = a14 + qword_253F0F870;
  v21 = *MEMORY[0x24BE9AEF8];
  v22 = sub_2144EB404();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v20, v21, v22);
  *(_BYTE *)(a14 + qword_253F0F860) = 2;
  sub_2144E5868((uint64_t)v27, a14 + qword_253F0F868);
  *(_QWORD *)(a14 + qword_253F0F878) = a13;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a3, v15);
  sub_2144E5868(a10, (uint64_t)v26);
  v23 = sub_2144EB410();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1(a10);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  return v23;
}

uint64_t type metadata accessor for ButterflyBridge()
{
  uint64_t result;

  result = qword_253F0F6A0;
  if (!qword_253F0F6A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2144E8A6C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ButterflyBridge()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2144E8AB4()
{
  return type metadata accessor for ButterflyBridge();
}

unint64_t sub_2144E8ABC()
{
  unint64_t result;

  result = qword_253F0F808;
  if (!qword_253F0F808)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F0F808);
  }
  return result;
}

uint64_t sub_2144E8AF8()
{
  return sub_2144E82DC();
}

uint64_t sub_2144E8B08()
{
  return sub_2144E82DC();
}

uint64_t sub_2144E8B20()
{
  return sub_2144E8274();
}

uint64_t sub_2144E8B28(void *a1)
{
  uint64_t v1;

  return sub_2144E80D4(a1, v1, MEMORY[0x24BE9AEE0]);
}

uint64_t sub_2144E8B48(void *a1)
{
  uint64_t v1;

  return sub_2144E80D4(a1, v1, MEMORY[0x24BE9AEF8]);
}

uint64_t sub_2144E8B68(void *a1)
{
  uint64_t v1;

  return sub_2144E80D4(a1, v1, MEMORY[0x24BE9AED8]);
}

uint64_t sub_2144E8B88(void *a1)
{
  uint64_t v1;

  return sub_2144E80D4(a1, v1, MEMORY[0x24BE9AF08]);
}

uint64_t sub_2144E8BA8(void *a1)
{
  uint64_t v1;

  return sub_2144E80D4(a1, v1, MEMORY[0x24BE9AEE8]);
}

uint64_t sub_2144E8BC8(void *a1)
{
  uint64_t v1;

  return sub_2144E80D4(a1, v1, MEMORY[0x24BE9AEC0]);
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_2144EB440();
}

ValueMetadata *type metadata accessor for ButterflyBridgeLog()
{
  return &type metadata for ButterflyBridgeLog;
}

void sub_2144E8C40()
{
  qword_254D78CF0 = 0x636974796C616E41;
  *(_QWORD *)algn_254D78CF8 = 0xE900000000000073;
}

void sub_2144E8C68()
{
  qword_253F0F6B0 = 0x6C66726574747542;
  *(_QWORD *)algn_253F0F6B8 = 0xEF65676469724279;
}

uint64_t sub_2144E8C98()
{
  uint64_t result;

  sub_2144E8DA8();
  if (qword_253F0F688 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = sub_2144EB614();
  qword_253F0F858 = result;
  return result;
}

uint64_t *sub_2144E8D2C()
{
  if (qword_253F0F7B0 != -1)
    swift_once();
  return &qword_253F0F858;
}

id sub_2144E8D6C()
{
  sub_2144E8D2C();
  return (id)qword_253F0F858;
}

uint64_t sub_2144E8D8C()
{
  return sub_2144EB470();
}

unint64_t sub_2144E8DA8()
{
  unint64_t result;

  result = qword_253F0F820;
  if (!qword_253F0F820)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F0F820);
  }
  return result;
}

uint64_t sub_2144E8DE4()
{
  uint64_t v0;

  v0 = sub_2144EB4DC();
  __swift_allocate_value_buffer(v0, qword_254D78FB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D78FB0);
  if (qword_254D78B50 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_2144EB4D0();
}

uint64_t sub_2144E8E94()
{
  uint64_t v0;
  id v1;

  v0 = sub_2144EB4DC();
  __swift_allocate_value_buffer(v0, qword_253F0F890);
  __swift_project_value_buffer(v0, (uint64_t)qword_253F0F890);
  if (qword_253F0F7B0 != -1)
    swift_once();
  v1 = (id)qword_253F0F858;
  return sub_2144EB4E8();
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

uint64_t dispatch thunk of FeatureFlagging.isEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

void SiriInCallInstrumentationUtil.logInvocationContext(occurringFor:at:callMetadata:)(uint64_t a1, unint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unsigned int v14;
  int v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;

  v5 = v4;
  v10 = sub_2144EB4DC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = *a4;
  v14 = *((_DWORD *)a4 + 1);
  v15 = a4[8];
  v44 = *((_DWORD *)a4 + 3);
  v45 = v14;
  v47 = a4[16];
  v48 = v15;
  v51 = *((unsigned int *)a4 + 5);
  v16 = a4[24];
  v46 = *((_DWORD *)a4 + 7);
  v49 = a4[32];
  v50 = v16;
  if (qword_254D78B58 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v10, (uint64_t)qword_254D78FB0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v17, v10);
  swift_bridgeObjectRetain_n();
  v18 = sub_2144EB4C4();
  v19 = sub_2144EB5D8();
  if (os_log_type_enabled(v18, (os_log_type_t)v19))
  {
    v39 = v19;
    v42 = a3;
    v43 = v5;
    v20 = OUTLINED_FUNCTION_2();
    v38 = OUTLINED_FUNCTION_2();
    v54 = v38;
    *(_DWORD *)v20 = 136316418;
    swift_bridgeObjectRetain();
    v40 = a1;
    v53 = sub_2144EA53C(a1, a2, &v54);
    sub_2144EB620();
    v41 = a2;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v20 + 12) = 2080;
    v21 = 1702195828;
    if ((v52 & 1) == 0)
      v21 = 0x65736C6166;
    v22 = 0xE400000000000000;
    if ((v52 & 1) == 0)
      v22 = 0xE500000000000000;
    if (v52 == 2)
      v23 = 0;
    else
      v23 = v21;
    if (v52 == 2)
      v24 = 0xE000000000000000;
    else
      v24 = v22;
    v53 = sub_2144EA53C(v23, v24, &v54);
    sub_2144EB620();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2080;
    if ((v47 & 1) != 0)
      v25 = 0;
    else
      v25 = sub_2144EB5FC();
    v53 = OUTLINED_FUNCTION_4_1(v25);
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_9();
    *(_WORD *)(v20 + 32) = 2080;
    if ((v48 & 1) != 0)
      v26 = 0;
    else
      v26 = sub_2144EB5F0();
    v53 = OUTLINED_FUNCTION_4_1(v26);
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_9();
    *(_WORD *)(v20 + 42) = 2080;
    LOBYTE(v53) = v50;
    v27 = OUTLINED_FUNCTION_6_0(v50);
    if ((v27 & 0x100000000) != 0)
      v28 = 0;
    else
      v28 = SICSchemaSICParticipantCountBucket.debugDescription.getter(v27);
    v53 = OUTLINED_FUNCTION_4_1(v28);
    OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_9();
    *(_WORD *)(v20 + 52) = 2080;
    if ((v49 & 1) != 0)
    {
      v29 = 0;
      v30 = 0xE000000000000000;
    }
    else
    {
      v29 = sub_2144EB608();
      v30 = v31;
    }
    v32 = sub_2144EA53C(v29, v30, &v54);
    OUTLINED_FUNCTION_10(v32);
    sub_2144EB620();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2144E3000, v18, (os_log_type_t)v39, "Emitting invocation context started instrumentation. requestId=%s isMuted=%s callStatus=%s mediaType=%s participants=%s providerType=%s", (uint8_t *)v20, 0x3Eu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_5_1();
  v33 = OUTLINED_FUNCTION_3_1(objc_allocWithZone(MEMORY[0x24BE95A50]));
  if (v33)
  {
    v34 = v33;
    v35 = OUTLINED_FUNCTION_3_1(objc_allocWithZone(MEMORY[0x24BE95A60]));
    if (v35)
    {
      v36 = v35;
      if ((v47 & 1) == 0)
        objc_msgSend(v35, sel_setCallState_, v44);
      if ((v48 & 1) == 0)
        objc_msgSend(v36, sel_setCallType_, v45);
      if ((v49 & 1) == 0)
        objc_msgSend(v36, sel_setCallAppType_, v46);
      LOBYTE(v54) = v50;
      v37 = OUTLINED_FUNCTION_6_0(v50);
      if ((v37 & 0x100000000) == 0)
        objc_msgSend(v36, sel_setParticipantCountBucket_, v37);
      if (v52 != 2)
        objc_msgSend(v36, sel_setIsMuted_, v52 & 1);
      objc_msgSend(v34, sel_setStartedOrChanged_, v36);
      sub_2144E9C80(a1, a2, a3);
      sub_2144E97D8((uint64_t)v34, a1, a2, a3);

    }
    else
    {
      v36 = v34;
    }

  }
  OUTLINED_FUNCTION_1_1();
}

Swift::Void __swiftcall SiriInCallInstrumentationUtil.logInvocationContext(endedFor:isCancelled:)(Swift::String endedFor, Swift::Bool isCancelled)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  char **v18;
  id v19;
  uint64_t v20;
  char *v21;
  _BOOL4 v22;
  int v23;
  uint64_t v24;

  v22 = isCancelled;
  object = endedFor._object;
  countAndFlagsBits = endedFor._countAndFlagsBits;
  v4 = sub_2144EB50C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254D78B58 != -1)
    swift_once();
  v8 = sub_2144EB4DC();
  __swift_project_value_buffer(v8, (uint64_t)qword_254D78FB0);
  swift_bridgeObjectRetain_n();
  v9 = sub_2144EB4C4();
  v10 = sub_2144EB5D8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = OUTLINED_FUNCTION_2();
    v12 = OUTLINED_FUNCTION_2();
    v21 = v7;
    v24 = v12;
    *(_DWORD *)v11 = 136315394;
    swift_bridgeObjectRetain();
    v13 = sub_2144EA53C(countAndFlagsBits, (unint64_t)object, &v24);
    OUTLINED_FUNCTION_10(v13);
    sub_2144EB620();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 1024;
    v23 = v22;
    sub_2144EB620();
    _os_log_impl(&dword_2144E3000, v9, v10, "Emitting invocation context ended instrumentation. requestId=%s isCancelled=%{BOOL}d", (uint8_t *)v11, 0x12u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  swift_bridgeObjectRelease_n();
  v14 = OUTLINED_FUNCTION_3_1(objc_allocWithZone(MEMORY[0x24BE95A50]));
  if (v14)
  {
    v15 = v14;
    if (v22)
    {
      v16 = OUTLINED_FUNCTION_3_1(objc_allocWithZone(MEMORY[0x24BE95A48]));
      if (v16)
      {
        v17 = v16;
        v18 = &selRef_setCancelled_;
LABEL_11:
        objc_msgSend(v17, sel_setExists_, 1);
        objc_msgSend(v15, *v18, v17);

        sub_2144EB4F4();
        v20 = sub_2144EB500();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        sub_2144E97D8((uint64_t)v15, countAndFlagsBits, (unint64_t)object, v20);
      }
    }
    else
    {
      v19 = OUTLINED_FUNCTION_3_1(objc_allocWithZone(MEMORY[0x24BE95A58]));
      if (v19)
      {
        v17 = v19;
        v18 = &selRef_setEnded_;
        goto LABEL_11;
      }
    }

  }
  OUTLINED_FUNCTION_1_1();
}

uint64_t sub_2144E96C4()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t result;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_sharedStream);
  v2 = objc_msgSend(v0, sel_sharedAnalytics);
  v3 = objc_msgSend(v2, sel_defaultMessageStream);

  type metadata accessor for SiriInCallInstrumentationUtil();
  result = OUTLINED_FUNCTION_11();
  *(_QWORD *)(result + 16) = v1;
  *(_QWORD *)(result + 24) = v3;
  qword_253F0F6D0 = result;
  return result;
}

uint64_t static SiriInCallInstrumentationUtil.sharedInstance.getter()
{
  if (qword_253F0F698 != -1)
    swift_once();
  return swift_retain();
}

uint64_t SiriInCallInstrumentationUtil.__allocating_init(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_11();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t SiriInCallInstrumentationUtil.init(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

void sub_2144E97D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v36 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0F678);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v34 - v10;
  v12 = sub_2144EB320();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v34 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v34 - v20;
  sub_2144EB2FC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_2144EACDC((uint64_t)v11);
    if (qword_254D78B58 != -1)
      swift_once();
    v22 = sub_2144EB4DC();
    __swift_project_value_buffer(v22, (uint64_t)qword_254D78FB0);
    swift_bridgeObjectRetain_n();
    v23 = sub_2144EB4C4();
    v24 = sub_2144EB5E4();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v39 = v26;
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      v38 = sub_2144EA53C(a2, a3, &v39);
      sub_2144EB620();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2144E3000, v23, v24, "RequestId=%s isn't in the right format of a uuid string", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D0648](v26, -1, -1);
      MEMORY[0x2199D0648](v25, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    v35 = a4;
    v27 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v27(v21, v11, v12);
    v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95A38]), sel_init);
    if (v28)
    {
      v29 = v28;
      v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95A40]), sel_init);
      if (v30)
      {
        v31 = v30;
        sub_2144E6C84(29, (uint64_t)v9);
        if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v12) == 1)
        {
          (*(void (**)(char *, uint64_t))(v13 + 8))(v21, v12);

          sub_2144EACDC((uint64_t)v9);
        }
        else
        {
          v27(v19, v9, v12);
          sub_2144EAD1C();
          (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v19, v12);
          v32 = sub_2144E9C04((uint64_t)v16);
          objc_msgSend(v31, sel_setSicId_, v32);

          objc_msgSend(v29, sel_setEventMetadata_, v31);
          objc_msgSend(v29, sel_setSiriInCallInvocationContext_, v36);
          objc_msgSend(*(id *)(v37 + 16), sel_emitMessage_timestamp_, v29, v35);

          v33 = *(void (**)(char *, uint64_t))(v13 + 8);
          v33(v19, v12);
          v33(v21, v12);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v13 + 8))(v21, v12);

      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v21, v12);
    }
  }
}

id sub_2144E9C04(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_2144EB308();
  v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  v5 = sub_2144EB320();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void sub_2144E9C80(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  int EnumTagSinglePayload;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  int v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t *v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  unint64_t v58;
  unint64_t v59;
  os_log_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  id v66;
  uint8_t *v67;
  uint8_t *v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  os_log_t v71;
  uint8_t *v72;
  uint8_t *v73;
  int v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0F678);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v70 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v70 - v10;
  v12 = sub_2144EB320();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v70 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v70 - v20;
  sub_2144EB2FC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12) == 1)
  {
    sub_2144EACDC((uint64_t)v11);
    if (qword_254D78B58 != -1)
      swift_once();
    v22 = sub_2144EB4DC();
    __swift_project_value_buffer(v22, (uint64_t)qword_254D78FB0);
    swift_bridgeObjectRetain_n();
    v23 = sub_2144EB4C4();
    v24 = sub_2144EB5E4();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v83 = v26;
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      v82 = sub_2144EA53C(a1, a2, &v83);
      sub_2144EB620();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2144E3000, v23, v24, "RequestId=%s isn't in the right format of a uuid string", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199D0648](v26, -1, -1);
      MEMORY[0x2199D0648](v25, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return;
  }
  v79 = a3;
  v27 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v27(v21, v11, v12);
  sub_2144E6C84(29, (uint64_t)v9);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v12);
  v80 = v13;
  if (EnumTagSinglePayload != 1)
  {
    v27(v19, v9, v12);
    sub_2144EAD1C();
    v34 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v34(v16, v19, v12);
    v35 = sub_2144E9C04((uint64_t)v16);
    v34(v16, v21, v12);
    v36 = sub_2144E9C04((uint64_t)v16);
    v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B60]), sel_init);
    if (v37)
    {
      v38 = v37;
      v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B68]), sel_init);
      if (v39)
      {
        v40 = v39;
        v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B68]), sel_init);
        if (v41)
        {
          v42 = v41;
          v78 = v35;
          objc_msgSend(v40, sel_setUuid_, v35);
          objc_msgSend(v40, sel_setComponent_, 29);
          objc_msgSend(v38, sel_setSource_, v40);
          v77 = v36;
          objc_msgSend(v42, sel_setUuid_, v36);
          objc_msgSend(v42, sel_setComponent_, 1);
          v76 = v42;
          objc_msgSend(v38, sel_setTarget_, v42);
          if (qword_254D78B58 != -1)
            swift_once();
          v43 = sub_2144EB4DC();
          __swift_project_value_buffer(v43, (uint64_t)qword_254D78FB0);
          v44 = v38;
          v45 = sub_2144EB4C4();
          v46 = sub_2144EB5E4();
          v47 = v46;
          v48 = os_log_type_enabled(v45, v46);
          v50 = v79;
          v49 = v80;
          if (v48)
          {
            v51 = swift_slowAlloc();
            v74 = v47;
            v52 = (uint8_t *)v51;
            v75 = swift_slowAlloc();
            v83 = v75;
            v73 = v52;
            *(_DWORD *)v52 = 136315138;
            v72 = v52 + 4;
            v53 = v44;
            v54 = objc_msgSend(v53, sel_description);
            v71 = v45;
            v55 = v50;
            v56 = v44;
            v57 = v54;
            v70 = sub_2144EB530();
            v59 = v58;

            v44 = v56;
            v50 = v55;
            v82 = sub_2144EA53C(v70, v59, &v83);
            sub_2144EB620();

            v49 = v80;
            swift_bridgeObjectRelease();
            v60 = v71;
            v61 = v73;
            _os_log_impl(&dword_2144E3000, v71, (os_log_type_t)v74, "Emitting deprecated request link: %s", v73, 0xCu);
            v62 = v75;
            swift_arrayDestroy();
            MEMORY[0x2199D0648](v62, -1, -1);
            MEMORY[0x2199D0648](v61, -1, -1);

          }
          else
          {

          }
          objc_msgSend(*(id *)(v81 + 16), sel_emitMessage_timestamp_, v44, v50);

          v69 = *(void (**)(char *, uint64_t))(v49 + 8);
          v69(v19, v12);
LABEL_31:
          v69(v21, v12);
          return;
        }

      }
      else
      {
        v40 = v38;
      }

    }
    if (qword_254D78B58 != -1)
      swift_once();
    v63 = sub_2144EB4DC();
    __swift_project_value_buffer(v63, (uint64_t)qword_254D78FB0);
    v64 = sub_2144EB4C4();
    v65 = sub_2144EB5E4();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = v36;
      v67 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v67 = 0;
      _os_log_impl(&dword_2144E3000, v64, v65, "Failed to create RequestLink event for SiriInCall", v67, 2u);
      v68 = v67;
      v36 = v66;
      MEMORY[0x2199D0648](v68, -1, -1);
    }

    v69 = *(void (**)(char *, uint64_t))(v80 + 8);
    v69(v19, v12);
    goto LABEL_31;
  }
  sub_2144EACDC((uint64_t)v9);
  if (qword_254D78B58 != -1)
    swift_once();
  v29 = sub_2144EB4DC();
  __swift_project_value_buffer(v29, (uint64_t)qword_254D78FB0);
  swift_bridgeObjectRetain_n();
  v30 = sub_2144EB4C4();
  v31 = sub_2144EB5E4();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    v83 = v33;
    *(_DWORD *)v32 = 136315138;
    swift_bridgeObjectRetain();
    v82 = sub_2144EA53C(a1, a2, &v83);
    sub_2144EB620();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2144E3000, v30, v31, "Unable to derive SIC component ID from RequestId=%s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199D0648](v33, -1, -1);
    MEMORY[0x2199D0648](v32, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  (*(void (**)(char *, uint64_t))(v80 + 8))(v21, v12);
}

uint64_t SiriInCallInstrumentationUtil.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return v0;
}

uint64_t SiriInCallInstrumentationUtil.__deallocating_deinit()
{
  SiriInCallInstrumentationUtil.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2144EA53C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2144EA60C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2144E7C14((uint64_t)v12, *a3);
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
      sub_2144E7C14((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2144EA60C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_2144EA760((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2144EB62C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2144EA824(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2144EB680();
    if (!v8)
    {
      result = sub_2144EB68C();
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

void *sub_2144EA760(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2144EB6A4();
  __break(1u);
  return result;
}

uint64_t sub_2144EA824(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2144EA8B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2144EAA8C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2144EAA8C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2144EA8B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2144EB560();
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
  v3 = sub_2144EAA28(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2144EB65C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2144EB6A4();
  __break(1u);
LABEL_14:
  result = sub_2144EB68C();
  __break(1u);
  return result;
}

_QWORD *sub_2144EAA28(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D78D00);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2144EAA8C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D78D00);
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
    sub_2144EAC24(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2144EAB60(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2144EAB60(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2144EB6A4();
  __break(1u);
  return result;
}

char *sub_2144EAC24(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2144EB6A4();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t type metadata accessor for SiriInCallInstrumentationUtil()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriInCallInstrumentationUtil()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriInCallInstrumentationUtil.__allocating_init(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_2144EACDC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F0F678);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2144EAD1C()
{
  unint64_t result;

  result = qword_254D78D10;
  if (!qword_254D78D10)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D78D10);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_2144EB620();
}

id OUTLINED_FUNCTION_3_1(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  return sub_2144EA53C(a1, v1, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_6_0@<X0>(unsigned __int8 a1@<W8>)
{
  uint64_t v1;

  return sub_2144E4C60(*(_QWORD *)(v1 - 112) | ((unint64_t)a1 << 32));
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_allocObject();
}

const char *SiriInCallFeatureFlag.domain.getter()
{
  return "SiriInCall";
}

const char *SiriInCallFeatureFlag.feature.getter()
{
  _BYTE *v0;

  if (*v0)
    return "blinded_sphinx";
  else
    return "blushing_phantom";
}

uint64_t SiriInCallFeatureFlag.isEnabled.getter()
{
  char *v0;
  char v1;
  uint64_t v2;

  v1 = *v0;
  sub_2144EAE54();
  v2 = sub_2144EB32C();
  OUTLINED_FUNCTION_1_3(v2);
  return v1 & 1;
}

unint64_t sub_2144EAE54()
{
  unint64_t result;

  result = qword_253F0F6C0;
  if (!qword_253F0F6C0)
  {
    result = MEMORY[0x2199D05DC](&protocol conformance descriptor for SiriInCallFeatureFlag, &type metadata for SiriInCallFeatureFlag);
    atomic_store(result, (unint64_t *)&qword_253F0F6C0);
  }
  return result;
}

uint64_t SiriInCallFeatureFlag.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_2144EB650();
  v0 = sub_2144EB668();
  OUTLINED_FUNCTION_0_2();
  sub_2144EB554();
  sub_2144EB668();
  sub_2144EB554();
  OUTLINED_FUNCTION_0_2();
  sub_2144EB554();
  sub_2144EAE54();
  v1 = sub_2144EB32C();
  OUTLINED_FUNCTION_1_3(v1);
  sub_2144EB554();
  OUTLINED_FUNCTION_0_2();
  return v0;
}

BOOL static SiriInCallFeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SiriInCallFeatureFlag.hash(into:)()
{
  return sub_2144EB6E0();
}

uint64_t SiriInCallFeatureFlag.hashValue.getter()
{
  sub_2144EB6D4();
  sub_2144EB6E0();
  return sub_2144EB6EC();
}

uint64_t sub_2144EB05C()
{
  sub_2144EB6D4();
  sub_2144EB6E0();
  return sub_2144EB6EC();
}

unint64_t sub_2144EB0A0()
{
  unint64_t result;

  result = qword_254D78D20;
  if (!qword_254D78D20)
  {
    result = MEMORY[0x2199D05DC](&protocol conformance descriptor for SiriInCallFeatureFlag, &type metadata for SiriInCallFeatureFlag);
    atomic_store(result, (unint64_t *)&qword_254D78D20);
  }
  return result;
}

const char *sub_2144EB0DC()
{
  return "SiriInCall";
}

const char *sub_2144EB0F0()
{
  return SiriInCallFeatureFlag.feature.getter();
}

unint64_t sub_2144EB10C(uint64_t a1)
{
  unint64_t result;

  result = sub_2144EB130();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2144EB130()
{
  unint64_t result;

  result = qword_254D78D28;
  if (!qword_254D78D28)
  {
    result = MEMORY[0x2199D05DC](&protocol conformance descriptor for SiriInCallFeatureFlag, &type metadata for SiriInCallFeatureFlag);
    atomic_store(result, (unint64_t *)&qword_254D78D28);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriInCallFeatureFlag(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFF)
  {
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
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriInCallFeatureFlag(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2144EB250 + 4 * byte_2144EBDA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2144EB284 + 4 * byte_2144EBDA0[v4]))();
}

uint64_t sub_2144EB284(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2144EB28C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2144EB294);
  return result;
}

uint64_t sub_2144EB2A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2144EB2A8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2144EB2AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2144EB2B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2144EB2C0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2144EB2CC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriInCallFeatureFlag()
{
  return &type metadata for SiriInCallFeatureFlag;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

uint64_t sub_2144EB2FC()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2144EB308()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_2144EB314()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2144EB320()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2144EB32C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2144EB338()
{
  return MEMORY[0x24BE99E10]();
}

uint64_t sub_2144EB344()
{
  return MEMORY[0x24BE99FF8]();
}

uint64_t sub_2144EB350()
{
  return MEMORY[0x24BE9A048]();
}

uint64_t sub_2144EB35C()
{
  return MEMORY[0x24BE9A3B8]();
}

uint64_t sub_2144EB368()
{
  return MEMORY[0x24BE9A550]();
}

uint64_t sub_2144EB374()
{
  return MEMORY[0x24BE9A5B8]();
}

uint64_t sub_2144EB380()
{
  return MEMORY[0x24BE9A6C0]();
}

uint64_t sub_2144EB38C()
{
  return MEMORY[0x24BE9A6D8]();
}

uint64_t sub_2144EB398()
{
  return MEMORY[0x24BE9A818]();
}

uint64_t sub_2144EB3A4()
{
  return MEMORY[0x24BE9A840]();
}

uint64_t sub_2144EB3B0()
{
  return MEMORY[0x24BE9A970]();
}

uint64_t sub_2144EB3BC()
{
  return MEMORY[0x24BE9AA80]();
}

uint64_t sub_2144EB3C8()
{
  return MEMORY[0x24BE9AA90]();
}

uint64_t sub_2144EB3D4()
{
  return MEMORY[0x24BE9ABC0]();
}

uint64_t sub_2144EB3E0()
{
  return MEMORY[0x24BE9ABD0]();
}

uint64_t sub_2144EB3EC()
{
  return MEMORY[0x24BE9AC18]();
}

uint64_t sub_2144EB3F8()
{
  return MEMORY[0x24BE9AD18]();
}

uint64_t sub_2144EB404()
{
  return MEMORY[0x24BE9AF20]();
}

uint64_t sub_2144EB410()
{
  return MEMORY[0x24BEA60B8]();
}

uint64_t sub_2144EB41C()
{
  return MEMORY[0x24BEA60D0]();
}

uint64_t sub_2144EB428()
{
  return MEMORY[0x24BEA60E0]();
}

uint64_t sub_2144EB434()
{
  return MEMORY[0x24BEA60F8]();
}

uint64_t sub_2144EB440()
{
  return MEMORY[0x24BEA6108]();
}

uint64_t sub_2144EB44C()
{
  return MEMORY[0x24BEA6110]();
}

uint64_t _s10SiriInCall15ButterflyBridgeCfd_0()
{
  return MEMORY[0x24BEA6120]();
}

uint64_t sub_2144EB464()
{
  return MEMORY[0x24BEA6128]();
}

uint64_t sub_2144EB470()
{
  return MEMORY[0x24BEA6130]();
}

uint64_t sub_2144EB47C()
{
  return MEMORY[0x24BEA6138]();
}

uint64_t sub_2144EB488()
{
  return MEMORY[0x24BEA6140]();
}

uint64_t sub_2144EB494()
{
  return MEMORY[0x24BEA61D0]();
}

uint64_t sub_2144EB4A0()
{
  return MEMORY[0x24BEA61D8]();
}

uint64_t sub_2144EB4AC()
{
  return MEMORY[0x24BEA61F0]();
}

uint64_t sub_2144EB4B8()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2144EB4C4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2144EB4D0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2144EB4DC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2144EB4E8()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2144EB4F4()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2144EB500()
{
  return MEMORY[0x24BEE5588]();
}

uint64_t sub_2144EB50C()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2144EB518()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2144EB524()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2144EB530()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2144EB53C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2144EB548()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2144EB554()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2144EB560()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2144EB56C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2144EB578()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2144EB584()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2144EB590()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2144EB59C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2144EB5A8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2144EB5B4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2144EB5C0()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_2144EB5CC()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2144EB5D8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2144EB5E4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2144EB5F0()
{
  return MEMORY[0x24BE948C0]();
}

uint64_t sub_2144EB5FC()
{
  return MEMORY[0x24BE948C8]();
}

uint64_t sub_2144EB608()
{
  return MEMORY[0x24BE948D8]();
}

uint64_t sub_2144EB614()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2144EB620()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2144EB62C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2144EB638()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2144EB644()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2144EB650()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2144EB65C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2144EB668()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_2144EB674()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2144EB680()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2144EB68C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2144EB698()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2144EB6A4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2144EB6B0()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_2144EB6BC()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2144EB6C8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2144EB6D4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2144EB6E0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2144EB6EC()
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x24BEE7270]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

