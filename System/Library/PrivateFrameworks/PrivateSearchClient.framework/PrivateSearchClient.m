uint64_t static PrivateSearchFactory.newCallContext(withClientContext:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v4 = sub_244B1CD84();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 16) = 0u;
  swift_beginAccess();
  sub_244B1C940(a1, v5 + 16);
  result = swift_endAccess();
  v7 = MEMORY[0x24BE78F30];
  a2[3] = v4;
  a2[4] = v7;
  *a2 = v5;
  return result;
}

uint64_t sub_244B1C940(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DBA38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24951F55C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t static PrivateSearchFactory.newPrivateSearchIndex(_:_:)@<X0>(_QWORD *a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16[5];
  uint64_t v17[5];

  v4 = a1[3];
  v5 = a1[4];
  v6 = __swift_project_boxed_opaque_existential_1(a1, v4);
  v17[3] = v4;
  v17[4] = *(_QWORD *)(v5 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_1, v6, v4);
  v8 = a1[3];
  v9 = a1[4];
  v10 = __swift_project_boxed_opaque_existential_1(a1, v8);
  v16[3] = v8;
  v16[4] = *(_QWORD *)(v9 + 16);
  v11 = __swift_allocate_boxed_opaque_existential_1(v16);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v11, v10, v8);
  sub_244B1CD9C();
  swift_allocObject();
  sub_244B1CD90();
  swift_bridgeObjectRetain();
  v12 = sub_244B1CDCC();
  swift_bridgeObjectRelease();
  MEMORY[0x24951F4E4](v12);
  swift_bridgeObjectRelease();
  v13 = sub_244B1CDB4();
  swift_allocObject();
  result = sub_244B1CDA8();
  v15 = MEMORY[0x24BE78F58];
  a2[3] = v13;
  a2[4] = v15;
  *a2 = result;
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

uint64_t static PrivateSearchFactory.newPrivateSearchIndexInMemory(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17[5];
  uint64_t v18[5];
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  v2 = sub_244B1CD78();
  swift_allocObject();
  v3 = sub_244B1CD6C();
  v4 = MEMORY[0x24BE78F18];
  v20 = v2;
  v21 = MEMORY[0x24BE78F18];
  v19[0] = v3;
  v5 = __swift_project_boxed_opaque_existential_1(v19, v2);
  v6 = *(_QWORD *)(v4 + 8);
  v18[3] = v2;
  v18[4] = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(boxed_opaque_existential_1, v5, v2);
  v8 = v20;
  v9 = v21;
  v10 = __swift_project_boxed_opaque_existential_1(v19, v20);
  v17[3] = v8;
  v17[4] = *(_QWORD *)(v9 + 16);
  v11 = __swift_allocate_boxed_opaque_existential_1(v17);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v11, v10, v8);
  sub_244B1CD9C();
  swift_allocObject();
  sub_244B1CD90();
  swift_bridgeObjectRetain();
  v12 = sub_244B1CDCC();
  swift_bridgeObjectRelease();
  MEMORY[0x24951F4E4](v12);
  swift_bridgeObjectRelease();
  v13 = sub_244B1CDB4();
  swift_allocObject();
  v14 = sub_244B1CDA8();
  v15 = MEMORY[0x24BE78F58];
  a1[3] = v13;
  a1[4] = v15;
  *a1 = v14;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
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

uint64_t PrivateSearchFactory.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PrivateSearchFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PrivateSearchFactory()
{
  return objc_opt_self();
}

uint64_t sub_244B1CD6C()
{
  return MEMORY[0x24BE78F20]();
}

uint64_t sub_244B1CD78()
{
  return MEMORY[0x24BE78F28]();
}

uint64_t sub_244B1CD84()
{
  return MEMORY[0x24BE78F38]();
}

uint64_t sub_244B1CD90()
{
  return MEMORY[0x24BE78F48]();
}

uint64_t sub_244B1CD9C()
{
  return MEMORY[0x24BE78F50]();
}

uint64_t sub_244B1CDA8()
{
  return MEMORY[0x24BE78F60]();
}

uint64_t sub_244B1CDB4()
{
  return MEMORY[0x24BE78F68]();
}

uint64_t sub_244B1CDC0()
{
  return MEMORY[0x24BE78F70]();
}

uint64_t sub_244B1CDCC()
{
  return MEMORY[0x24BE78F78]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

