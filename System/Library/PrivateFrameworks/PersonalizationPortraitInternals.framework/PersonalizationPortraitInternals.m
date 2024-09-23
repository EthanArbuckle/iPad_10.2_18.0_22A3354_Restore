uint64_t block_destroy_helper()
{
  return swift_release();
}

void sub_1C39350B8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 160));
  _Unwind_Resume(a1);
}

id procNameForPid(int a1, int *a2)
{
  unsigned int v4;
  _BYTE buffer[1024];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  *__error() = 0;
  v4 = proc_name(a1, buffer, 0x400u);
  if (a2)
    *a2 = *__error();
  if ((v4 & 0x80000000) != 0)
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v4, 4);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

unint64_t sub_1C3935BC8()
{
  return 0xD000000000000042;
}

unint64_t sub_1C3935C20()
{
  return 0xD000000000000040;
}

unint64_t sub_1C3935C78()
{
  return 0xD00000000000003ELL;
}

void sub_1C3936288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3936854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3936A80(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C3936AA0(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3936A48);
}

void sub_1C3936DA0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C3936F64(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C3936F84(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3936F2CLL);
}

void sub_1C3937074(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C3937094(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3937024);
}

void sub_1C3937128(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3937100);
}

void sub_1C3937134(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C39383A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C39391BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

void sub_1C3939B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C393A6F8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C393A6A0);
}

void sub_1C393A720(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C393AA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C393ADB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1C393AF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C393B768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1C393C1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C393C914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C393CE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1C393D1A4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char aBlock;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  char v15;
  id result;
  char v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;

  v40 = 0;
  v2 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = &v40;
  v3 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v3 + 16) = sub_1C3954C00;
  *(_QWORD *)(v3 + 24) = v2;
  aBlock = MEMORY[0x1E0C809B0];
  v5 = OUTLINED_FUNCTION_3_3((uint64_t)sub_1C3954360, v25, v2, a1, MEMORY[0x1E0C809B0], 1107296256, v34, v37);
  v6 = v1;
  swift_retain();
  OUTLINED_FUNCTION_13_1();
  v7 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = &v40;
  v8 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v8 + 16) = sub_1C393D538;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = OUTLINED_FUNCTION_3_3((uint64_t)sub_1C393D4C8, v26, v28, (uint64_t)v31, aBlock, 1107296256, v35, v38);
  v10 = v6;
  swift_retain();
  OUTLINED_FUNCTION_13_1();
  v11 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = &v40;
  v12 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v12 + 16) = sub_1C3954C30;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = OUTLINED_FUNCTION_3_3((uint64_t)sub_1C395486C, v27, v29, (uint64_t)v32, aBlock, 1107296256, v36, v39);
  v14 = v10;
  swift_retain();
  swift_release();
  objc_msgSend(v33, sel_accessCriteriaUsingBundleIdentifierBlock_domainSelectionBlock_uniqueIdentifiersBlock_, v5, v9, v13);
  _Block_release(v9);
  _Block_release(v5);
  _Block_release(v13);
  v15 = OUTLINED_FUNCTION_12_1();
  result = (id)swift_release();
  if ((v15 & 1) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v17 = OUTLINED_FUNCTION_12_1();
  result = (id)swift_release();
  if ((v17 & 1) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v18 = OUTLINED_FUNCTION_12_1();
  result = (id)swift_release();
  if ((v18 & 1) != 0)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v19 = v40;
  v20 = (void *)objc_opt_self();
  v21 = v20;
  if (v19)
  {
    v22 = v19;
    v23 = (void *)sub_1C3AB7E88();

    v24 = objc_msgSend(v21, sel_failedWithError_, v23);
  }
  else
  {
    v24 = objc_msgSend(v20, sel_successWithNumberOfExtractions_, 0);
  }

  OUTLINED_FUNCTION_13_1();
  swift_release();
  swift_release();
  return v24;
}

void sub_1C393D4C8(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, uint64_t, id);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = *(void (**)(uint64_t, uint64_t, id))(a1 + 32);
  v5 = sub_1C3AB7F6C();
  v7 = v6;
  v8 = a3;
  v4(v5, v7, v8);
  swift_bridgeObjectRelease();

}

void sub_1C393D538(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v3;

  sub_1C393D540(a1, a2, a3, *(_QWORD *)(v3 + 16), *(void ***)(v3 + 24));
}

void sub_1C393D540(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, void **a5)
{
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  void **v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  unsigned int v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned __int8 v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  id v60;
  unint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (qword_1ED7E7668 != -1)
    swift_once();
  v9 = sub_1C3AB7F3C();
  __swift_project_value_buffer(v9, (uint64_t)qword_1ED7E7A28);
  v10 = a3;
  swift_bridgeObjectRetain_n();
  v11 = v10;
  v12 = sub_1C3AB7F24();
  v13 = sub_1C3AB80B0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = a5;
    v16 = (void *)swift_slowAlloc();
    v60 = v16;
    *(_DWORD *)v14 = 134218242;
    objc_msgSend(v11, sel_count);

    sub_1C3AB80D4();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1C393DFE0(a1, a2, (uint64_t *)&v60);
    sub_1C3AB80D4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C392E000, v12, v13, "Consumer: beginning deletion from %ld group Ids from %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    v17 = v16;
    a5 = v15;
    MEMORY[0x1C3BD6CF0](v17, -1, -1);
    MEMORY[0x1C3BD6CF0](v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (sub_1C3AB7F6C() == a1 && v18 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = sub_1C3AB81C4();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
      goto LABEL_15;
  }
  v60 = 0;
  v61 = 0xE000000000000000;
  sub_1C3AB8128();
  v21 = (void *)sub_1C3AB7F6C();
  v23 = v22;
  swift_bridgeObjectRelease();
  v60 = v21;
  v61 = v23;
  sub_1C3AB7FB4();
  v24 = (void *)sub_1C3AB7F60();
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v11, sel_containsDomain_, v24);

  if (v25)
  {
    sub_1C3953C9C();
    return;
  }
LABEL_15:
  v26 = objc_msgSend(v11, sel_allDomains);
  v27 = sub_1C3AB805C();

  sub_1C393DCE0(v27);
  swift_bridgeObjectRelease();
  v28 = sub_1C393DFCC();
  if (v28)
  {
    v29 = v28;
    v30 = (void *)sub_1C3AB7F60();
    v31 = (void *)sub_1C3AB7FF0();
    v60 = 0;
    v32 = objc_msgSend(v29, sel_deleteAllTopicsFromSourcesWithBundleId_groupIds_deletedCount_error_, v30, v31, 0, &v60);

    v33 = v60;
    if (!v32)
      goto LABEL_24;
    v34 = v60;
  }
  v35 = sub_1C393DFB8();
  if (v35)
  {
    v36 = v35;
    v37 = (void *)sub_1C3AB7F60();
    v38 = (void *)sub_1C3AB7FF0();
    v60 = 0;
    v39 = objc_msgSend(v36, sel_deleteAllNamedEntitiesFromSourcesWithBundleId_groupIds_deletedCount_error_, v37, v38, 0, &v60);

    v33 = v60;
    if (v39)
    {
      v40 = v60;
      goto LABEL_21;
    }
LABEL_24:
    v47 = v33;
    swift_release();
    v48 = (void *)sub_1C3AB7E94();

    goto LABEL_27;
  }
LABEL_21:
  v41 = sub_1C393DFA4();
  if (!v41)
  {
    swift_release();
    return;
  }
  v42 = v41;
  v43 = (void *)sub_1C3AB7F60();
  v44 = (void *)sub_1C3AB7FF0();
  swift_release();
  v60 = 0;
  v45 = objc_msgSend(v42, sel_deleteAllLocationsFromSourcesWithBundleId_groupIds_deletedCount_error_, v43, v44, 0, &v60);

  if ((v45 & 1) != 0)
  {
    v46 = v60;
    return;
  }
  v49 = v60;
  v48 = (void *)sub_1C3AB7E94();

LABEL_27:
  swift_willThrow();
  v50 = *a5;
  *a5 = v48;
  v51 = v48;

  swift_bridgeObjectRetain();
  v52 = v48;
  swift_bridgeObjectRetain();
  v53 = v48;
  v54 = sub_1C3AB7F24();
  v55 = sub_1C3AB8098();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = swift_slowAlloc();
    v57 = (void *)swift_slowAlloc();
    v60 = v57;
    *(_DWORD *)v56 = 136315394;
    swift_bridgeObjectRetain();
    sub_1C393DFE0(a1, a2, (uint64_t *)&v60);
    sub_1C3AB80D4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v56 + 12) = 2080;
    swift_getErrorValue();
    v58 = sub_1C3AB81DC();
    sub_1C393DFE0(v58, v59, (uint64_t *)&v60);
    sub_1C3AB80D4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1C392E000, v54, v55, "Consumer: failed to delete data on request to delete by group IDs from %s. %s", (uint8_t *)v56, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BD6CF0](v57, -1, -1);
    MEMORY[0x1C3BD6CF0](v56, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

id sub_1C393DC90(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(v1 + *a1);
  v3 = v2;
  if (!v2)
    v3 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  v4 = v2;
  return v3;
}

_QWORD *sub_1C393DCE0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E76A8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  sub_1C393DDC0(&v8, v3 + 4, v1, a1);
  v6 = v5;
  swift_bridgeObjectRetain();
  sub_1C3954C3C();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

void sub_1C393DDC0(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
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
LABEL_37:
    *a1 = a4;
    a1[1] = v6;
    a1[2] = ~v7;
    a1[3] = v12;
    a1[4] = v9;
    OUTLINED_FUNCTION_28_1();
    return;
  }
  if (!a3)
  {
    v12 = 0;
    goto LABEL_37;
  }
  if (a3 < 0)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
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
    if (v13 == a3)
    {
      swift_bridgeObjectRetain();
      goto LABEL_37;
    }
    v11 += 2;
    swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_39;
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
    goto LABEL_37;
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
LABEL_40:
  __break(1u);
}

id sub_1C393DFA4()
{
  return sub_1C393DC90(&OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_locationStoreOverride);
}

id sub_1C393DFB8()
{
  return sub_1C393DC90(&OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_entityStoreOverride);
}

id sub_1C393DFCC()
{
  return sub_1C393DC90(&OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_topicStoreOverride);
}

uint64_t sub_1C393DFE0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_1C393E0B0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C393E204((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1C393E204((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1C393E0B0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_1C394CF78((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C3AB80E0();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1C394D03C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1C3AB8158();
    if (!v8)
    {
      result = sub_1C3AB81A0();
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

uint64_t sub_1C393E204(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id OUTLINED_FUNCTION_1(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2, 3);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_1_1(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2, 1);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_1_2(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return objc_msgSend(*(id *)(v6 - 328), a2, v5, v4, *(_QWORD *)(v6 - 288), *(_DWORD *)(v6 - 244) & 1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_allocObject();
}

id OUTLINED_FUNCTION_0()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 177));
}

id OUTLINED_FUNCTION_0_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_1C3AB7FB4();
}

void OUTLINED_FUNCTION_0_2()
{
  JUMPOUT(0x1C3BD6CF0);
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_deallocObject();
}

id OUTLINED_FUNCTION_0_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  return sub_1C394CB2C(*(_QWORD *)(v18 - 88), v15, *(_QWORD *)(v18 - 96), v17, v14, v16, v13, v12, a9, a10, a11, a12);
}

void OUTLINED_FUNCTION_0_5()
{
  JUMPOUT(0x1C3BD6CF0);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BD6C60]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_1C393E5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1C393E838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1C393EA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v7;

  return v6(a1, a2, a3, a4, a5, a6, 0, v7);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, _QWORD, uint64_t))
{
  return sub_1C3948C90(a1, a2, 1, a4, a5);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_1C3955320(819200);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_slowAlloc();
}

id OUTLINED_FUNCTION_96(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

id OUTLINED_FUNCTION_3(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 456));
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_3_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

}

uint64_t OUTLINED_FUNCTION_3_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 - 120);
  v2 = *(_QWORD *)(v0 - 112);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 - 144), v1);
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v2 + 24))(0, v1, v2);
}

void *OUTLINED_FUNCTION_3_3@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, char aBlock, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  a7 = a1;
  a8 = v8;
  return _Block_copy(&aBlock);
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return sub_1C3AB7EC4();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 272) + 8))(v0, *(_QWORD *)(v1 - 264));
}

void OUTLINED_FUNCTION_7_2(uint64_t a1@<X8>)
{
  uint64_t v1;

}

void OUTLINED_FUNCTION_20()
{
  JUMPOUT(0x1C3BD5A3CLL);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_dynamicCast();
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

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_8_0(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_8_1()
{
  JUMPOUT(0x1C3BD5BF8);
}

uint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(v1, v3, v0);
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(v4 - 208);
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v6, v5);
}

id OUTLINED_FUNCTION_14(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_14_0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  return objc_msgSend(v2, sel_extractionAlgorithmsForBundleId_sourceLanguage_conservative_domain_, v0, v1, 0, 0);
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_1C3AB7F6C();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return sub_1C3AB8050();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_release();
}

void OUTLINED_FUNCTION_11(uint64_t a1, SEL *a2)
{
  void *v2;

  sub_1C394AFE0(v2, a2);
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 160) = a1;
  return sub_1C3AB80D4();
}

uint64_t OUTLINED_FUNCTION_11_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;

  va_start(va, a5);
  return sub_1C3954B44(v5 - 72, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return swift_unknownObjectRetain();
}

void sub_1C393FA38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C39404D8(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Unwind_Resume(a1);
}

void sub_1C3940688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

id blockNotifyQueue()
{
  if (blockNotifyQueue__pasOnceToken2 != -1)
    dispatch_once(&blockNotifyQueue__pasOnceToken2, &__block_literal_global_59);
  return (id)blockNotifyQueue__pasExprOnceResult;
}

void sub_1C3941050(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3941624(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C3941F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_1C39423B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3942700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1C394372C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1C3944538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39445E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C394474C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3944710);
}

void sub_1C394475C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C394484C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3944810);
}

void sub_1C394485C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C39455BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39456C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAFPreferencesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAFPreferencesClass_softClass;
  v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_1E7E1F798;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C39457D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1C394606C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C39461D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C3946634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3946BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C3947590(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_begin_catch(exc_buf);
  JUMPOUT(0x1C3947548);
}

void sub_1C39475C0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C39476B4(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3947678);
}

void sub_1C39476C4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id sub_1C39476E4()
{
  id result;

  type metadata accessor for RealTimeTextConsumer();
  result = sub_1C3947704();
  qword_1ED7E7A40 = (uint64_t)result;
  return result;
}

id sub_1C3947704()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v0 = (void *)objc_opt_self();
  v1 = OUTLINED_FUNCTION_3(v0);
  v2 = (void *)objc_opt_self();
  v3 = OUTLINED_FUNCTION_3(v2);
  v4 = (void *)objc_opt_self();
  v5 = OUTLINED_FUNCTION_3(v4);
  v6 = objc_allocWithZone((Class)type metadata accessor for RealTimeTextConsumer());
  return sub_1C394779C(v1, v3, v5);
}

id sub_1C394779C(void *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = objc_allocWithZone((Class)PPSpotlightWritebackDissector);
  v7 = a3;
  v8 = a1;
  v9 = a2;
  v10 = objc_msgSend(v6, sel_init);
  v11 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v12 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v13 = sub_1C395368C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12);
  objc_opt_self();
  v14 = v13;
  v15 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(v15, sel_registerMessagesConsumer_levelOfService_);

  v16 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(v16, sel_registerSafariConsumer_levelOfService_);

  v17 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(v17, sel_registerRemindersConsumer_levelOfService_);

  v18 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(v18, sel_registerInteractionConsumer_levelOfService_);

  return v14;
}

uint64_t sub_1C3947930(void *a1)
{
  return sub_1C39479BC(a1, (uint64_t)&unk_1E7E14008, 2, (uint64_t)sub_1C3947CD4);
}

uint64_t sub_1C394799C(void *a1)
{
  return sub_1C39479BC(a1, (uint64_t)&unk_1E7E13FE0, 0, (uint64_t)sub_1C3947D00);
}

uint64_t sub_1C39479BC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v7 = objc_msgSend(a1, sel_content);
  v8 = OUTLINED_FUNCTION_4();
  *(_QWORD *)(v8 + 16) = a1;
  v9 = objc_msgSend(a1, sel_contentProtection);
  v10 = OUTLINED_FUNCTION_2((uint64_t)v7, 1, a3, a4, v8, (uint64_t)v9);

  swift_release();
  return v10;
}

uint64_t sub_1C3947AC4(void *a1)
{
  return sub_1C3947AE0(a1, (uint64_t)&unk_1E7E13FB8, (uint64_t)sub_1C3947D00);
}

uint64_t sub_1C3947AE0(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;

  v5 = objc_msgSend(a1, sel_content);
  v6 = OUTLINED_FUNCTION_4();
  *(_QWORD *)(v6 + 16) = a1;
  v7 = objc_msgSend(a1, sel_contentProtection);
  v8 = OUTLINED_FUNCTION_2((uint64_t)v5, 0, 2, a3, v6, (uint64_t)v7);

  swift_release();
  return v8;
}

uint64_t sub_1C3947BDC(void *a1)
{
  return sub_1C3947AE0(a1, (uint64_t)&unk_1E7E13F90, (uint64_t)sub_1C3947D00);
}

id sub_1C3947C48()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RealTimeTextConsumer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t variable initialization expression of StringDonation.source()
{
  return 0;
}

uint64_t variable initialization expression of StringDonation.shouldConsume()
{
  return 1;
}

uint64_t type metadata accessor for RealTimeTextConsumer()
{
  return objc_opt_self();
}

uint64_t sub_1C3947CB0()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1C3947CD4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_shouldContinue);
}

uint64_t sub_1C3947D04()
{
  uint64_t v0;

  v0 = sub_1C3AB7F3C();
  __swift_allocate_value_buffer(v0, qword_1ED7E7A28);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED7E7A28);
  return sub_1C3AB7F30();
}

uint64_t sub_1C3947D7C()
{
  return sub_1C3AB8224();
}

uint64_t sub_1C3947DA0()
{
  sub_1C3AB8218();
  sub_1C3AB8224();
  return sub_1C3AB8230();
}

uint64_t sub_1C3947DE0()
{
  return 1;
}

uint64_t sub_1C3947DF0()
{
  sub_1C3AB8218();
  sub_1C3AB8224();
  return sub_1C3AB8230();
}

void sub_1C3947E3C(void *a1, void *a2, void *a3)
{
  unint64_t v3;
  void *v4;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  id v15;
  double v16;
  double v17;
  id v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  char **v28;
  id v29;
  id v30;
  uint64_t v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  char **v51;
  uint64_t v52;
  id v53;
  id v54;
  unsigned int v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
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
  void *v88;
  _OWORD v89[2];
  id v90[5];

  v88 = a3;
  v90[4] = *(id *)MEMORY[0x1E0C80C00];
  v7 = OUTLINED_FUNCTION_0_0((uint64_t)a1, sel_topics);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7690);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6();
  if (v3 >> 62)
  {
    OUTLINED_FUNCTION_2_0();
    v8 = sub_1C3AB81AC();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
    v8 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v9 = (id)OUTLINED_FUNCTION_1_0();
  if (v8 && a1)
  {
    v10 = OUTLINED_FUNCTION_0_0((uint64_t)v9, sel_topics);
    v11 = v10;
    if (!v10)
    {
      OUTLINED_FUNCTION_4_0();
      v11 = (void *)sub_1C3AB7FF0();
      v10 = (id)OUTLINED_FUNCTION_1_0();
    }
    v12 = OUTLINED_FUNCTION_0_0((uint64_t)v10, sel_source);
    v13 = OUTLINED_FUNCTION_0_0((uint64_t)v12, sel_topicAlgorithm);
    v14 = (unint64_t)OUTLINED_FUNCTION_0_0((uint64_t)v13, sel_cloudSync);
    v15 = objc_msgSend(v4, sel_sentimentScore);
    v17 = v16;
    v18 = OUTLINED_FUNCTION_0_0((uint64_t)v15, sel_topicsExactMatchesInSourceText);
    if (v18)
    {
      v90[0] = 0;
      sub_1C3948564(0, (unint64_t *)&unk_1ED7E77E0);
      sub_1C3AB7FFC();

      v18 = 0;
      v14 = v14;
    }
    v90[0] = 0;
    v19 = objc_msgSend(a1, sel_donateTopics_source_algorithm_cloudSync_sentimentScore_exactMatchesInSourceText_error_, v11, v12, v13, v14, v18, v90, v17);

    v3 = (unint64_t)v90[0];
    if (!v19)
      goto LABEL_34;
    v9 = v90[0];
  }
  v20 = OUTLINED_FUNCTION_0_0((uint64_t)v9, sel_entities);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6();
  if (v3 >> 62)
  {
    OUTLINED_FUNCTION_2_0();
    v21 = sub_1C3AB81AC();
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
    v21 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v22 = (id)OUTLINED_FUNCTION_1_0();
  if (v21 && a2)
  {
    v23 = OUTLINED_FUNCTION_0_0((uint64_t)v22, sel_entities);
    v24 = v23;
    if (!v23)
    {
      OUTLINED_FUNCTION_4_0();
      sub_1C3AB7FF0();
      v23 = (id)OUTLINED_FUNCTION_7();
    }
    v25 = OUTLINED_FUNCTION_0_0((uint64_t)v23, sel_source);
    v26 = OUTLINED_FUNCTION_0_0((uint64_t)v25, sel_entityAlgorithm);
    v27 = OUTLINED_FUNCTION_0_0((uint64_t)v26, sel_cloudSync);
    objc_msgSend(v4, sel_sentimentScore);
    v90[0] = 0;
    LODWORD(v26) = objc_msgSend(a2, sel_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error_, v24, v25, v26, v27, v90);

    v3 = (unint64_t)v90[0];
    if ((_DWORD)v26)
    {
      v22 = v90[0];
      goto LABEL_19;
    }
LABEL_34:
    v64 = (id)v3;
    sub_1C3AB7E94();

LABEL_41:
    swift_willThrow();
    return;
  }
LABEL_19:
  v28 = &selRef_initWithHandle_;
  v29 = OUTLINED_FUNCTION_0_0((uint64_t)v22, sel_locations);
  v30 = objc_msgSend(v29, sel_count);

  if (v30)
  {
    v32 = OUTLINED_FUNCTION_0_0(v31, sel_locations);
    v33 = objc_msgSend(v32, sel_allKeys);

    v34 = MEMORY[0x1E0DEE9B8] + 8;
    sub_1C3AB8008();
    OUTLINED_FUNCTION_6();
    v35 = v32[2];
    if (v35)
    {
      v82 = (uint64_t)v32;
      v83 = v34;
      v36 = (uint64_t)(v32 + 4);
      while (1)
      {
        sub_1C393E204(v36, (uint64_t)v90);
        sub_1C3948564(0, (unint64_t *)&unk_1ED7E77E0);
        v37 = swift_dynamicCast();
        if ((v37 & 1) == 0)
          goto LABEL_38;
        v86 = v35;
        v38 = *(void **)&v89[0];
        v39 = OUTLINED_FUNCTION_0_0(v37, v28[345]);
        v40 = v38;
        v41 = objc_msgSend(v39, sel_objectForKeyedSubscript_, v40);

        if (v41)
        {
          sub_1C3AB80EC();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v89, 0, sizeof(v89));
        }
        v42 = sub_1C39484DC((uint64_t)v89, (uint64_t)v90);
        if (!v90[3])
          break;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77B0);
        if ((swift_dynamicCast() & 1) == 0)
        {
          v65 = OUTLINED_FUNCTION_8();
          OUTLINED_FUNCTION_3_0(v65, v66, v67, v68, v69, v70, v71, v72, v82, v83, v84, v85, v86, (uint64_t)v88, v40);
          goto LABEL_40;
        }
        v50 = objc_msgSend(v40, sel_unsignedShortValue);
        if (v88)
        {
          v51 = v28;
          HIDWORD(v85) = v50;
          sub_1C3948564(0, &qword_1ED7E77D0);
          sub_1C3AB7FF0();
          v52 = OUTLINED_FUNCTION_7();
          v53 = OUTLINED_FUNCTION_0_0(v52, sel_source);
          v54 = OUTLINED_FUNCTION_0_0((uint64_t)v53, sel_cloudSync);
          v90[0] = 0;
          v55 = objc_msgSend(v88, sel_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error_, v41, v53, 0, HIDWORD(v85), v54, v90);

          if (!v55)
          {
            v73 = v90[0];
            OUTLINED_FUNCTION_8();
            sub_1C3AB7E94();

            v74 = swift_willThrow();
            OUTLINED_FUNCTION_3_0(v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, (uint64_t)v88, v40);
            return;
          }
          v56 = v90[0];
          v28 = v51;
        }
        else
        {
          v56 = (id)swift_bridgeObjectRelease();
        }
        OUTLINED_FUNCTION_3_0((uint64_t)v56, v57, v58, v59, v60, v61, v62, v63, v82, v83, v84, v85, v86, (uint64_t)v88, v40);
        v36 += 32;
        v35 = v87 - 1;
        if (v87 == 1)
          goto LABEL_35;
      }
      OUTLINED_FUNCTION_3_0(v42, v43, v44, v45, v46, v47, v48, v49, v82, v83, v84, v85, v86, (uint64_t)v88, v40);
      sub_1C3948524((uint64_t)v90);
LABEL_38:
      OUTLINED_FUNCTION_8();
LABEL_40:
      sub_1C39484A0();
      swift_allocError();
      goto LABEL_41;
    }
LABEL_35:
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_1C39484A0()
{
  unint64_t result;

  result = qword_1EF8E4D00;
  if (!qword_1EF8E4D00)
  {
    result = MEMORY[0x1C3BD6C78](&unk_1C3AE4914, &type metadata for HarvestingError);
    atomic_store(result, (unint64_t *)&qword_1EF8E4D00);
  }
  return result;
}

uint64_t sub_1C39484DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E76B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C3948524(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E76B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C3948564(uint64_t a1, unint64_t *a2)
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

uint64_t getEnumTagSinglePayload for HarvestingError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HarvestingError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C3948674 + 4 * asc_1C3AE4820[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C3948694 + 4 * byte_1C3AE4825[v4]))();
}

_BYTE *sub_1C3948674(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C3948694(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C394869C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C39486A4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C39486AC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C39486B4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1C39486C0()
{
  return 0;
}

ValueMetadata *type metadata accessor for HarvestingError()
{
  return &type metadata for HarvestingError;
}

unint64_t sub_1C39486DC()
{
  unint64_t result;

  result = qword_1EF8E4D08;
  if (!qword_1EF8E4D08)
  {
    result = MEMORY[0x1C3BD6C78](&unk_1C3AE48EC, &type metadata for HarvestingError);
    atomic_store(result, (unint64_t *)&qword_1EF8E4D08);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_1C3AB8008();
}

void OUTLINED_FUNCTION_6()
{
  void *v0;

}

void sub_1C3948728()
{
  uint64_t v0;

  type metadata accessor for BackgroundTextConsumer();
  sub_1C3948748();
  qword_1ED7E7A48 = v0;
}

void sub_1C3948748()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  v0 = (void *)objc_opt_self();
  v1 = OUTLINED_FUNCTION_3(v0);
  v2 = (void *)objc_opt_self();
  v3 = OUTLINED_FUNCTION_3(v2);
  v4 = (void *)objc_opt_self();
  v5 = OUTLINED_FUNCTION_3(v4);
  v6 = objc_allocWithZone((Class)type metadata accessor for BackgroundTextConsumer());
  sub_1C39487D8(v1, v3, v5);
  OUTLINED_FUNCTION_5();
}

id sub_1C39487D8(void *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v6 = objc_allocWithZone((Class)PPSpotlightWritebackDissector);
  v7 = a3;
  v8 = a1;
  v9 = a2;
  v10 = objc_msgSend(v6, sel_init);
  v11 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v12 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v13 = sub_1C395368C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12);
  objc_opt_self();
  v14 = v13;
  v15 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(v15, sel_registerNewsConsumer_levelOfService_);

  v16 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(v16, sel_registerNotesConsumer_levelOfService_);

  v17 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(v17, sel_registerSafariConsumer_levelOfService_);

  v18 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(v18, sel_registerThirdPartyAppConsumer_levelOfService_);

  v19 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(v19, sel_registerMailConsumer_levelOfService_);

  return v14;
}

uint64_t sub_1C394898C(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, sel_content);
  *(_QWORD *)(OUTLINED_FUNCTION_4() + 16) = a1;
  v3 = a1;
  v4 = objc_msgSend(v3, sel_contentProtection);
  v5 = objc_msgSend(v3, sel_htmlParser);
  sub_1C394F830();
  v7 = v6;

  swift_release();
  return v7;
}

uint64_t sub_1C3948AB0(void *a1, uint64_t a2, uint64_t a3)
{
  return OUTLINED_FUNCTION_2_1(a1, (uint64_t)&unk_1E7E141A8, a3, (uint64_t)sub_1C3947D00, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, _QWORD, uint64_t))sub_1C39500A4);
}

uint64_t sub_1C3948B18(void *a1)
{
  return sub_1C3948C90(a1, (uint64_t)&unk_1E7E14180, 0, (uint64_t)sub_1C3947D00, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, _QWORD, uint64_t))sub_1C3950918);
}

void sub_1C3948B84(void *a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend(a1, sel_content);
  *(_QWORD *)(OUTLINED_FUNCTION_4() + 16) = a1;
  v3 = objc_msgSend(a1, sel_contentProtection);
  sub_1C394DED4();

  swift_release();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C3948C74(void *a1, uint64_t a2, uint64_t a3)
{
  return OUTLINED_FUNCTION_2_1(a1, (uint64_t)&unk_1E7E14130, a3, (uint64_t)sub_1C3947D00, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, _QWORD, uint64_t))sub_1C395118C);
}

uint64_t sub_1C3948C90(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(id, uint64_t, uint64_t, uint64_t, uint64_t, id, _QWORD, uint64_t))
{
  uint64_t v5;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v10 = objc_msgSend(a1, sel_content);
  v11 = OUTLINED_FUNCTION_4();
  *(_QWORD *)(v11 + 16) = a1;
  v12 = objc_msgSend(a1, sel_contentProtection);
  v13 = a5(v10, a3, 2, a4, v11, v12, 0, v5);

  swift_release();
  return v13;
}

id sub_1C3948DA0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BackgroundTextConsumer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BackgroundTextConsumer()
{
  return objc_opt_self();
}

uint64_t sub_1C3948DF4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1C3948E34()
{
  id v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  v1 = objc_msgSend(v0, sel_meCard);

  if (v1)
  {
    v10[0] = 0;
    v2 = objc_msgSend(v1, sel_contactsContactIdentifierWithError_, v10);

    v3 = v10[0];
    if (v2)
    {
      v4 = sub_1C3AB7F6C();
      v6 = v5;
      v7 = v3;

      qword_1ED7E7748 = v4;
      qword_1ED7E7750 = v6;
      return;
    }
    v8 = v10[0];
    v9 = (void *)sub_1C3AB7E94();

    swift_willThrow();
  }
  qword_1ED7E7748 = 0;
  qword_1ED7E7750 = 0;
}

uint64_t sub_1C3948F58()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t result;

  v1 = objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_sharedInstance), sel_donationBlockedApps);
  OUTLINED_FUNCTION_43();
  v2 = sub_1C3AB8008();

  result = sub_1C3948FD4(v2);
  qword_1ED7E7760 = result;
  return result;
}

uint64_t sub_1C3948FD4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_1C3AB8068();
  v10 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1C394A3B4(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_1C3949084(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v11;

  if (a1)
  {
    v1 = a1;
    v3 = OUTLINED_FUNCTION_0_0((uint64_t)v1, sel_subject);
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_12();
    v4 = OUTLINED_FUNCTION_27();
    v5 = OUTLINED_FUNCTION_14(v4, sel_textContent);
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_18();
    v6 = OUTLINED_FUNCTION_2_2();
    MEMORY[0x1C3BD5A3C](v6);
    OUTLINED_FUNCTION_18();
  }
  else
  {
    OUTLINED_FUNCTION_42(0, (SEL *)&selRef_textContent);
    if (v8)
    {
      v9 = OUTLINED_FUNCTION_0_0(v7, sel_subject);
      OUTLINED_FUNCTION_25();

      OUTLINED_FUNCTION_0_1();
      sub_1C3AB7FB4();
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_20();
    }
    v11 = OUTLINED_FUNCTION_0_0(v7, sel_subject);
    OUTLINED_FUNCTION_26();
  }

  return OUTLINED_FUNCTION_16();
}

uint64_t sub_1C39491BC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = sub_1C3AB7F18();
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v25 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v25 - v12;
  if (!a1)
    return __swift_storeEnumTagSinglePayload((uint64_t)a2, 1, 1, v4);
  v26 = (uint64_t)a2;
  v14 = a1;
  v15 = objc_msgSend(v14, sel_textContent);
  OUTLINED_FUNCTION_34();

  v16 = sub_1C3AB7FCC();
  result = swift_bridgeObjectRelease();
  if (v16 < 0)
  {
    __break(1u);
  }
  else
  {
    v18 = sub_1C3AB7EF4();
    v19 = OUTLINED_FUNCTION_33(v18, sel_quotedRegions);
    sub_1C3AB7F0C();

    sub_1C39493F4((uint64_t)v11);
    OUTLINED_FUNCTION_21((uint64_t)v13);
    v20 = OUTLINED_FUNCTION_15();
    v21 = OUTLINED_FUNCTION_33(v20, sel_tabularRegions);
    OUTLINED_FUNCTION_35();

    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_21((uint64_t)v7);
    OUTLINED_FUNCTION_21((uint64_t)v13);
    v22 = OUTLINED_FUNCTION_15();
    v23 = OUTLINED_FUNCTION_33(v22, sel_signatureRegions);
    OUTLINED_FUNCTION_35();

    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_21((uint64_t)v7);
    OUTLINED_FUNCTION_21((uint64_t)v11);
    OUTLINED_FUNCTION_21((uint64_t)v13);
    v24 = v26;
    OUTLINED_FUNCTION_15();
    return __swift_storeEnumTagSinglePayload(v24, 0, 1, v4);
  }
  return result;
}

uint64_t sub_1C39493F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v17;

  v3 = sub_1C3AB7F18();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v17 - v9;
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v17 - v12;
  MEMORY[0x1E0C80A78](v11);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v14((char *)&v17 - v15, v1, v3);
  v14(v10, v1, v3);
  v14(v7, a1, v3);
  sub_1C394B370();
  sub_1C3AB8104();
  sub_1C3AB80F8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v13, v3);
}

uint64_t sub_1C3949540()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  unsigned int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v14;

  v1 = sub_1C3AB7EE8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_29();
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_isMultilingual);

  if (v4
    && (v6 = OUTLINED_FUNCTION_0_0(v5, sel_subject),
        sub_1C3AB7F6C(),
        v6,
        v7 = sub_1C3AB7F9C(),
        swift_bridgeObjectRelease(),
        v7 >= 51))
  {
    v8 = (void *)objc_opt_self();
    v9 = OUTLINED_FUNCTION_0_0((uint64_t)v8, sel_subject);
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_12();
    v14 = v0;
    sub_1C3AB7FD8();
    v10 = (void *)sub_1C3AB7F60();
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v8, sel_detectLanguageFromTextHeuristically_, v10, v14, v7);

    if (v11)
    {
      v12 = sub_1C3AB7F6C();

    }
    else
    {
      return 0;
    }
  }
  else
  {
    sub_1C3AB7EDC();
    v12 = sub_1C3AB7ED0();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  }
  return v12;
}

id sub_1C3949700()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;

  sub_1C39587C0(v0);
  v3 = v2;
  if (v2)
  {
    v4 = v1;
    if (qword_1ED7E7680 != -1)
      swift_once();
    sub_1C3954DDC(v4, (uint64_t)v3, qword_1ED7E7760);
    if ((v5 & 1) != 0)
    {
      OUTLINED_FUNCTION_1_0();
      return 0;
    }
    else
    {
      v6 = objc_msgSend((id)objc_opt_self(), sel_defaultPolicy);
      v7 = (void *)sub_1C3AB7F60();
      OUTLINED_FUNCTION_1_0();
      v3 = objc_msgSend(v6, sel_bundleIdentifierIsAllowedForSearchableItems_, v7);

    }
  }
  return v3;
}

void sub_1C39497DC()
{
  void *v0;
  uint64_t v1;
  uint64_t inited;
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  unint64_t v13;
  char v14;
  char v15;
  unint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C3AE4980;
  v3 = OUTLINED_FUNCTION_14(inited, sel_fromHandle);
  v4 = OUTLINED_FUNCTION_28((uint64_t)v3);
  v5 = OUTLINED_FUNCTION_30(v4, (SEL *)&selRef_toHandles);
  v6 = OUTLINED_FUNCTION_4_1(v5);
  v7 = OUTLINED_FUNCTION_30(v6, (SEL *)&selRef_ccHandles);
  v8 = OUTLINED_FUNCTION_4_1(v7);
  v9 = OUTLINED_FUNCTION_30(v8, (SEL *)&selRef_bccHandles);
  OUTLINED_FUNCTION_4_1(v9);
  if (!(v16 >> 62))
  {
    v10 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_3;
LABEL_13:
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_13();
    return;
  }
  OUTLINED_FUNCTION_24();
  v10 = sub_1C3AB81AC();
  OUTLINED_FUNCTION_1_0();
  if (!v10)
    goto LABEL_13;
LABEL_3:
  OUTLINED_FUNCTION_17();
  if ((v10 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_46();
    do
    {
      if (v1)
        OUTLINED_FUNCTION_36();
      v11 = OUTLINED_FUNCTION_32();
      v12 = OUTLINED_FUNCTION_40(v11);
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_37();

      OUTLINED_FUNCTION_39();
      if (v14)
        OUTLINED_FUNCTION_19(v13);
      OUTLINED_FUNCTION_31();
    }
    while (!v15);
    goto LABEL_13;
  }
  __break(1u);
}

uint64_t sub_1C3949928()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7648);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1C3AB7EC4();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_29();
  if (qword_1ED7E7678 != -1)
    swift_once();
  v6 = qword_1ED7E7750;
  if (qword_1ED7E7750)
  {
    v7 = qword_1ED7E7748;
    v8 = swift_bridgeObjectRetain();
    v9 = OUTLINED_FUNCTION_0_0(v8, sel_fromHandle);
    sub_1C394AF40(v9, (SEL *)&selRef_contactIdentifier);
    if (v11)
    {
      if (v7 == v10 && v6 == v11)
        v13 = 1;
      else
        v13 = sub_1C3AB81C4();
      OUTLINED_FUNCTION_45();
    }
    else
    {
      v13 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  sub_1C39497DC();
  v15 = v14;
  sub_1C39587C0(v0);
  if (!v17)
  {
    OUTLINED_FUNCTION_45();
    return 0;
  }
  v18 = v17;
  v38 = v16;
  v19 = (uint64_t)objc_msgSend(v0, sel_respondsToSelector_, sel_domainId);
  if ((v19 & 1) != 0 && (v20 = OUTLINED_FUNCTION_0_0(v19, sel_domainId)) != 0)
  {
    v21 = v20;
    v22 = sub_1C3AB7F6C();
    v36 = v23;
    v37 = v22;

  }
  else
  {
    v36 = 0;
    v37 = 0;
  }
  if (*(_QWORD *)(v15 + 16) < 0x10000uLL)
  {
    v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D70C80]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_, 0, 0, 0, 0, (unsigned __int16)*(_QWORD *)(v15 + 16), v13 & 1);
    v25 = OUTLINED_FUNCTION_0_0((uint64_t)v24, sel_uniqueId);
    v26 = sub_1C3AB7F6C();
    v28 = v27;

    objc_msgSend(v0, sel_absoluteTimestamp);
    sub_1C3AB7EA0();
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
    swift_bridgeObjectRetain();
    v29 = sub_1C3949540();
    v31 = v30;
    v32 = objc_allocWithZone(MEMORY[0x1E0D70C78]);
    v33 = sub_1C394CB2C(v38, v18, v37, v36, v26, v28, v1, (uint64_t)v4, v15, v29, v31, v24);
    OUTLINED_FUNCTION_45();
    return (uint64_t)v33;
  }
  result = sub_1C3AB81A0();
  __break(1u);
  return result;
}

uint64_t sub_1C3949C3C(void *a1)
{
  return sub_1C3949084(a1);
}

uint64_t sub_1C3949C5C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_1C39491BC(a1, a2);
}

void sub_1C3949C70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  OUTLINED_FUNCTION_11(a1, (SEL *)&selRef_title);
  OUTLINED_FUNCTION_7_0(v1, v2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_0_1();
  v4 = OUTLINED_FUNCTION_14(v3, sel_summary);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_18();
  v5 = OUTLINED_FUNCTION_0_1();
  v6 = OUTLINED_FUNCTION_14(v5, sel_content);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_20();
}

void sub_1C3949D04()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1();
}

void sub_1C3949D1C(uint64_t a1)
{
  sub_1C3949C70(a1);
}

void sub_1C3949D30()
{
  OUTLINED_FUNCTION_10();
}

void sub_1C3949D38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  OUTLINED_FUNCTION_11(a1, (SEL *)&selRef_title);
  OUTLINED_FUNCTION_7_0(v1, v2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_0_1();
  v4 = OUTLINED_FUNCTION_14(v3, sel_content);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_20();
}

void sub_1C3949DA4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1();
}

void sub_1C3949DBC(uint64_t a1)
{
  sub_1C3949D38(a1);
}

void sub_1C3949DD0()
{
  OUTLINED_FUNCTION_10();
}

void sub_1C3949DD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_42(a1, (SEL *)&selRef_title);
  OUTLINED_FUNCTION_7_0(v1, v2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_11(v3, (SEL *)&selRef_notes);
  OUTLINED_FUNCTION_7_0(v4, v5);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_20();
}

void sub_1C3949E3C()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1();
}

void sub_1C3949E54(uint64_t a1)
{
  sub_1C3949DD8(a1);
}

void sub_1C3949E68()
{
  OUTLINED_FUNCTION_10();
}

void sub_1C3949E70(uint64_t a1)
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
  uint64_t v11;

  OUTLINED_FUNCTION_42(a1, (SEL *)&selRef_title);
  OUTLINED_FUNCTION_7_0(v1, v2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9();
  v3 = OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_11(v3, (SEL *)&selRef_desc);
  OUTLINED_FUNCTION_7_0(v4, v5);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9();
  v6 = OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_11(v6, (SEL *)&selRef_comment);
  OUTLINED_FUNCTION_7_0(v7, v8);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9();
  v9 = OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_11(v9, (SEL *)&selRef_content);
  OUTLINED_FUNCTION_7_0(v10, v11);
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_20();
}

void sub_1C3949F14()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1();
}

void sub_1C3949F2C(uint64_t a1)
{
  sub_1C3949E70(a1);
}

void sub_1C3949F40()
{
  OUTLINED_FUNCTION_10();
}

void sub_1C3949F48()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(objc_msgSend(v0, sel_interaction), sel_intent);
  OUTLINED_FUNCTION_43();
  sub_1C394AF40(v0, (SEL *)&selRef_intentDescription);
  OUTLINED_FUNCTION_7_0(v2, v3);
  OUTLINED_FUNCTION_10();
}

void sub_1C3949FAC()
{
  sub_1C3949F48();
  OUTLINED_FUNCTION_10();
}

void sub_1C3949FC8()
{
  sub_1C394A13C((const char **)&selRef_title);
}

uint64_t sub_1C3949FF0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  sub_1C394AF40(objc_msgSend(v0, sel_userActivity), (SEL *)&selRef_title);
  return OUTLINED_FUNCTION_7_0(v1, v2);
}

uint64_t sub_1C394A030()
{
  return sub_1C3949FF0();
}

void sub_1C394A050()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = objc_msgSend(v0, sel_contentIsReaderText);
  if ((_DWORD)v1)
  {
    OUTLINED_FUNCTION_11((uint64_t)v1, (SEL *)&selRef_title);
    OUTLINED_FUNCTION_7_0(v2, v3);
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_9();
    v4 = OUTLINED_FUNCTION_27();
    v5 = OUTLINED_FUNCTION_14(v4, sel_content);
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_18();
  }
  else
  {
    OUTLINED_FUNCTION_11((uint64_t)v1, (SEL *)&selRef_title);
  }
  sub_1C3955320(819200);
  OUTLINED_FUNCTION_20();
}

void sub_1C394A108()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_3_1();
}

void sub_1C394A120()
{
  sub_1C394A050();
}

void sub_1C394A134()
{
  OUTLINED_FUNCTION_10();
}

void sub_1C394A13C(const char **a1)
{
  id v1;

  v1 = OUTLINED_FUNCTION_0_0((uint64_t)a1, *a1);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5();
}

void sub_1C394A170()
{
  void *v0;
  uint64_t v1;
  uint64_t inited;
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t v9;
  char v10;
  char v11;
  unint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C3AE4980;
  v3 = OUTLINED_FUNCTION_14(inited, sel_fromHandle);
  v4 = OUTLINED_FUNCTION_28((uint64_t)v3);
  v5 = OUTLINED_FUNCTION_30(v4, (SEL *)&selRef_toHandles);
  OUTLINED_FUNCTION_4_1(v5);
  if (!(v12 >> 62))
  {
    v6 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_3;
LABEL_13:
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_13();
    return;
  }
  OUTLINED_FUNCTION_24();
  v6 = sub_1C3AB81AC();
  OUTLINED_FUNCTION_1_0();
  if (!v6)
    goto LABEL_13;
LABEL_3:
  OUTLINED_FUNCTION_17();
  if ((v6 & 0x8000000000000000) == 0)
  {
    OUTLINED_FUNCTION_46();
    do
    {
      if (v1)
        OUTLINED_FUNCTION_36();
      v7 = OUTLINED_FUNCTION_32();
      v8 = OUTLINED_FUNCTION_40(v7);
      OUTLINED_FUNCTION_34();
      OUTLINED_FUNCTION_37();

      OUTLINED_FUNCTION_39();
      if (v10)
        OUTLINED_FUNCTION_19(v9);
      OUTLINED_FUNCTION_31();
    }
    while (!v11);
    goto LABEL_13;
  }
  __break(1u);
}

id sub_1C394A294()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  id v10;

  if (qword_1ED7E7678 != -1)
    swift_once();
  v1 = qword_1ED7E7750;
  if (qword_1ED7E7750)
  {
    v2 = qword_1ED7E7748;
    v3 = swift_bridgeObjectRetain();
    v4 = OUTLINED_FUNCTION_0_0(v3, sel_fromHandle);
    sub_1C394AF40(v4, (SEL *)&selRef_contactIdentifier);
    if (v6)
    {
      if (v2 == v5 && v1 == v6)
        v8 = 1;
      else
        v8 = sub_1C3AB81C4();
      OUTLINED_FUNCTION_1_0();
    }
    else
    {
      v8 = 0;
    }
    OUTLINED_FUNCTION_9();
  }
  else
  {
    v8 = 0;
  }
  sub_1C394A170();
  v10 = sub_1C394B06C(v0, v9, v8 & 1);
  OUTLINED_FUNCTION_1_0();
  return v10;
}

void sub_1C394A390()
{
  sub_1C394A13C((const char **)&selRef_content);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C394A3B4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_1C3AB8218();
  swift_bridgeObjectRetain();
  sub_1C3AB7F90();
  v8 = sub_1C3AB8230();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1C3AB81C4() & 1) != 0)
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
      if (v19 || (sub_1C3AB81C4() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1C394A838(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1C394A560()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
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
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E4EA0);
  v3 = sub_1C3AB811C();
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
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_1C3AB8218();
      sub_1C3AB7F90();
      result = sub_1C3AB8230();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
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
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_1C394A9D0(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1C394A838(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_1C394A560();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1C394A9EC();
      goto LABEL_22;
    }
    sub_1C394AB9C();
  }
  v11 = *v4;
  sub_1C3AB8218();
  sub_1C3AB7F90();
  result = sub_1C3AB8230();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1C3AB81C4(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1C3AB81D0();
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
          result = sub_1C3AB81C4();
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

uint64_t sub_1C394A9D0(uint64_t result, uint64_t a2, _QWORD *a3)
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

void *sub_1C394A9EC()
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
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E4EA0);
  v2 = *v0;
  v3 = sub_1C3AB8110();
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
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_1C394AB9C()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
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
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E4EA0);
  v3 = sub_1C3AB811C();
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
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_1C3AB8218();
    swift_bridgeObjectRetain();
    sub_1C3AB7F90();
    result = sub_1C3AB8230();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_1C394AE44(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1C394AE60(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_1C394AE60(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E76A8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1C3957964(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C3957AE4((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_1C394AF40(void *a1, SEL *a2)
{
  id v3;

  v3 = OUTLINED_FUNCTION_41(a1, a2);

  if (v3)
  {
    sub_1C3AB7F6C();
    OUTLINED_FUNCTION_44();
  }
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1C394AF90(void *a1, SEL *a2)
{
  uint64_t v2;

  if (!OUTLINED_FUNCTION_41(a1, a2))
    return 0;
  sub_1C394B030();
  sub_1C3AB8008();
  OUTLINED_FUNCTION_43();
  return v2;
}

void sub_1C394AFE0(void *a1, SEL *a2)
{
  id v2;
  void *v3;

  v2 = OUTLINED_FUNCTION_41(a1, a2);
  if (v2)
  {
    v3 = v2;
    sub_1C3AB7F6C();

  }
  OUTLINED_FUNCTION_5();
}

unint64_t sub_1C394B030()
{
  unint64_t result;

  result = qword_1ED7E77C0;
  if (!qword_1ED7E77C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED7E77C0);
  }
  return result;
}

id sub_1C394B06C(void *a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7648);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1C3AB7EC4();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(a1, sel_content);
  sub_1C3AB7F6C();

  v13 = sub_1C3AB7F9C();
  swift_bridgeObjectRelease();
  if ((v13 & 0x8000000000000000) == 0 && !HIDWORD(v13))
  {
    sub_1C3958AA0(a1);
    if (!v15)
      return 0;
    v16 = v15;
    v36 = v14;
    if ((objc_msgSend(a1, sel_respondsToSelector_, sel_domainId) & 1) != 0
      && (v17 = objc_msgSend(a1, sel_domainId)) != 0)
    {
      v18 = v17;
      v19 = sub_1C3AB7F6C();
      v34 = v20;
      v35 = v19;

      if (!a2)
      {
LABEL_7:
        LOWORD(v21) = 0;
LABEL_10:
        v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D70C80]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_, 0, 0, v13, 0, (unsigned __int16)v21, a3 & 1);
        v23 = objc_msgSend(a1, sel_uniqueId);
        v24 = sub_1C3AB7F6C();
        v26 = v25;

        objc_msgSend(a1, sel_absoluteTimestamp);
        sub_1C3AB7EA0();
        __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v9);
        swift_bridgeObjectRetain();
        sub_1C3954ED4();
        v28 = v27;
        v30 = v29;
        v31 = objc_allocWithZone(MEMORY[0x1E0D70C78]);
        return sub_1C394CB2C(v36, v16, v35, v34, v24, v26, (uint64_t)v11, (uint64_t)v8, a2, v28, v30, v22);
      }
    }
    else
    {
      v34 = 0;
      v35 = 0;
      if (!a2)
        goto LABEL_7;
    }
    v21 = *(_QWORD *)(a2 + 16);
    if (v21 < 0x10000)
      goto LABEL_10;
  }
  result = (id)sub_1C3AB81A0();
  __break(1u);
  return result;
}

unint64_t sub_1C394B370()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF8E4EA8;
  if (!qword_1EF8E4EA8)
  {
    v1 = sub_1C3AB7F18();
    result = MEMORY[0x1C3BD6C78](MEMORY[0x1E0CB13E8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF8E4EA8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_1(unint64_t a1)
{
  unint64_t v1;

  if (!a1)
    a1 = v1;
  return sub_1C3957C5C(a1);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_1C3AB7FB4();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_1C3AB7FB4();
}

void OUTLINED_FUNCTION_12()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_16()
{
  uint64_t v0;

  return v0;
}

char *OUTLINED_FUNCTION_17()
{
  uint64_t v0;

  return sub_1C394AE44(0, v0 & ~(v0 >> 63), 0);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_bridgeObjectRelease();
}

char *OUTLINED_FUNCTION_19@<X0>(unint64_t a1@<X8>)
{
  int64_t v1;

  return sub_1C394AE44((char *)(a1 > 1), v1, 1);
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void OUTLINED_FUNCTION_22()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_1C3AB7F6C();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_1C3AB7F6C();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_1C3AB7FB4();
}

uint64_t OUTLINED_FUNCTION_28(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return sub_1C3AB8014();
}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1, SEL *a2)
{
  void *v2;

  return sub_1C394AF90(v2, a2);
}

void OUTLINED_FUNCTION_31()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v0 + 16) = v3;
  v5 = v0 + 16 * v4;
  *(_QWORD *)(v5 + 32) = v1;
  *(_QWORD *)(v5 + 40) = v2;
}

id OUTLINED_FUNCTION_32()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v0 + 8 * v1 + 32);
}

id OUTLINED_FUNCTION_33(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_1C3AB7F6C();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_1C3AB7F0C();
}

void OUTLINED_FUNCTION_36()
{
  JUMPOUT(0x1C3BD5BF8);
}

void OUTLINED_FUNCTION_37()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_1C3AB7FB4();
}

id OUTLINED_FUNCTION_40(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 2888));
}

id OUTLINED_FUNCTION_41(void *a1, SEL *a2)
{
  return objc_msgSend(a1, *a2);
}

void OUTLINED_FUNCTION_42(uint64_t a1, SEL *a2)
{
  void *v2;

  sub_1C394AFE0(v2, a2);
}

void OUTLINED_FUNCTION_43()
{
  void *v0;

}

void OUTLINED_FUNCTION_44()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_47()
{
  uint64_t v0;

  return sub_1C39493F4(v0);
}

uint64_t StringDonation.uniqueId.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___PPSWStringDonation_uniqueId);
  OUTLINED_FUNCTION_149();
  v2 = *v1;
  OUTLINED_FUNCTION_167();
  return v2;
}

uint64_t StringDonation.uniqueId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___PPSWStringDonation_uniqueId);
  OUTLINED_FUNCTION_149();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

void StringDonation.uniqueId.modify()
{
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_10();
}

double StringDonation.absoluteTimestamp.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___PPSWStringDonation_absoluteTimestamp;
  OUTLINED_FUNCTION_149();
  return *(double *)v1;
}

uint64_t StringDonation.absoluteTimestamp.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___PPSWStringDonation_absoluteTimestamp);
  result = OUTLINED_FUNCTION_149();
  *v3 = a1;
  return result;
}

void StringDonation.absoluteTimestamp.modify()
{
  OUTLINED_FUNCTION_149();
  OUTLINED_FUNCTION_10();
}

void sub_1C394B79C()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + OBJC_IVAR___PPSWStringDonation_source);
  OUTLINED_FUNCTION_10();
}

void sub_1C394B80C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR___PPSWStringDonation_source);
  *(_QWORD *)(v1 + OBJC_IVAR___PPSWStringDonation_source) = a1;

}

id sub_1C394B82C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  void *v3;

  a3();
  v3 = (void *)sub_1C3AB7F60();
  OUTLINED_FUNCTION_1_0();
  return v3;
}

void sub_1C394B860()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_10();
}

void sub_1C394B8A0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = sub_1C3AB7F6C();
  v8 = v7;
  v9 = a1;
  a4(v6, v8);

}

uint64_t sub_1C394B900(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR___PPSWStringDonation_extractionContent);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C394B940()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___PPSWStringDonation_shouldConsume);
}

uint64_t sub_1C394B974(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + OBJC_IVAR___PPSWStringDonation_shouldConsume) = result;
  return result;
}

void StringDonation.__allocating_init(labeledStrings:bundleId:groupId:documentId:)()
{
  OUTLINED_FUNCTION_151();
  StringDonation.init(labeledStrings:bundleId:groupId:documentId:)();
}

void StringDonation.init(labeledStrings:bundleId:groupId:documentId:)()
{
  char *v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  objc_super v50;
  uint64_t v51;

  OUTLINED_FUNCTION_104();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v48 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7648);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_154();
  v47 = v13;
  v44 = sub_1C3AB7EC4();
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_154();
  v46 = v15;
  v16 = OBJC_IVAR___PPSWStringDonation_absoluteTimestamp;
  v17 = v0;
  *(CFAbsoluteTime *)&v0[v16] = CFAbsoluteTimeGetCurrent();
  v45 = OBJC_IVAR___PPSWStringDonation_source;
  *(_QWORD *)&v17[OBJC_IVAR___PPSWStringDonation_source] = 0;
  v17[OBJC_IVAR___PPSWStringDonation_shouldConsume] = 1;
  v18 = (uint64_t *)&v17[OBJC_IVAR___PPSWStringDonation_uniqueId];
  v49 = v4;
  *v18 = v4;
  v18[1] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E76A8);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1C3AE4C00;
  OUTLINED_FUNCTION_167();
  v20 = OUTLINED_FUNCTION_153(0x656C746974, 0xE500000000000000);
  if (v21)
    v22 = v20;
  else
    v22 = 0;
  if (v21)
    v23 = v21;
  else
    v23 = 0xE000000000000000;
  *(_QWORD *)(v19 + 32) = v22;
  *(_QWORD *)(v19 + 40) = v23;
  v24 = OUTLINED_FUNCTION_153(0xD000000000000012, 0x80000001C3ACCCC0);
  if (v25)
    v26 = v24;
  else
    v26 = 0;
  if (v25)
    v27 = v25;
  else
    v27 = 0xE000000000000000;
  *(_QWORD *)(v19 + 48) = v26;
  *(_QWORD *)(v19 + 56) = v27;
  v28 = OUTLINED_FUNCTION_153(0x746E6F4374786574, 0xEB00000000746E65);
  if (v29)
    v30 = v28;
  else
    v30 = 0;
  if (v29)
    v31 = v29;
  else
    v31 = 0xE000000000000000;
  *(_QWORD *)(v19 + 64) = v30;
  *(_QWORD *)(v19 + 72) = v31;
  v51 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77A0);
  sub_1C394BF74();
  v32 = sub_1C3AB7F54();
  v34 = v33;
  swift_bridgeObjectRelease();
  v35 = (uint64_t *)&v17[OBJC_IVAR___PPSWStringDonation_extractionContent];
  *v35 = v32;
  v35[1] = v34;
  if (qword_1ED7E7668 != -1)
    swift_once();
  v36 = OUTLINED_FUNCTION_106();
  __swift_project_value_buffer(v36, (uint64_t)qword_1ED7E7A28);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v37 = sub_1C3AB7F24();
  v38 = sub_1C3AB808C();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = OUTLINED_FUNCTION_9_0();
    v51 = OUTLINED_FUNCTION_9_0();
    *(_DWORD *)v39 = 134218498;
    OUTLINED_FUNCTION_45();
    sub_1C3AB80D4();
    OUTLINED_FUNCTION_45();
    *(_WORD *)(v39 + 12) = 2080;
    OUTLINED_FUNCTION_167();
    sub_1C393DFE0(v49, v2, &v51);
    sub_1C3AB80D4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v39 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_1C393DFE0(v48, v10, &v51);
    sub_1C3AB80D4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C392E000, v37, v38, "StringDonation constructed with %ld string donations from document %s from %s", (uint8_t *)v39, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_2();
  }

  OUTLINED_FUNCTION_152();
  OUTLINED_FUNCTION_152();
  OUTLINED_FUNCTION_152();
  swift_bridgeObjectRetain();
  v40 = sub_1C3AB7F9C();
  swift_bridgeObjectRelease();
  if ((v40 & 0x8000000000000000) != 0 || HIDWORD(v40))
  {
    OUTLINED_FUNCTION_156();
    sub_1C3AB81A0();
    __break(1u);
  }
  else
  {
    v41 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D70C80]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_, 0, 0, v40, 0, 0, 0);
    sub_1C3AB7EB8();
    __swift_storeEnumTagSinglePayload(v47, 1, 1, v44);
    objc_allocWithZone(MEMORY[0x1E0D70C78]);
    v42 = sub_1C394CB2C(v48, v10, v8, v6, v49, v2, v46, v47, 0, 0, 0, v41);
    v43 = *(void **)&v17[v45];
    *(_QWORD *)&v17[v45] = v42;

    v50.receiver = v17;
    v50.super_class = (Class)type metadata accessor for StringDonation();
    objc_msgSendSuper2(&v50, sel_init);
    OUTLINED_FUNCTION_30_0();
  }
}

uint64_t sub_1C394BF20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = sub_1C394D4BC(a1, a2);
  if ((v5 & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

unint64_t sub_1C394BF74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED7E77A8;
  if (!qword_1ED7E77A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED7E77A0);
    result = MEMORY[0x1C3BD6C78](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1ED7E77A8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BD6C6C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id StringDonation.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_151(), sel_init);
}

void StringDonation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id StringDonation.__deallocating_deinit()
{
  return sub_1C394CAFC(type metadata accessor for StringDonation);
}

void sub_1C394C158()
{
  sub_1C394B860();
  OUTLINED_FUNCTION_10();
}

void StringDonationConsumer.__allocating_init(topicStore:entityStore:locationStore:entityDissector:topicDissector:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  OUTLINED_FUNCTION_151();
  sub_1C395368C(a1, a2, a3, 0, a4, a5);
  OUTLINED_FUNCTION_150();
}

id StringDonationConsumer.init(topicStore:entityStore:locationStore:entityDissector:topicDissector:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1C395368C(a1, a2, a3, 0, a4, a5);
}

void StringDonationConsumer.__allocating_init()()
{
  OUTLINED_FUNCTION_151();
  StringDonationConsumer.init()();
  OUTLINED_FUNCTION_10();
}

void StringDonationConsumer.init()()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v1 = (void *)objc_opt_self();
  v2 = OUTLINED_FUNCTION_155(v1);
  v3 = (void *)objc_opt_self();
  v4 = OUTLINED_FUNCTION_155(v3);
  v5 = (void *)objc_opt_self();
  v6 = OUTLINED_FUNCTION_155(v5);
  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  objc_msgSend(v0, sel_initWithTopicStore_entityStore_locationStore_entityDissector_topicDissector_, v2, v4, v6, v7, v8);

  OUTLINED_FUNCTION_150();
}

uint64_t StringDonationConsumer.consume(donation:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_1C394C398()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  unsigned int v15;
  id v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v35;
  uint64_t v36;

  v1 = *(void **)(*(_QWORD *)(v0 + 24) + OBJC_IVAR___PPSWStringDonation_source);
  if (!v1)
  {
    if (qword_1ED7E7668 != -1)
      swift_once();
    v10 = OUTLINED_FUNCTION_106();
    __swift_project_value_buffer(v10, (uint64_t)qword_1ED7E7A28);
    v11 = sub_1C3AB7F24();
    v12 = sub_1C3AB80A4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C392E000, v11, v12, "StringDonationConsumer: encountered a sourceless donation", v13, 2u);
      OUTLINED_FUNCTION_0_2();
    }
    goto LABEL_33;
  }
  v2 = v1;
  v3 = sub_1C394D600(v2);
  v5 = v4;
  v6 = sub_1C3AB7F6C();
  if (!v5)
  {
    OUTLINED_FUNCTION_45();
    goto LABEL_19;
  }
  if (v3 == v6 && v5 == v7)
  {
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_18_0();
  }
  else
  {
    v9 = sub_1C3AB81C4();
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_18_0();
    if ((v9 & 1) == 0)
      goto LABEL_19;
  }
  v14 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v15 = objc_msgSend(v14, sel_notificationExtractionEnabled);

  if (!v15)
    goto LABEL_23;
  v16 = objc_msgSend((id)objc_opt_self(), sel_defaultPolicy);
  v17 = OUTLINED_FUNCTION_14((uint64_t)v16, sel_bundleId);
  v18 = v17;
  if (!v17)
  {
    sub_1C3AB7F6C();
    v18 = (void *)sub_1C3AB7F60();
    v17 = (id)OUTLINED_FUNCTION_107();
  }
  v19 = OUTLINED_FUNCTION_166((uint64_t)v17, sel_bundleIdentifierIsAllowedForNotifications_);

  if ((v19 & 1) == 0)
  {
LABEL_23:
    if (qword_1ED7E7668 != -1)
      swift_once();
    v24 = OUTLINED_FUNCTION_106();
    __swift_project_value_buffer(v24, (uint64_t)qword_1ED7E7A28);
    v11 = sub_1C3AB7F24();
    v25 = sub_1C3AB80B0();
    if (os_log_type_enabled(v11, v25))
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1C392E000, v11, v25, "StringDonationConsumer: ignoring notification as notification consumption is not enabled either globally or for this bundle ID.", v26, 2u);
      OUTLINED_FUNCTION_0_2();
    }
    goto LABEL_32;
  }
LABEL_19:
  v20 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v21 = OUTLINED_FUNCTION_14((uint64_t)v20, sel_bundleId);
  v22 = v21;
  if (!v21)
  {
    sub_1C3AB7F6C();
    v22 = (void *)sub_1C3AB7F60();
    v21 = (id)OUTLINED_FUNCTION_107();
  }
  v23 = OUTLINED_FUNCTION_166((uint64_t)v21, sel_bundleIdentifierIsEnabledForDonation_);

  if ((v23 & 1) == 0)
  {
    if (qword_1ED7E7668 != -1)
      swift_once();
    v27 = OUTLINED_FUNCTION_106();
    __swift_project_value_buffer(v27, (uint64_t)qword_1ED7E7A28);
    v2 = v2;
    v11 = sub_1C3AB7F24();
    v28 = sub_1C3AB80B0();
    if (os_log_type_enabled(v11, v28))
    {
      v29 = (uint8_t *)OUTLINED_FUNCTION_9_0();
      v35 = OUTLINED_FUNCTION_9_0();
      v36 = v35;
      *(_DWORD *)v29 = 136315138;
      v30 = OUTLINED_FUNCTION_14(v35, sel_bundleId);
      v31 = sub_1C3AB7F6C();
      v33 = v32;

      *(_QWORD *)(v0 + 16) = sub_1C393DFE0(v31, v33, &v36);
      sub_1C3AB80D4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C392E000, v11, v28, "StringDonationConsumer: _donateNotificationFromLabeledStrings: ignoring notification string from %s due to settings.", v29, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_2();
    }

LABEL_32:
LABEL_33:

    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C394C8B8(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  _QWORD *v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  a3;
  v7 = (_QWORD *)swift_task_alloc();
  v3[5] = v7;
  *v7 = v3;
  v7[1] = sub_1C394C934;
  return StringDonationConsumer.consume(donation:)((uint64_t)v6);
}

uint64_t sub_1C394C934()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  uint64_t v5;

  v1 = *(void (***)(_QWORD))(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v2 = *(void **)(*v0 + 24);
  v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1C394C9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77B8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1C3AB8038();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_1EF8E4EF8;
  v9[5] = v8;
  sub_1C394CDA8((uint64_t)v6, (uint64_t)&unk_1EF8E4F08, (uint64_t)v9);
  return swift_release();
}

void sub_1C394CA80()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id StringDonationConsumer.__deallocating_deinit()
{
  return sub_1C394CAFC(type metadata accessor for StringDonationConsumer);
}

id sub_1C394CAFC(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_1C394CB2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;

  v15 = (void *)sub_1C3AB7F60();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v16 = (void *)sub_1C3AB7F60();
    OUTLINED_FUNCTION_107();
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)sub_1C3AB7F60();
  OUTLINED_FUNCTION_18_0();
  v18 = (void *)sub_1C3AB7EAC();
  v19 = sub_1C3AB7EC4();
  v20 = 0;
  if (__swift_getEnumTagSinglePayload(a8, 1, v19) != 1)
  {
    v20 = (void *)sub_1C3AB7EAC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(a8, v19);
  }
  if (a9)
  {
    v21 = (void *)sub_1C3AB7FF0();
    OUTLINED_FUNCTION_109();
  }
  else
  {
    v21 = 0;
  }
  if (a11)
  {
    v22 = (void *)sub_1C3AB7F60();
    OUTLINED_FUNCTION_18();
  }
  else
  {
    v22 = 0;
  }
  v23 = objc_msgSend(v25, sel_initWithBundleId_groupId_documentId_date_relevanceDate_contactHandles_language_metadata_, v15, v16, v17, v18, v20, v21, v22, a12);

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(a7, v19);
  return v23;
}

uint64_t type metadata accessor for StringDonation()
{
  return objc_opt_self();
}

uint64_t sub_1C394CD00(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1C3952E18;
  return v6();
}

uint64_t sub_1C394CD54(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1C3952E18;
  return v7();
}

uint64_t sub_1C394CDA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1C3AB8038();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1C3952D98(a1, &qword_1ED7E77B8);
  }
  else
  {
    sub_1C3AB802C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1C3AB8020();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1C394CEEC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1C394CF50;
  return v6(a1);
}

uint64_t sub_1C394CF50()
{
  uint64_t v0;

  OUTLINED_FUNCTION_80();
  return OUTLINED_FUNCTION_147(*(uint64_t (**)(void))(v0 + 8));
}

void *sub_1C394CF78(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C3AB81B8();
  __break(1u);
  return result;
}

uint64_t sub_1C394D03C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C394D0D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1C394D2A4(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1C394D2A4((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C394D0D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1C3AB7FC0();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x1E0DEE9D8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_6:
  v3 = sub_1C394D240(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1C3AB8134();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_1C3AB81B8();
  __break(1u);
LABEL_14:
  result = sub_1C3AB81A0();
  __break(1u);
  return result;
}

_QWORD *sub_1C394D240(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E4F28);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1C394D2A4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E4F28);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1C394D43C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C394D378(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1C394D378(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C3AB81B8();
  __break(1u);
  return result;
}

char *sub_1C394D43C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C3AB81B8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_1C394D4BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1C3AB8218();
  sub_1C3AB7F90();
  v4 = sub_1C3AB8230();
  return sub_1C394D520(a1, a2, v4);
}

unint64_t sub_1C394D520(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1C3AB81C4() & 1) == 0)
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
      while (!v14 && (sub_1C3AB81C4() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1C394D600(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_groupId);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1C3AB7F6C();

  return v3;
}

void sub_1C394D660()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _UNKNOWN **v30;
  uint64_t (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  char v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  char v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  os_log_type_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  _QWORD v107[6];
  void *v108;

  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_6_1(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = OUTLINED_FUNCTION_88();
  v14 = OUTLINED_FUNCTION_73(v13);
  MEMORY[0x1E0C80A78](v14);
  v15 = OUTLINED_FUNCTION_23();
  v16 = OUTLINED_FUNCTION_27_0(v15);
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_29_0(v17, v104);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_72();
  v21 = MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_35_0(v21, v22, v23, v24, v25, v26, v27, v28, v105);
  OUTLINED_FUNCTION_141();
  v29 = (uint64_t)sub_1C3954CA8();
  if ((v29 & 1) != 0)
  {
    sub_1C39553D0();
    if (v29)
    {
      if ((OUTLINED_FUNCTION_64(v29) & 1) != 0)
      {
        v108 = (void *)MEMORY[0x1E0DEE9D8];
        v30 = &off_1E7E14360;
        v107[3] = v2;
        v107[4] = &off_1E7E14360;
        v107[0] = v4;
        OUTLINED_FUNCTION_42_0();
        v31 = (uint64_t (*)(uint64_t))OUTLINED_FUNCTION_34_0();
        v33 = v32;
        OUTLINED_FUNCTION_57();
        if (v33)
        {
          v34 = OUTLINED_FUNCTION_21_0();
          OUTLINED_FUNCTION_5_1(v34);
          v35 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77D8);
          v36 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7798);
          if ((OUTLINED_FUNCTION_2_3() & 1) != 0)
          {
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v107);
            OUTLINED_FUNCTION_42_0();
            if ((OUTLINED_FUNCTION_2_3() & 1) != 0)
            {
              v37 = OUTLINED_FUNCTION_3_2();
              OUTLINED_FUNCTION_43_0(v37, &qword_1ED7E7650);
              OUTLINED_FUNCTION_57();
            }
            else
            {
              OUTLINED_FUNCTION_99();
              OUTLINED_FUNCTION_43_0(v60, &qword_1ED7E7650);
              OUTLINED_FUNCTION_117(v61, &qword_1EF8E4F20);
              OUTLINED_FUNCTION_52();
            }
            OUTLINED_FUNCTION_85();
          }
          OUTLINED_FUNCTION_136();
          if (v62)
          {
            OUTLINED_FUNCTION_135();
            if (v63)
            {
              v64 = v63;
              OUTLINED_FUNCTION_36_0();
              OUTLINED_FUNCTION_67();
              v65 = OUTLINED_FUNCTION_41_0();
              if (v62)
              {
                v30 = 0;
              }
              else
              {
                OUTLINED_FUNCTION_111();
                v65 = OUTLINED_FUNCTION_37_0();
              }
              v66 = OUTLINED_FUNCTION_10_0(v65, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);
              OUTLINED_FUNCTION_59();

              OUTLINED_FUNCTION_58(v67, &qword_1ED7E7698);
              OUTLINED_FUNCTION_92();
              OUTLINED_FUNCTION_129();
              OUTLINED_FUNCTION_98();

              v35 = v3;
            }
          }
          if ((OUTLINED_FUNCTION_133() & 1) != 0)
          {
            OUTLINED_FUNCTION_146();
            if (v68 || (OUTLINED_FUNCTION_134(), !v36))
            {
              v75 = OUTLINED_FUNCTION_44_0();
            }
            else
            {
              objc_opt_self();
              v69 = OUTLINED_FUNCTION_120();
              v70 = OUTLINED_FUNCTION_38_0((uint64_t)v69);
              OUTLINED_FUNCTION_105();
              OUTLINED_FUNCTION_79(v71, sel_respondsToSelector_);
              OUTLINED_FUNCTION_145();
              if ((v72 & 1) != 0)
              {
                v73 = OUTLINED_FUNCTION_79(v72, (const char *)(v1 + 1480));
                OUTLINED_FUNCTION_119();
                OUTLINED_FUNCTION_47_0();
              }
              else
              {
                OUTLINED_FUNCTION_94();
              }
              OUTLINED_FUNCTION_17_0();
              OUTLINED_FUNCTION_16_0();
              OUTLINED_FUNCTION_162();
              if (v76)
              {
                OUTLINED_FUNCTION_76();
                OUTLINED_FUNCTION_48();
              }
              else
              {
                v30 = 0;
              }
              v77 = OUTLINED_FUNCTION_14_0();
              OUTLINED_FUNCTION_59();

              OUTLINED_FUNCTION_58(v78, (unint64_t *)&unk_1ED7E77E0);
              OUTLINED_FUNCTION_122();
              v79 = OUTLINED_FUNCTION_19_0();
              OUTLINED_FUNCTION_93(v79);
              v80 = OUTLINED_FUNCTION_45_0();
              OUTLINED_FUNCTION_144();
              sub_1C39553D0();
              v82 = v81;
              if (v81)
              {
                v83 = OUTLINED_FUNCTION_95();
                OUTLINED_FUNCTION_118();
                OUTLINED_FUNCTION_114();
                OUTLINED_FUNCTION_47_0();
              }
              else
              {
                v30 = (_UNKNOWN **)0xE000000000000000;
              }
              OUTLINED_FUNCTION_17_0();
              OUTLINED_FUNCTION_16_0();
              OUTLINED_FUNCTION_162();
              if (v84)
              {
                OUTLINED_FUNCTION_76();
                OUTLINED_FUNCTION_48();
              }
              else
              {
                v30 = 0;
              }
              v85 = OUTLINED_FUNCTION_25_0();
              OUTLINED_FUNCTION_59();

              OUTLINED_FUNCTION_50();
              OUTLINED_FUNCTION_112();
              OUTLINED_FUNCTION_51();
              OUTLINED_FUNCTION_1_0();
              OUTLINED_FUNCTION_42_0();
              __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7788);
              v31 = (uint64_t (*)(uint64_t))OUTLINED_FUNCTION_20_0();
              if ((_DWORD)v31)
                OUTLINED_FUNCTION_57();
              OUTLINED_FUNCTION_162();
              if (v86)
              {
                OUTLINED_FUNCTION_142();
              }
              else
              {
                OUTLINED_FUNCTION_66();
                OUTLINED_FUNCTION_128();
                OUTLINED_FUNCTION_7_1();
                if (!v30)
                  OUTLINED_FUNCTION_94();
              }
              OUTLINED_FUNCTION_17_0();
              OUTLINED_FUNCTION_16_0();
              OUTLINED_FUNCTION_13_0();
              OUTLINED_FUNCTION_90();
              OUTLINED_FUNCTION_46_0();
              v87 = OUTLINED_FUNCTION_84();
              v88 = OUTLINED_FUNCTION_1_2(v87, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);
              OUTLINED_FUNCTION_130();

              OUTLINED_FUNCTION_58(v89, &qword_1ED7E7698);
              OUTLINED_FUNCTION_91();
              OUTLINED_FUNCTION_123();
              OUTLINED_FUNCTION_97();

              OUTLINED_FUNCTION_143();
            }
            v90 = v31(v75);
            v91 = v108;
            if ((v90 & 1) != 0)
            {
              OUTLINED_FUNCTION_26_0();
              if (!v31)
              {
                OUTLINED_FUNCTION_43_0(v92, &qword_1ED7E7650);
                OUTLINED_FUNCTION_1_0();
                OUTLINED_FUNCTION_4_2();
                goto LABEL_65;
              }
              v93 = OUTLINED_FUNCTION_1_0();
              if (qword_1ED7E7668 != -1)
                v93 = swift_once();
              OUTLINED_FUNCTION_56(v93, (uint64_t)qword_1ED7E7A28);
              OUTLINED_FUNCTION_78();
              sub_1C3AB7F24();
              v94 = OUTLINED_FUNCTION_124();
              if (OUTLINED_FUNCTION_65(v94))
              {
                OUTLINED_FUNCTION_9_0();
                v95 = OUTLINED_FUNCTION_9_0();
                OUTLINED_FUNCTION_140(v95);
                OUTLINED_FUNCTION_24_0(4.8149e-34);
                v96 = OUTLINED_FUNCTION_89();
                v98 = OUTLINED_FUNCTION_81(v96, v97);
                OUTLINED_FUNCTION_12_0(v98);
                OUTLINED_FUNCTION_18_0();
                OUTLINED_FUNCTION_32_0();
                OUTLINED_FUNCTION_32_0();
                OUTLINED_FUNCTION_54(&dword_1C392E000, v99, v100, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_70();
                OUTLINED_FUNCTION_0_2();
              }
              OUTLINED_FUNCTION_32_0();
              OUTLINED_FUNCTION_32_0();

              objc_opt_self();
              v102 = OUTLINED_FUNCTION_87();
              v103 = OUTLINED_FUNCTION_96(v102, sel_failedWithError_);
              OUTLINED_FUNCTION_125();
              OUTLINED_FUNCTION_4_2();
              OUTLINED_FUNCTION_32_0();
              goto LABEL_64;
            }
            OUTLINED_FUNCTION_1_0();
            v74 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_44_0();
            OUTLINED_FUNCTION_1_0();
            v74 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
          }
          v74;
          OUTLINED_FUNCTION_4_2();
LABEL_64:
          OUTLINED_FUNCTION_43_0(v101, &qword_1ED7E7650);
          goto LABEL_65;
        }
        v52 = swift_bridgeObjectRelease();
        if (qword_1ED7E7668 != -1)
          v52 = swift_once();
        OUTLINED_FUNCTION_40_0(v52, (uint64_t)qword_1ED7E7A28);
        sub_1C3AB7F24();
        v53 = OUTLINED_FUNCTION_77();
        if (OUTLINED_FUNCTION_62(v53))
        {
          OUTLINED_FUNCTION_9_0();
          v54 = OUTLINED_FUNCTION_9_0();
          OUTLINED_FUNCTION_137(v54);
          OUTLINED_FUNCTION_100(4.8149e-34);
          v56 = OUTLINED_FUNCTION_79(v55, sel_uniqueId);
          OUTLINED_FUNCTION_113();
          OUTLINED_FUNCTION_86();
          v57 = OUTLINED_FUNCTION_61();
          OUTLINED_FUNCTION_22_0(v57);

          OUTLINED_FUNCTION_109();
          OUTLINED_FUNCTION_53(&dword_1C392E000, v58, v59, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_69();
          OUTLINED_FUNCTION_0_2();
        }

        v47 = objc_msgSend((id)objc_opt_self(), sel_ignored);
      }
      else
      {
        v47 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
      }
      v47;
      OUTLINED_FUNCTION_4_2();
LABEL_65:
      OUTLINED_FUNCTION_30_0();
      return;
    }
  }
  if (qword_1ED7E7668 != -1)
    v29 = swift_once();
  OUTLINED_FUNCTION_15_0(v29, (uint64_t)qword_1ED7E7A28);
  v38 = v4;
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_116();
  v39 = OUTLINED_FUNCTION_77();
  if (OUTLINED_FUNCTION_63(v39))
  {
    OUTLINED_FUNCTION_9_0();
    v40 = OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_139(v40);
    OUTLINED_FUNCTION_138(4.8151e-34);
    v42 = OUTLINED_FUNCTION_126(v41, sel_uniqueId);
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_83();
    v43 = OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_11_0(v43);

    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_103();
    sub_1C39553D0();
    if (v44)
    {
      v45 = objc_msgSend(v44, sel_bundleId);
      OUTLINED_FUNCTION_115();
      OUTLINED_FUNCTION_132();
      OUTLINED_FUNCTION_82();
    }
    else
    {
      OUTLINED_FUNCTION_28_0();
    }
    v48 = OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_33_0(v48);

    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_68(&dword_1C392E000, v49, (os_log_type_t)v2, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_55();
    OUTLINED_FUNCTION_0_2();
  }

  OUTLINED_FUNCTION_127();
  v46 = OUTLINED_FUNCTION_102();
  v50(v46);
  v51 = objc_msgSend((id)objc_opt_self(), sel_ignored);
  OUTLINED_FUNCTION_8_0(v51);
}

id sub_1C394DED4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v3;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  id v35;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_6_1(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = OUTLINED_FUNCTION_88();
  v11 = OUTLINED_FUNCTION_73(v10);
  MEMORY[0x1E0C80A78](v11);
  v12 = OUTLINED_FUNCTION_23();
  v13 = OUTLINED_FUNCTION_27_0(v12);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_29_0(v14, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_72();
  v18 = MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_35_0(v18, v19, v20, v21, v22, v23, v24, v25, v38);
  OUTLINED_FUNCTION_141();
  v26 = (uint64_t)sub_1C3954CB4();
  if ((v26 & 1) != 0)
    sub_1C3955564();
  if (qword_1ED7E7668 != -1)
    v26 = swift_once();
  OUTLINED_FUNCTION_15_0(v26, (uint64_t)qword_1ED7E7A28);
  v27 = v1;
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_116();
  v28 = OUTLINED_FUNCTION_77();
  if (OUTLINED_FUNCTION_63(v28))
  {
    OUTLINED_FUNCTION_9_0();
    v29 = OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_139(v29);
    OUTLINED_FUNCTION_138(4.8151e-34);
    v31 = OUTLINED_FUNCTION_126(v30, sel_uniqueId);
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_83();
    v32 = OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_11_0(v32);

    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_103();
    sub_1C3955564();
  }

  OUTLINED_FUNCTION_127();
  v33 = OUTLINED_FUNCTION_102();
  v34(v33);
  v35 = objc_msgSend((id)objc_opt_self(), sel_ignored);
  return OUTLINED_FUNCTION_8_0(v35);
}

void sub_1C394E748()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _UNKNOWN **v30;
  uint64_t (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  char v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  char v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  os_log_type_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  _QWORD v106[6];
  void *v107;

  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_6_1(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = OUTLINED_FUNCTION_88();
  v14 = OUTLINED_FUNCTION_73(v13);
  MEMORY[0x1E0C80A78](v14);
  v15 = OUTLINED_FUNCTION_23();
  v16 = OUTLINED_FUNCTION_27_0(v15);
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_29_0(v17, v103);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_72();
  v21 = MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_35_0(v21, v22, v23, v24, v25, v26, v27, v28, v104);
  OUTLINED_FUNCTION_141();
  v29 = (uint64_t)sub_1C3954CC0();
  if ((v29 & 1) != 0)
  {
    v29 = (uint64_t)sub_1C394A294();
    if (v29)
    {
      if ((OUTLINED_FUNCTION_64(v29) & 1) != 0)
      {
        v107 = (void *)MEMORY[0x1E0DEE9D8];
        v30 = &off_1E7E14460;
        v106[3] = v2;
        v106[4] = &off_1E7E14460;
        v106[0] = v4;
        OUTLINED_FUNCTION_42_0();
        v31 = (uint64_t (*)(uint64_t))OUTLINED_FUNCTION_34_0();
        v33 = v32;
        OUTLINED_FUNCTION_57();
        if (v33)
        {
          v34 = OUTLINED_FUNCTION_21_0();
          OUTLINED_FUNCTION_5_1(v34);
          v35 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77D8);
          v36 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7798);
          if ((OUTLINED_FUNCTION_2_3() & 1) != 0)
          {
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
            OUTLINED_FUNCTION_42_0();
            if ((OUTLINED_FUNCTION_2_3() & 1) != 0)
            {
              v37 = OUTLINED_FUNCTION_3_2();
              OUTLINED_FUNCTION_43_0(v37, &qword_1ED7E7650);
              OUTLINED_FUNCTION_57();
            }
            else
            {
              OUTLINED_FUNCTION_99();
              OUTLINED_FUNCTION_43_0(v60, &qword_1ED7E7650);
              OUTLINED_FUNCTION_117(v61, &qword_1EF8E4F20);
              OUTLINED_FUNCTION_52();
            }
            OUTLINED_FUNCTION_85();
          }
          OUTLINED_FUNCTION_136();
          if (v62)
          {
            OUTLINED_FUNCTION_135();
            if (v63)
            {
              v64 = v63;
              OUTLINED_FUNCTION_36_0();
              OUTLINED_FUNCTION_67();
              v65 = OUTLINED_FUNCTION_41_0();
              if (v62)
              {
                v30 = 0;
              }
              else
              {
                OUTLINED_FUNCTION_111();
                v65 = OUTLINED_FUNCTION_37_0();
              }
              v66 = OUTLINED_FUNCTION_10_0(v65, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);
              OUTLINED_FUNCTION_59();

              OUTLINED_FUNCTION_58(v67, &qword_1ED7E7698);
              OUTLINED_FUNCTION_92();
              OUTLINED_FUNCTION_129();
              OUTLINED_FUNCTION_98();

              v35 = v3;
            }
          }
          if ((OUTLINED_FUNCTION_133() & 1) != 0)
          {
            OUTLINED_FUNCTION_146();
            if (v68 || (OUTLINED_FUNCTION_134(), !v36))
            {
              v75 = OUTLINED_FUNCTION_44_0();
            }
            else
            {
              objc_opt_self();
              v69 = OUTLINED_FUNCTION_120();
              v70 = OUTLINED_FUNCTION_38_0((uint64_t)v69);
              OUTLINED_FUNCTION_105();
              OUTLINED_FUNCTION_79(v71, sel_respondsToSelector_);
              OUTLINED_FUNCTION_145();
              if ((v72 & 1) != 0)
              {
                v73 = OUTLINED_FUNCTION_79(v72, (const char *)(v1 + 1480));
                OUTLINED_FUNCTION_119();
                OUTLINED_FUNCTION_47_0();
              }
              else
              {
                OUTLINED_FUNCTION_94();
              }
              OUTLINED_FUNCTION_17_0();
              OUTLINED_FUNCTION_16_0();
              OUTLINED_FUNCTION_158();
              if (v76)
              {
                OUTLINED_FUNCTION_76();
                OUTLINED_FUNCTION_48();
              }
              else
              {
                v30 = 0;
              }
              v77 = OUTLINED_FUNCTION_14_0();
              OUTLINED_FUNCTION_59();

              OUTLINED_FUNCTION_58(v78, (unint64_t *)&unk_1ED7E77E0);
              OUTLINED_FUNCTION_122();
              v79 = OUTLINED_FUNCTION_19_0();
              OUTLINED_FUNCTION_93(v79);
              v80 = OUTLINED_FUNCTION_45_0();
              OUTLINED_FUNCTION_144();
              v81 = sub_1C394A294();
              if (v81)
              {
                v82 = OUTLINED_FUNCTION_95();
                OUTLINED_FUNCTION_118();
                OUTLINED_FUNCTION_114();
                OUTLINED_FUNCTION_47_0();
              }
              else
              {
                v30 = (_UNKNOWN **)0xE000000000000000;
              }
              OUTLINED_FUNCTION_17_0();
              OUTLINED_FUNCTION_16_0();
              OUTLINED_FUNCTION_158();
              if (v83)
              {
                OUTLINED_FUNCTION_76();
                OUTLINED_FUNCTION_48();
              }
              else
              {
                v30 = 0;
              }
              v84 = OUTLINED_FUNCTION_25_0();
              OUTLINED_FUNCTION_59();

              OUTLINED_FUNCTION_50();
              OUTLINED_FUNCTION_112();
              OUTLINED_FUNCTION_51();
              OUTLINED_FUNCTION_1_0();
              OUTLINED_FUNCTION_42_0();
              __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7788);
              v31 = (uint64_t (*)(uint64_t))OUTLINED_FUNCTION_20_0();
              if ((_DWORD)v31)
                OUTLINED_FUNCTION_57();
              OUTLINED_FUNCTION_158();
              if (v85)
              {
                OUTLINED_FUNCTION_142();
              }
              else
              {
                OUTLINED_FUNCTION_66();
                OUTLINED_FUNCTION_128();
                OUTLINED_FUNCTION_7_1();
                if (!v30)
                  OUTLINED_FUNCTION_94();
              }
              OUTLINED_FUNCTION_17_0();
              OUTLINED_FUNCTION_16_0();
              OUTLINED_FUNCTION_13_0();
              OUTLINED_FUNCTION_90();
              OUTLINED_FUNCTION_46_0();
              v86 = OUTLINED_FUNCTION_84();
              v87 = OUTLINED_FUNCTION_1_2(v86, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);
              OUTLINED_FUNCTION_130();

              OUTLINED_FUNCTION_58(v88, &qword_1ED7E7698);
              OUTLINED_FUNCTION_91();
              OUTLINED_FUNCTION_123();
              OUTLINED_FUNCTION_97();

              OUTLINED_FUNCTION_143();
            }
            v89 = v31(v75);
            v90 = v107;
            if ((v89 & 1) != 0)
            {
              OUTLINED_FUNCTION_26_0();
              if (!v31)
              {
                OUTLINED_FUNCTION_43_0(v91, &qword_1ED7E7650);
                OUTLINED_FUNCTION_1_0();
                OUTLINED_FUNCTION_4_2();
                goto LABEL_65;
              }
              v92 = OUTLINED_FUNCTION_1_0();
              if (qword_1ED7E7668 != -1)
                v92 = swift_once();
              OUTLINED_FUNCTION_56(v92, (uint64_t)qword_1ED7E7A28);
              OUTLINED_FUNCTION_78();
              sub_1C3AB7F24();
              v93 = OUTLINED_FUNCTION_124();
              if (OUTLINED_FUNCTION_65(v93))
              {
                OUTLINED_FUNCTION_9_0();
                v94 = OUTLINED_FUNCTION_9_0();
                OUTLINED_FUNCTION_140(v94);
                OUTLINED_FUNCTION_24_0(4.8149e-34);
                v95 = OUTLINED_FUNCTION_89();
                v97 = OUTLINED_FUNCTION_81(v95, v96);
                OUTLINED_FUNCTION_12_0(v97);
                OUTLINED_FUNCTION_18_0();
                OUTLINED_FUNCTION_32_0();
                OUTLINED_FUNCTION_32_0();
                OUTLINED_FUNCTION_54(&dword_1C392E000, v98, v99, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_70();
                OUTLINED_FUNCTION_0_2();
              }
              OUTLINED_FUNCTION_32_0();
              OUTLINED_FUNCTION_32_0();

              objc_opt_self();
              v101 = OUTLINED_FUNCTION_87();
              v102 = OUTLINED_FUNCTION_96(v101, sel_failedWithError_);
              OUTLINED_FUNCTION_125();
              OUTLINED_FUNCTION_4_2();
              OUTLINED_FUNCTION_32_0();
              goto LABEL_64;
            }
            OUTLINED_FUNCTION_1_0();
            v74 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_44_0();
            OUTLINED_FUNCTION_1_0();
            v74 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
          }
          v74;
          OUTLINED_FUNCTION_4_2();
LABEL_64:
          OUTLINED_FUNCTION_43_0(v100, &qword_1ED7E7650);
          goto LABEL_65;
        }
        v52 = swift_bridgeObjectRelease();
        if (qword_1ED7E7668 != -1)
          v52 = swift_once();
        OUTLINED_FUNCTION_40_0(v52, (uint64_t)qword_1ED7E7A28);
        sub_1C3AB7F24();
        v53 = OUTLINED_FUNCTION_77();
        if (OUTLINED_FUNCTION_62(v53))
        {
          OUTLINED_FUNCTION_9_0();
          v54 = OUTLINED_FUNCTION_9_0();
          OUTLINED_FUNCTION_137(v54);
          OUTLINED_FUNCTION_100(4.8149e-34);
          v56 = OUTLINED_FUNCTION_79(v55, sel_uniqueId);
          OUTLINED_FUNCTION_113();
          OUTLINED_FUNCTION_86();
          v57 = OUTLINED_FUNCTION_61();
          OUTLINED_FUNCTION_22_0(v57);

          OUTLINED_FUNCTION_109();
          OUTLINED_FUNCTION_53(&dword_1C392E000, v58, v59, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_69();
          OUTLINED_FUNCTION_0_2();
        }

        v47 = objc_msgSend((id)objc_opt_self(), sel_ignored);
      }
      else
      {
        v47 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
      }
      v47;
      OUTLINED_FUNCTION_4_2();
LABEL_65:
      OUTLINED_FUNCTION_30_0();
      return;
    }
  }
  if (qword_1ED7E7668 != -1)
    v29 = swift_once();
  OUTLINED_FUNCTION_15_0(v29, (uint64_t)qword_1ED7E7A28);
  v38 = v4;
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_116();
  v39 = OUTLINED_FUNCTION_77();
  if (OUTLINED_FUNCTION_63(v39))
  {
    OUTLINED_FUNCTION_9_0();
    v40 = OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_139(v40);
    OUTLINED_FUNCTION_138(4.8151e-34);
    v42 = OUTLINED_FUNCTION_126(v41, sel_uniqueId);
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_83();
    v43 = OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_11_0(v43);

    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_103();
    v44 = sub_1C394A294();
    if (v44)
    {
      v45 = objc_msgSend(v44, sel_bundleId);
      OUTLINED_FUNCTION_115();
      OUTLINED_FUNCTION_132();
      OUTLINED_FUNCTION_82();
    }
    else
    {
      OUTLINED_FUNCTION_28_0();
    }
    v48 = OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_33_0(v48);

    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_68(&dword_1C392E000, v49, (os_log_type_t)v2, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_55();
    OUTLINED_FUNCTION_0_2();
  }

  OUTLINED_FUNCTION_127();
  v46 = OUTLINED_FUNCTION_102();
  v50(v46);
  v51 = objc_msgSend((id)objc_opt_self(), sel_ignored);
  OUTLINED_FUNCTION_8_0(v51);
}

id sub_1C394EFBC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v3;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  id v35;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_6_1(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = OUTLINED_FUNCTION_88();
  v11 = OUTLINED_FUNCTION_73(v10);
  MEMORY[0x1E0C80A78](v11);
  v12 = OUTLINED_FUNCTION_23();
  v13 = OUTLINED_FUNCTION_27_0(v12);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_29_0(v14, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_72();
  v18 = MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_35_0(v18, v19, v20, v21, v22, v23, v24, v25, v38);
  OUTLINED_FUNCTION_141();
  v26 = (uint64_t)sub_1C3954CCC();
  if ((v26 & 1) != 0)
    sub_1C39556F8();
  if (qword_1ED7E7668 != -1)
    v26 = swift_once();
  OUTLINED_FUNCTION_15_0(v26, (uint64_t)qword_1ED7E7A28);
  v27 = v1;
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_116();
  v28 = OUTLINED_FUNCTION_77();
  if (OUTLINED_FUNCTION_63(v28))
  {
    OUTLINED_FUNCTION_9_0();
    v29 = OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_139(v29);
    OUTLINED_FUNCTION_138(4.8151e-34);
    v31 = OUTLINED_FUNCTION_126(v30, sel_uniqueId);
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_83();
    v32 = OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_11_0(v32);

    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_103();
    sub_1C39556F8();
  }

  OUTLINED_FUNCTION_127();
  v33 = OUTLINED_FUNCTION_102();
  v34(v33);
  v35 = objc_msgSend((id)objc_opt_self(), sel_ignored);
  return OUTLINED_FUNCTION_8_0(v35);
}

void sub_1C394F830()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _UNKNOWN **v30;
  uint64_t (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  char v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  char v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  os_log_type_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  _QWORD v106[6];
  void *v107;

  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_6_1(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = OUTLINED_FUNCTION_88();
  v14 = OUTLINED_FUNCTION_73(v13);
  MEMORY[0x1E0C80A78](v14);
  v15 = OUTLINED_FUNCTION_23();
  v16 = OUTLINED_FUNCTION_27_0(v15);
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_29_0(v17, v103);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_72();
  v21 = MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_35_0(v21, v22, v23, v24, v25, v26, v27, v28, v104);
  OUTLINED_FUNCTION_141();
  v29 = (uint64_t)sub_1C3949700();
  if ((v29 & 1) != 0)
  {
    v29 = sub_1C3949928();
    if (v29)
    {
      if ((OUTLINED_FUNCTION_64(v29) & 1) != 0)
      {
        v107 = (void *)MEMORY[0x1E0DEE9D8];
        v30 = &off_1E7E14220;
        v106[3] = v2;
        v106[4] = &off_1E7E14220;
        v106[0] = v4;
        OUTLINED_FUNCTION_42_0();
        v31 = (uint64_t (*)(uint64_t))OUTLINED_FUNCTION_34_0();
        v33 = v32;
        OUTLINED_FUNCTION_57();
        if (v33)
        {
          v34 = OUTLINED_FUNCTION_21_0();
          OUTLINED_FUNCTION_5_1(v34);
          v35 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77D8);
          v36 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7798);
          if ((OUTLINED_FUNCTION_2_3() & 1) != 0)
          {
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v106);
            OUTLINED_FUNCTION_42_0();
            if ((OUTLINED_FUNCTION_2_3() & 1) != 0)
            {
              v37 = OUTLINED_FUNCTION_3_2();
              OUTLINED_FUNCTION_43_0(v37, &qword_1ED7E7650);
              OUTLINED_FUNCTION_57();
            }
            else
            {
              OUTLINED_FUNCTION_99();
              OUTLINED_FUNCTION_43_0(v60, &qword_1ED7E7650);
              OUTLINED_FUNCTION_117(v61, &qword_1EF8E4F20);
              OUTLINED_FUNCTION_52();
            }
            OUTLINED_FUNCTION_85();
          }
          OUTLINED_FUNCTION_136();
          if (v62)
          {
            OUTLINED_FUNCTION_135();
            if (v63)
            {
              v64 = v63;
              OUTLINED_FUNCTION_36_0();
              OUTLINED_FUNCTION_67();
              v65 = OUTLINED_FUNCTION_41_0();
              if (v62)
              {
                v30 = 0;
              }
              else
              {
                OUTLINED_FUNCTION_111();
                v65 = OUTLINED_FUNCTION_37_0();
              }
              v66 = OUTLINED_FUNCTION_10_0(v65, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_);
              OUTLINED_FUNCTION_59();

              OUTLINED_FUNCTION_58(v67, &qword_1ED7E7698);
              OUTLINED_FUNCTION_92();
              OUTLINED_FUNCTION_129();
              OUTLINED_FUNCTION_98();

              v35 = v3;
            }
          }
          if ((OUTLINED_FUNCTION_133() & 1) != 0)
          {
            OUTLINED_FUNCTION_146();
            if (v68 || (OUTLINED_FUNCTION_134(), !v36))
            {
              v75 = OUTLINED_FUNCTION_44_0();
            }
            else
            {
              objc_opt_self();
              v69 = OUTLINED_FUNCTION_120();
              v70 = OUTLINED_FUNCTION_38_0((uint64_t)v69);
              OUTLINED_FUNCTION_105();
              OUTLINED_FUNCTION_79(v71, sel_respondsToSelector_);
              OUTLINED_FUNCTION_145();
              if ((v72 & 1) != 0)
              {
                v73 = OUTLINED_FUNCTION_79(v72, (const char *)(v1 + 1480));
                OUTLINED_FUNCTION_119();
                OUTLINED_FUNCTION_47_0();
              }
              else
              {
                OUTLINED_FUNCTION_94();
              }
              OUTLINED_FUNCTION_17_0();
              OUTLINED_FUNCTION_16_0();
              OUTLINED_FUNCTION_163();
              if (v76)
              {
                OUTLINED_FUNCTION_76();
                OUTLINED_FUNCTION_48();
              }
              else
              {
                v30 = 0;
              }
              v77 = OUTLINED_FUNCTION_14_0();
              OUTLINED_FUNCTION_59();

              OUTLINED_FUNCTION_58(v78, (unint64_t *)&unk_1ED7E77E0);
              OUTLINED_FUNCTION_122();
              v79 = OUTLINED_FUNCTION_19_0();
              OUTLINED_FUNCTION_93(v79);
              v80 = OUTLINED_FUNCTION_45_0();
              OUTLINED_FUNCTION_144();
              v81 = (void *)sub_1C3949928();
              if (v81)
              {
                v82 = OUTLINED_FUNCTION_95();
                OUTLINED_FUNCTION_118();
                OUTLINED_FUNCTION_114();
                OUTLINED_FUNCTION_47_0();
              }
              else
              {
                v30 = (_UNKNOWN **)0xE000000000000000;
              }
              OUTLINED_FUNCTION_17_0();
              OUTLINED_FUNCTION_16_0();
              OUTLINED_FUNCTION_163();
              if (v83)
              {
                OUTLINED_FUNCTION_76();
                OUTLINED_FUNCTION_48();
              }
              else
              {
                v30 = 0;
              }
              v84 = OUTLINED_FUNCTION_25_0();
              OUTLINED_FUNCTION_59();

              OUTLINED_FUNCTION_50();
              OUTLINED_FUNCTION_112();
              OUTLINED_FUNCTION_51();
              OUTLINED_FUNCTION_1_0();
              OUTLINED_FUNCTION_42_0();
              __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7788);
              v31 = (uint64_t (*)(uint64_t))OUTLINED_FUNCTION_20_0();
              if ((_DWORD)v31)
                OUTLINED_FUNCTION_57();
              OUTLINED_FUNCTION_163();
              if (v85)
              {
                OUTLINED_FUNCTION_142();
              }
              else
              {
                OUTLINED_FUNCTION_66();
                OUTLINED_FUNCTION_128();
                OUTLINED_FUNCTION_7_1();
                if (!v30)
                  OUTLINED_FUNCTION_94();
              }
              OUTLINED_FUNCTION_17_0();
              OUTLINED_FUNCTION_16_0();
              OUTLINED_FUNCTION_13_0();
              OUTLINED_FUNCTION_90();
              OUTLINED_FUNCTION_46_0();
              v86 = OUTLINED_FUNCTION_84();
              v87 = OUTLINED_FUNCTION_1_2(v86, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_);
              OUTLINED_FUNCTION_130();

              OUTLINED_FUNCTION_58(v88, &qword_1ED7E7698);
              OUTLINED_FUNCTION_91();
              OUTLINED_FUNCTION_123();
              OUTLINED_FUNCTION_97();

              OUTLINED_FUNCTION_143();
            }
            v89 = v31(v75);
            v90 = v107;
            if ((v89 & 1) != 0)
            {
              OUTLINED_FUNCTION_26_0();
              if (!v31)
              {
                OUTLINED_FUNCTION_43_0(v91, &qword_1ED7E7650);
                OUTLINED_FUNCTION_1_0();
                OUTLINED_FUNCTION_4_2();
                goto LABEL_65;
              }
              v92 = OUTLINED_FUNCTION_1_0();
              if (qword_1ED7E7668 != -1)
                v92 = swift_once();
              OUTLINED_FUNCTION_56(v92, (uint64_t)qword_1ED7E7A28);
              OUTLINED_FUNCTION_78();
              sub_1C3AB7F24();
              v93 = OUTLINED_FUNCTION_124();
              if (OUTLINED_FUNCTION_65(v93))
              {
                OUTLINED_FUNCTION_9_0();
                v94 = OUTLINED_FUNCTION_9_0();
                OUTLINED_FUNCTION_140(v94);
                OUTLINED_FUNCTION_24_0(4.8149e-34);
                v95 = OUTLINED_FUNCTION_89();
                v97 = OUTLINED_FUNCTION_81(v95, v96);
                OUTLINED_FUNCTION_12_0(v97);
                OUTLINED_FUNCTION_18_0();
                OUTLINED_FUNCTION_32_0();
                OUTLINED_FUNCTION_32_0();
                OUTLINED_FUNCTION_54(&dword_1C392E000, v98, v99, "Consumer: unable to persist extractions to the database %s");
                OUTLINED_FUNCTION_70();
                OUTLINED_FUNCTION_0_2();
              }
              OUTLINED_FUNCTION_32_0();
              OUTLINED_FUNCTION_32_0();

              objc_opt_self();
              v101 = OUTLINED_FUNCTION_87();
              v102 = OUTLINED_FUNCTION_96(v101, sel_failedWithError_);
              OUTLINED_FUNCTION_125();
              OUTLINED_FUNCTION_4_2();
              OUTLINED_FUNCTION_32_0();
              goto LABEL_64;
            }
            OUTLINED_FUNCTION_1_0();
            v74 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
          }
          else
          {
            OUTLINED_FUNCTION_44_0();
            OUTLINED_FUNCTION_1_0();
            v74 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
          }
          v74;
          OUTLINED_FUNCTION_4_2();
LABEL_64:
          OUTLINED_FUNCTION_43_0(v100, &qword_1ED7E7650);
          goto LABEL_65;
        }
        v52 = swift_bridgeObjectRelease();
        if (qword_1ED7E7668 != -1)
          v52 = swift_once();
        OUTLINED_FUNCTION_40_0(v52, (uint64_t)qword_1ED7E7A28);
        sub_1C3AB7F24();
        v53 = OUTLINED_FUNCTION_77();
        if (OUTLINED_FUNCTION_62(v53))
        {
          OUTLINED_FUNCTION_9_0();
          v54 = OUTLINED_FUNCTION_9_0();
          OUTLINED_FUNCTION_137(v54);
          OUTLINED_FUNCTION_100(4.8149e-34);
          v56 = OUTLINED_FUNCTION_79(v55, sel_uniqueId);
          OUTLINED_FUNCTION_113();
          OUTLINED_FUNCTION_86();
          v57 = OUTLINED_FUNCTION_61();
          OUTLINED_FUNCTION_22_0(v57);

          OUTLINED_FUNCTION_109();
          OUTLINED_FUNCTION_53(&dword_1C392E000, v58, v59, "Consumer: ignoring item with no content with id %s");
          OUTLINED_FUNCTION_69();
          OUTLINED_FUNCTION_0_2();
        }

        v47 = objc_msgSend((id)objc_opt_self(), sel_ignored);
      }
      else
      {
        v47 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
      }
      v47;
      OUTLINED_FUNCTION_4_2();
LABEL_65:
      OUTLINED_FUNCTION_30_0();
      return;
    }
  }
  if (qword_1ED7E7668 != -1)
    v29 = swift_once();
  OUTLINED_FUNCTION_15_0(v29, (uint64_t)qword_1ED7E7A28);
  v38 = v4;
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_116();
  v39 = OUTLINED_FUNCTION_77();
  if (OUTLINED_FUNCTION_63(v39))
  {
    OUTLINED_FUNCTION_9_0();
    v40 = OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_139(v40);
    OUTLINED_FUNCTION_138(4.8151e-34);
    v42 = OUTLINED_FUNCTION_126(v41, sel_uniqueId);
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_83();
    v43 = OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_11_0(v43);

    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_103();
    v44 = (void *)sub_1C3949928();
    if (v44)
    {
      v45 = objc_msgSend(v44, sel_bundleId);
      OUTLINED_FUNCTION_115();
      OUTLINED_FUNCTION_132();
      OUTLINED_FUNCTION_82();
    }
    else
    {
      OUTLINED_FUNCTION_28_0();
    }
    v48 = OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_33_0(v48);

    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_68(&dword_1C392E000, v49, (os_log_type_t)v2, "Consumer: ignoring ineligible item %s from %s.");
    OUTLINED_FUNCTION_55();
    OUTLINED_FUNCTION_0_2();
  }

  OUTLINED_FUNCTION_127();
  v46 = OUTLINED_FUNCTION_102();
  v50(v46);
  v51 = objc_msgSend((id)objc_opt_self(), sel_ignored);
  OUTLINED_FUNCTION_8_0(v51);
}

id sub_1C39500A4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v3;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  id v35;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_6_1(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = OUTLINED_FUNCTION_88();
  v11 = OUTLINED_FUNCTION_73(v10);
  MEMORY[0x1E0C80A78](v11);
  v12 = OUTLINED_FUNCTION_23();
  v13 = OUTLINED_FUNCTION_27_0(v12);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_29_0(v14, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_72();
  v18 = MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_35_0(v18, v19, v20, v21, v22, v23, v24, v25, v38);
  OUTLINED_FUNCTION_141();
  v26 = (uint64_t)sub_1C3954CD8();
  if ((v26 & 1) != 0)
    sub_1C395588C();
  if (qword_1ED7E7668 != -1)
    v26 = swift_once();
  OUTLINED_FUNCTION_15_0(v26, (uint64_t)qword_1ED7E7A28);
  v27 = v1;
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_116();
  v28 = OUTLINED_FUNCTION_77();
  if (OUTLINED_FUNCTION_63(v28))
  {
    OUTLINED_FUNCTION_9_0();
    v29 = OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_139(v29);
    OUTLINED_FUNCTION_138(4.8151e-34);
    v31 = OUTLINED_FUNCTION_126(v30, sel_uniqueId);
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_83();
    v32 = OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_11_0(v32);

    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_103();
    sub_1C395588C();
  }

  OUTLINED_FUNCTION_127();
  v33 = OUTLINED_FUNCTION_102();
  v34(v33);
  v35 = objc_msgSend((id)objc_opt_self(), sel_ignored);
  return OUTLINED_FUNCTION_8_0(v35);
}

id sub_1C3950918()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v3;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  id v35;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_6_1(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = OUTLINED_FUNCTION_88();
  v11 = OUTLINED_FUNCTION_73(v10);
  MEMORY[0x1E0C80A78](v11);
  v12 = OUTLINED_FUNCTION_23();
  v13 = OUTLINED_FUNCTION_27_0(v12);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_29_0(v14, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_72();
  v18 = MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_35_0(v18, v19, v20, v21, v22, v23, v24, v25, v38);
  OUTLINED_FUNCTION_141();
  v26 = (uint64_t)sub_1C3954CE4();
  if ((v26 & 1) != 0)
    sub_1C3955A20();
  if (qword_1ED7E7668 != -1)
    v26 = swift_once();
  OUTLINED_FUNCTION_15_0(v26, (uint64_t)qword_1ED7E7A28);
  v27 = v1;
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_116();
  v28 = OUTLINED_FUNCTION_77();
  if (OUTLINED_FUNCTION_63(v28))
  {
    OUTLINED_FUNCTION_9_0();
    v29 = OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_139(v29);
    OUTLINED_FUNCTION_138(4.8151e-34);
    v31 = OUTLINED_FUNCTION_126(v30, sel_uniqueId);
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_83();
    v32 = OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_11_0(v32);

    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_103();
    sub_1C3955A20();
  }

  OUTLINED_FUNCTION_127();
  v33 = OUTLINED_FUNCTION_102();
  v34(v33);
  v35 = objc_msgSend((id)objc_opt_self(), sel_ignored);
  return OUTLINED_FUNCTION_8_0(v35);
}

id sub_1C395118C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  int v3;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  id v35;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_6_1(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = OUTLINED_FUNCTION_88();
  v11 = OUTLINED_FUNCTION_73(v10);
  MEMORY[0x1E0C80A78](v11);
  v12 = OUTLINED_FUNCTION_23();
  v13 = OUTLINED_FUNCTION_27_0(v12);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_29_0(v14, v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_39_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_72();
  v18 = MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_35_0(v18, v19, v20, v21, v22, v23, v24, v25, v38);
  OUTLINED_FUNCTION_141();
  v26 = (uint64_t)sub_1C3954CF0();
  if ((v26 & 1) != 0)
    sub_1C3955BB4();
  if (qword_1ED7E7668 != -1)
    v26 = swift_once();
  OUTLINED_FUNCTION_15_0(v26, (uint64_t)qword_1ED7E7A28);
  v27 = v1;
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_116();
  v28 = OUTLINED_FUNCTION_77();
  if (OUTLINED_FUNCTION_63(v28))
  {
    OUTLINED_FUNCTION_9_0();
    v29 = OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_139(v29);
    OUTLINED_FUNCTION_138(4.8151e-34);
    v31 = OUTLINED_FUNCTION_126(v30, sel_uniqueId);
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_83();
    v32 = OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_11_0(v32);

    OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_103();
    sub_1C3955BB4();
  }

  OUTLINED_FUNCTION_127();
  v33 = OUTLINED_FUNCTION_102();
  v34(v33);
  v35 = objc_msgSend((id)objc_opt_self(), sel_ignored);
  return OUTLINED_FUNCTION_8_0(v35);
}

id sub_1C3951A00(char *a1, int a2, unsigned __int8 a3, uint64_t (*a4)(void), uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  _UNKNOWN **v37;
  uint64_t v38;
  uint64_t v39;
  void (**v40)(char *, uint64_t);
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  id v55;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t (*v80)(void);
  void *v81;
  void *v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t (*v122)(void);
  uint64_t v123;
  id v124;
  uint64_t v125;
  _UNKNOWN **v126;
  __int128 v127;
  __int128 v128;
  _UNKNOWN **v129;
  unint64_t v130;

  v117 = a6;
  v122 = a4;
  v123 = a5;
  v118 = a2;
  v120 = a8;
  ObjectType = swift_getObjectType();
  v12 = sub_1C3AB7F3C();
  v124 = *(id *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v110 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v116 = sub_1C3AB7EE8();
  v115 = *(_QWORD *)(v116 - 8);
  MEMORY[0x1E0C80A78](v116);
  v16 = (char *)&v110 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  v18 = MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v110 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x1E0C80A78](v18);
  v23 = (char *)&v110 - v22;
  MEMORY[0x1E0C80A78](v21);
  v121 = (uint64_t)&v110 - v24;
  v25 = swift_getObjectType();
  if (a1[OBJC_IVAR___PPSWStringDonation_shouldConsume] == 1
    && (v26 = *(void **)&a1[OBJC_IVAR___PPSWStringDonation_source]) != 0)
  {
    v27 = v25;
    v114 = OBJC_IVAR___PPSWStringDonation_source;
    v119 = v12;
    v28 = v26;
    if ((v122() & 1) != 0)
    {
      v124 = v28;
      v130 = MEMORY[0x1E0DEE9D8];
      *((_QWORD *)&v128 + 1) = v27;
      v129 = &off_1E7E144B8;
      *(_QWORD *)&v127 = a1;
      swift_unknownObjectRetain();
      v29 = sub_1C39549F4((uint64_t)&v127, a7, ObjectType, v27, (uint64_t)&off_1E7E144B8);
      v31 = v30;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v127);
      if (v31)
      {
        LODWORD(v113) = a3;
        v32 = (id)sub_1C3AB7F18();
        v33 = v121;
        v112 = v32;
        __swift_storeEnumTagSinglePayload(v121, 1, 1, (uint64_t)v32);
        v125 = (uint64_t)a1;
        v126 = &off_1E7E144B8;
        swift_unknownObjectRetain();
        v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77D8);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7798);
        v35 = swift_dynamicCast();
        v111 = v29;
        v110 = v34;
        if ((v35 & 1) != 0)
        {
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v127);
          v125 = (uint64_t)a1;
          v126 = &off_1E7E144B8;
          swift_unknownObjectRetain();
          if ((swift_dynamicCast() & 1) != 0)
          {
            v36 = *((_QWORD *)&v128 + 1);
            v37 = v129;
            __swift_project_boxed_opaque_existential_1(&v127, *((uint64_t *)&v128 + 1));
            ((void (*)(_QWORD, uint64_t, _UNKNOWN **))v37[3])(0, v36, v37);
            sub_1C3952D98(v33, &qword_1ED7E7650);
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v127);
            v38 = (uint64_t)v112;
          }
          else
          {
            v129 = 0;
            v127 = 0u;
            v128 = 0u;
            sub_1C3952D98(v33, &qword_1ED7E7650);
            sub_1C3952D98((uint64_t)&v127, &qword_1EF8E4F20);
            v38 = (uint64_t)v112;
            __swift_storeEnumTagSinglePayload((uint64_t)v23, 1, 1, (uint64_t)v112);
          }
          sub_1C3952DD0((uint64_t)v23, v33);
          v66 = v113;
        }
        else
        {
          v66 = v113;
          v38 = (uint64_t)v112;
        }
        v68 = v124;
        if ((v66 | 2) == 2)
        {
          v69 = *(void **)(v120 + OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_entityDissector);
          if (v69)
          {
            v70 = v69;
            v71 = sub_1C3AB7F60();
            v72 = v33;
            v73 = (void *)v71;
            sub_1C3952D50(v72, (uint64_t)v20);
            if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v38) == 1)
            {
              v74 = 0;
            }
            else
            {
              v75 = sub_1C3AB7F00();
              v76 = v38;
              v74 = (void *)v75;
              (*(void (**)(char *))(*(_QWORD *)(v76 - 8) + 8))(v20);
            }
            v77 = objc_msgSend(v70, sel_entitiesInPlainText_eligibleRegions_source_cloudSync_, v73, v74, v68, v118 & 1, v110, v111);

            sub_1C3952D1C(0, &qword_1ED7E7698);
            v78 = sub_1C3AB8008();

            sub_1C3957C68(v78);
            v33 = v121;
          }
        }
        v80 = v122;
        v79 = v123;
        if ((v122() & 1) != 0)
        {
          if ((v66 - 1) < 2
            && (v81 = *(void **)(v120 + OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_topicDissector)) != 0)
          {
            v82 = (void *)objc_opt_self();
            v112 = v81;
            v83 = objc_msgSend(v82, sel_sharedInstance);
            if ((objc_msgSend(a1, sel_respondsToSelector_, sel_bundleId) & 1) != 0)
            {
              v84 = objc_msgSend(a1, sel_bundleId);
              sub_1C3AB7F6C();

            }
            v87 = (void *)sub_1C3AB7F60();
            swift_bridgeObjectRelease();
            sub_1C39551C4();
            if (v88)
            {
              v89 = (void *)sub_1C3AB7F60();
              swift_bridgeObjectRelease();
            }
            else
            {
              v89 = 0;
            }
            v90 = objc_msgSend(v83, sel_extractionAlgorithmsForBundleId_sourceLanguage_conservative_domain_, v87, v89, 0, 0, v110, v111);

            sub_1C3952D1C(0, (unint64_t *)&unk_1ED7E77E0);
            sub_1C3952CCC();
            v113 = sub_1C3AB805C();

            v91 = objc_msgSend(v82, sel_sharedInstance);
            v92 = *(void **)&a1[v114];
            if (v92)
            {
              v93 = objc_msgSend(v92, sel_bundleId);
              sub_1C3AB7F6C();

            }
            v94 = (void *)sub_1C3AB7F60();
            swift_bridgeObjectRelease();
            sub_1C39551C4();
            if (v95)
            {
              v96 = (void *)sub_1C3AB7F60();
              swift_bridgeObjectRelease();
            }
            else
            {
              v96 = 0;
            }
            v97 = objc_msgSend(v91, sel_extractionAlgorithmsForBundleId_sourceLanguage_conservative_domain_, v94, v96, 0, 1);

            sub_1C3AB805C();
            v98 = (void *)sub_1C3AB7F60();
            swift_bridgeObjectRelease();
            v125 = (uint64_t)a1;
            v126 = &off_1E7E144B8;
            swift_unknownObjectRetain();
            __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7788);
            v99 = swift_dynamicCast();
            if ((_DWORD)v99)
              __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v127);
            sub_1C39551C4();
            if (!v100)
            {
              sub_1C3AB7EDC();
              sub_1C3AB7ED0();
              (*(void (**)(char *, uint64_t))(v115 + 8))(v16, v116);
            }
            v101 = v112;
            v102 = (void *)sub_1C3AB7F60();
            swift_bridgeObjectRelease();
            v103 = (void *)sub_1C3AB8050();
            swift_bridgeObjectRelease();
            v104 = (void *)sub_1C3AB8050();
            swift_bridgeObjectRelease();
            v105 = v124;
            v106 = objc_msgSend(v101, sel_topicsInText_isPlainText_source_cloudSync_language_topicAlgorithms_namedEntityAlgorithms_weight_, v98, v99, v124, v118 & 1, v102, v103, 1.0, v104);

            v68 = v105;
            sub_1C3952D1C(0, &qword_1ED7E7698);
            v107 = sub_1C3AB8008();

            sub_1C3957C68(v107);
            v33 = v121;
            v80 = v122;
            v79 = v123;
          }
          else
          {
            v86 = swift_bridgeObjectRelease();
          }
          if ((((uint64_t (*)(uint64_t))v80)(v86) & 1) != 0)
          {
            sub_1C3953704(v130, (unint64_t)v80, v79, v117);
            v109 = v108;
            sub_1C3952D98(v33, &qword_1ED7E7650);
            swift_bridgeObjectRelease();

            return (id)v109;
          }
          swift_bridgeObjectRelease();
          v85 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v85 = objc_msgSend((id)objc_opt_self(), sel_interrupted);
        }
        v55 = v85;

        sub_1C3952D98(v33, &qword_1ED7E7650);
      }
      else
      {
        swift_bridgeObjectRelease();
        v57 = v119;
        if (qword_1ED7E7668 != -1)
          swift_once();
        __swift_project_value_buffer(v57, (uint64_t)qword_1ED7E7A28);
        swift_unknownObjectRetain_n();
        v58 = sub_1C3AB7F24();
        v59 = sub_1C3AB80B0();
        if (os_log_type_enabled(v58, v59))
        {
          v60 = (uint8_t *)swift_slowAlloc();
          v61 = swift_slowAlloc();
          *(_QWORD *)&v127 = v61;
          *(_DWORD *)v60 = 136315138;
          v62 = objc_msgSend(a1, sel_uniqueId);
          v63 = sub_1C3AB7F6C();
          v65 = v64;

          v125 = sub_1C393DFE0(v63, v65, (uint64_t *)&v127);
          sub_1C3AB80D4();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C392E000, v58, v59, "Consumer: ignoring item with no content with id %s", v60, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1C3BD6CF0](v61, -1, -1);
          MEMORY[0x1C3BD6CF0](v60, -1, -1);

        }
        else
        {

        }
        v67 = v124;
        v55 = objc_msgSend((id)objc_opt_self(), sel_ignored);

      }
    }
    else
    {
      v55 = objc_msgSend((id)objc_opt_self(), sel_interrupted);

    }
    return v55;
  }
  else
  {
    if (qword_1ED7E7668 != -1)
      swift_once();
    v39 = __swift_project_value_buffer(v12, (uint64_t)qword_1ED7E7A28);
    v40 = (void (**)(char *, uint64_t))v124;
    (*((void (**)(char *, uint64_t, uint64_t))v124 + 2))(v14, v39, v12);
    v41 = a1;
    swift_unknownObjectRetain_n();
    v42 = sub_1C3AB7F24();
    v43 = sub_1C3AB80B0();
    if (os_log_type_enabled(v42, v43))
    {
      v119 = v12;
      v44 = swift_slowAlloc();
      v45 = swift_slowAlloc();
      *(_QWORD *)&v127 = v45;
      *(_DWORD *)v44 = 136315394;
      v46 = objc_msgSend(v41, sel_uniqueId);
      v47 = sub_1C3AB7F6C();
      v49 = v48;

      v125 = sub_1C393DFE0(v47, v49, (uint64_t *)&v127);
      sub_1C3AB80D4();

      swift_bridgeObjectRelease();
      *(_WORD *)(v44 + 12) = 2080;
      v50 = *(void **)&v41[OBJC_IVAR___PPSWStringDonation_source];
      if (v50)
      {
        v51 = objc_msgSend(v50, sel_bundleId);
        v52 = sub_1C3AB7F6C();
        v54 = v53;

      }
      else
      {
        v54 = 0xEC00000044492065;
        v52 = 0x6C646E7542206F4ELL;
      }
      v125 = sub_1C393DFE0(v52, v54, (uint64_t *)&v127);
      sub_1C3AB80D4();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C392E000, v42, v43, "Consumer: ignoring ineligible item %s from %s.", (uint8_t *)v44, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1C3BD6CF0](v45, -1, -1);
      MEMORY[0x1C3BD6CF0](v44, -1, -1);

      (*((void (**)(char *, uint64_t))v124 + 1))(v14, v119);
    }
    else
    {

      swift_unknownObjectRelease();
      v40[1](v14, v12);
    }
    return objc_msgSend((id)objc_opt_self(), sel_ignored);
  }
}

uint64_t type metadata accessor for StringDonationConsumer()
{
  return objc_opt_self();
}

uint64_t sub_1C3952A18()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1C3952A4C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1C3952AB8;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1EF8E4EE0 + dword_1EF8E4EE0))(v2, v3, v4);
}

uint64_t sub_1C3952AB8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_80();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1C3952AE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1C3952E18;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EF8E4EF0 + dword_1EF8E4EF0))(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C3952B90(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1C3952E18;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EF8E4F00 + dword_1EF8E4F00))(a1, v4, v5, v6);
}

uint64_t sub_1C3952C14()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C3952C38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1C3952CA8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF8E4F10 + dword_1EF8E4F10))(a1, v4);
}

uint64_t sub_1C3952CA8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_80();
  return OUTLINED_FUNCTION_147(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_1C3952CCC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED7E76A0;
  if (!qword_1ED7E76A0)
  {
    sub_1C3952D1C(255, (unint64_t *)&unk_1ED7E77E0);
    result = MEMORY[0x1C3BD6C78](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED7E76A0);
  }
  return result;
}

void sub_1C3952D1C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C3952D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C3952D98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C3952DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_4_2()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_storeEnumTagSinglePayload(*(_QWORD *)(v3 - 232), 1, 1, a1);
  *(_QWORD *)(v3 - 160) = v2;
  *(_QWORD *)(v3 - 152) = v1;
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 - 256) = a6;
  *(_QWORD *)(v8 - 224) = a4;
  *(_QWORD *)(v8 - 216) = a5;
  *(_DWORD *)(v8 - 244) = a2;
  *(_QWORD *)(v8 - 240) = a8;
  return swift_getObjectType();
}

id OUTLINED_FUNCTION_10_0(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend(v2, a2, v4, v3, *(_QWORD *)(v5 - 288), *(_DWORD *)(v5 - 244) & 1);
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 160) = a1;
  return sub_1C3AB80D4();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_1C3AB7F60();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 312) = v0;
  return sub_1C3AB805C();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 304) = v1;
  *(_QWORD *)(v2 - 296) = v0;
  return sub_1C3AB7F18();
}

uint64_t OUTLINED_FUNCTION_22_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 160) = a1;
  return sub_1C3AB80D4();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_1C3AB7EE8();
}

uint64_t OUTLINED_FUNCTION_24_0(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_getErrorValue();
}

id OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, (SEL)(v3 + 2780), v0, v1, 0, 1);
}

void OUTLINED_FUNCTION_26_0()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1C3953704(v0, v2, v1, *(void **)(v3 - 256));
}

uint64_t OUTLINED_FUNCTION_27_0(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 264) = result;
  *(_QWORD *)(v1 - 272) = *(_QWORD *)(result - 8);
  return result;
}

void OUTLINED_FUNCTION_29_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 280) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_32_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_33_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 160) = a1;
  return sub_1C3AB80D4();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return sub_1C39549F4(v4 - 144, v2, v0, v3, v1);
}

uint64_t OUTLINED_FUNCTION_35_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 232) = (char *)&a9 - v9;
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return sub_1C3AB7F60();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

id OUTLINED_FUNCTION_38_0(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 328) = a1;
  return objc_msgSend(v1, sel_sharedInstance);
}

uint64_t OUTLINED_FUNCTION_40_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  __swift_project_value_buffer(*(_QWORD *)(v2 - 208), a2);
  return swift_unknownObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_unknownObjectRetain();
}

void OUTLINED_FUNCTION_43_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1C3952D98(v2, a2);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_45_0()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 1608));
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return sub_1C3AB8050();
}

void OUTLINED_FUNCTION_47_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_49()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C393DFE0(v1, v0, (uint64_t *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_1C3AB805C();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return sub_1C3AB7F60();
}

uint64_t OUTLINED_FUNCTION_52()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

void OUTLINED_FUNCTION_53(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_54(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_arrayDestroy();
}

id OUTLINED_FUNCTION_56(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  __swift_project_value_buffer(v3, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_57()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0 - 144);
}

void OUTLINED_FUNCTION_58(uint64_t a1, unint64_t *a2)
{
  sub_1C3952D1C(0, a2);
}

void OUTLINED_FUNCTION_59()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_60()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C393DFE0(v1, v0, (uint64_t *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_61()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return sub_1C393DFE0(v0, v1, (uint64_t *)(v2 - 144));
}

BOOL OUTLINED_FUNCTION_62(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_63(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_64(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 288) = a1;
  return (*(uint64_t (**)(void))(v1 - 224))();
}

BOOL OUTLINED_FUNCTION_65(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_66()
{
  return sub_1C3AB7EDC();
}

uint64_t OUTLINED_FUNCTION_67()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C3952D50(v1, v0);
}

void OUTLINED_FUNCTION_68(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_impl(a1, v4, a3, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_69()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_73(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 208) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_unknownObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_76()
{
  return sub_1C3AB7F60();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return sub_1C3AB80B0();
}

id OUTLINED_FUNCTION_78()
{
  void *v0;

  return v0;
}

id OUTLINED_FUNCTION_79(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_80()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_81(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C393DFE0(a1, a2, (uint64_t *)(v2 - 144));
}

void OUTLINED_FUNCTION_82()
{
  void *v0;

}

void OUTLINED_FUNCTION_83()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_84()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_85()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C3952DD0(v1, v0);
}

void OUTLINED_FUNCTION_86()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_1C3AB7E88();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return sub_1C3AB7F3C();
}

uint64_t OUTLINED_FUNCTION_89()
{
  return sub_1C3AB81DC();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_91()
{
  return sub_1C3AB8008();
}

uint64_t OUTLINED_FUNCTION_92()
{
  return sub_1C3AB8008();
}

void OUTLINED_FUNCTION_93(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 336) = a1;

}

id OUTLINED_FUNCTION_95()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 1480));
}

uint64_t OUTLINED_FUNCTION_97()
{
  unint64_t v0;

  return sub_1C3957C68(v0);
}

uint64_t OUTLINED_FUNCTION_98()
{
  unint64_t v0;

  return sub_1C3957C68(v0);
}

double OUTLINED_FUNCTION_99()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 - 112) = 0;
  result = 0.0;
  *(_OWORD *)(v0 - 144) = 0u;
  *(_OWORD *)(v0 - 128) = 0u;
  return result;
}

void OUTLINED_FUNCTION_100(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_101()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_102()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_103()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2080;
}

uint64_t OUTLINED_FUNCTION_106()
{
  return sub_1C3AB7F3C();
}

uint64_t OUTLINED_FUNCTION_107()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_109()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_111()
{
  return sub_1C3AB7F00();
}

void OUTLINED_FUNCTION_112()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_113()
{
  return sub_1C3AB7F6C();
}

uint64_t OUTLINED_FUNCTION_114()
{
  return sub_1C3AB7F6C();
}

void OUTLINED_FUNCTION_115()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_116()
{
  return sub_1C3AB7F24();
}

void OUTLINED_FUNCTION_117(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1C3952D98(v2 - 144, a2);
}

void OUTLINED_FUNCTION_118()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_119()
{
  return sub_1C3AB7F6C();
}

id OUTLINED_FUNCTION_120()
{
  void *v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_122()
{
  return sub_1C3952CCC();
}

void OUTLINED_FUNCTION_123()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_124()
{
  return sub_1C3AB8098();
}

void OUTLINED_FUNCTION_125()
{
  void *v0;

}

id OUTLINED_FUNCTION_126(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_127()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_128()
{
  return sub_1C3AB7ED0();
}

void OUTLINED_FUNCTION_129()
{
  void *v0;

}

void OUTLINED_FUNCTION_130()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_132()
{
  return sub_1C3AB7F6C();
}

uint64_t OUTLINED_FUNCTION_133()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 224))();
}

uint64_t OUTLINED_FUNCTION_137(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 144) = result;
  return result;
}

void OUTLINED_FUNCTION_138(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_139(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 216) = result;
  *(_QWORD *)(v1 - 144) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_140(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 144) = result;
  return result;
}

void OUTLINED_FUNCTION_145()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 320) = v0;
}

uint64_t OUTLINED_FUNCTION_147(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_149()
{
  return swift_beginAccess();
}

id OUTLINED_FUNCTION_151()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_152()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_153(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1C394BF20(a1, a2, v2);
}

id OUTLINED_FUNCTION_155(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 456));
}

void OUTLINED_FUNCTION_158()
{
  sub_1C3954ED4();
}

void OUTLINED_FUNCTION_159()
{
  sub_1C3955070();
}

void OUTLINED_FUNCTION_160()
{
  sub_1C3955058();
}

void OUTLINED_FUNCTION_161()
{
  sub_1C395507C();
}

void OUTLINED_FUNCTION_162()
{
  sub_1C3955040();
}

uint64_t OUTLINED_FUNCTION_163()
{
  return sub_1C3949540();
}

void OUTLINED_FUNCTION_164()
{
  sub_1C395504C();
}

void OUTLINED_FUNCTION_165()
{
  sub_1C3955064();
}

id OUTLINED_FUNCTION_166(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_167()
{
  return swift_bridgeObjectRetain();
}

id sub_1C395368C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  objc_super v8;

  *(_QWORD *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_topicStoreOverride] = a1;
  *(_QWORD *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_entityStoreOverride] = a2;
  *(_QWORD *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_locationStoreOverride] = a3;
  *(_QWORD *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_writebackDissector] = a4;
  *(_QWORD *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_entityDissector] = a5;
  *(_QWORD *)&v6[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_topicDissector] = a6;
  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for Consumer();
  return objc_msgSendSuper2(&v8, sel_init);
}

void sub_1C3953704(unint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  unsigned int v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  id v46;
  char *v47;
  char *v48;
  id v49;
  id v50;
  char *v51;
  BOOL v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  id aBlock[7];

  v6 = v5;
  aBlock[6] = *(id *)MEMORY[0x1E0C80C00];
  if (a1 >> 62)
    goto LABEL_38;
  v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v11)
  {
    v12 = *(void **)&v4[OBJC_IVAR____TtC32PersonalizationPortraitInternals8Consumer_writebackDissector];
    if (v12)
    {
      v62 = (void *)a2;
      sub_1C395A8D8(0, (a1 & 0xC000000000000001) == 0, a1);
      v61 = v6;
      v63 = (uint64_t)a4;
      if ((a1 & 0xC000000000000001) != 0)
      {
        v60 = v12;
        OUTLINED_FUNCTION_8_1();
      }
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      v15 = v13;
      v16 = objc_msgSend(v15, sel_source);

      v17 = objc_msgSend(v16, sel_bundleId);
      if (!v17)
      {
        sub_1C3AB7F6C();
        v17 = (id)sub_1C3AB7F60();
        swift_bridgeObjectRelease();
      }
      sub_1C3948564(0, &qword_1ED7E7698);
      v18 = (void *)sub_1C3AB7FF0();
      v19 = *(id *)(a1 + 32);
      v20 = objc_msgSend(v19, sel_source);

      v21 = objc_msgSend(v20, sel_documentId);
      if (!v21)
      {
        sub_1C3AB7F6C();
        v21 = (id)sub_1C3AB7F60();
        swift_bridgeObjectRelease();
      }
      aBlock[4] = v62;
      aBlock[5] = (id)a3;
      aBlock[0] = (id)MEMORY[0x1E0C809B0];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_1C3953E14;
      aBlock[3] = &block_descriptor_24;
      v22 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      v23 = objc_msgSend(v12, sel_consumeContentFromBundleId_extractions_spotlightIdentifier_fileProtectionType_shouldContinueBlock_, v17, v18, v21, v63, v22);
      _Block_release(v22);

      if (!v23)
      {
        if (qword_1ED7E7668 != -1)
          swift_once();
        v53 = sub_1C3AB7F3C();
        __swift_project_value_buffer(v53, (uint64_t)qword_1ED7E7A28);
        v54 = sub_1C3AB7F24();
        v55 = sub_1C3AB8080();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v56 = 0;
          _os_log_impl(&dword_1C392E000, v54, v55, "Deferred donation due to interruption in writeback.", v56, 2u);
          MEMORY[0x1C3BD6CF0](v56, -1, -1);
        }

        objc_msgSend((id)objc_opt_self(), sel_interrupted);
        return;
      }

      v6 = v61;
    }
    sub_1C3953E4C(a1, v4);
    if (v6)
      return;
    v24 = sub_1C393DFCC();
    a3 = 0x1F2632000;
    if (v24)
    {
      v32 = v24;
      v33 = OUTLINED_FUNCTION_6_2(v24, v25, v26, v27, v28, v29, v30, v31, v61, (uint64_t)v62, v63, (uint64_t)aBlock[0]);

      v34 = aBlock[0];
      if (!v33)
        goto LABEL_34;
      v35 = aBlock[0];
    }
    v36 = sub_1C393DFB8();
    if (v36)
    {
      v44 = v36;
      v45 = OUTLINED_FUNCTION_6_2(v36, v37, v38, v39, v40, v41, v42, v43, v61, (uint64_t)v62, v63, (uint64_t)aBlock[0]);

      v34 = aBlock[0];
      if (!v45)
      {
LABEL_34:
        v57 = v34;
        sub_1C3AB7E94();

        swift_willThrow();
        return;
      }
      v46 = aBlock[0];
    }
    a2 = a1 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    v4 = 0;
    v47 = 0;
LABEL_19:
    v63 = (uint64_t)v47;
    v48 = v4;
    while (1)
    {
      if (a2)
        OUTLINED_FUNCTION_8_1();
      v49 = *(id *)(a1 + 8 * (_QWORD)v48 + 32);
      a4 = v49;
      v4 = v48 + 1;
      if (__OFADD__(v48, 1))
        break;
      v50 = objc_msgSend(v49, sel_numberOfExtractions);
      if (v50)
      {
        a3 = (uint64_t)v50;
        v51 = (char *)objc_msgSend(v50, sel_unsignedIntegerValue);

        v52 = __CFADD__(v63, v51);
        v47 = &v51[v63];
        if (v52)
          __break(1u);
        if (v4 == (char *)v11)
        {
LABEL_36:
          swift_bridgeObjectRelease();
          objc_opt_self();
          v58 = (void *)sub_1C3AB80C8();
          v59 = OUTLINED_FUNCTION_96((uint64_t)v58, sel_successWithNumberOfExtractions_);
          goto LABEL_40;
        }
        goto LABEL_19;
      }

      ++v48;
      if (v4 == (char *)v11)
        goto LABEL_36;
    }
    __break(1u);
LABEL_38:
    swift_bridgeObjectRetain();
    v11 = sub_1C3AB81AC();
    swift_bridgeObjectRelease();
  }
  objc_opt_self();
  sub_1C3948564(0, (unint64_t *)&unk_1ED7E77E0);
  v58 = (void *)sub_1C3AB80BC();
  v59 = OUTLINED_FUNCTION_96((uint64_t)v58, sel_successWithNumberOfExtractions_);
LABEL_40:
  v59;

}

id sub_1C3953C9C()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  id v22;
  id result;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  id v28;
  id v29[2];

  v29[1] = *(id *)MEMORY[0x1E0C80C00];
  v0 = sub_1C393DFCC();
  if (v0)
  {
    v1 = v0;
    v2 = (void *)OUTLINED_FUNCTION_5_2();
    v9 = OUTLINED_FUNCTION_4_3((uint64_t)v2, sel_deleteAllTopicsFromSourcesWithBundleId_deletedCount_error_, v3, v4, v5, v6, v7, v8, 0);

    v10 = v29[0];
    if (!v9)
      goto LABEL_10;
    v11 = v29[0];
  }
  v12 = sub_1C393DFB8();
  if (v12)
  {
    v13 = v12;
    v14 = (void *)OUTLINED_FUNCTION_5_2();
    v21 = OUTLINED_FUNCTION_4_3((uint64_t)v14, sel_deleteAllNamedEntitiesFromSourcesWithBundleId_deletedCount_error_, v15, v16, v17, v18, v19, v20, 0);

    v10 = v29[0];
    if (v21)
    {
      v22 = v29[0];
      goto LABEL_7;
    }
LABEL_10:
    v27 = v10;
    sub_1C3AB7E94();

    return (id)swift_willThrow();
  }
LABEL_7:
  result = sub_1C393DFA4();
  if (!result)
    return result;
  v24 = result;
  v25 = (void *)OUTLINED_FUNCTION_5_2();
  v29[0] = 0;
  v26 = objc_msgSend(v24, sel_deleteAllLocationsFromSourcesWithBundleId_deletedCount_error_, v25, 0, v29);

  if (v26)
    return v29[0];
  v28 = v29[0];
  sub_1C3AB7E94();

  return (id)swift_willThrow();
}

uint64_t sub_1C3953E14(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  return v1 & 1;
}

void sub_1C3953E4C(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v14;

  v3 = v2;
  if (a1 >> 62)
    goto LABEL_13;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_1C3AB81AC())
  {
    v6 = 4;
    while (1)
    {
      v14 = v3;
      v3 = v6 - 4;
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1C3BD5BF8](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v3, 1))
        break;
      v10 = sub_1C393DFCC();
      v11 = sub_1C393DFB8();
      v12 = sub_1C393DFA4();
      sub_1C3947E3C(v10, v11, v12);
      v3 = v14;
      if (v14)
      {

        swift_bridgeObjectRelease();
        return;
      }

      ++v6;
      if (v9 == v5)
        goto LABEL_10;
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_10:

  swift_bridgeObjectRelease();
}

id sub_1C3953FAC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v10;

  if (qword_1ED7E7668 != -1)
    swift_once();
  v4 = sub_1C3AB7F3C();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED7E7A28);
  swift_bridgeObjectRetain_n();
  v5 = sub_1C3AB7F24();
  v6 = sub_1C3AB80B0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v10 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_1C393DFE0(a1, a2, &v10);
    sub_1C3AB80D4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C392E000, v5, v6, "Consumer: beginning deletion from from %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BD6CF0](v8, -1, -1);
    MEMORY[0x1C3BD6CF0](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return sub_1C3953C9C();
}

uint64_t sub_1C3954360(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = sub_1C3AB7F6C();
  v1(v2);
  return swift_bridgeObjectRelease();
}

void sub_1C3954398(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void **a5)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  void **v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  id v42[2];

  v42[1] = *(id *)MEMORY[0x1E0C80C00];
  if (qword_1ED7E7668 != -1)
    swift_once();
  v8 = sub_1C3AB7F3C();
  __swift_project_value_buffer(v8, (uint64_t)qword_1ED7E7A28);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v9 = sub_1C3AB7F24();
  v10 = sub_1C3AB80B0();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = a5;
    v13 = (void *)swift_slowAlloc();
    v42[0] = v13;
    *(_DWORD *)v11 = 134218242;
    swift_bridgeObjectRelease();
    sub_1C3AB80D4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1C393DFE0(a1, a2, (uint64_t *)v42);
    sub_1C3AB80D4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C392E000, v9, v10, "Consumer: beginning deletion from %ld documents from %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    v14 = v13;
    a5 = v12;
    MEMORY[0x1C3BD6CF0](v14, -1, -1);
    MEMORY[0x1C3BD6CF0](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v15 = swift_bridgeObjectRetain();
  sub_1C393DCE0(v15);
  swift_bridgeObjectRelease();
  v16 = sub_1C393DFCC();
  if (v16)
  {
    v17 = v16;
    v18 = (void *)sub_1C3AB7F60();
    v19 = (void *)sub_1C3AB7FF0();
    v42[0] = 0;
    v20 = objc_msgSend(v17, sel_deleteAllTopicsFromSourcesWithBundleId_documentIds_deletedCount_error_, v18, v19, 0, v42);

    v21 = v42[0];
    if (!v20)
      goto LABEL_15;
    v22 = v42[0];
  }
  v23 = sub_1C393DFB8();
  if (v23)
  {
    v24 = v23;
    v25 = (void *)sub_1C3AB7F60();
    v26 = (void *)sub_1C3AB7FF0();
    v42[0] = 0;
    v27 = objc_msgSend(v24, sel_deleteAllNamedEntitiesFromSourcesWithBundleId_documentIds_deletedCount_error_, v25, v26, 0, v42);

    v21 = v42[0];
    if (v27)
    {
      v28 = v42[0];
      goto LABEL_12;
    }
LABEL_15:
    v35 = v21;
    swift_release();
    goto LABEL_18;
  }
LABEL_12:
  v29 = sub_1C393DFA4();
  if (!v29)
  {
    swift_release();
    return;
  }
  v30 = v29;
  v31 = (void *)sub_1C3AB7F60();
  v32 = (void *)sub_1C3AB7FF0();
  swift_release();
  v42[0] = 0;
  v33 = objc_msgSend(v30, sel_deleteAllLocationsFromSourcesWithBundleId_documentIds_deletedCount_error_, v31, v32, 0, v42);

  if ((v33 & 1) != 0)
  {
    v34 = v42[0];
    return;
  }
  v35 = v42[0];
LABEL_18:
  v36 = (void *)sub_1C3AB7E94();

  swift_willThrow();
  v37 = *a5;
  *a5 = v36;
  v38 = v36;

  v39 = sub_1C3AB7F24();
  v40 = sub_1C3AB8098();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v41 = 0;
    _os_log_impl(&dword_1C392E000, v39, v40, "Consumer: failed to delete data on request to delete by group IDs from ", v41, 2u);
    MEMORY[0x1C3BD6CF0](v41, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_1C395486C(uint64_t a1)
{
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  v2 = sub_1C3AB7F6C();
  v4 = v3;
  v5 = sub_1C3AB805C();
  v1(v2, v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id Consumer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void Consumer.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id Consumer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Consumer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Consumer()
{
  return objc_opt_self();
}

uint64_t sub_1C39549F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
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
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53[5];

  v53[3] = a4;
  v53[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v53);
  v9 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(boxed_opaque_existential_1, a1, a4);
  OUTLINED_FUNCTION_11_1(v9, v10, v11, v12, v13);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E7658);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7788);
  v14 = OUTLINED_FUNCTION_2_4();
  if ((_DWORD)v14)
  {
    OUTLINED_FUNCTION_10_1(v14, v15, v16, v17, v18, v19, v20, v21, v42, v43, *((uint64_t *)&v43 + 1), v44, v45, v46, v47, v48, v49, v50[0]);
    v22 = v51;
    v23 = v52;
    __swift_project_boxed_opaque_existential_1(v50, v51);
    v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 16))(v22, v23);
  }
  else
  {
    v44 = 0;
    v42 = 0u;
    v43 = 0u;
    v25 = sub_1C3954B88((uint64_t)&v42, &qword_1ED7E7790);
    OUTLINED_FUNCTION_11_1(v25, v26, v27, v28, v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7798);
    v30 = OUTLINED_FUNCTION_2_4();
    if ((v30 & 1) == 0)
    {
      v44 = 0;
      v42 = 0u;
      v43 = 0u;
      sub_1C3954B88((uint64_t)&v42, &qword_1EF8E4F20);
      v40 = 0;
      goto LABEL_7;
    }
    OUTLINED_FUNCTION_10_1(v30, v31, v32, v33, v34, v35, v36, v37, v42, v43, *((uint64_t *)&v43 + 1), v44, v45, v46, v47, v48, v49, v50[0]);
    v38 = v51;
    v39 = v52;
    __swift_project_boxed_opaque_existential_1(v50, v51);
    v24 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 16))(a2, v38, v39);
  }
  v40 = v24;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v53);
  return v40;
}

uint64_t sub_1C3954B44(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C3954B88(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1C3954BC4(__int128 *a1, uint64_t a2)
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

uint64_t sub_1C3954BDC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1C3954C00(uint64_t a1, unint64_t a2)
{
  return sub_1C3953FAC(a1, a2);
}

uint64_t sub_1C3954C0C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1C3954C30(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1C3954398(a1, a2, a3, *(_QWORD *)(v3 + 16), *(void ***)(v3 + 24));
}

uint64_t sub_1C3954C3C()
{
  return swift_release();
}

id OUTLINED_FUNCTION_4_3(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t v10;

  return objc_msgSend(v9, a2, v10, 0, &a9);
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return sub_1C3AB7F60();
}

id OUTLINED_FUNCTION_6_2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  a12 = 0;
  return objc_msgSend(a1, (SEL)(v12 + 876), &a12);
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  return sub_1C3954BC4(&a9, (uint64_t)&a18);
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_isEscapingClosureAtFileLocation();
}

id sub_1C3954CA8()
{
  return sub_1C3954CFC((uint64_t (*)(uint64_t))sub_1C3958D80);
}

id sub_1C3954CB4()
{
  return sub_1C3954CFC((uint64_t (*)(uint64_t))sub_1C39591AC);
}

id sub_1C3954CC0()
{
  return sub_1C3954CFC((uint64_t (*)(uint64_t))sub_1C3958AA0);
}

id sub_1C3954CCC()
{
  return sub_1C3954CFC((uint64_t (*)(uint64_t))sub_1C39595D8);
}

id sub_1C3954CD8()
{
  return sub_1C3954CFC((uint64_t (*)(uint64_t))sub_1C3959A04);
}

id sub_1C3954CE4()
{
  return sub_1C3954CFC((uint64_t (*)(uint64_t))sub_1C3959E30);
}

id sub_1C3954CF0()
{
  return sub_1C3954CFC((uint64_t (*)(uint64_t))sub_1C395A25C);
}

id sub_1C3954CFC(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;

  v2 = a1(v1);
  v4 = v3;
  if (v3)
  {
    v5 = v2;
    if (qword_1ED7E7680 != -1)
      swift_once();
    sub_1C3954DDC(v5, (uint64_t)v4, qword_1ED7E7760);
    if ((v6 & 1) != 0)
    {
      OUTLINED_FUNCTION_1_0();
      return 0;
    }
    else
    {
      v7 = objc_msgSend((id)objc_opt_self(), sel_defaultPolicy);
      v8 = (void *)sub_1C3AB7F60();
      OUTLINED_FUNCTION_1_0();
      v4 = objc_msgSend(v7, sel_bundleIdentifierIsAllowedForSearchableItems_, v8);

    }
  }
  return v4;
}

void sub_1C3954DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;
  char v18;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_1C3AB8218();
    sub_1C3AB7F90();
    v6 = sub_1C3AB8230();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    OUTLINED_FUNCTION_39_1();
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (OUTLINED_FUNCTION_64_0() & 1) == 0)
      {
        v13 = ~v7;
        v14 = (v8 + 1) & v13;
        OUTLINED_FUNCTION_39_1();
        if ((v15 & 1) != 0)
        {
          do
          {
            v16 = (_QWORD *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2)
              break;
            if ((OUTLINED_FUNCTION_64_0() & 1) != 0)
              break;
            v14 = (v14 + 1) & v13;
            OUTLINED_FUNCTION_39_1();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

void sub_1C3954ED4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  unsigned int v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  OUTLINED_FUNCTION_62_0();
  OUTLINED_FUNCTION_60_0();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_29();
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_isMultilingual);

  if (v3)
  {
    v5 = OUTLINED_FUNCTION_0_0(v4, sel_content);
    OUTLINED_FUNCTION_76_0();

    v6 = sub_1C3AB7F9C();
    OUTLINED_FUNCTION_107();
    if (v6 >= 51)
    {
      v7 = objc_opt_self();
      v8 = OUTLINED_FUNCTION_0_0(v7, sel_content);
      sub_1C3AB7F6C();

      sub_1C3955320(500);
      OUTLINED_FUNCTION_92_0();
    }
  }
  sub_1C3AB7EDC();
  sub_1C3AB7ED0();
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_85_0(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_53_0();
}

void sub_1C3955040()
{
  sub_1C3955088(sub_1C3949F48);
}

void sub_1C395504C()
{
  sub_1C3955088((void (*)(void))sub_1C394A050);
}

void sub_1C3955058()
{
  sub_1C3955088((void (*)(void))sub_1C3949DD8);
}

void sub_1C3955064()
{
  sub_1C3955088((void (*)(void))sub_1C3949C70);
}

void sub_1C3955070()
{
  sub_1C3955088((void (*)(void))sub_1C3949D38);
}

void sub_1C395507C()
{
  sub_1C3955088((void (*)(void))sub_1C3949E70);
}

void sub_1C3955088(void (*a1)(void))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unsigned int v8;
  uint64_t v9;

  v3 = OUTLINED_FUNCTION_62_0();
  OUTLINED_FUNCTION_60_0();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_59_0();
  v6 = v5 - v4;
  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v8 = objc_msgSend(v7, sel_isMultilingual);

  if (v8)
  {
    a1();
    v9 = OUTLINED_FUNCTION_32_1();
    OUTLINED_FUNCTION_45();
    if (v9 >= 51)
    {
      objc_opt_self();
      a1();
      sub_1C3955320(500);
      OUTLINED_FUNCTION_92_0();
    }
  }
  sub_1C3AB7EDC();
  sub_1C3AB7ED0();
  OUTLINED_FUNCTION_90_0();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v6, v3);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_53_0();
}

uint64_t sub_1C39551C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  unsigned int v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_62_0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_29();
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v4 = objc_msgSend(v3, sel_isMultilingual);

  if (v4)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1C3AB7F9C();
    OUTLINED_FUNCTION_18();
    if (v5 >= 51)
    {
      objc_opt_self();
      swift_bridgeObjectRetain();
      sub_1C3955320(500);
      OUTLINED_FUNCTION_92_0();
    }
  }
  sub_1C3AB7EDC();
  sub_1C3AB7ED0();
  OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_85_0(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return v0;
}

uint64_t sub_1C3955320(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1C3AB7FA8();
    sub_1C3AB7FE4();
    OUTLINED_FUNCTION_90_0();
    OUTLINED_FUNCTION_1_0();
    return OUTLINED_FUNCTION_16();
  }
  return result;
}

void sub_1C39553D0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7648);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_29();
  sub_1C3949F48();
  v3 = OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_45();
  if ((v3 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_21_1();
    goto LABEL_12;
  }
  if (HIDWORD(v3))
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_20_1();
LABEL_12:
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_49_0();
  }
  sub_1C3958D80(v0);
  if (v4)
  {
    OUTLINED_FUNCTION_12_2();
    v6 = (uint64_t)OUTLINED_FUNCTION_0_0(v5, sel_respondsToSelector_);
    if ((v6 & 1) != 0 && OUTLINED_FUNCTION_0_0(v6, (const char *)(v1 + 61)))
    {
      v7 = OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_16_1(v7);
    }
    else
    {
      OUTLINED_FUNCTION_44_1();
    }
    v8 = OUTLINED_FUNCTION_5_3(objc_allocWithZone(MEMORY[0x1E0D70C80]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    v9 = OUTLINED_FUNCTION_0_0((uint64_t)v8, sel_uniqueId);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_0_0(v10, sel_absoluteTimestamp);
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_10_2();
    sub_1C3955088(sub_1C3949F48);
    OUTLINED_FUNCTION_36_1();
    v11 = objc_allocWithZone(MEMORY[0x1E0D70C78]);
    OUTLINED_FUNCTION_0_4((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21);
  }
  OUTLINED_FUNCTION_30_0();
}

void sub_1C3955564()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7648);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_29();
  sub_1C394A050();
}

void sub_1C39555B8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
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
  void *v23;

  v4 = OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_45();
  if ((v4 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_21_1();
    goto LABEL_12;
  }
  if (HIDWORD(v4))
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_20_1();
LABEL_12:
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_49_0();
  }
  sub_1C39591AC(v0);
  if (v5)
  {
    OUTLINED_FUNCTION_12_2();
    v7 = (uint64_t)OUTLINED_FUNCTION_0_0(v6, sel_respondsToSelector_);
    *(_QWORD *)(v3 - 88) = v2;
    if ((v7 & 1) != 0 && OUTLINED_FUNCTION_0_0(v7, (const char *)(v1 + 61)))
    {
      v8 = OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_16_1(v8);
    }
    else
    {
      OUTLINED_FUNCTION_44_1();
    }
    v9 = OUTLINED_FUNCTION_5_3(objc_allocWithZone(MEMORY[0x1E0D70C80]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    v10 = OUTLINED_FUNCTION_0_0((uint64_t)v9, sel_uniqueId);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_0_0(v11, sel_absoluteTimestamp);
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_10_2();
    sub_1C3955088((void (*)(void))sub_1C394A050);
    OUTLINED_FUNCTION_36_1();
    v12 = objc_allocWithZone(MEMORY[0x1E0D70C78]);
    OUTLINED_FUNCTION_0_4((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
  OUTLINED_FUNCTION_30_0();
}

void sub_1C39556F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7648);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_29();
  sub_1C3949DD8(v2);
}

void sub_1C395574C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
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
  void *v23;

  v4 = OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_45();
  if ((v4 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_21_1();
    goto LABEL_12;
  }
  if (HIDWORD(v4))
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_20_1();
LABEL_12:
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_49_0();
  }
  sub_1C39595D8(v0);
  if (v5)
  {
    OUTLINED_FUNCTION_12_2();
    v7 = (uint64_t)OUTLINED_FUNCTION_0_0(v6, sel_respondsToSelector_);
    *(_QWORD *)(v3 - 88) = v2;
    if ((v7 & 1) != 0 && OUTLINED_FUNCTION_0_0(v7, (const char *)(v1 + 61)))
    {
      v8 = OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_16_1(v8);
    }
    else
    {
      OUTLINED_FUNCTION_44_1();
    }
    v9 = OUTLINED_FUNCTION_5_3(objc_allocWithZone(MEMORY[0x1E0D70C80]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    v10 = OUTLINED_FUNCTION_0_0((uint64_t)v9, sel_uniqueId);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_0_0(v11, sel_absoluteTimestamp);
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_10_2();
    sub_1C3955088((void (*)(void))sub_1C3949DD8);
    OUTLINED_FUNCTION_36_1();
    v12 = objc_allocWithZone(MEMORY[0x1E0D70C78]);
    OUTLINED_FUNCTION_0_4((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
  OUTLINED_FUNCTION_30_0();
}

void sub_1C395588C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7648);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_29();
  sub_1C3949C70(v2);
}

void sub_1C39558E0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
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
  void *v23;

  v4 = OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_45();
  if ((v4 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_21_1();
    goto LABEL_12;
  }
  if (HIDWORD(v4))
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_20_1();
LABEL_12:
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_49_0();
  }
  sub_1C3959A04(v0);
  if (v5)
  {
    OUTLINED_FUNCTION_12_2();
    v7 = (uint64_t)OUTLINED_FUNCTION_0_0(v6, sel_respondsToSelector_);
    *(_QWORD *)(v3 - 88) = v2;
    if ((v7 & 1) != 0 && OUTLINED_FUNCTION_0_0(v7, (const char *)(v1 + 61)))
    {
      v8 = OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_16_1(v8);
    }
    else
    {
      OUTLINED_FUNCTION_44_1();
    }
    v9 = OUTLINED_FUNCTION_5_3(objc_allocWithZone(MEMORY[0x1E0D70C80]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    v10 = OUTLINED_FUNCTION_0_0((uint64_t)v9, sel_uniqueId);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_0_0(v11, sel_absoluteTimestamp);
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_10_2();
    sub_1C3955088((void (*)(void))sub_1C3949C70);
    OUTLINED_FUNCTION_36_1();
    v12 = objc_allocWithZone(MEMORY[0x1E0D70C78]);
    OUTLINED_FUNCTION_0_4((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
  OUTLINED_FUNCTION_30_0();
}

void sub_1C3955A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7648);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_29();
  sub_1C3949D38(v2);
}

void sub_1C3955A74()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
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
  void *v23;

  v4 = OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_45();
  if ((v4 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_21_1();
    goto LABEL_12;
  }
  if (HIDWORD(v4))
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_20_1();
LABEL_12:
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_49_0();
  }
  sub_1C3959E30(v0);
  if (v5)
  {
    OUTLINED_FUNCTION_12_2();
    v7 = (uint64_t)OUTLINED_FUNCTION_0_0(v6, sel_respondsToSelector_);
    *(_QWORD *)(v3 - 88) = v2;
    if ((v7 & 1) != 0 && OUTLINED_FUNCTION_0_0(v7, (const char *)(v1 + 61)))
    {
      v8 = OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_16_1(v8);
    }
    else
    {
      OUTLINED_FUNCTION_44_1();
    }
    v9 = OUTLINED_FUNCTION_5_3(objc_allocWithZone(MEMORY[0x1E0D70C80]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    v10 = OUTLINED_FUNCTION_0_0((uint64_t)v9, sel_uniqueId);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_0_0(v11, sel_absoluteTimestamp);
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_10_2();
    sub_1C3955088((void (*)(void))sub_1C3949D38);
    OUTLINED_FUNCTION_36_1();
    v12 = objc_allocWithZone(MEMORY[0x1E0D70C78]);
    OUTLINED_FUNCTION_0_4((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
  OUTLINED_FUNCTION_30_0();
}

void sub_1C3955BB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_104();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7648);
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_29();
  sub_1C3949E70(v2);
}

void sub_1C3955C08()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
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
  void *v23;

  v4 = OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_45();
  if ((v4 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_21_1();
    goto LABEL_12;
  }
  if (HIDWORD(v4))
  {
    OUTLINED_FUNCTION_156();
    OUTLINED_FUNCTION_20_1();
LABEL_12:
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_49_0();
  }
  sub_1C395A25C(v0);
  if (v5)
  {
    OUTLINED_FUNCTION_12_2();
    v7 = (uint64_t)OUTLINED_FUNCTION_0_0(v6, sel_respondsToSelector_);
    *(_QWORD *)(v3 - 88) = v2;
    if ((v7 & 1) != 0 && OUTLINED_FUNCTION_0_0(v7, (const char *)(v1 + 61)))
    {
      v8 = OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_16_1(v8);
    }
    else
    {
      OUTLINED_FUNCTION_44_1();
    }
    v9 = OUTLINED_FUNCTION_5_3(objc_allocWithZone(MEMORY[0x1E0D70C80]), sel_initWithDwellTimeSeconds_lengthSeconds_lengthCharacters_donationCount_contactHandleCount_flags_);
    v10 = OUTLINED_FUNCTION_0_0((uint64_t)v9, sel_uniqueId);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_0_0(v11, sel_absoluteTimestamp);
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_10_2();
    sub_1C3955088((void (*)(void))sub_1C3949E70);
    OUTLINED_FUNCTION_36_1();
    v12 = objc_allocWithZone(MEMORY[0x1E0D70C78]);
    OUTLINED_FUNCTION_0_4((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
  }
  OUTLINED_FUNCTION_30_0();
}

void sub_1C3955D48()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;

  v0 = (void *)objc_opt_self();
  v1 = OUTLINED_FUNCTION_3(v0);
  v2 = (void *)objc_opt_self();
  v3 = OUTLINED_FUNCTION_3(v2);
  v4 = (void *)objc_opt_self();
  v5 = OUTLINED_FUNCTION_3(v4);
  v6 = objc_allocWithZone((Class)type metadata accessor for StructuredConsumer());
  sub_1C3955DE8();
  qword_1ED7E7A20 = v7;
}

void sub_1C3955DE8()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  OUTLINED_FUNCTION_104();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v6 = (void *)objc_opt_self();
  v7 = v1;
  v8 = v5;
  v9 = v3;
  v10 = objc_msgSend(v6, sel_sharedInstance);
  v11 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v12 = sub_1C395368C((uint64_t)v5, (uint64_t)v3, (uint64_t)v1, 0, (uint64_t)v10, (uint64_t)v11);
  v13 = (void *)objc_opt_self();
  v14 = v12;
  v15 = objc_msgSend(v13, sel_defaultCoordinator);
  objc_msgSend(v15, sel_registerInteractionConsumer_levelOfService_, v14, 3);

  OUTLINED_FUNCTION_30_0();
}

id sub_1C3955EF4(void *a1)
{
  uint64_t v1;
  id i;
  double v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _BOOL8 v26;
  int64_t v27;
  char v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  id v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void **v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  unint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  char *v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _BOOL8 v54;
  int64_t v55;
  char v56;
  unint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  void **v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  unint64_t v70;
  _QWORD *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  unint64_t v85;
  uint64_t v86;
  id v87;
  void *v88;
  void *v89;
  unsigned int v90;
  id v91;
  _QWORD *v92;
  id v93;
  void *v94;
  void *v95;
  unsigned int v96;
  _QWORD *v97;
  _QWORD *v98;
  id v99;
  void *v100;
  unsigned int v101;
  _QWORD *v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  NSObject *v108;
  os_log_type_t v109;
  uint8_t *v110;
  uint64_t v111;
  unint64_t v112;
  void *v113;
  void *v114;
  id v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  unint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD *v125;
  char v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  sub_1C3AB7EC4();
  OUTLINED_FUNCTION_74();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_59_0();
  v8 = v7 - v6;
  v9 = OUTLINED_FUNCTION_62_0();
  OUTLINED_FUNCTION_60_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_59_0();
  v13 = v12 - v11;
  v14 = objc_msgSend(a1, sel_interaction);
  v15 = objc_msgSend(v14, sel_intent);

  objc_opt_self();
  v16 = swift_dynamicCastObjCClass();
  if (v16)
  {
    v17 = (id)v16;
    v123 = v8;
    v18 = (uint64_t)a1;
    if ((sub_1C3954CFC((uint64_t (*)(uint64_t))sub_1C3958D80) & 1) == 0)
    {
      v34 = objc_msgSend((id)objc_opt_self(), sel_ignored);

      return v34;
    }
    v19 = sub_1C3958228(v17);
    v117 = a1;
    v118 = v17;
    v119 = v15;
    if (v19)
    {
      v20 = v19;
      if (v19 >> 62)
      {
        OUTLINED_FUNCTION_66_0();
        v18 = sub_1C3AB81AC();
      }
      else
      {
        OUTLINED_FUNCTION_71();
      }
      v21 = (char *)MEMORY[0x1E0DEE9D8];
      v121 = v9;
      v116 = v1;
      if (v18)
      {
        if (v18 < 1)
        {
          __break(1u);
          goto LABEL_106;
        }
        for (i = 0; i != (id)v18; i = (char *)i + 1)
        {
          if ((v20 & 0xC000000000000001) != 0)
            v22 = (id)MEMORY[0x1C3BD5BF8](i, v20);
          else
            v22 = OUTLINED_FUNCTION_70_0(v20 + 8 * (_QWORD)i);
          v23 = OUTLINED_FUNCTION_74_0(v22);

          if (v23)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v21 = sub_1C3957648(0, *((_QWORD *)v21 + 2) + 1, 1, (uint64_t)v21);
            v25 = *((_QWORD *)v21 + 2);
            v24 = *((_QWORD *)v21 + 3);
            v15 = (id)(v25 + 1);
            if (v25 >= v24 >> 1)
            {
              v26 = OUTLINED_FUNCTION_86_0(v24);
              v21 = sub_1C3957648((char *)v26, v27, v28, (uint64_t)v21);
            }
            *((_QWORD *)v21 + 2) = v15;
            *(_QWORD *)&v21[8 * v25 + 32] = v23;
          }
        }
      }
      OUTLINED_FUNCTION_152();
      v35 = MEMORY[0x1E0DEE9D8];
      v125 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      if (*((_QWORD *)v21 + 2))
      {
        swift_bridgeObjectRetain();
        while (1)
        {
          v36 = (_QWORD *)OUTLINED_FUNCTION_82_0();
          sub_1C3957E14(v36);
        }
      }
      OUTLINED_FUNCTION_23_0();
      v38 = MEMORY[0x1E0DEE9D8];
      v39 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
      if (v39)
      {
        v124 = v35;
        sub_1C3AB817C();
        v40 = (void **)(v38 + 48);
        do
        {
          v42 = (uint64_t)*(v40 - 2);
          v41 = (uint64_t)*(v40 - 1);
          v43 = *v40;
          v40 += 3;
          OUTLINED_FUNCTION_83_0();
          i = v43;
          sub_1C3AB7EDC();
          sub_1C3AB7ED0();
          (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v13, v121);
          v44 = objc_allocWithZone(MEMORY[0x1E0D70BC0]);
          v45 = sub_1C39573D4(v42, v41, 6);
          v125 = 0;
          v126 = 1;
          MEMORY[0x1C3BD5AFC](i, &v125);
          OUTLINED_FUNCTION_78_0();
          objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D70C38]), sel_initWithItem_score_, v45, v3);

          OUTLINED_FUNCTION_9();
          v18 = (uint64_t)&v124;
          sub_1C3AB8164();
          sub_1C3AB8188();
          sub_1C3AB8194();
          sub_1C3AB8170();
          --v39;
        }
        while (v39);
        v37 = v124;
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_1_0();
        v37 = MEMORY[0x1E0DEE9D8];
      }
    }
    else
    {
      v37 = MEMORY[0x1E0DEE9D8];
    }
    v46 = sub_1C3958228(v17);
    v122 = v37;
    if (!v46)
    {
      v57 = MEMORY[0x1E0DEE9D8];
      goto LABEL_63;
    }
    v20 = v46;
    if (v46 >> 62)
    {
      OUTLINED_FUNCTION_66_0();
      v18 = sub_1C3AB81AC();
    }
    else
    {
      OUTLINED_FUNCTION_71();
    }
    v47 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    if (!v18)
    {
      v49 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_54:
      OUTLINED_FUNCTION_152();
      v125 = v47;
      if (*((_QWORD *)v49 + 2))
      {
        swift_bridgeObjectRetain();
        while (1)
        {
          v58 = (_QWORD *)OUTLINED_FUNCTION_82_0();
          sub_1C3957E14(v58);
        }
      }
      OUTLINED_FUNCTION_63_0();
      v59 = v125;
      v60 = v125[2];
      if (v60)
      {
        v124 = (uint64_t)v47;
        sub_1C3AB817C();
        v61 = (void **)(v59 + 6);
        do
        {
          v62 = *v61;
          v61 += 3;
          v63 = objc_allocWithZone(MEMORY[0x1E0D70CB8]);
          swift_bridgeObjectRetain();
          v64 = v62;
          v65 = (void *)sub_1C3AB7F60();
          v66 = OUTLINED_FUNCTION_80_0(v63, sel_initWithTopicIdentifier_);

          v125 = 0;
          v126 = 1;
          MEMORY[0x1C3BD5AFC](v64, &v125);
          OUTLINED_FUNCTION_78_0();
          objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D70C38]), sel_initWithItem_score_, v66, v3);

          OUTLINED_FUNCTION_18_0();
          sub_1C3AB8164();
          sub_1C3AB8188();
          sub_1C3AB8194();
          sub_1C3AB8170();
          --v60;
        }
        while (v60);
        v57 = v124;
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_1_0();
        v57 = MEMORY[0x1E0DEE9D8];
      }
      v37 = v122;
LABEL_63:
      if (qword_1ED7E7668 != -1)
        swift_once();
      v67 = OUTLINED_FUNCTION_106();
      __swift_project_value_buffer(v67, (uint64_t)qword_1ED7E7A28);
      OUTLINED_FUNCTION_83_0();
      OUTLINED_FUNCTION_83_0();
      v17 = v119;
      v18 = sub_1C3AB7F24();
      LOBYTE(i) = sub_1C3AB80B0();
      v120 = v37 >> 62;
      if (os_log_type_enabled((os_log_t)v18, (os_log_type_t)i))
      {
        v20 = OUTLINED_FUNCTION_9_0();
        *(_DWORD *)v20 = 134218496;
        if (v37 >> 62)
        {
          swift_bridgeObjectRetain();
          v68 = (_QWORD *)sub_1C3AB81AC();
          OUTLINED_FUNCTION_18();
        }
        else
        {
          v68 = *(_QWORD **)((v37 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        OUTLINED_FUNCTION_18();
        v125 = v68;
        OUTLINED_FUNCTION_29_1();
        OUTLINED_FUNCTION_18();
        *(_WORD *)(v20 + 12) = 2048;
        if (v57 >> 62)
        {
          swift_bridgeObjectRetain();
          v69 = (_QWORD *)sub_1C3AB81AC();
          OUTLINED_FUNCTION_23_0();
        }
        else
        {
          v69 = *(_QWORD **)((v57 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        OUTLINED_FUNCTION_23_0();
        v125 = v69;
        OUTLINED_FUNCTION_29_1();
        OUTLINED_FUNCTION_23_0();
        *(_WORD *)(v20 + 22) = 2048;
        v70 = sub_1C3958228(v118);
        if (!v70)
        {

          v71 = 0;
LABEL_76:
          v125 = v71;
          OUTLINED_FUNCTION_29_1();

          _os_log_impl(&dword_1C392E000, (os_log_t)v18, (os_log_type_t)i, "StructuredConsumer: identified %ld entities and %ld topics in %ld Podcasts items", (uint8_t *)v20, 0x20u);
          OUTLINED_FUNCTION_0_2();
        }
        if (!(v70 >> 62))
        {
          v71 = *(_QWORD **)((v70 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_73:

          OUTLINED_FUNCTION_9();
          goto LABEL_76;
        }
LABEL_107:
        v71 = (_QWORD *)sub_1C3AB81AC();
        goto LABEL_73;
      }

      OUTLINED_FUNCTION_152();
      OUTLINED_FUNCTION_152();

      v72 = v17;
      v73 = sub_1C3AB7F6C();
      v75 = v74;
      v76 = sub_1C3958294(v117);
      v78 = v77;
      v79 = objc_msgSend(v117, sel_uniqueId);
      v80 = sub_1C3AB7F6C();
      v82 = v81;

      objc_msgSend(v117, sel_absoluteTimestamp);
      sub_1C3AB7EA0();
      v83 = objc_allocWithZone(MEMORY[0x1E0D70C78]);
      v84 = sub_1C3957460(v73, v75, v76, v78, v80, v82, v123);
      v85 = v120;
      if (v120)
      {
        OUTLINED_FUNCTION_45_1();
        v86 = sub_1C3AB81AC();
        OUTLINED_FUNCTION_107();
      }
      else
      {
        v86 = *(_QWORD *)((v122 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      if (v86)
      {
        v87 = sub_1C393DFB8();
        if (v87)
        {
          v88 = v87;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7690);
          v89 = (void *)sub_1C3AB7FF0();
          v125 = 0;
          v90 = objc_msgSend(v88, sel_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error_, v89, v84, 13, 0, &v125, 0.0);

          v91 = v125;
          if (!v90)
          {
            v98 = v125;
            OUTLINED_FUNCTION_23_0();
LABEL_97:
            OUTLINED_FUNCTION_107();
            sub_1C3AB7E94();
            OUTLINED_FUNCTION_125();
            swift_willThrow();
            v106 = v91;
            v107 = v91;
            v108 = sub_1C3AB7F24();
            v109 = sub_1C3AB8098();
            if (os_log_type_enabled(v108, v109))
            {
              v110 = (uint8_t *)OUTLINED_FUNCTION_9_0();
              v125 = (_QWORD *)OUTLINED_FUNCTION_9_0();
              *(_DWORD *)v110 = 136315138;
              swift_getErrorValue();
              v111 = sub_1C3AB81DC();
              v124 = sub_1C393DFE0(v111, v112, (uint64_t *)&v125);
              OUTLINED_FUNCTION_88_0();
              OUTLINED_FUNCTION_18_0();
              OUTLINED_FUNCTION_56_0();
              OUTLINED_FUNCTION_56_0();
              _os_log_impl(&dword_1C392E000, v108, v109, "StructuredConsumer: failed to write podcast entities to the database: %s", v110, 0xCu);
              OUTLINED_FUNCTION_67_0();
              OUTLINED_FUNCTION_0_2();
            }
            OUTLINED_FUNCTION_56_0();
            OUTLINED_FUNCTION_56_0();

            v113 = (void *)objc_opt_self();
            v114 = (void *)sub_1C3AB7E88();
            v115 = OUTLINED_FUNCTION_80_0(v113, sel_failedWithError_);

            OUTLINED_FUNCTION_56_0();
            return v115;
          }
          v92 = v125;
          v85 = v120;
        }
        v93 = sub_1C393DFCC();
        if (v93)
        {
          v94 = v93;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7690);
          v95 = (void *)sub_1C3AB7FF0();
          OUTLINED_FUNCTION_23_0();
          v125 = 0;
          v96 = objc_msgSend(v94, sel_donateTopics_source_algorithm_cloudSync_sentimentScore_exactMatchesInSourceText_error_, v95, v84, 8, 0, 0, &v125, 0.0);

          v91 = v125;
          if (!v96)
          {
LABEL_96:
            v105 = v91;
            goto LABEL_97;
          }
          v97 = v125;
          v85 = v120;
        }
        else
        {
          OUTLINED_FUNCTION_23_0();
        }
        v99 = sub_1C393DFB8();
        if (v99)
        {
          v100 = v99;
          v125 = 0;
          v101 = objc_msgSend(v99, sel_flushDonationsWithError_, &v125);

          v91 = v125;
          if (v101)
          {
            v102 = v125;
            goto LABEL_92;
          }
          goto LABEL_96;
        }
      }
      else
      {
        OUTLINED_FUNCTION_23_0();
      }
LABEL_92:
      if (v85)
      {
        OUTLINED_FUNCTION_45_1();
        sub_1C3AB81AC();
        OUTLINED_FUNCTION_107();
      }
      OUTLINED_FUNCTION_107();
      v103 = (void *)objc_opt_self();
      v104 = (void *)sub_1C3AB8074();
      v34 = OUTLINED_FUNCTION_80_0(v103, sel_successWithNumberOfExtractions_);

      return v34;
    }
    if (v18 >= 1)
    {
      v48 = 0;
      v49 = (char *)MEMORY[0x1E0DEE9D8];
      do
      {
        if ((v20 & 0xC000000000000001) != 0)
          v50 = (id)MEMORY[0x1C3BD5BF8](v48, v20);
        else
          v50 = OUTLINED_FUNCTION_70_0(v20 + 8 * v48);
        v51 = OUTLINED_FUNCTION_74_0(v50);

        if (v51)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v49 = sub_1C3957648(0, *((_QWORD *)v49 + 2) + 1, 1, (uint64_t)v49);
          v53 = *((_QWORD *)v49 + 2);
          v52 = *((_QWORD *)v49 + 3);
          v37 = v53 + 1;
          if (v53 >= v52 >> 1)
          {
            v54 = OUTLINED_FUNCTION_86_0(v52);
            v49 = sub_1C3957648((char *)v54, v55, v56, (uint64_t)v49);
          }
          *((_QWORD *)v49 + 2) = v37;
          *(_QWORD *)&v49[8 * v53 + 32] = v51;
        }
        ++v48;
      }
      while (v18 != v48);
      goto LABEL_54;
    }
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }

  if (qword_1ED7E7668 != -1)
    swift_once();
  v29 = OUTLINED_FUNCTION_106();
  __swift_project_value_buffer(v29, (uint64_t)qword_1ED7E7A28);
  v30 = sub_1C3AB7F24();
  v31 = sub_1C3AB8080();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)OUTLINED_FUNCTION_9_0();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_1C392E000, v30, v31, "StructuredConsumer: ignoring non PlayMedia intent from Podcasts.", v32, 2u);
    OUTLINED_FUNCTION_0_2();
  }

  return objc_msgSend((id)objc_opt_self(), sel_ignored);
}

id sub_1C3956C7C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v19;

  v1 = v0;
  sub_1C39553D0();
  if (!v2)
    return objc_msgSend((id)objc_opt_self(), sel_ignored);
  v3 = v2;
  if ((sub_1C3954CFC((uint64_t (*)(uint64_t))sub_1C3958D80) & 1) == 0)
  {

    return objc_msgSend((id)objc_opt_self(), sel_ignored);
  }
  v4 = (void *)objc_opt_self();
  v5 = OUTLINED_FUNCTION_0_0((uint64_t)v4, sel_interaction);
  v6 = objc_msgSend(v5, sel_intent);

  v7 = objc_msgSend(v4, sel_scoredEntitiesFromMapsIntent_, v6);
  v8 = v7;
  if (!v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7690);
    sub_1C3AB8008();
    v8 = (void *)sub_1C3AB7FF0();
    OUTLINED_FUNCTION_45();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7690);
  v9 = sub_1C3AB8008();
  if (v9 >> 62)
    v10 = sub_1C3AB81AC();
  else
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_18();
  if (v10)
  {
    v11 = objc_msgSend(objc_allocWithZone((Class)PPScoredExtractionSet), sel_init);
    objc_msgSend(v11, sel_setEntities_, v8);

    objc_msgSend(v11, sel_setEntityAlgorithm_, 7);
    objc_msgSend(v11, sel_setSource_, v3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77F0);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1C3AE4980;
    *(_QWORD *)(v12 + 32) = v11;
    v19 = v12;
    sub_1C3AB8014();
    v13 = (void *)*MEMORY[0x1E0CB2AE0];
    v14 = v11;
    sub_1C3953704(v19, (unint64_t)sub_1C3947DE0, 0, v13);
    OUTLINED_FUNCTION_43();

    OUTLINED_FUNCTION_45();
    return (id)v1;
  }
  else
  {

    v15 = (void *)objc_opt_self();
    sub_1C3948564(0, (unint64_t *)&unk_1ED7E77E0);
    v16 = (void *)sub_1C3AB80BC();
    v17 = objc_msgSend(v15, sel_successWithNumberOfExtractions_, v16);

    return v17;
  }
}

void sub_1C39570DC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v7;
  id v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  id v13;
  void *v14;
  os_log_type_t v15;
  _DWORD *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;

  v3 = objc_msgSend(a1, sel_content);
  v4 = objc_msgSend(v3, sel_bundleId);
  sub_1C3AB7F6C();
  OUTLINED_FUNCTION_75_0();
  if (v2 == sub_1C3AB7F6C() && v1 == v5)
  {
    OUTLINED_FUNCTION_152();
    goto LABEL_16;
  }
  v7 = OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_45();
  if ((v7 & 1) != 0)
  {
LABEL_16:
    sub_1C3955EF4(v3);
    goto LABEL_20;
  }
  v8 = OUTLINED_FUNCTION_79_0();
  sub_1C3AB7F6C();
  OUTLINED_FUNCTION_75_0();
  if (v7 == sub_1C3AB7F6C() && v1 == v9)
  {
    OUTLINED_FUNCTION_152();
    goto LABEL_18;
  }
  v11 = OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_45();
  if ((v11 & 1) != 0)
  {
LABEL_18:
    sub_1C3956C7C();
    goto LABEL_20;
  }
  if (qword_1ED7E7668 != -1)
    swift_once();
  v12 = OUTLINED_FUNCTION_106();
  __swift_project_value_buffer(v12, (uint64_t)qword_1ED7E7A28);
  v13 = v3;
  v14 = (void *)sub_1C3AB7F24();
  v15 = sub_1C3AB80B0();
  if (OUTLINED_FUNCTION_26_1(v15))
  {
    v16 = (_DWORD *)OUTLINED_FUNCTION_9_0();
    v24 = OUTLINED_FUNCTION_9_0();
    *v16 = 136315138;
    v17 = OUTLINED_FUNCTION_79_0();
    v18 = sub_1C3AB7F6C();
    v20 = v19;

    sub_1C393DFE0(v18, v20, &v24);
    sub_1C3AB80D4();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_22_1(&dword_1C392E000, v21, v22, "StructuredConsumer: ignoring interaction from non-structured source %s");
    OUTLINED_FUNCTION_35_1();
    OUTLINED_FUNCTION_0_2();
  }

  v23 = objc_msgSend((id)objc_opt_self(), sel_ignored);
LABEL_20:
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_28_1();
}

id sub_1C3957380()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StructuredConsumer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StructuredConsumer()
{
  return objc_opt_self();
}

id sub_1C39573D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)sub_1C3AB7F60();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_1C3AB7F60();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, sel_initWithName_category_language_, v5, a3, v6);

  return v7;
}

id sub_1C3957460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v7;
  void *v8;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;

  v8 = v7;
  v11 = (void *)sub_1C3AB7F60();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v12 = (void *)sub_1C3AB7F60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)sub_1C3AB7F60();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1C3AB7EAC();
  v15 = objc_msgSend(v8, sel_initWithBundleId_groupId_documentId_date_, v11, v12, v13, v14);

  v16 = sub_1C3AB7EC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a7, v16);
  return v15;
}

char *sub_1C3957554(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E4FE0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1C39579D4((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C3957734(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_1C3957648(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E4FD0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1C3957A60((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C3957850(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1C3957734(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E4FE8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C3AB81B8();
  __break(1u);
  return result;
}

uint64_t sub_1C3957850(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E4FD8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C3AB81B8();
  __break(1u);
  return result;
}

char *sub_1C3957964(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_156();
    __src = (char *)OUTLINED_FUNCTION_48_0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_1C39579D4(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C3AB81B8();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

char *sub_1C3957A60(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C3AB81B8();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_1C3957AE4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  OUTLINED_FUNCTION_156();
  result = OUTLINED_FUNCTION_48_0();
  __break(1u);
  return result;
}

uint64_t sub_1C3957B90(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4)
{
  BOOL v4;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v4 = a1 + 8 * a2 > a3) : (v4 = 0), v4))
  {
    OUTLINED_FUNCTION_156();
    result = OUTLINED_FUNCTION_48_0();
    __break(1u);
  }
  else
  {
    sub_1C3948564(0, a4);
    OUTLINED_FUNCTION_16();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1C3957C5C(unint64_t a1)
{
  return sub_1C3957C74(a1, sub_1C3958368);
}

uint64_t sub_1C3957C68(unint64_t a1)
{
  return sub_1C3957C74(a1, sub_1C3958508);
}

uint64_t sub_1C3957C74(unint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, unint64_t))
{
  unint64_t *v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1C3AB81AC();
    OUTLINED_FUNCTION_9();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (*v2 >> 62)
  {
    OUTLINED_FUNCTION_72_0();
    v7 = sub_1C3AB81AC();
    OUTLINED_FUNCTION_45();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
  {
    __break(1u);
    goto LABEL_24;
  }
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v7 = 1;
  }
  if (v6 >> 62)
    goto LABEL_25;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    OUTLINED_FUNCTION_72_0();
    v6 = MEMORY[0x1C3BD5C04](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    OUTLINED_FUNCTION_72_0();
    v11 = sub_1C3AB81AC();
    OUTLINED_FUNCTION_45();
  }
  if (v13 < 1)
    goto LABEL_20;
  v14 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v15 = __OFADD__(v14, v13);
  v16 = v14 + v13;
  if (!v15)
  {
    *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
LABEL_20:
    swift_bridgeObjectRelease();
    return sub_1C3AB8014();
  }
  __break(1u);
  return result;
}

_QWORD *sub_1C3957E14(_QWORD *result)
{
  char **v1;
  int64_t v2;
  uint64_t v3;
  char *v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  char *v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  int64_t v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  int64_t v33;
  uint64_t *v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  int64_t v43;
  unint64_t v44;

  v3 = result[2];
  v4 = *v1;
  v5 = *((_QWORD *)*v1 + 2);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = (uint64_t)result;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v9 = *((_QWORD *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6)
      v10 = v5 + v3;
    else
      v10 = v5;
    v4 = sub_1C3957554(isUniquelyReferenced_nonNull_native, v10, 1, (uint64_t)v4);
    v9 = *((_QWORD *)v4 + 3) >> 1;
  }
  v11 = *((_QWORD *)v4 + 2);
  v12 = (_QWORD *)(v9 - v11);
  result = sub_1C395A688(v41, &v4[24 * v11 + 32], v9 - v11, v7);
  if ((uint64_t)result < v3)
    goto LABEL_15;
  if (result)
  {
    v15 = *((_QWORD *)v4 + 2);
    v16 = __OFADD__(v15, result);
    v17 = (char *)result + v15;
    if (v16)
    {
      __break(1u);
      goto LABEL_46;
    }
    *((_QWORD *)v4 + 2) = v17;
  }
  if (result != v12)
  {
LABEL_13:
    result = (_QWORD *)sub_1C3954C3C();
    *v1 = v4;
    return result;
  }
LABEL_16:
  v2 = *((_QWORD *)v4 + 2);
  v13 = v42;
  v39 = v41[1];
  v40 = v41[0];
  v14 = v43;
  if (!v44)
  {
LABEL_46:
    v35 = v14 + 1;
    if (__OFADD__(v14, 1))
      goto LABEL_65;
    v38 = (unint64_t)(v13 + 64) >> 6;
    if (v35 >= v38)
      goto LABEL_13;
    v36 = *(_QWORD *)(v39 + 8 * v35);
    v19 = v14 + 1;
    if (!v36)
    {
      v19 = v14 + 2;
      if (v14 + 2 >= v38)
        goto LABEL_13;
      v36 = *(_QWORD *)(v39 + 8 * v19);
      if (!v36)
      {
        v19 = v14 + 3;
        if (v14 + 3 >= v38)
          goto LABEL_13;
        v36 = *(_QWORD *)(v39 + 8 * v19);
        if (!v36)
        {
          v19 = v14 + 4;
          if (v14 + 4 >= v38)
            goto LABEL_13;
          v36 = *(_QWORD *)(v39 + 8 * v19);
          if (!v36)
          {
            v19 = v14 + 5;
            if (v14 + 5 >= v38)
              goto LABEL_13;
            v36 = *(_QWORD *)(v39 + 8 * v19);
            if (!v36)
            {
              v37 = v14 + 6;
              do
              {
                if (v37 >= v38)
                  goto LABEL_13;
                v36 = *(_QWORD *)(v39 + 8 * v37++);
              }
              while (!v36);
              v19 = v37 - 1;
            }
          }
        }
      }
    }
    v18 = (v36 - 1) & v36;
    v20 = __clz(__rbit64(v36)) + (v19 << 6);
    goto LABEL_18;
  }
  v18 = (v44 - 1) & v44;
  v19 = v43;
  v20 = __clz(__rbit64(v44)) | (v43 << 6);
  v38 = (unint64_t)(v42 + 64) >> 6;
LABEL_18:
  v21 = (uint64_t *)(*(_QWORD *)(v40 + 48) + 16 * v20);
  v22 = *v21;
  v23 = v21[1];
  v24 = *(void **)(*(_QWORD *)(v40 + 56) + 8 * v20);
  swift_bridgeObjectRetain();
  result = v24;
  while (1)
  {
    v25 = *((_QWORD *)v4 + 3);
    v26 = v25 >> 1;
    if ((uint64_t)(v25 >> 1) < v2 + 1)
    {
      result = sub_1C3957554((char *)(v25 > 1), v2 + 1, 1, (uint64_t)v4);
      v4 = (char *)result;
      v26 = result[3] >> 1;
    }
    if (v2 < v26)
      break;
LABEL_43:
    *((_QWORD *)v4 + 2) = v2;
  }
  while (1)
  {
    v27 = &v4[24 * v2 + 32];
    *(_QWORD *)v27 = v22;
    *((_QWORD *)v27 + 1) = v23;
    *((_QWORD *)v27 + 2) = v24;
    ++v2;
    if (v18)
    {
      v28 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v29 = v28 | (v19 << 6);
      goto LABEL_40;
    }
    v30 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v30 >= v38)
      goto LABEL_44;
    v31 = *(_QWORD *)(v39 + 8 * v30);
    v32 = v19 + 1;
    if (!v31)
    {
      v32 = v19 + 2;
      if (v19 + 2 >= v38)
        goto LABEL_44;
      v31 = *(_QWORD *)(v39 + 8 * v32);
      if (!v31)
      {
        v32 = v19 + 3;
        if (v19 + 3 >= v38)
          goto LABEL_44;
        v31 = *(_QWORD *)(v39 + 8 * v32);
        if (!v31)
        {
          v32 = v19 + 4;
          if (v19 + 4 >= v38)
            goto LABEL_44;
          v31 = *(_QWORD *)(v39 + 8 * v32);
          if (!v31)
          {
            v32 = v19 + 5;
            if (v19 + 5 >= v38)
              goto LABEL_44;
            v31 = *(_QWORD *)(v39 + 8 * v32);
            if (!v31)
            {
              v33 = v19 + 6;
              while (v33 < v38)
              {
                v31 = *(_QWORD *)(v39 + 8 * v33++);
                if (v31)
                {
                  v32 = v33 - 1;
                  goto LABEL_39;
                }
              }
LABEL_44:
              *((_QWORD *)v4 + 2) = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_39:
    v18 = (v31 - 1) & v31;
    v29 = __clz(__rbit64(v31)) + (v32 << 6);
    v19 = v32;
LABEL_40:
    v34 = (uint64_t *)(*(_QWORD *)(v40 + 48) + 16 * v29);
    v22 = *v34;
    v23 = v34[1];
    v24 = *(void **)(*(_QWORD *)(v40 + 56) + 8 * v29);
    if (v2 >= v26)
    {
      swift_bridgeObjectRetain();
      result = v24;
      goto LABEL_43;
    }
    swift_bridgeObjectRetain();
    result = v24;
    v24 = result;
  }
  __break(1u);
LABEL_65:
  __break(1u);
  return result;
}

unint64_t sub_1C3958204(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_1C3958228(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_mediaItems);
  if (!v1)
    return 0;
  v2 = v1;
  sub_1C3948564(0, &qword_1EF8E4FF0);
  v3 = sub_1C3AB8008();

  return v3;
}

uint64_t sub_1C3958294(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_domainId);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1C3AB7F6C();

  return v3;
}

uint64_t sub_1C39582F4(void *a1, SEL *a2)
{
  uint64_t v2;

  if (!objc_msgSend(a1, *a2))
    return 0;
  sub_1C3948564(0, (unint64_t *)&unk_1ED7E77E0);
  sub_1C3AB7F48();
  OUTLINED_FUNCTION_43();
  return v2;
}

uint64_t sub_1C3958368(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void (*v10)(uint64_t *, _QWORD);
  void (*v11)(uint64_t *, _QWORD);
  id *v12;
  id v13;
  uint64_t v14;

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1C3AB81AC();
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
      v8 = sub_1C3AB81AC();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C395A898(&qword_1ED7E7738, &qword_1ED7E7640);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7640);
            sub_1C39586A8();
            v11 = v10;
            v13 = *v12;
            v11(&v14, 0);
            *(_QWORD *)(v5 + 8 * i) = v13;
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
        sub_1C3957B90((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, (unint64_t *)&qword_1ED7E77C0);
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

uint64_t sub_1C3958508(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void (*v10)(uint64_t *, _QWORD);
  void (*v11)(uint64_t *, _QWORD);
  id *v12;
  id v13;
  uint64_t v14;

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1C3AB81AC();
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
      v8 = sub_1C3AB81AC();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1C395A898(&qword_1ED7E7740, &qword_1ED7E7688);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E7688);
            sub_1C39586DC();
            v11 = v10;
            v13 = *v12;
            v11(&v14, 0);
            *(_QWORD *)(v5 + 8 * i) = v13;
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
        sub_1C3957B90((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5, &qword_1ED7E7698);
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

void sub_1C39586A8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_47_1();
  v2 = OUTLINED_FUNCTION_77_0((uint64_t)v1);
  sub_1C3958738(v2, v3, v4);
  *(_QWORD *)(v0 + 32) = v5;
  OUTLINED_FUNCTION_5();
}

void sub_1C39586DC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_47_1();
  v2 = OUTLINED_FUNCTION_77_0((uint64_t)v1);
  sub_1C3958780(v2, v3, v4);
  *(_QWORD *)(v0 + 32) = v5;
  OUTLINED_FUNCTION_5();
}

void sub_1C395870C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void sub_1C3958738(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_33_1(a1, a2, a3);
  if (v6)
    OUTLINED_FUNCTION_84_0();
  *v3 = OUTLINED_FUNCTION_70_0(v4 + 8 * v5);
  OUTLINED_FUNCTION_5();
}

void sub_1C3958778(id *a1)
{

}

void sub_1C3958780(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_33_1(a1, a2, a3);
  if (v6)
    OUTLINED_FUNCTION_84_0();
  *v3 = OUTLINED_FUNCTION_70_0(v4 + 8 * v5);
  OUTLINED_FUNCTION_5();
}

void sub_1C39587C0(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  os_log_type_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_opt_self();
  if (OUTLINED_FUNCTION_2_5()
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5())
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5())
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5())
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5())
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5()))
  {
    sub_1C3AB7F6C();
    OUTLINED_FUNCTION_90_0();
    goto LABEL_8;
  }
  objc_opt_self();
  if (OUTLINED_FUNCTION_2_5())
    goto LABEL_16;
  objc_opt_self();
  if (OUTLINED_FUNCTION_2_5())
  {
    v3 = OUTLINED_FUNCTION_11_2();
    v4 = OUTLINED_FUNCTION_0_0(v3, sel_bundleID);
LABEL_17:
    v6 = v4;
    OUTLINED_FUNCTION_76_0();
    OUTLINED_FUNCTION_44();

    goto LABEL_8;
  }
  objc_opt_self();
  if (OUTLINED_FUNCTION_2_5()
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5())
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5()))
  {
LABEL_16:
    v5 = OUTLINED_FUNCTION_11_2();
    v4 = OUTLINED_FUNCTION_0_0(v5, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1ED7E7668 != -1)
    swift_once();
  v7 = OUTLINED_FUNCTION_106();
  __swift_project_value_buffer(v7, (uint64_t)qword_1ED7E7A28);
  OUTLINED_FUNCTION_68_0();
  v8 = (void *)sub_1C3AB7F24();
  v9 = sub_1C3AB80A4();
  if (OUTLINED_FUNCTION_26_1(v9))
  {
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_46_1(4.8149e-34);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E4FC0);
    v10 = OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_73_0(v10, v11, v12, v13, v14);
    OUTLINED_FUNCTION_38_1();

    OUTLINED_FUNCTION_63_0();
    OUTLINED_FUNCTION_22_1(&dword_1C392E000, v15, v16, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.");
    OUTLINED_FUNCTION_35_1();
    OUTLINED_FUNCTION_0_2();
  }

LABEL_8:
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_25_1();
}

void sub_1C3958AA0(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  os_log_type_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_opt_self();
  if (OUTLINED_FUNCTION_2_5()
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5())
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5())
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5())
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5())
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5()))
  {
    sub_1C3AB7F6C();
    OUTLINED_FUNCTION_90_0();
    goto LABEL_8;
  }
  objc_opt_self();
  if (OUTLINED_FUNCTION_2_5())
    goto LABEL_16;
  objc_opt_self();
  if (OUTLINED_FUNCTION_2_5())
  {
    v3 = OUTLINED_FUNCTION_11_2();
    v4 = OUTLINED_FUNCTION_0_0(v3, sel_bundleID);
LABEL_17:
    v6 = v4;
    OUTLINED_FUNCTION_76_0();
    OUTLINED_FUNCTION_44();

    goto LABEL_8;
  }
  objc_opt_self();
  if (OUTLINED_FUNCTION_2_5()
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5())
    || (objc_opt_self(), OUTLINED_FUNCTION_2_5()))
  {
LABEL_16:
    v5 = OUTLINED_FUNCTION_11_2();
    v4 = OUTLINED_FUNCTION_0_0(v5, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1ED7E7668 != -1)
    swift_once();
  v7 = OUTLINED_FUNCTION_106();
  __swift_project_value_buffer(v7, (uint64_t)qword_1ED7E7A28);
  OUTLINED_FUNCTION_68_0();
  v8 = (void *)sub_1C3AB7F24();
  v9 = sub_1C3AB80A4();
  if (OUTLINED_FUNCTION_26_1(v9))
  {
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_46_1(4.8149e-34);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E4FC0);
    v10 = OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_73_0(v10, v11, v12, v13, v14);
    OUTLINED_FUNCTION_38_1();

    OUTLINED_FUNCTION_63_0();
    OUTLINED_FUNCTION_22_1(&dword_1C392E000, v15, v16, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.");
    OUTLINED_FUNCTION_35_1();
    OUTLINED_FUNCTION_0_2();
  }

LABEL_8:
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_25_1();
}

uint64_t sub_1C3958D80(void *a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
    goto LABEL_16;
  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    v6 = (void *)v5;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    v9 = v7;
    v2 = sub_1C3AB7F6C();

    return v2;
  }
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0)
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    v8 = (void *)v4;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1ED7E7668 != -1)
    swift_once();
  v10 = sub_1C3AB7F3C();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED7E7A28);
  swift_unknownObjectRetain_n();
  v11 = sub_1C3AB7F24();
  v12 = sub_1C3AB80A4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v17 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E4FC0);
    v15 = sub_1C3AB7F78();
    sub_1C393DFE0(v15, v16, &v17);
    sub_1C3AB80D4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C392E000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BD6CF0](v14, -1, -1);
    MEMORY[0x1C3BD6CF0](v13, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_1C39591AC(void *a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
    goto LABEL_16;
  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    v6 = (void *)v5;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    v9 = v7;
    v2 = sub_1C3AB7F6C();

    return v2;
  }
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0)
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    v8 = (void *)v4;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1ED7E7668 != -1)
    swift_once();
  v10 = sub_1C3AB7F3C();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED7E7A28);
  swift_unknownObjectRetain_n();
  v11 = sub_1C3AB7F24();
  v12 = sub_1C3AB80A4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v17 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E4FC0);
    v15 = sub_1C3AB7F78();
    sub_1C393DFE0(v15, v16, &v17);
    sub_1C3AB80D4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C392E000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BD6CF0](v14, -1, -1);
    MEMORY[0x1C3BD6CF0](v13, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_1C39595D8(void *a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
    goto LABEL_16;
  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    v6 = (void *)v5;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    v9 = v7;
    v2 = sub_1C3AB7F6C();

    return v2;
  }
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0)
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    v8 = (void *)v4;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1ED7E7668 != -1)
    swift_once();
  v10 = sub_1C3AB7F3C();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED7E7A28);
  swift_unknownObjectRetain_n();
  v11 = sub_1C3AB7F24();
  v12 = sub_1C3AB80A4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v17 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E4FC0);
    v15 = sub_1C3AB7F78();
    sub_1C393DFE0(v15, v16, &v17);
    sub_1C3AB80D4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C392E000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BD6CF0](v14, -1, -1);
    MEMORY[0x1C3BD6CF0](v13, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_1C3959A04(void *a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
    goto LABEL_16;
  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    v6 = (void *)v5;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    v9 = v7;
    v2 = sub_1C3AB7F6C();

    return v2;
  }
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0)
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    v8 = (void *)v4;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1ED7E7668 != -1)
    swift_once();
  v10 = sub_1C3AB7F3C();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED7E7A28);
  swift_unknownObjectRetain_n();
  v11 = sub_1C3AB7F24();
  v12 = sub_1C3AB80A4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v17 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E4FC0);
    v15 = sub_1C3AB7F78();
    sub_1C393DFE0(v15, v16, &v17);
    sub_1C3AB80D4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C392E000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BD6CF0](v14, -1, -1);
    MEMORY[0x1C3BD6CF0](v13, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_1C3959E30(void *a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
    goto LABEL_16;
  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    v6 = (void *)v5;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    v9 = v7;
    v2 = sub_1C3AB7F6C();

    return v2;
  }
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0)
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    v8 = (void *)v4;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1ED7E7668 != -1)
    swift_once();
  v10 = sub_1C3AB7F3C();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED7E7A28);
  swift_unknownObjectRetain_n();
  v11 = sub_1C3AB7F24();
  v12 = sub_1C3AB80A4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v17 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E4FC0);
    v15 = sub_1C3AB7F78();
    sub_1C393DFE0(v15, v16, &v17);
    sub_1C3AB80D4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C392E000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BD6CF0](v14, -1, -1);
    MEMORY[0x1C3BD6CF0](v13, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_1C395A25C(void *a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
    return sub_1C3AB7F6C();
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
    goto LABEL_16;
  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    v6 = (void *)v5;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v6, sel_bundleID);
LABEL_17:
    v9 = v7;
    v2 = sub_1C3AB7F6C();

    return v2;
  }
  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0)
    || (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0))
  {
LABEL_16:
    v8 = (void *)v4;
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v8, sel_bundleId);
    goto LABEL_17;
  }
  if (qword_1ED7E7668 != -1)
    swift_once();
  v10 = sub_1C3AB7F3C();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED7E7A28);
  swift_unknownObjectRetain_n();
  v11 = sub_1C3AB7F24();
  v12 = sub_1C3AB80A4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v17 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_getObjectType();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E4FC0);
    v15 = sub_1C3AB7F78();
    sub_1C393DFE0(v15, v16, &v17);
    sub_1C3AB80D4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C392E000, v11, v12, "Harvesting logger: returning nil due to unsupported event of class %s, bundle ID cannot be retrieved.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BD6CF0](v14, -1, -1);
    MEMORY[0x1C3BD6CF0](v13, -1, -1);

  }
  else
  {

  }
  return 0;
}

_QWORD *sub_1C395A688(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  void *v22;
  id v23;
  uint64_t v24;

  v5 = result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_39:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (_QWORD *)v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v24 = -1 << *(_BYTE *)(a4 + 32);
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
    v22 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      v23 = v22;
      goto LABEL_38;
    }
    v11 += 3;
    swift_bridgeObjectRetain();
    result = v22;
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
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
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
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
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v24;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1C395A898(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1C3BD6C78](MEMORY[0x1E0DEAF50], v4);
    atomic_store(result, a1);
  }
  return result;
}

id OUTLINED_FUNCTION_5_3(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, 0, 0, v2, 0, 0, 0);
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

void OUTLINED_FUNCTION_16_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = a1;

}

void OUTLINED_FUNCTION_17_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return sub_1C3AB81A0();
}

void OUTLINED_FUNCTION_22_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_bridgeObjectRelease();
}

BOOL OUTLINED_FUNCTION_26_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  return sub_1C3AB80D4();
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return sub_1C3AB81C4();
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return sub_1C3AB7F9C();
}

unint64_t OUTLINED_FUNCTION_33_1(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_1C3958204(a2, (a3 & 0xC000000000000001) == 0, a3);
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return sub_1C3AB80D4();
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return sub_1C3AB7EA0();
}

void OUTLINED_FUNCTION_44_1()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 0;
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_46_1(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_getObjectType();
}

void *OUTLINED_FUNCTION_47_1()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return sub_1C3AB81B8();
}

void OUTLINED_FUNCTION_49_0()
{
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return sub_1C3AB7F60();
}

void OUTLINED_FUNCTION_56_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return sub_1C3AB7EE8();
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  return sub_1C3AB81C4();
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return sub_1C3AB7F78();
}

uint64_t OUTLINED_FUNCTION_66_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  return swift_unknownObjectRetain_n();
}

id OUTLINED_FUNCTION_70_0@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(a1 + 32);
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_73_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  return sub_1C393DFE0(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_74_0(void *a1)
{
  SEL *v1;

  return sub_1C39582F4(a1, v1);
}

void OUTLINED_FUNCTION_75_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return sub_1C3AB7F6C();
}

uint64_t OUTLINED_FUNCTION_77_0(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

id OUTLINED_FUNCTION_79_0()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 1480));
}

id OUTLINED_FUNCTION_80_0(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_82_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_83_0()
{
  return swift_bridgeObjectRetain_n();
}

void OUTLINED_FUNCTION_84_0()
{
  JUMPOUT(0x1C3BD5BF8);
}

uint64_t OUTLINED_FUNCTION_85_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

BOOL OUTLINED_FUNCTION_86_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_87_0()
{
  return sub_1C3AB7F6C();
}

uint64_t OUTLINED_FUNCTION_88_0()
{
  return sub_1C3AB80D4();
}

void OUTLINED_FUNCTION_89_0()
{
  void *v0;

}

void OUTLINED_FUNCTION_92_0()
{
  JUMPOUT(0x1C3BD5A3CLL);
}

uint64_t static HarvestingSystem.start()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  unint64_t v15;

  if (qword_1ED7E7668 != -1)
    swift_once();
  v0 = sub_1C3AB7F3C();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED7E7A28);
  v1 = sub_1C3AB7F24();
  v2 = sub_1C3AB8080();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1C392E000, v1, v2, "HarvestingSystem: beginning bring up of consumers", v3, 2u);
    OUTLINED_FUNCTION_0_5();
  }

  if (qword_1ED7E7758 != -1)
    swift_once();
  v4 = (void *)qword_1ED7E7A20;
  if (qword_1ED7E7770 != -1)
    swift_once();
  v5 = (void *)qword_1ED7E7A40;
  if (qword_1ED7E7780 != -1)
    swift_once();
  v6 = (void *)qword_1ED7E7A48;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E77F0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1C3AE4CF0;
  *(_QWORD *)(v7 + 32) = v4;
  *(_QWORD *)(v7 + 40) = v5;
  *(_QWORD *)(v7 + 48) = v6;
  v15 = v7;
  sub_1C3AB8014();
  v8 = v4;
  v9 = v5;
  v10 = v6;
  swift_bridgeObjectRetain();
  v11 = sub_1C3AB7F24();
  v12 = sub_1C3AB8080();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v13 = 134217984;
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_1C3AB81AC();
      OUTLINED_FUNCTION_9();
    }
    OUTLINED_FUNCTION_9();
    sub_1C3AB80D4();
    OUTLINED_FUNCTION_9();
    _os_log_impl(&dword_1C392E000, v11, v12, "HarvestingSystem: completed consumer bring up of %ld consumers", v13, 0xCu);
    OUTLINED_FUNCTION_0_5();
  }

  return swift_bridgeObjectRelease_n();
}

id HarvestingSystem.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HarvestingSystem.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HarvestingSystem();
  return objc_msgSendSuper2(&v2, sel_init);
}

id HarvestingSystem.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HarvestingSystem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for HarvestingSystem()
{
  return objc_opt_self();
}

uint64_t PPM2DatabaseRemoteRecordCountReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 32) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_36:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 24;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPM2NamedEntitiesPerDonationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  void *v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 3u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_39;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_41;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_41:
          v32 = 20;
          goto LABEL_46;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 24;
          goto LABEL_37;
        case 5u:
          v26 = 0;
          v27 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          break;
        case 6u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 8;
LABEL_37:
          v31 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          break;
        v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
        *(_QWORD *)(a2 + v28) = v29 + 1;
        v19 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0)
          goto LABEL_43;
        v26 += 7;
        v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_45;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_45:
      v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C395CD78(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void ___getNotificationDispatchQueue_block_invoke()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.proactive.PersonalizationPortrait.PPNamedEntityDissector.NotificationQueue", v2);
  v4 = (void *)_getNotificationDispatchQueue__pasExprOnceResult;
  _getNotificationDispatchQueue__pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v0);
}

id ___makeDefaultGazetteer_block_invoke()
{
  return (id)objc_opt_new();
}

uint64_t PPSocialHighlightFeedbackReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  PPRankableSocialHighlight *v31;
  void *v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
        goto LABEL_36;
      case 2u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 48) |= 2u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              v15 = v22++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_40:
        *(_DWORD *)(a1 + 24) = v23;
        goto LABEL_43;
      case 3u:
        *(_BYTE *)(a1 + 48) |= 1u;
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        *(_QWORD *)(a1 + 8) = v30;
        goto LABEL_43;
      case 4u:
        v31 = objc_alloc_init(PPRankableSocialHighlight);
        objc_storeStrong((id *)(a1 + 32), v31);
        if (PBReaderPlaceMark() && (PPRankableSocialHighlightReadFrom((uint64_t)v31, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_43:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 5u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
LABEL_36:
        v32 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_43;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_43;
    }
  }
}

void sub_1C396068C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C3960754(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C39609BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C3960A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C3960AF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::priority_queue<PPTokenCount * {__strong},std::vector<PPTokenCount * {__strong}>,PPTokenCountCompareLess>::pop(uint64_t a1)
{
  void **v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void **v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v2 = *(void ***)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = v3 - *(_QWORD *)a1;
  if ((uint64_t)v4 >= 9)
  {
    v5 = 0;
    v6 = v4 >> 3;
    v22 = *v2;
    *v2 = 0;
    v7 = __OFSUB__(v4 >> 3, 2);
    v8 = (v4 >> 3) - 2;
    if (v8 < 0 != v7)
      v8 = v6 - 1;
    v9 = v8 >> 1;
    v10 = v2;
    do
    {
      v11 = &v10[v5 + 1];
      v12 = (2 * v5) | 1;
      v13 = 2 * v5 + 2;
      if (v13 < v6 && PPTokenCountCompareLess::operator()(*v11, v10[v5 + 2]))
      {
        ++v11;
        v12 = v13;
      }
      v14 = *v11;
      *v11 = 0;
      v15 = *v10;
      *v10 = v14;

      v10 = v11;
      v5 = v12;
    }
    while (v12 <= v9);
    v16 = (void **)(v3 - 8);
    if (v16 == v11)
    {
      v20 = *v11;
      *v11 = v22;

    }
    else
    {
      v17 = *v16;
      *v16 = 0;
      v18 = *v11;
      *v11 = v17;

      v19 = *v16;
      *v16 = v22;

      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPTokenCountCompareLess &,std::__wrap_iter<PPTokenCount * {__strong}*>>((uint64_t)v2, (uint64_t)(v11 + 1), v11 + 1 - v2);
    }
  }
  v21 = *(_QWORD *)(a1 + 8);

  *(_QWORD *)(a1 + 8) = v21 - 8;
}

void sub_1C3960C48(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPTokenCountCompareLess &,std::__wrap_iter<PPTokenCount * {__strong}*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  void **v6;
  void **v7;
  void *v8;
  void **v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = v3 >> 1;
    v6 = (void **)(a1 + 8 * (v3 >> 1));
    v7 = (void **)(a2 - 8);
    if (PPTokenCountCompareLess::operator()(*v6, *(void **)(a2 - 8)))
    {
      v8 = *v7;
      *v7 = 0;
      do
      {
        v9 = v6;
        v10 = *v6;
        *v6 = 0;
        v11 = *v7;
        *v7 = v10;

        if (!v5)
          break;
        v5 = (v5 - 1) >> 1;
        v6 = (void **)(a1 + 8 * v5);
        v7 = v9;
      }
      while (PPTokenCountCompareLess::operator()(*v6, v8));
      v12 = *v9;
      *v9 = v8;

    }
  }
}

void sub_1C3960D18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL PPTokenCountCompareLess::operator()(void *a1, void *a2)
{
  id v3;
  id v4;
  unsigned int v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  v6 = v5 < objc_msgSend(v4, "count");

  return v6;
}

void sub_1C3960D84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E7E13398, MEMORY[0x1E0DE42D0]);
}

void sub_1C3960E10(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void sub_1C3961CA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2LocationItemDonationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 3u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 44) |= 4u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_60;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_62;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_62:
          v50 = 28;
          goto LABEL_71;
        case 6u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 32;
          goto LABEL_44;
        case 7u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 44) |= 8u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_66:
          v51 = v28 != 0;
          v52 = 40;
          goto LABEL_76;
        case 8u:
          v32 = 0;
          v33 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v19 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_70:
          v50 = 24;
LABEL_71:
          *(_DWORD *)(a1 + v50) = v19;
          continue;
        case 9u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 16;
LABEL_44:
          v37 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        case 0xAu:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 44) |= 0x10u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_75:
          v51 = v40 != 0;
          v52 = 41;
LABEL_76:
          *(_BYTE *)(a1 + v52) = v51;
          continue;
        case 0xBu:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v47 = *v3;
        v48 = *(_QWORD *)(a2 + v47);
        if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
          break;
        v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
        *(_QWORD *)(a2 + v47) = v48 + 1;
        v46 |= (unint64_t)(v49 & 0x7F) << v44;
        if ((v49 & 0x80) == 0)
          goto LABEL_78;
        v44 += 7;
        v14 = v45++ >= 9;
        if (v14)
        {
          v46 = 0;
          goto LABEL_80;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_78:
      if (*(_BYTE *)(a2 + *v5))
        v46 = 0;
LABEL_80:
      *(_QWORD *)(a1 + 8) = v46;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3964DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PPM2FeedbackPortraitRegisteredReadFrom(_BYTE *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  PPM2SourceAlgPair *v31;
  void *v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
        goto LABEL_41;
      case 3u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        a1[52] |= 1u;
        while (2)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 1;
            v22 |= (unint64_t)(v25 & 0x7F) << v20;
            if (v25 < 0)
            {
              v20 += 7;
              v14 = v21++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_52;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_52:
        v38 = 24;
        goto LABEL_61;
      case 4u:
        v26 = 0;
        v27 = 0;
        v22 = 0;
        a1[52] |= 4u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v22 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              v14 = v27++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_56:
        v38 = 48;
        goto LABEL_61;
      case 5u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_41;
      case 7u:
        v31 = objc_alloc_init(PPM2SourceAlgPair);
        objc_msgSend(a1, "addRecords:", v31);
        if (PBReaderPlaceMark() && PPM2SourceAlgPairReadFrom((uint64_t)v31, a2))
        {
          PBReaderRecallMark();

LABEL_62:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 8u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_41:
        v32 = *(void **)&a1[v18];
        *(_QWORD *)&a1[v18] = v17;

        goto LABEL_62;
      case 9u:
        v33 = 0;
        v34 = 0;
        v22 = 0;
        a1[52] |= 2u;
        while (2)
        {
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v36 + 1;
            v22 |= (unint64_t)(v37 & 0x7F) << v33;
            if (v37 < 0)
            {
              v33 += 7;
              v14 = v34++ >= 9;
              if (v14)
              {
                LODWORD(v22) = 0;
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_60:
        v38 = 28;
LABEL_61:
        *(_DWORD *)&a1[v38] = v22;
        goto LABEL_62;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_62;
    }
  }
}

uint64_t __Block_byref_object_copy__597(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__598(uint64_t a1)
{

}

void sub_1C396785C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2NamedEntitiesScoredReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  void *v56;
  BOOL v57;
  uint64_t v58;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_65;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_69:
          *(_DWORD *)(a1 + 24) = v22;
          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 36) |= 8u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_73:
          v57 = v28 != 0;
          v58 = 30;
          goto LABEL_90;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 36) |= 0x20u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_77:
          v57 = v34 != 0;
          v58 = 32;
          goto LABEL_90;
        case 5u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 36) |= 0x10u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_81:
          v57 = v40 != 0;
          v58 = 31;
          goto LABEL_90;
        case 6u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
              *(_QWORD *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  v46 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_85:
          v57 = v46 != 0;
          v58 = 29;
          goto LABEL_90;
        case 7u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          break;
        case 8u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_65:
          v56 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v53 = *v3;
        v54 = *(_QWORD *)(a2 + v53);
        if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
          break;
        v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
        *(_QWORD *)(a2 + v53) = v54 + 1;
        v52 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0)
          goto LABEL_87;
        v50 += 7;
        v14 = v51++ >= 9;
        if (v14)
        {
          v52 = 0;
          goto LABEL_89;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_87:
      if (*(_BYTE *)(a2 + *v5))
        v52 = 0;
LABEL_89:
      v57 = v52 != 0;
      v58 = 28;
LABEL_90:
      *(_BYTE *)(a1 + v58) = v57;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3969E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C396A7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__816(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__817(uint64_t a1)
{

}

uint64_t PPM2DeviceStatsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C396B55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__988(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__989(uint64_t a1)
{

}

uint64_t PPM2TopicDonationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v23;

      }
      else if ((v10 >> 3) == 2)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C396C674(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t PPRankableSocialHighlightReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  PPSocialHighlightContact *v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v75;
  void *v76;
  char v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  uint64_t v84;
  BOOL v85;
  uint64_t v86;
  uint64_t v87;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 160;
        goto LABEL_109;
      case 3u:
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 256) |= 0x40u;
        while (2)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          v26 = v25 + 1;
          if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
            *(_QWORD *)(a2 + v24) = v26;
            v23 |= (unint64_t)(v27 & 0x7F) << v21;
            if (v27 < 0)
            {
              v21 += 7;
              v15 = v22++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_120;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_120:
        v84 = 168;
        goto LABEL_129;
      case 4u:
        *(_WORD *)(a1 + 256) |= 0x10u;
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v87 = 40;
        goto LABEL_159;
      case 5u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 232;
        goto LABEL_109;
      case 6u:
        PBReaderReadString();
        v31 = (PPSocialHighlightContact *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend((id)a1, "addApplicationIdentifiers:", v31);
        goto LABEL_44;
      case 7u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 216;
        goto LABEL_109;
      case 8u:
        v31 = objc_alloc_init(PPSocialHighlightContact);
        objc_storeStrong((id *)(a1 + 224), v31);
        if (!PBReaderPlaceMark() || (PPSocialHighlightContactReadFrom((uint64_t)v31, a2) & 1) == 0)
          goto LABEL_162;
        goto LABEL_43;
      case 9u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 128;
        goto LABEL_109;
      case 0xAu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 72;
        goto LABEL_109;
      case 0xBu:
        v31 = objc_alloc_init(PPSocialHighlightFeature);
        objc_msgSend((id)a1, "addCalculatedFeatures:", v31);
        if (PBReaderPlaceMark() && (PPSocialHighlightFeatureReadFrom((uint64_t)v31, a2) & 1) != 0)
        {
LABEL_43:
          PBReaderRecallMark();
LABEL_44:

LABEL_160:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_162:

        return 0;
      case 0xCu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 88;
        goto LABEL_109;
      case 0xDu:
        *(_WORD *)(a1 + 256) |= 1u;
        v32 = *v3;
        v33 = *(_QWORD *)(a2 + v32);
        if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v33);
          *(_QWORD *)(a2 + v32) = v33 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v87 = 8;
        goto LABEL_159;
      case 0xEu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 144;
        goto LABEL_109;
      case 0xFu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 120;
        goto LABEL_109;
      case 0x11u:
        v34 = 0;
        v35 = 0;
        v36 = 0;
        *(_WORD *)(a1 + 256) |= 0x800u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          v39 = v38 + 1;
          if (v38 == -1 || v39 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              v15 = v35++ >= 9;
              if (v15)
              {
                v36 = 0;
                goto LABEL_124;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v36 = 0;
LABEL_124:
        v85 = v36 != 0;
        v86 = 251;
        goto LABEL_146;
      case 0x12u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 64;
        goto LABEL_109;
      case 0x13u:
        v41 = 0;
        v42 = 0;
        v23 = 0;
        *(_WORD *)(a1 + 256) |= 0x80u;
        while (2)
        {
          v43 = *v3;
          v44 = *(_QWORD *)(a2 + v43);
          v45 = v44 + 1;
          if (v44 == -1 || v45 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
            *(_QWORD *)(a2 + v43) = v45;
            v23 |= (unint64_t)(v46 & 0x7F) << v41;
            if (v46 < 0)
            {
              v41 += 7;
              v15 = v42++ >= 9;
              if (v15)
              {
                LODWORD(v23) = 0;
                goto LABEL_128;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v23) = 0;
LABEL_128:
        v84 = 200;
LABEL_129:
        *(_DWORD *)(a1 + v84) = v23;
        goto LABEL_160;
      case 0x14u:
        *(_WORD *)(a1 + 256) |= 8u;
        v47 = *v3;
        v48 = *(_QWORD *)(a2 + v47);
        if (v48 <= 0xFFFFFFFFFFFFFFF7 && v48 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v48);
          *(_QWORD *)(a2 + v47) = v48 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v87 = 32;
        goto LABEL_159;
      case 0x15u:
        v49 = 0;
        v50 = 0;
        v51 = 0;
        *(_WORD *)(a1 + 256) |= 0x400u;
        while (2)
        {
          v52 = *v3;
          v53 = *(_QWORD *)(a2 + v52);
          v54 = v53 + 1;
          if (v53 == -1 || v54 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
            *(_QWORD *)(a2 + v52) = v54;
            v51 |= (unint64_t)(v55 & 0x7F) << v49;
            if (v55 < 0)
            {
              v49 += 7;
              v15 = v50++ >= 9;
              if (v15)
              {
                v51 = 0;
                goto LABEL_133;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v51 = 0;
LABEL_133:
        v85 = v51 != 0;
        v86 = 250;
        goto LABEL_146;
      case 0x16u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 192;
        goto LABEL_109;
      case 0x17u:
        *(_WORD *)(a1 + 256) |= 4u;
        v56 = *v3;
        v57 = *(_QWORD *)(a2 + v56);
        if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v57);
          *(_QWORD *)(a2 + v56) = v57 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v87 = 24;
        goto LABEL_159;
      case 0x18u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 208;
        goto LABEL_109;
      case 0x19u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 240;
        goto LABEL_109;
      case 0x1Au:
        v58 = 0;
        v59 = 0;
        v60 = 0;
        *(_WORD *)(a1 + 256) |= 0x1000u;
        while (2)
        {
          v61 = *v3;
          v62 = *(_QWORD *)(a2 + v61);
          v63 = v62 + 1;
          if (v62 == -1 || v63 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v64 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v62);
            *(_QWORD *)(a2 + v61) = v63;
            v60 |= (unint64_t)(v64 & 0x7F) << v58;
            if (v64 < 0)
            {
              v58 += 7;
              v15 = v59++ >= 9;
              if (v15)
              {
                v60 = 0;
                goto LABEL_137;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v60 = 0;
LABEL_137:
        v85 = v60 != 0;
        v86 = 252;
        goto LABEL_146;
      case 0x1Bu:
        *(_WORD *)(a1 + 256) |= 0x20u;
        v65 = *v3;
        v66 = *(_QWORD *)(a2 + v65);
        if (v66 <= 0xFFFFFFFFFFFFFFF7 && v66 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v66);
          *(_QWORD *)(a2 + v65) = v66 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v87 = 48;
        goto LABEL_159;
      case 0x1Cu:
        *(_WORD *)(a1 + 256) |= 2u;
        v67 = *v3;
        v68 = *(_QWORD *)(a2 + v67);
        if (v68 <= 0xFFFFFFFFFFFFFFF7 && v68 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v68);
          *(_QWORD *)(a2 + v67) = v68 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v87 = 16;
LABEL_159:
        *(_QWORD *)(a1 + v87) = v30;
        goto LABEL_160;
      case 0x1Du:
        v69 = 0;
        v70 = 0;
        v71 = 0;
        *(_WORD *)(a1 + 256) |= 0x200u;
        while (2)
        {
          v72 = *v3;
          v73 = *(_QWORD *)(a2 + v72);
          v74 = v73 + 1;
          if (v73 == -1 || v74 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v75 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v73);
            *(_QWORD *)(a2 + v72) = v74;
            v71 |= (unint64_t)(v75 & 0x7F) << v69;
            if (v75 < 0)
            {
              v69 += 7;
              v15 = v70++ >= 9;
              if (v15)
              {
                v71 = 0;
                goto LABEL_141;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v71 = 0;
LABEL_141:
        v85 = v71 != 0;
        v86 = 249;
        goto LABEL_146;
      case 0x1Eu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 96;
        goto LABEL_109;
      case 0x1Fu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 112;
        goto LABEL_109;
      case 0x20u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 104;
        goto LABEL_109;
      case 0x21u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 136;
        goto LABEL_109;
      case 0x22u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 176;
        goto LABEL_109;
      case 0x23u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 184;
        goto LABEL_109;
      case 0x24u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 152;
LABEL_109:
        v76 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_160;
      case 0x25u:
        v77 = 0;
        v78 = 0;
        v79 = 0;
        *(_WORD *)(a1 + 256) |= 0x100u;
        while (2)
        {
          v80 = *v3;
          v81 = *(_QWORD *)(a2 + v80);
          v82 = v81 + 1;
          if (v81 == -1 || v82 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v83 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
            *(_QWORD *)(a2 + v80) = v82;
            v79 |= (unint64_t)(v83 & 0x7F) << v77;
            if (v83 < 0)
            {
              v77 += 7;
              v15 = v78++ >= 9;
              if (v15)
              {
                v79 = 0;
                goto LABEL_145;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v79 = 0;
LABEL_145:
        v85 = v79 != 0;
        v86 = 248;
LABEL_146:
        *(_BYTE *)(a1 + v86) = v85;
        goto LABEL_160;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_160;
    }
  }
}

uint64_t PPM2TopicDonationErrorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_44;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_46;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_46:
          v37 = 24;
          goto LABEL_51;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *(void **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v24;

          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 4u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_50:
          v37 = 28;
LABEL_51:
          *(_DWORD *)(a1 + v37) = v19;
          continue;
        case 4u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
          break;
        v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v35 + 1;
        v33 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0)
          goto LABEL_53;
        v31 += 7;
        v14 = v32++ >= 9;
        if (v14)
        {
          v33 = 0;
          goto LABEL_55;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
      if (*(_BYTE *)(a2 + *v5))
        v33 = 0;
LABEL_55:
      *(_QWORD *)(a1 + 8) = v33;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPM2TopicItemDonationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 3u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 44) |= 4u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_60;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_62;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_62:
          v50 = 28;
          goto LABEL_71;
        case 6u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 32;
          goto LABEL_44;
        case 7u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 44) |= 8u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_66:
          v51 = v28 != 0;
          v52 = 40;
          goto LABEL_76;
        case 8u:
          v32 = 0;
          v33 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v19 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_70:
          v50 = 24;
LABEL_71:
          *(_DWORD *)(a1 + v50) = v19;
          continue;
        case 9u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 16;
LABEL_44:
          v37 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        case 0xAu:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 44) |= 0x10u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_75:
          v51 = v40 != 0;
          v52 = 41;
LABEL_76:
          *(_BYTE *)(a1 + v52) = v51;
          continue;
        case 0xBu:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v47 = *v3;
        v48 = *(_QWORD *)(a2 + v47);
        if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
          break;
        v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
        *(_QWORD *)(a2 + v47) = v48 + 1;
        v46 |= (unint64_t)(v49 & 0x7F) << v44;
        if ((v49 & 0x80) == 0)
          goto LABEL_78;
        v44 += 7;
        v14 = v45++ >= 9;
        if (v14)
        {
          v46 = 0;
          goto LABEL_80;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_78:
      if (*(_BYTE *)(a2 + *v5))
        v46 = 0;
LABEL_80:
      *(_QWORD *)(a1 + 8) = v46;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3973A90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C3973CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C3973D1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C3973E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void **a13)
{
  a13 = (void **)&a10;
  std::vector<PPScoredItem * {__strong}>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

void std::priority_queue<PPScoredItem * {__strong},std::vector<PPScoredItem * {__strong}>,PPScoredItemCompareGreater>::pop(uint64_t a1)
{
  void **v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void **v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v2 = *(void ***)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = v3 - *(_QWORD *)a1;
  if ((uint64_t)v4 >= 9)
  {
    v5 = 0;
    v6 = v4 >> 3;
    v22 = *v2;
    *v2 = 0;
    v7 = __OFSUB__(v4 >> 3, 2);
    v8 = (v4 >> 3) - 2;
    if (v8 < 0 != v7)
      v8 = v6 - 1;
    v9 = v8 >> 1;
    v10 = v2;
    do
    {
      v11 = &v10[v5 + 1];
      v12 = (2 * v5) | 1;
      v13 = 2 * v5 + 2;
      if (v13 < v6 && PPScoredItemCompareGreater::operator()(*v11, v10[v5 + 2]))
      {
        ++v11;
        v12 = v13;
      }
      v14 = *v11;
      *v11 = 0;
      v15 = *v10;
      *v10 = v14;

      v10 = v11;
      v5 = v12;
    }
    while (v12 <= v9);
    v16 = (void **)(v3 - 8);
    if (v16 == v11)
    {
      v20 = *v11;
      *v11 = v22;

    }
    else
    {
      v17 = *v16;
      *v16 = 0;
      v18 = *v11;
      *v11 = v17;

      v19 = *v16;
      *v16 = v22;

      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPScoredItemCompareGreater &,std::__wrap_iter<PPScoredItem * {__strong}*>>((uint64_t)v2, (uint64_t)(v11 + 1), v11 + 1 - v2);
    }
  }
  v21 = *(_QWORD *)(a1 + 8);

  *(_QWORD *)(a1 + 8) = v21 - 8;
}

void sub_1C3973FD4(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void std::vector<PPScoredItem * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  void *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = (void *)*((_QWORD *)v4 - 1);
        v4 -= 8;

      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,PPScoredItemCompareGreater &,std::__wrap_iter<PPScoredItem * {__strong}*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  void **v6;
  void **v7;
  void *v8;
  void **v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = v3 >> 1;
    v6 = (void **)(a1 + 8 * (v3 >> 1));
    v7 = (void **)(a2 - 8);
    if (PPScoredItemCompareGreater::operator()(*v6, *(void **)(a2 - 8)))
    {
      v8 = *v7;
      *v7 = 0;
      do
      {
        v9 = v6;
        v10 = *v6;
        *v6 = 0;
        v11 = *v7;
        *v7 = v10;

        if (!v5)
          break;
        v5 = (v5 - 1) >> 1;
        v6 = (void **)(a1 + 8 * v5);
        v7 = v9;
      }
      while (PPScoredItemCompareGreater::operator()(*v6, v8));
      v12 = *v9;
      *v9 = v8;

    }
  }
}

void sub_1C3974110(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL PPScoredItemCompareGreater::operator()(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  _BOOL8 v8;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "score");
  v6 = v5;
  objc_msgSend(v4, "score");
  v8 = v6 > v7;

  return v8;
}

void sub_1C3974184(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PPScoredItem * {__strong}>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

uint64_t PPM2TopicsScoredReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  void *v56;
  BOOL v57;
  uint64_t v58;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_65;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_69:
          *(_DWORD *)(a1 + 24) = v22;
          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 36) |= 8u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_73:
          v57 = v28 != 0;
          v58 = 30;
          goto LABEL_90;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 36) |= 0x20u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_77:
          v57 = v34 != 0;
          v58 = 32;
          goto LABEL_90;
        case 5u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 36) |= 0x10u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_81:
          v57 = v40 != 0;
          v58 = 31;
          goto LABEL_90;
        case 6u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
              *(_QWORD *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  v46 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_85:
          v57 = v46 != 0;
          v58 = 29;
          goto LABEL_90;
        case 7u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          break;
        case 8u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_65:
          v56 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v53 = *v3;
        v54 = *(_QWORD *)(a2 + v53);
        if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
          break;
        v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
        *(_QWORD *)(a2 + v53) = v54 + 1;
        v52 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0)
          goto LABEL_87;
        v50 += 7;
        v14 = v51++ >= 9;
        if (v14)
        {
          v52 = 0;
          goto LABEL_89;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_87:
      if (*(_BYTE *)(a2 + *v5))
        v52 = 0;
LABEL_89:
      v57 = v52 != 0;
      v58 = 28;
LABEL_90:
      *(_BYTE *)(a1 + v58) = v57;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPM2TopicsScoredForMappingReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  void *v56;
  BOOL v57;
  uint64_t v58;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_66;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_66;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_70:
          *(_DWORD *)(a1 + 32) = v22;
          continue;
        case 4u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 44) |= 0x10u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_74:
          v57 = v28 != 0;
          v58 = 39;
          goto LABEL_91;
        case 5u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 44) |= 4u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_78:
          v57 = v34 != 0;
          v58 = 37;
          goto LABEL_91;
        case 6u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_82:
          v57 = v40 != 0;
          v58 = 36;
          goto LABEL_91;
        case 7u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_BYTE *)(a1 + 44) |= 0x20u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
              *(_QWORD *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  v46 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_86:
          v57 = v46 != 0;
          v58 = 40;
          goto LABEL_91;
        case 8u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_BYTE *)(a1 + 44) |= 8u;
          break;
        case 9u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_66:
          v56 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v53 = *v3;
        v54 = *(_QWORD *)(a2 + v53);
        if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
          break;
        v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
        *(_QWORD *)(a2 + v53) = v54 + 1;
        v52 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0)
          goto LABEL_88;
        v50 += 7;
        v14 = v51++ >= 9;
        if (v14)
        {
          v52 = 0;
          goto LABEL_90;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_88:
      if (*(_BYTE *)(a2 + *v5))
        v52 = 0;
LABEL_90:
      v57 = v52 != 0;
      v58 = 38;
LABEL_91:
      *(_BYTE *)(a1 + v58) = v57;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPM2TopicUniqueItemsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPM2UniqueNamedEntitiesFoundReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3977BF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C3977E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1C3977F94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C3978148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1C3978274(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1C39783E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C3978604(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

void sub_1C39787E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C3978894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ***std::unique_ptr<std::vector<PPScoreInterpreterValue>>::reset[abi:ne180100](void ***result, void **a2)
{
  void **v2;
  char *v3;
  char *v4;
  void *v5;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    v3 = (char *)*v2;
    if (*v2)
    {
      v4 = (char *)v2[1];
      v5 = *v2;
      if (v4 != v3)
      {
        do
          PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(v4 - 24));
        while (v4 != v3);
        v5 = *v2;
      }
      v2[1] = v3;
      operator delete(v5);
    }
    JUMPOUT(0x1C3BD627CLL);
  }
  return result;
}

void sub_1C397A1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  if (__p)
    operator delete(__p);
  std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table((uint64_t)&a35);
  std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table(v35 - 240);

  _Unwind_Resume(a1);
}

void sub_1C397A430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)PPScoreInterpreterBytecode;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void ***std::unique_ptr<std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>>::reset[abi:ne180100](void ***result, void **a2)
{
  void **v2;
  void **v3;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    v3 = v2;
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__destroy_vector::operator()[abi:ne180100](&v3);
    JUMPOUT(0x1C3BD627CLL);
  }
  return result;
}

void std::default_delete<std::vector<PPSubscoreIdentifier>>::operator()[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1C3BD627CLL);
}

void std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        v6 = v4;
        std::vector<std::unordered_set<PPSubscoreIdentifier>>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<std::unordered_set<PPSubscoreIdentifier>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table(v4 - 40);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::vector<std::unordered_set<PPSubscoreIdentifier>>::vector(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::unordered_set<PPSubscoreIdentifier>>::__vallocate[abi:ne180100](a1, a2);
    v4 = a1[1];
    v5 = v4 + 40 * a2;
    do
    {
      *(_OWORD *)v4 = 0uLL;
      *(_OWORD *)(v4 + 16) = 0uLL;
      *(_DWORD *)(v4 + 32) = 1065353216;
      v4 += 40;
    }
    while (v4 != v5);
    a1[1] = v5;
  }
  return a1;
}

void sub_1C397A730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::unordered_set<PPSubscoreIdentifier>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void sub_1C397A8A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C397B1C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("vector");
}

void sub_1C397B6CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__emplace_unique_key_args<PPSubscoreIdentifier,PPSubscoreIdentifier const&>(uint64_t a1, unsigned __int8 *a2, int a3)
{
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  uint64_t v8;
  uint64_t **v9;
  uint64_t *i;
  unint64_t v11;
  _QWORD *v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v5 = *((unsigned __int16 *)a2 + 1) + 4 * *a2;
  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v8 = *((unsigned __int16 *)a2 + 1) + 4 * *a2;
      if (v5 >= v6)
        v8 = v5 % v6;
    }
    else
    {
      v8 = ((_DWORD)v6 - 1) & v5;
    }
    v9 = *(uint64_t ***)(*(_QWORD *)a1 + 8 * v8);
    if (v9)
    {
      for (i = *v9; i; i = (uint64_t *)*i)
      {
        v11 = i[1];
        if (v11 == v5)
        {
          if (((*(_DWORD *)a2 ^ *((_DWORD *)i + 4)) & 0xFFFF00FF) == 0)
            return 0;
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= v6)
              v11 %= v6;
          }
          else
          {
            v11 &= v6 - 1;
          }
          if (v11 != v8)
            break;
        }
      }
    }
  }
  else
  {
    v8 = 0;
  }
  v12 = operator new(0x18uLL);
  *v12 = 0;
  v12[1] = v5;
  *((_DWORD *)v12 + 4) = a3;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v6 || (float)(v14 * (float)v6) < v13)
  {
    v15 = 1;
    if (v6 >= 3)
      v15 = (v6 & (v6 - 1)) != 0;
    v16 = v15 | (2 * v6);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__rehash<true>(a1, v18);
    v6 = *(_QWORD *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v5 >= v6)
        v8 = v5 % v6;
      else
        v8 = v5;
    }
    else
    {
      v8 = ((_DWORD)v6 - 1) & v5;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v8);
  if (v20)
  {
    *v12 = *v20;
LABEL_38:
    *v20 = v12;
    goto LABEL_39;
  }
  *v12 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v12;
  *(_QWORD *)(v19 + 8 * v8) = a1 + 16;
  if (*v12)
  {
    v21 = *(_QWORD *)(*v12 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v21 >= v6)
        v21 %= v6;
    }
    else
    {
      v21 &= v6 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return 1;
}

void sub_1C397B8F0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::find<PPSubscoreIdentifier>(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  unint64_t v3;
  uint8x8_t v4;
  uint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  if (!a2)
    return 0;
  v3 = *((unsigned __int16 *)a3 + 1) + 4 * *a3;
  v4 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *((unsigned __int16 *)a3 + 1) + 4 * *a3;
    if (v3 >= a2)
      v5 = v3 % a2;
  }
  else
  {
    v5 = ((_DWORD)a2 - 1) & v3;
  }
  v6 = *(uint64_t ***)(a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (((*(_DWORD *)a3 ^ *((_DWORD *)result + 4)) & 0xFFFF00FF) == 0)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E7E133A0, MEMORY[0x1E0DE42E0]);
}

void sub_1C397B9FC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

void std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

void sub_1C397BF14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::unordered_set<PPSubscoreIdentifier>>>,std::vector<std::unordered_set<PPSubscoreIdentifier>>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  void **v3;
  void **v4;
  void **v5;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = **(void ****)(a1 + 16);
    v4 = **(void ****)(a1 + 8);
    while (v3 != v4)
    {
      v3 -= 3;
      v5 = v3;
      std::vector<std::unordered_set<PPSubscoreIdentifier>>::__destroy_vector::operator()[abi:ne180100](&v5);
    }
  }
  return a1;
}

char *std::vector<std::unordered_set<PPSubscoreIdentifier>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  uint64_t v3;
  char *result;

  if (a2 >= 0x666666666666667)
    std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
  v3 = 5 * a2;
  result = (char *)operator new(40 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v3];
  return result;
}

void sub_1C397C0E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C397C1A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C397C334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2440(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2441(uint64_t a1)
{

}

void sub_1C397C490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1C397C614(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C397C6C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C397C7C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1C397C8D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1C397CA14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1C397CC28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1C397CE6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1C397D2FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(v3 - 144));

  _Unwind_Resume(a1);
}

void sub_1C397DDA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(v3 - 224));

  _Unwind_Resume(a1);
}

void pop(PPScoreInterpreterCtx *a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  uint8_t buf[16];

  v3 = a2;
  v4 = *(_QWORD *)(v3[1] + 8);
  v8 = v3;
  if (v4 == *(_QWORD *)v3[1])
  {
    pp_score_interpreter_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "Score interpreter stack underflow", buf, 2u);
    }

    __break(1u);
  }
  else
  {
    a1->super.isa = 0;
    a1->_stack.__ptr_.__value_ = 0;
    a1->_scoreInputs = 0;
    PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)a1, (const PPScoreInterpreterValue *)(v4 - 24));
    v5 = v8[1];
    PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(*(_QWORD *)(v5 + 8) - 24));
    *(_QWORD *)(v5 + 8) = v6;

  }
}

void sub_1C397DFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void push(void *a1, const PPScoreInterpreterValue *a2)
{
  uint64_t *v3;
  PPScoreInterpreterValue *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD *v14;
  uint8_t buf[8];
  PPScoreInterpreterValue *v16;
  char *v17;
  unint64_t v18;
  uint64_t *v19;

  v14 = a1;
  v3 = (uint64_t *)v14[1];
  v4 = (PPScoreInterpreterValue *)v3[1];
  v5 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v4 - *v3) >> 3);
  if (v5 >= 0x200)
  {
    pp_score_interpreter_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v13, OS_LOG_TYPE_ERROR, "Score interpreter stack overflow", buf, 2u);
    }

    __break(1u);
  }
  else
  {
    v6 = v3[2];
    if ((unint64_t)v4 >= v6)
    {
      v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - *v3) >> 3);
      v10 = 2 * v9;
      if (2 * v9 <= v5 + 1)
        v10 = v5 + 1;
      if (v9 >= 0x555555555555555)
        v11 = 0xAAAAAAAAAAAAAAALL;
      else
        v11 = v10;
      v19 = v3 + 2;
      if (v11)
        v11 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<PPScoreInterpreterValue>>(v11);
      else
        v12 = 0;
      *(_QWORD *)buf = v11;
      v16 = (PPScoreInterpreterValue *)(v11 + 24 * v5);
      v18 = v11 + 24 * v12;
      PPScoreInterpreterValue::PPScoreInterpreterValue(v16, a2);
      v17 = (char *)v16 + 24;
      std::vector<PPScoreInterpreterValue>::__swap_out_circular_buffer(v3, buf);
      v8 = v3[1];
      std::__split_buffer<PPScoreInterpreterValue>::~__split_buffer((uint64_t)buf);
    }
    else
    {
      PPScoreInterpreterValue::PPScoreInterpreterValue(v4, a2);
      v8 = v7 + 24;
      v3[1] = v7 + 24;
    }
    v3[1] = v8;

  }
}

void sub_1C397E12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void sub_1C3983008(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t shouldReturnUndefined(PPScoreInterpreterCtx *a1, std::__shared_weak_count *a2)
{
  PPScoreInterpreterCtx *v3;
  _QWORD *value;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint8_t buf[8];
  uint64_t v19;
  uint64_t v20;

  v3 = a1;
  value = v3->_stack.__ptr_.__value_;
  v5 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(value[1] - *value) >> 3);
  v6 = v5 - (_QWORD)a2;
  if (v5 < (unint64_t)a2)
  {
    pp_score_interpreter_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "Score interpreter stack underflow", buf, 2u);
    }

    __break(1u);
LABEL_23:
    std::vector<std::vector<std::unordered_set<PPSubscoreIdentifier>>>::__throw_out_of_range[abi:ne180100]();
  }
  if (v6 >= v5)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_19;
  }
  while (1)
  {
    v19 = 0;
    v20 = 0;
    *(_QWORD *)buf = 0;
    v8 = value;
    v7 = *value;
    if (0xAAAAAAAAAAAAAAABLL * ((v8[1] - v7) >> 3) <= v6)
      goto LABEL_23;
    PPScoreInterpreterValue::PPScoreInterpreterValue((PPScoreInterpreterValue *)buf, (const PPScoreInterpreterValue *)(v7 + 24 * v6));
    if (!(_BYTE)v20)
    {
      if (PPScoreInterpreterValue::getDouble((PPScoreInterpreterValue *)buf) == -31337.0)
        break;
      goto LABEL_14;
    }
    if (v20 != 1)
    {
      LODWORD(a2) = v20 != 2;
      goto LABEL_18;
    }
    PPScoreInterpreterValue::getFloatVector((PPScoreInterpreterValue *)buf, &v16);
    v9 = v16;
    a2 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v11 = __ldaxr(p_shared_owners);
      while (__stlxr(v11 - 1, p_shared_owners));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))a2->__on_zero_shared)(a2);
        std::__shared_weak_count::__release_weak(a2);
      }
    }
    if (!v9)
      break;
LABEL_14:
    PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
    ++v6;
    value = v3->_stack.__ptr_.__value_;
    if (v6 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(value[1] - *value) >> 3))
      goto LABEL_15;
  }
  LODWORD(a2) = 1;
LABEL_18:
  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)buf);
  v12 = 1;
LABEL_19:
  v13 = v12 & a2;

  return v13;
}

void sub_1C3983F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  va_list va;

  va_start(va, a3);
  PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)va);

  _Unwind_Resume(a1);
}

void drop(PPScoreInterpreterCtx *a1, unint64_t a2)
{
  _QWORD *value;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  PPScoreInterpreterCtx *v9;
  uint8_t buf[16];

  v9 = a1;
  value = v9->_stack.__ptr_.__value_;
  v4 = value[1];
  v5 = 0xAAAAAAAAAAAAAAABLL * ((v4 - *value) >> 3);
  v6 = v5 - a2;
  if (v5 < a2)
  {
    pp_score_interpreter_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "Score interpreter stack underflow", buf, 2u);
    }

    __break(1u);
  }
  else
  {
    if (v5 > v6)
    {
      v7 = *value + 24 * v6;
      while (v4 != v7)
        PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(v4 - 24));
      value[1] = v7;
    }

  }
}

void sub_1C3984074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

_QWORD *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1C39840E4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::push_back[abi:ne180100](uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  _DWORD *v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  unint64_t v15;
  int v16;

  v5 = *(_DWORD **)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)v5 >= v4)
  {
    v7 = *(_DWORD **)a1;
    v8 = ((uint64_t)v5 - *(_QWORD *)a1) >> 2;
    v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 62)
      std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
    v10 = v4 - (_QWORD)v7;
    if (v10 >> 1 > v9)
      v9 = v10 >> 1;
    v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL;
    v12 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v11)
      v12 = v9;
    if (v12)
    {
      v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v12);
      v7 = *(_DWORD **)a1;
      v5 = *(_DWORD **)(a1 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = (_DWORD *)(v12 + 4 * v8);
    v15 = v12 + 4 * v13;
    *v14 = *a2;
    v6 = v14 + 1;
    while (v5 != v7)
    {
      v16 = *--v5;
      *--v14 = v16;
    }
    *(_QWORD *)a1 = v14;
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = v15;
    if (v7)
      operator delete(v7);
  }
  else
  {
    *v5 = *a2;
    v6 = v5 + 1;
  }
  *(_QWORD *)(a1 + 8) = v6;
}

uint64_t std::shared_ptr<std::vector<float>>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

uint64_t *std::unordered_set<float>::unordered_set<std::__wrap_iter<float *>>(uint64_t *a1, float *a2, float *a3)
{
  float *v5;
  unint64_t v6;
  uint64_t v7;
  float **v8;
  float v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  float **v13;
  float *i;
  unint64_t v15;
  float *v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  int8x8_t prime;
  void *v23;
  void *v24;
  uint64_t v25;
  float *v26;
  unint64_t v27;
  uint8x8_t v28;
  unint64_t v29;
  uint8x8_t v30;
  uint64_t v31;
  float *v32;
  unint64_t v33;
  uint64_t v34;
  float **v35;
  unint64_t v36;
  void *v37;

  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_DWORD *)a1 + 8) = 1065353216;
  if (a2 != a3)
  {
    v5 = a2;
    v6 = 0;
    v7 = 0;
    v8 = (float **)(a1 + 2);
    while (1)
    {
      v9 = *v5;
      v10 = *v5 == 0.0 ? 0 : *(unsigned int *)v5;
      if (v6)
      {
        v11 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
        v11.i16[0] = vaddlv_u8(v11);
        if (v11.u32[0] > 1uLL)
        {
          v12 = v10;
          if (v10 >= v6)
            v12 = v10 % v6;
        }
        else
        {
          v12 = v10 & (v6 + 0xFFFFFFFF);
        }
        v13 = *(float ***)(*a1 + 8 * v12);
        if (v13)
        {
          for (i = *v13; i; i = *(float **)i)
          {
            v15 = *((_QWORD *)i + 1);
            if (v15 == v10)
            {
              if (i[4] == v9)
                goto LABEL_79;
            }
            else
            {
              if (v11.u32[0] > 1uLL)
              {
                if (v15 >= v6)
                  v15 %= v6;
              }
              else
              {
                v15 &= v6 - 1;
              }
              if (v15 != v12)
                break;
            }
          }
        }
      }
      else
      {
        v12 = 0;
      }
      v16 = (float *)operator new(0x18uLL);
      *(_QWORD *)v16 = 0;
      *((_QWORD *)v16 + 1) = v10;
      v16[4] = v9;
      v17 = (float)(unint64_t)(v7 + 1);
      v18 = *((float *)a1 + 8);
      if (!v6 || (float)(v18 * (float)v6) < v17)
        break;
LABEL_69:
      v34 = *a1;
      v35 = *(float ***)(*a1 + 8 * v12);
      if (v35)
      {
        *(_QWORD *)v16 = *v35;
      }
      else
      {
        *(_QWORD *)v16 = *v8;
        *v8 = v16;
        *(_QWORD *)(v34 + 8 * v12) = v8;
        if (!*(_QWORD *)v16)
          goto LABEL_78;
        v36 = *(_QWORD *)(*(_QWORD *)v16 + 8);
        if ((v6 & (v6 - 1)) != 0)
        {
          if (v36 >= v6)
            v36 %= v6;
        }
        else
        {
          v36 &= v6 - 1;
        }
        v35 = (float **)(*a1 + 8 * v36);
      }
      *v35 = v16;
LABEL_78:
      v7 = a1[3] + 1;
      a1[3] = v7;
LABEL_79:
      if (++v5 == a3)
        return a1;
    }
    v19 = (v6 & (v6 - 1)) != 0;
    if (v6 < 3)
      v19 = 1;
    v20 = v19 | (2 * v6);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      prime = (int8x8_t)v21;
    else
      prime = (int8x8_t)v20;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v6 = a1[1];
    }
    if (*(_QWORD *)&prime > v6)
      goto LABEL_35;
    if (*(_QWORD *)&prime < v6)
    {
      v29 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v6 < 3 || (v30 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        v29 = std::__next_prime(v29);
      }
      else
      {
        v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2)
          v29 = v31;
      }
      if (*(_QWORD *)&prime <= v29)
        prime = (int8x8_t)v29;
      if (*(_QWORD *)&prime >= v6)
      {
        v6 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_35:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v23 = operator new(8 * *(_QWORD *)&prime);
          v24 = (void *)*a1;
          *a1 = (uint64_t)v23;
          if (v24)
            operator delete(v24);
          v25 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(_QWORD *)(*a1 + 8 * v25++) = 0;
          while (*(_QWORD *)&prime != v25);
          v26 = *v8;
          if (*v8)
          {
            v27 = *((_QWORD *)v26 + 1);
            v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(_QWORD *)&prime)
                v27 %= *(_QWORD *)&prime;
            }
            else
            {
              v27 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*a1 + 8 * v27) = v8;
            v32 = *(float **)v26;
            if (*(_QWORD *)v26)
            {
              do
              {
                v33 = *((_QWORD *)v32 + 1);
                if (v28.u32[0] > 1uLL)
                {
                  if (v33 >= *(_QWORD *)&prime)
                    v33 %= *(_QWORD *)&prime;
                }
                else
                {
                  v33 &= *(_QWORD *)&prime - 1;
                }
                if (v33 != v27)
                {
                  if (!*(_QWORD *)(*a1 + 8 * v33))
                  {
                    *(_QWORD *)(*a1 + 8 * v33) = v26;
                    goto LABEL_60;
                  }
                  *(_QWORD *)v26 = *(_QWORD *)v32;
                  *(_QWORD *)v32 = **(_QWORD **)(*a1 + 8 * v33);
                  **(_QWORD **)(*a1 + 8 * v33) = v32;
                  v32 = v26;
                }
                v33 = v27;
LABEL_60:
                v26 = v32;
                v32 = *(float **)v32;
                v27 = v33;
              }
              while (v32);
            }
          }
          v6 = (unint64_t)prime;
          goto LABEL_64;
        }
        v37 = (void *)*a1;
        *a1 = 0;
        if (v37)
          operator delete(v37);
        v6 = 0;
        a1[1] = 0;
      }
    }
LABEL_64:
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v10 >= v6)
        v12 = v10 % v6;
      else
        v12 = v10;
    }
    else
    {
      v12 = ((_DWORD)v6 - 1) & v10;
    }
    goto LABEL_69;
  }
  return a1;
}

void sub_1C3984660(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  operator delete(v2);
  std::__hash_table<PPSubscoreIdentifier,std::hash<PPSubscoreIdentifier>,std::equal_to<PPSubscoreIdentifier>,std::allocator<PPSubscoreIdentifier>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PPScoreInterpreterValue>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a1);
}

uint64_t *std::vector<PPScoreInterpreterValue>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
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

  v3 = *result;
  v2 = result[1];
  v4 = a2[1];
  if (v2 != *result)
  {
    do
    {
      v6 = *(_QWORD *)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      v7 = *(_QWORD *)(v2 - 24);
      v2 -= 24;
      *(_BYTE *)(v4 + 16) = 3;
      *(_QWORD *)v4 = v7;
      *(_QWORD *)v2 = v5;
      v8 = *(_QWORD *)(v4 + 8);
      *(_QWORD *)(v4 + 8) = *(_QWORD *)(v2 + 8);
      *(_QWORD *)(v2 + 8) = v8;
      *(_BYTE *)(v4 + 16) = *(_BYTE *)(v2 + 16);
      *(_BYTE *)(v2 + 16) = 3;
    }
    while (v2 != v3);
  }
  a2[1] = v4;
  v9 = *result;
  *result = v4;
  a2[1] = v9;
  v10 = result[1];
  result[1] = a2[2];
  a2[2] = v10;
  v11 = result[2];
  result[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<PPScoreInterpreterValue>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 24;
    PPScoreInterpreterValue::~PPScoreInterpreterValue((PPScoreInterpreterValue *)(i - 24));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__shared_ptr_emplace<std::vector<float>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E7E17F30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<float>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E7E17F30;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1C3BD627CLL);
}

void std::__shared_ptr_emplace<std::vector<float>>::__on_zero_shared(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

void sub_1C3984A68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C3984B28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C3984B9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C3985154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C398655C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2603(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2604(uint64_t a1)
{

}

void sub_1C3987410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C39882C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_1C3988598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39888E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1C3988A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1C3988B78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C3988C2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C3989060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  uint64_t v60;

  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose((const void *)(v60 - 232), 8);
  _Block_object_dispose((const void *)(v60 - 184), 8);
  _Block_object_dispose((const void *)(v60 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1C3989374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39895B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1C39896D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1C3989814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C3989958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2706(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2707(uint64_t a1)
{

}

void sub_1C398D160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C398DBBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1C398DDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C398DF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id defaultRTRoutineManager()
{
  void *v0;
  id v1;
  SEL v2;
  void *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v0 = (void *)getRTRoutineManagerClass_softClass;
  v10 = getRTRoutineManagerClass_softClass;
  if (!getRTRoutineManagerClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getRTRoutineManagerClass_block_invoke;
    v6[3] = &unk_1E7E1F798;
    v6[4] = &v7;
    __getRTRoutineManagerClass_block_invoke((uint64_t)v6);
    v0 = (void *)v8[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v7, 8);
  if (v1)
  {
    v2 = NSSelectorFromString(CFSTR("defaultManager"));
    ((void (*)(id, SEL))objc_msgSend(v1, "methodForSelector:", v2))(v1, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "Failed to dlopen CoreRoutine.", (uint8_t *)v6, 2u);
    }

    v3 = 0;
  }
  return v3;
}

void sub_1C398E078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2860(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2861(uint64_t a1)
{

}

Class __getRTRoutineManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreRoutineLibraryCore_frameworkLibrary)
    CoreRoutineLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreRoutineLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreRoutineLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPRoutineSupport.m"), 40, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("RTRoutineManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getRTRoutineManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPRoutineSupport.m"), 41, CFSTR("Unable to find class %s"), "RTRoutineManager");

LABEL_8:
    __break(1u);
  }
  getRTRoutineManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C398FDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  uint64_t v10;

  objc_destroyWeak(v9);
  objc_destroyWeak((id *)(v10 - 144));
  _Unwind_Resume(a1);
}

void sub_1C3990028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3990368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3990430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39904F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3990790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3990984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3990A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39915AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3032(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3033(uint64_t a1)
{

}

void sub_1C3992140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3992FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39937B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t offsetFromAppendingData(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  while ((objc_msgSend(v3, "length") & 0x1F) != 0)
    objc_msgSend(v3, "appendBytes:length:", "", 1);
  v5 = objc_msgSend(v3, "length");
  objc_msgSend(v3, "appendData:", v4);

  return v5;
}

void sub_1C39968EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C39982EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int16 a11, uint64_t a12, __int16 buf)
{
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(exception_object);
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)*MEMORY[0x1E0C99778];

    if (v16 == v17)
    {
      pp_events_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        buf = 0;
        _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "Corrupted persistent logging store! Removing corrupted store.", (uint8_t *)&buf, 2u);
      }

      v19 = objc_msgSend(MEMORY[0x1E0D70D00], "isInternalDevice");
      v20 = *(void **)(v14 + 1568);
      if (v19)
      {
        objc_msgSend(v20, "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", CFSTR(".old"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "moveItemAtPath:toPath:error:", v13, v22, 0);

      }
      else
      {
        objc_msgSend(v20, "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeItemAtPath:error:", v13, 0);
      }

      objc_end_catch();
      JUMPOUT(0x1C3998278);
    }
    pp_events_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      a11 = 0;
      _os_log_debug_impl(&dword_1C392E000, v23, OS_LOG_TYPE_DEBUG, "Exception we're not catching", (uint8_t *)&a11, 2u);
    }

    objc_exception_throw(objc_retainAutorelease(v15));
  }
  _Unwind_Resume(exception_object);
}

uint64_t PPM2AttributedFeedbackReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  void *v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 68) |= 8u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_69;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_71;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_69:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_71:
          v53 = 56;
          goto LABEL_88;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 68) |= 1u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_75;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_75:
          v53 = 16;
          goto LABEL_88;
        case 3u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 68) |= 4u;
          while (2)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
              *(_QWORD *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_79;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_79:
          v53 = 32;
          goto LABEL_88;
        case 4u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = 8;
          goto LABEL_60;
        case 5u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = 24;
          goto LABEL_60;
        case 6u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = 48;
          goto LABEL_60;
        case 7u:
          v36 = 0;
          v37 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 68) |= 0x10u;
          while (2)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v14 = v37++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_83:
          v53 = 60;
          goto LABEL_88;
        case 8u:
          v41 = 0;
          v42 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 68) |= 2u;
          while (2)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
              *(_QWORD *)(a2 + v43) = v44 + 1;
              v19 |= (unint64_t)(v45 & 0x7F) << v41;
              if (v45 < 0)
              {
                v41 += 7;
                v14 = v42++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_87:
          v53 = 20;
LABEL_88:
          *(_DWORD *)(a1 + v53) = v19;
          continue;
        case 9u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = 40;
LABEL_60:
          v46 = *(void **)(a1 + v35);
          *(_QWORD *)(a1 + v35) = v34;

          continue;
        case 0xAu:
          v47 = 0;
          v48 = 0;
          v49 = 0;
          *(_BYTE *)(a1 + 68) |= 0x20u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v50 = *v3;
        v51 = *(_QWORD *)(a2 + v50);
        if (v51 == -1 || v51 >= *(_QWORD *)(a2 + *v4))
          break;
        v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v51);
        *(_QWORD *)(a2 + v50) = v51 + 1;
        v49 |= (unint64_t)(v52 & 0x7F) << v47;
        if ((v52 & 0x80) == 0)
          goto LABEL_92;
        v47 += 7;
        v14 = v48++ >= 9;
        if (v14)
        {
          v49 = 0;
          goto LABEL_94;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_92:
      if (*(_BYTE *)(a2 + *v5))
        v49 = 0;
LABEL_94:
      *(_BYTE *)(a1 + 64) = v49 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PPPBLabeledSocialProfileReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_24;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_24;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_24;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_24:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_25:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void PPScoreInterpreterValue::PPScoreInterpreterValue(PPScoreInterpreterValue *this, double a2)
{
  *(double *)this = a2;
  *((_BYTE *)this + 16) = 0;
}

{
  *(double *)this = a2;
  *((_BYTE *)this + 16) = 0;
}

_QWORD *std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>(_QWORD *a1, const void *a2, uint64_t a3)
{
  char *v6;
  _QWORD *result;

  v6 = (char *)operator new(0x30uLL);
  *(_OWORD *)(v6 + 8) = 0u;
  *(_QWORD *)v6 = &off_1E7E17F30;
  *((_QWORD *)v6 + 3) = 0;
  *((_OWORD *)v6 + 2) = 0u;
  result = std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>((_QWORD *)v6 + 3, a2, a3, (a3 - (uint64_t)a2) >> 2);
  *a1 = v6 + 24;
  a1[1] = v6;
  return result;
}

void sub_1C399BFD8(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t PPScoreInterpreterValue::PPScoreInterpreterValue(uint64_t a1, void *a2)
{
  char *v3;
  char *v5[3];

  arrayToFloatVector(v5, a2);
  v3 = v5[0];
  std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>((_QWORD *)a1, v5[0], (uint64_t)v5[1]);
  *(_BYTE *)(a1 + 16) = 1;
  if (v3)
    operator delete(v3);
  return a1;
}

{
  char *v3;
  char *v5[3];

  arrayToFloatVector(v5, a2);
  v3 = v5[0];
  std::allocate_shared[abi:ne180100]<std::vector<float>,std::allocator<std::vector<float>>,std::vector<float> const&,void>((_QWORD *)a1, v5[0], (uint64_t)v5[1]);
  *(_BYTE *)(a1 + 16) = 1;
  if (v3)
    operator delete(v3);
  return a1;
}

void sub_1C399C044(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void arrayToFloatVector(char **a1, void *a2)
{
  id v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t i;
  int v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  int v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  v22 = v3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    if (v4 >> 62)
      std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
    v5 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v4);
    v7 = &v5[4 * v6];
    *a1 = v5;
    a1[1] = v5;
    a1[2] = v7;
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v22;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    v11 = v5;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "floatValue");
        v14 = v13;
        if (v11 >= v7)
        {
          v15 = (v11 - v5) >> 2;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 62)
            std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
          if ((v7 - v5) >> 1 > v16)
            v16 = (v7 - v5) >> 1;
          if ((unint64_t)(v7 - v5) >= 0x7FFFFFFFFFFFFFFCLL)
            v17 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v17 = v16;
          if (v17)
            v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v17);
          else
            v18 = 0;
          v19 = (char *)(v17 + 4 * v15);
          *(_DWORD *)v19 = v14;
          v20 = v19 + 4;
          while (v11 != v5)
          {
            v21 = *((_DWORD *)v11 - 1);
            v11 -= 4;
            *((_DWORD *)v19 - 1) = v21;
            v19 -= 4;
          }
          v7 = (char *)(v17 + 4 * v18);
          *a1 = v19;
          a1[1] = v20;
          a1[2] = v7;
          if (v5)
            operator delete(v5);
          v5 = v19;
          v11 = v20;
        }
        else
        {
          *(_DWORD *)v11 = v13;
          v11 += 4;
        }
        a1[1] = v11;
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

}

void sub_1C399C254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v10;
  void *v11;
  void *v13;

  v13 = *(void **)v10;
  if (*(_QWORD *)v10)
  {
    *(_QWORD *)(v10 + 8) = v13;
    operator delete(v13);
  }

  _Unwind_Resume(a1);
}

void sub_1C399C2F0(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void PPScoreInterpreterValue::PPScoreInterpreterValue(PPScoreInterpreterValue *this, NSObject *a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  v4 = v3;
  *((_BYTE *)this + 16) = 2;
  if (v3)
    v5 = v3;
  *(_QWORD *)this = v4;

}

void PPScoreInterpreterValue::PPScoreInterpreterValue(PPScoreInterpreterValue *this)
{
  *((_BYTE *)this + 16) = 3;
}

{
  *((_BYTE *)this + 16) = 3;
}

void PPScoreInterpreterValue::PPScoreInterpreterValue(PPScoreInterpreterValue *this, const PPScoreInterpreterValue *a2)
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  const void *v9;

  v3 = *((unsigned __int8 *)a2 + 16);
  *((_BYTE *)this + 16) = v3;
  switch(v3)
  {
    case 0:
      *(_QWORD *)this = *(_QWORD *)a2;
      break;
    case 1:
      v6 = *((_QWORD *)a2 + 1);
      *(_QWORD *)this = *(_QWORD *)a2;
      *((_QWORD *)this + 1) = v6;
      if (v6)
      {
        v7 = (unint64_t *)(v6 + 8);
        do
          v8 = __ldxr(v7);
        while (__stxr(v8 + 1, v7));
      }
      break;
    case 2:
      v9 = *(const void **)a2;
      if (*(_QWORD *)a2)
      {
        *(_QWORD *)this = v9;
        CFRetain(v9);
      }
      else
      {
        *(_QWORD *)this = 0;
      }
      break;
    case 3:
      return;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PPScoreInterpreterValue::PPScoreInterpreterValue(const PPScoreInterpreterValue &)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPScoreInterpreterValue.mm"), 87, CFSTR("Invalid valueType of %d in copy constructor"), *((unsigned __int8 *)this + 16));

      break;
  }
}

uint64_t *swap(uint64_t *result, PPScoreInterpreterValue *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *result;
  *result = *(_QWORD *)a2;
  *(_QWORD *)a2 = v2;
  v3 = result[1];
  result[1] = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  LOBYTE(v3) = *((_BYTE *)result + 16);
  *((_BYTE *)result + 16) = *((_BYTE *)a2 + 16);
  *((_BYTE *)a2 + 16) = v3;
  return result;
}

uint64_t *PPScoreInterpreterValue::PPScoreInterpreterValue(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  *((_BYTE *)result + 16) = 3;
  v2 = *result;
  *result = *a2;
  *a2 = v2;
  v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  *((_BYTE *)result + 16) = *((_BYTE *)a2 + 16);
  *((_BYTE *)a2 + 16) = 3;
  return result;
}

{
  uint64_t v2;
  uint64_t v3;

  *((_BYTE *)result + 16) = 3;
  v2 = *result;
  *result = *a2;
  *a2 = v2;
  v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  *((_BYTE *)result + 16) = *((_BYTE *)a2 + 16);
  *((_BYTE *)a2 + 16) = 3;
  return result;
}

uint64_t *PPScoreInterpreterValue::operator=(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *result;
  *result = *a2;
  *a2 = v2;
  v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  LOBYTE(v3) = *((_BYTE *)result + 16);
  *((_BYTE *)result + 16) = *((_BYTE *)a2 + 16);
  *((_BYTE *)a2 + 16) = v3;
  return result;
}

void PPScoreInterpreterValue::~PPScoreInterpreterValue(PPScoreInterpreterValue *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  void *v5;
  void *v6;
  const void *v7;

  switch(*((_BYTE *)this + 16))
  {
    case 0:
    case 3:
      return;
    case 1:
      v2 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
      *(_QWORD *)this = 0;
      *((_QWORD *)this + 1) = 0;
      if (v2)
      {
        p_shared_owners = (unint64_t *)&v2->__shared_owners_;
        do
          v4 = __ldaxr(p_shared_owners);
        while (__stlxr(v4 - 1, p_shared_owners));
        if (!v4)
        {
          ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
          std::__shared_weak_count::__release_weak(v2);
        }
      }
      break;
    case 2:
      v7 = *(const void **)this;
      if (*(_QWORD *)this)
        CFRelease(v7);
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PPScoreInterpreterValue::~PPScoreInterpreterValue()");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PPScoreInterpreterValue.mm"), 124, CFSTR("Invalid PPScoreInterpreterValueType of %d in destructor"), *((unsigned __int8 *)this + 16));

      break;
  }
}

double PPScoreInterpreterValue::getDouble(PPScoreInterpreterValue *this)
{
  void *v2;
  void *v3;

  if (*((_BYTE *)this + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "double PPScoreInterpreterValue::getDouble() const");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPScoreInterpreterValue.mm"), 131, CFSTR("Invalid valueType of %d in getDouble"), *((unsigned __int8 *)this + 16));

  }
  return *(double *)this;
}

void sub_1C399C6EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void PPScoreInterpreterValue::getFloatVector(PPScoreInterpreterValue *this@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  if (*((_BYTE *)this + 16) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "std::shared_ptr<std::vector<float>> PPScoreInterpreterValue::getFloatVector() const");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPScoreInterpreterValue.mm"), 138, CFSTR("Invalid valueType of %d in getFloatVector"), *((unsigned __int8 *)this + 16));

  }
  v6 = *((_QWORD *)this + 1);
  *a2 = *(_QWORD *)this;
  a2[1] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
}

void sub_1C399C7C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id PPScoreInterpreterValue::getNumericArray(PPScoreInterpreterValue *this)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  double v6;
  _DWORD *v7;
  _DWORD *v8;
  void *v9;
  void *v10;

  if (*((_BYTE *)this + 16) != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray<NSNumber *> *PPScoreInterpreterValue::getNumericArray() const");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPScoreInterpreterValue.mm"), 145, CFSTR("Invalid valueType of %d in getNumericArray"), *((unsigned __int8 *)this + 16));

  }
  v4 = *(_QWORD **)this;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", (uint64_t)(v4[1] - *v4) >> 2);
  v7 = (_DWORD *)*v4;
  v8 = (_DWORD *)v4[1];
  if ((_DWORD *)*v4 != v8)
  {
    do
    {
      LODWORD(v6) = *v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

      ++v7;
    }
    while (v7 != v8);
  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

void sub_1C399C8F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id PPScoreInterpreterValue::getObject(PPScoreInterpreterValue *this)
{
  void *v2;
  void *v3;

  if (*((_BYTE *)this + 16) != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSObject *PPScoreInterpreterValue::getObject() const");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPScoreInterpreterValue.mm"), 152, CFSTR("Invalid valueType of %d in getObject"), *((unsigned __int8 *)this + 16));

  }
  return *(id *)this;
}

void sub_1C399C9BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C399CD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3940(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3941(uint64_t a1)
{

}

void sub_1C39A0024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4070(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4071(uint64_t a1)
{

}

void sub_1C39A12C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4224(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4225(uint64_t a1)
{

}

uint64_t PPPBMusicDataCollectionRecordReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 68) |= 0x10u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_53;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_55;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_55:
          v46 = 64;
          goto LABEL_64;
        case 2u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 32;
          goto LABEL_37;
        case 3u:
          *(_BYTE *)(a1 + 68) |= 2u;
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v30 = 0;
          }
          v47 = 16;
          goto LABEL_69;
        case 4u:
          *(_BYTE *)(a1 + 68) |= 1u;
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 <= 0xFFFFFFFFFFFFFFF7 && v32 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v30 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v30 = 0;
          }
          v47 = 8;
LABEL_69:
          *(_QWORD *)(a1 + v47) = v30;
          continue;
        case 5u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 56;
          goto LABEL_37;
        case 6u:
          PBReaderReadString();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 40;
LABEL_37:
          v33 = *(void **)(a1 + v27);
          *(_QWORD *)(a1 + v27) = v26;

          continue;
        case 7u:
          v34 = 0;
          v35 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 68) |= 8u;
          while (2)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
              *(_QWORD *)(a2 + v36) = v38;
              v20 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                v15 = v35++ >= 9;
                if (v15)
                {
                  LODWORD(v20) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_59:
          v46 = 48;
          goto LABEL_64;
        case 8u:
          v40 = 0;
          v41 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 68) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v42 = *v3;
        v43 = *(_QWORD *)(a2 + v42);
        v44 = v43 + 1;
        if (v43 == -1 || v44 > *(_QWORD *)(a2 + *v4))
          break;
        v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v43);
        *(_QWORD *)(a2 + v42) = v44;
        v20 |= (unint64_t)(v45 & 0x7F) << v40;
        if ((v45 & 0x80) == 0)
          goto LABEL_61;
        v40 += 7;
        v15 = v41++ >= 9;
        if (v15)
        {
          LODWORD(v20) = 0;
          goto LABEL_63;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_61:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v20) = 0;
LABEL_63:
      v46 = 24;
LABEL_64:
      *(_DWORD *)(a1 + v46) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C39A4850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C39A4A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39A4AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39A5194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1C39A55C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1C39A5958(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1C39A6514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1C39A6E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39A6F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39A70C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39A71F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39A734C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39A74B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4580(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4581(uint64_t a1)
{

}

void sub_1C39A8AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39AA4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39AA95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39AB7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t PPPBFeedbackLogReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  PPPBFeedbackMetadata *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(PPPBFeedbackMetadata);
        objc_storeStrong((id *)(a1 + 32), v17);
        if (PBReaderPlaceMark() && (PPPBFeedbackMetadataReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_39;
        goto LABEL_49;
      case 2u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 64) |= 1u;
        while (2)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v21) = 0;
LABEL_46:
        *(_DWORD *)(a1 + 48) = v21;
        goto LABEL_47;
      case 3u:
        v17 = objc_alloc_init(PPPBScoredItemWithFeatures);
        objc_msgSend((id)a1, "addScoredItems:", v17);
        if (!PBReaderPlaceMark() || (PPPBScoredItemWithFeaturesReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_49;
        goto LABEL_39;
      case 4u:
        v17 = objc_alloc_init(PPPBExtractedDonationRecord);
        objc_msgSend((id)a1, "addExtractedDonations:", v17);
        if (!PBReaderPlaceMark() || (PPPBExtractedDonationRecordReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_49;
        goto LABEL_39;
      case 5u:
        v17 = objc_alloc_init(PPPBExperimentalGroup);
        objc_msgSend((id)a1, "addExperimentalGroups:", v17);
        if (PBReaderPlaceMark() && PPPBExperimentalGroupReadFrom((uint64_t)v17, a2))
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_47:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_49:

        return 0;
      case 6u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 40;
        goto LABEL_42;
      case 7u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 8;
LABEL_42:
        v27 = *(void **)(a1 + v26);
        *(_QWORD *)(a1 + v26) = v25;

        goto LABEL_47;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_47;
    }
  }
}

void sub_1C39AF914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5136(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5137(uint64_t a1)
{

}

void sub_1C39B1120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39B2400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5271(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5272(uint64_t a1)
{

}

void sub_1C39B3594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1C39B3B3C(_Unwind_Exception *a1, int a2)
{
  uint64_t v2;
  id v3;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(a1);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 - 120) + 80) + 8) + 40), v3);
    objc_end_catch();
    JUMPOUT(0x1C39B3AACLL);
  }
  _Unwind_Resume(a1);
}

void sub_1C39B4630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C39B4C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  uint64_t v43;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose((const void *)(v43 - 240), 8);
  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1C39B66B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a67;
  char a71;

  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_1C39B706C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1C39B7180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39BA378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;

  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_1C39BA69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1C39BAD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5387(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5388(uint64_t a1)
{

}

void sub_1C39BC2E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PPPBScoredItemWithFeaturesReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  PPPBFeatureIdFeatureValuePair *v31;
  void *v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 52) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_41;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_43:
        *(_QWORD *)(a1 + 8) = v20;
        goto LABEL_46;
      case 2u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 32;
        goto LABEL_39;
      case 3u:
        *(_BYTE *)(a1 + 52) |= 2u;
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        *(_DWORD *)(a1 + 48) = v30;
        goto LABEL_46;
      case 4u:
        v31 = objc_alloc_init(PPPBFeatureIdFeatureValuePair);
        objc_msgSend((id)a1, "addFeatures:", v31);
        if (!PBReaderPlaceMark() || (PPPBFeatureIdFeatureValuePairReadFrom((uint64_t)v31, a2) & 1) == 0)
          goto LABEL_48;
        goto LABEL_37;
      case 5u:
        v31 = objc_alloc_init(PPPBFeedbackItem);
        objc_msgSend((id)a1, "addFeedbackItems:", v31);
        if (PBReaderPlaceMark() && (PPPBFeedbackItemReadFrom((uint64_t)v31, a2) & 1) != 0)
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_46:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_48:

        return 0;
      case 6u:
        PBReaderReadString();
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = 40;
LABEL_39:
        v32 = *(void **)(a1 + v27);
        *(_QWORD *)(a1 + v27) = v26;

        goto LABEL_46;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_46;
    }
  }
}

void sub_1C39BEECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5668(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5669(uint64_t a1)
{

}

void sub_1C39BFDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39BFEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5901(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5902(uint64_t a1)
{

}

void sub_1C39C4080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_1C39C4318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C39C46AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5968(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5969(uint64_t a1)
{

}

id mergeDeduping(void *a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;

  v3 = a2;
  v4 = a1;
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v3, "count");
  sortedEvents(v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  sortedEvents(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v22 = v7;
LABEL_25:
    v19 = (void *)objc_msgSend(v22, "mutableCopy");
    goto LABEL_28;
  }
  if (!v6)
  {
    v22 = v25;
    goto LABEL_25;
  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v25, "count"));
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  do
  {
    v13 = v10;
    v14 = v9;
    objc_msgSend(v25, "objectAtIndexedSubscript:", v12, v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (eventCompare(v10, v9) == -1)
    {
      if ((isDupe(v10, v8) & 1) == 0)
      {
        objc_msgSend(v24, "addObject:", v10);
        v16 = v10;

        v8 = v16;
      }
      ++v12;
    }
    else
    {
      if ((isDupe(v9, v8) & 1) == 0)
      {
        objc_msgSend(v24, "addObject:", v9);
        v15 = v9;

        v8 = v15;
      }
      ++v11;
    }
  }
  while (v12 < v5 && v11 < v6);
  if (v12 < v5)
  {
    do
    {
      v17 = v10;
      objc_msgSend(v25, "objectAtIndexedSubscript:", v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((isDupe(v10, v8) & 1) == 0)
      {
        objc_msgSend(v24, "addObject:", v10);
        v18 = v10;

        v8 = v18;
      }
      ++v12;
    }
    while (v5 != v12);
  }
  if (v11 >= v6)
  {
    v19 = v24;
  }
  else
  {
    v19 = v24;
    do
    {
      v20 = v9;
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if ((isDupe(v9, v8) & 1) == 0)
      {
        objc_msgSend(v24, "addObject:", v9);
        v21 = v9;

        v8 = v21;
      }
      ++v11;
    }
    while (v6 != v11);
  }

LABEL_28:
  return v19;
}

void sub_1C39C5200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sortedEvents(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "count") >= 2)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (v5)
          {
            if (eventCompare(v5, v8) == 1)
            {
              v9 = (void *)MEMORY[0x1C3BD6630](1);
              objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_103, (_QWORD)v12);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_autoreleasePoolPop(v9);

              goto LABEL_17;
            }
          }
          else
          {
            v5 = v8;
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }

  }
  v10 = (void *)objc_msgSend(v1, "copy", (_QWORD)v12);
LABEL_17:

  return v10;
}

uint64_t eventCompare(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "compareStartDateWithEvent:", v4);
  if (!v5)
  {
    objc_msgSend(v3, "eventIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "compare:", v7);

  }
  return v5;
}

uint64_t isDupe(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      objc_msgSend(v5, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __sortedEvents_block_invoke(uint64_t a1, void *a2, void *a3)
{
  return eventCompare(a2, a3);
}

uint64_t PPPBMusicDataCollectionArrayReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  PPPBMusicDataCollectionRecord *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;
  uint64_t v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(PPPBMusicDataCollectionRecord);
        objc_msgSend((id)a1, "addRecords:", v17);
        if (PBReaderPlaceMark() && (PPPBMusicDataCollectionRecordReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_33;
        goto LABEL_41;
      case 2u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 36) |= 1u;
        while (2)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if (v23 < 0)
            {
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                v20 = 0;
                goto LABEL_38;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_38:
        *(_BYTE *)(a1 + 32) = v20 != 0;
        goto LABEL_39;
      case 5u:
        v17 = objc_alloc_init(PPPBExperimentalGroup);
        objc_msgSend((id)a1, "addExperimentalGroups:", v17);
        if (PBReaderPlaceMark() && PPPBExperimentalGroupReadFrom((uint64_t)v17, a2))
        {
LABEL_33:
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_41:

        return 0;
      case 7u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

        goto LABEL_39;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

void sub_1C39C81A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6178(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6179(uint64_t a1)
{

}

void sub_1C39CA460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6301(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6302(uint64_t a1)
{

}

void sub_1C39D9284(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C39D993C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PPPBContactNameRecordReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  void *v37;
  PPPBContactRelatedName *v38;
  uint64_t v39;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
        goto LABEL_49;
      case 2u:
        *(_BYTE *)(a1 + 144) |= 1u;
        v21 = *v3;
        v22 = *(_QWORD *)(a2 + v21);
        if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v23 = 0;
        }
        *(_QWORD *)(a1 + 8) = v23;
        goto LABEL_69;
      case 3u:
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 144) |= 4u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
            *(_QWORD *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              v15 = v25++ >= 9;
              if (v15)
              {
                LOBYTE(v26) = 0;
                goto LABEL_61;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LOBYTE(v26) = 0;
LABEL_61:
        v39 = 120;
        goto LABEL_66;
      case 4u:
        v31 = 0;
        v32 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 144) |= 2u;
        while (2)
        {
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v35;
            v26 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v15 = v32++ >= 9;
              if (v15)
              {
                LOBYTE(v26) = 0;
                goto LABEL_65;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LOBYTE(v26) = 0;
LABEL_65:
        v39 = 16;
LABEL_66:
        *(_BYTE *)(a1 + v39) = v26;
        goto LABEL_69;
      case 5u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 128;
        goto LABEL_49;
      case 6u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
        goto LABEL_49;
      case 7u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 88;
        goto LABEL_49;
      case 8u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 64;
        goto LABEL_49;
      case 9u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 104;
        goto LABEL_49;
      case 0xAu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 56;
        goto LABEL_49;
      case 0xBu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 96;
        goto LABEL_49;
      case 0xCu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 80;
        goto LABEL_49;
      case 0xDu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 48;
        goto LABEL_49;
      case 0xEu:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 72;
LABEL_49:
        v37 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_69;
      case 0xFu:
        v38 = objc_alloc_init(PPPBContactRelatedName);
        objc_msgSend((id)a1, "addRelatedNames:", v38);
        if (PBReaderPlaceMark() && PPPBContactRelatedNameReadFrom((uint64_t)v38, a2))
        {
          PBReaderRecallMark();
LABEL_57:

LABEL_69:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 0x10u:
        PBReaderReadString();
        v38 = (PPPBContactRelatedName *)objc_claimAutoreleasedReturnValue();
        if (v38)
          objc_msgSend((id)a1, "addStreetNames:", v38);
        goto LABEL_57;
      case 0x11u:
        PBReaderReadString();
        v38 = (PPPBContactRelatedName *)objc_claimAutoreleasedReturnValue();
        if (v38)
          objc_msgSend((id)a1, "addCityNames:", v38);
        goto LABEL_57;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_69;
    }
  }
}

void sub_1C39DC550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C39DC6D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  va_list va;

  va_start(va, a3);

  std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C39DC9D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, char a11)
{
  std::__shared_weak_count *v11;
  void **v12;
  void *v14;
  void *v15;

  v14 = *v12;
  if (*v12)
  {
    v11[1].__shared_owners_ = (uint64_t)v14;
    operator delete(v14);
  }
  std::__shared_weak_count::~__shared_weak_count(v11);
  operator delete(v15);

  _Unwind_Resume(a1);
}

void sub_1C39DCB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1C39DCC44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C39DCCC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1C39DCE80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C39DD774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1C39DD998(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C39DDA88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C39DDB78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C39DDD78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ***std::unique_ptr<std::vector<std::shared_ptr<std::vector<float>>>>::reset[abi:ne180100](void ***result, void **a2)
{
  void **v2;
  void **v3;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    v3 = v2;
    std::vector<std::shared_ptr<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v3);
    JUMPOUT(0x1C3BD627CLL);
  }
  return result;
}

void std::default_delete<std::vector<float>>::operator()[abi:ne180100](uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1C3BD627CLL);
}

void std::vector<std::shared_ptr<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100](v4 - 16);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1C39DDFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1C39DE250(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);
  std::shared_ptr<std::vector<float>>::~shared_ptr[abi:ne180100]((uint64_t)va);

  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AssistantServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPSettings+AssistantServices.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAFPreferencesClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPSettings+AssistantServices.m"), 19, CFSTR("Unable to find class %s"), "AFPreferences");

LABEL_8:
    __break(1u);
  }
  getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C39E04C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL isNontrivialString(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v1, "length") != 0;

  return v2;
}

uint64_t __Block_byref_object_copy__7237(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7238(uint64_t a1)
{

}

void sub_1C39E1960(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1C39E1BF0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1C39E1FEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t indexForPayload(NSString *a1, const unsigned __int8 *a2, int a3, unsigned int a4)
{
  NSString *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  const void *v11;
  int v12;

  v7 = a1;
  if (-[NSString lengthOfBytesUsingEncoding:](v7, "lengthOfBytesUsingEncoding:", 4) <= a4)
  {
    -[NSString stringByPaddingToLength:withString:startingAtIndex:](v7, "stringByPaddingToLength:withString:startingAtIndex:", a4, CFSTR(" "), 0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "UTF8String");
    if (a3)
    {
      v11 = (const void *)v10;
      v12 = 0;
      v8 = 0;
      while (memcmp(v11, &a2[v12], a4))
      {
        ++v8;
        v12 += a4;
        if (a3 == v8)
          goto LABEL_7;
      }
    }
    else
    {
LABEL_7:
      v8 = 0xFFFFFFFFLL;
    }

  }
  else
  {
    v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

void sub_1C39E25D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C39E267C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1C39E2798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id PPContactLabelScoringMap()
{
  if (PPContactLabelScoringMap__pasOnceToken4 != -1)
    dispatch_once(&PPContactLabelScoringMap__pasOnceToken4, &__block_literal_global_7431);
  return (id)PPContactLabelScoringMap__pasExprOnceResult;
}

__CFString *PPRemovePhoneExtensionAndNonDigits(void *a1)
{
  id v1;
  _BYTE *v2;
  const __CFString *v3;
  __CFString *v4;
  _BYTE *v5;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v9;
  int64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  CFIndex v14;
  UniChar v15;
  int64_t v16;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  CFIndex v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  _OWORD v26[8];
  CFStringRef theString;
  const UniChar *v28;
  const char *v29;
  uint64_t v30;
  CFIndex v31;
  int64_t v32;
  int64_t v33;
  CFRange v34;

  v1 = a1;
  v2 = malloc_type_malloc(objc_msgSend(v1, "length") + 1, 0x53208270uLL);
  v3 = (const __CFString *)v1;
  v4 = (__CFString *)v3;
  v5 = v2;
  if (v3)
  {
    memset(v26, 0, sizeof(v26));
    Length = CFStringGetLength(v3);
    theString = v4;
    v30 = 0;
    v31 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v4);
    CStringPtr = 0;
    v28 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
    v32 = 0;
    v33 = 0;
    v5 = v2;
    v29 = CStringPtr;
    if (Length >= 1)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = 64;
      v5 = v2;
      do
      {
        if ((unint64_t)v10 >= 4)
          v13 = 4;
        else
          v13 = v10;
        v14 = v31;
        if (v31 <= v10)
        {
          v15 = 0;
        }
        else if (v28)
        {
          v15 = v28[v10 + v30];
        }
        else if (v29)
        {
          v15 = v29[v30 + v10];
        }
        else
        {
          v16 = v32;
          if (v33 <= v10 || v32 > v10)
          {
            v18 = v13 + v9;
            v19 = v12 - v13;
            v20 = v10 - v13;
            v21 = v20 + 64;
            if (v20 + 64 >= v31)
              v21 = v31;
            v32 = v20;
            v33 = v21;
            if (v31 >= v19)
              v14 = v19;
            v34.length = v14 + v18;
            v34.location = v20 + v30;
            CFStringGetCharacters(theString, v34, (UniChar *)v26);
            v16 = v32;
          }
          v15 = *((_WORD *)v26 + v10 - v16);
        }
        if (v11)
        {
          v11 = 1;
        }
        else if (v15 - 48 > 9)
        {
          v11 = v15 == 59;
        }
        else
        {
          v11 = 0;
          *v5++ = v15;
        }
        ++v10;
        --v9;
        ++v12;
      }
      while (Length != v10);
    }
  }

  *v5 = 0;
  v22 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v2);
  free(v2);
  if (v22)
    v23 = v22;
  else
    v23 = v4;
  v24 = v23;

  return v24;
}

void PPStringNormalizationTypeCheck(void *a1, _BYTE *a2, _BYTE *a3)
{
  const __CFString *v5;
  __CFString *v6;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFIndex v15;
  UniChar v16;
  int v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFIndex v23;
  _OWORD v24[8];
  CFStringRef theString;
  const UniChar *v26;
  const char *v27;
  uint64_t v28;
  CFIndex v29;
  uint64_t v30;
  uint64_t v31;
  CFRange v32;

  v5 = a1;
  v6 = (__CFString *)v5;
  if (v5)
  {
    memset(v24, 0, sizeof(v24));
    Length = CFStringGetLength(v5);
    theString = v6;
    v28 = 0;
    v29 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v6);
    CStringPtr = 0;
    v26 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
    v30 = 0;
    v31 = 0;
    v27 = CStringPtr;
    if (Length >= 1)
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 64;
      while (1)
      {
        v14 = (unint64_t)v12 >= 4 ? 4 : v12;
        v15 = v29;
        if (v29 <= v12)
        {
          v16 = 0;
        }
        else if (v26)
        {
          v16 = v26[v12 + v28];
        }
        else if (v27)
        {
          v16 = v27[v28 + v12];
        }
        else
        {
          if (v31 <= v12 || v11 > v12)
          {
            v20 = v14 + v10;
            v21 = v13 - v14;
            v22 = v12 - v14;
            v23 = v22 + 64;
            if (v22 + 64 >= v29)
              v23 = v29;
            v30 = v22;
            v31 = v23;
            if (v29 >= v21)
              v15 = v21;
            v32.length = v15 + v20;
            v32.location = v22 + v28;
            CFStringGetCharacters(theString, v32, (UniChar *)v24);
            v11 = v30;
          }
          v16 = *((_WORD *)v24 + v12 - v11);
        }
        v17 = *a3;
        if (!*a3 && v16 - 48 <= 9)
          break;
        v18 = *a2;
        if (!*a2 && v16 == 64)
        {
          v18 = 1;
          *a2 = 1;
          v17 = *a3;
        }
        if (v17)
          goto LABEL_20;
LABEL_21:
        ++v12;
        --v10;
        ++v13;
        if (Length == v12)
          goto LABEL_35;
      }
      *a3 = 1;
      v18 = *a2;
LABEL_20:
      if (v18)
        goto LABEL_35;
      goto LABEL_21;
    }
  }
LABEL_35:

}

id PPNormalizePhoneNumber(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  const void *v8;
  void *String;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v7 = CFPhoneNumberCreate();
  if (v7)
  {
    v8 = (const void *)v7;
    String = (void *)CFPhoneNumberCreateString();
    CFRelease(v8);
  }
  else
  {
    PPRemovePhoneExtensionAndNonDigits(v1);
    String = (void *)objc_claimAutoreleasedReturnValue();
  }

  return String;
}

id PPNormalizeEmailAddress(void *a1)
{
  void *v2;
  void *v3;
  const __CFCharacterSet *Predefined;
  id v5;
  uint64_t v6;
  _WORD *v7;
  _WORD *v8;
  const __CFString *v9;
  __CFString *v10;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  UniChar v20;
  int64_t v21;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  CFIndex v26;
  id v27;
  void *v28;
  id v30;
  __CFString *v31;
  UniChar buffer[8];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CFStringRef theString;
  const UniChar *v41;
  const char *v42;
  uint64_t v43;
  CFIndex v44;
  int64_t v45;
  int64_t v46;
  CFRange v47;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(a1, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  v5 = v3;
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v30);
    }
    v8 = v7;
    v9 = (const __CFString *)v5;
    v10 = (__CFString *)v9;
    if (v9)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      *(_OWORD *)buffer = 0u;
      v33 = 0u;
      Length = CFStringGetLength(v9);
      theString = v10;
      v43 = 0;
      v44 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v10);
      CStringPtr = 0;
      v41 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v10, 0x600u);
      v31 = v10;
      v45 = 0;
      v46 = 0;
      v42 = CStringPtr;
      if (Length < 1)
      {
        v16 = 0;
      }
      else
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 64;
        do
        {
          if ((unint64_t)v15 >= 4)
            v18 = 4;
          else
            v18 = v15;
          v19 = v44;
          if (v44 <= v15)
          {
            v20 = 0;
          }
          else if (v41)
          {
            v20 = v41[v15 + v43];
          }
          else if (v42)
          {
            v20 = v42[v43 + v15];
          }
          else
          {
            v21 = v45;
            if (v46 <= v15 || v45 > v15)
            {
              v23 = v18 + v14;
              v24 = v17 - v18;
              v25 = v15 - v18;
              v26 = v25 + 64;
              if (v25 + 64 >= v44)
                v26 = v44;
              v45 = v25;
              v46 = v26;
              if (v44 >= v24)
                v19 = v24;
              v47.length = v19 + v23;
              v47.location = v25 + v43;
              CFStringGetCharacters(theString, v47, buffer);
              v21 = v45;
            }
            v20 = buffer[v15 - v21];
          }
          if (!CFCharacterSetIsCharacterMember(Predefined, v20))
            v8[v16++] = v20;
          ++v15;
          --v14;
          ++v17;
        }
        while (Length != v15);
      }
      v10 = v31;
    }
    else
    {
      v16 = 0;
    }

    v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharactersNoCopy:length:freeWhenDone:", v8, v16, 1);
  }
  else
  {
    v27 = v5;
  }
  v28 = v27;

  objc_autoreleasePoolPop(v2);
  return v28;
}

id PPQuickTypeItemsForContacts(void *a1, void *a2, unsigned int a3, void *a4, unint64_t a5, char a6, void *a7)
{
  id v11;
  NSObject *v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(void *, void *, void *, uint64_t, double);
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t n;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t ii;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t kk;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t jj;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *mm;
  void *v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t nn;
  void *v145;
  void *v146;
  void *v147;
  double v148;
  double v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t i1;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  int v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  NSObject *v185;
  void *v186;
  id v187;
  NSObject *v188;
  uint64_t i2;
  NSObject *v190;
  void *v191;
  void *v192;
  void *v193;
  double v194;
  double v195;
  double v196;
  double v197;
  void *v198;
  uint64_t v199;
  void *v200;
  const __CFString *v201;
  void *v202;
  uint64_t v203;
  void *v204;
  void *v205;
  void *v206;
  NSObject *v207;
  uint64_t v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  id v213;
  void *v214;
  uint64_t v215;
  void *v216;
  uint64_t v217;
  NSObject *v218;
  uint64_t v219;
  void *v220;
  void *v221;
  void *v222;
  NSObject *v223;
  uint64_t v224;
  uint64_t v226;
  void *v228;
  uint64_t v229;
  id obj;
  uint64_t v231;
  id v232;
  uint64_t v233;
  id v234;
  id v235;
  id v236;
  void *v237;
  uint64_t v238;
  uint64_t v239;
  id v240;
  id v241;
  unsigned int v242;
  id v243;
  id v244;
  void *v245;
  void *v246;
  uint64_t v247;
  id v248;
  id v249;
  id v250;
  id v251;
  char v253;
  id v254;
  void *v255;
  uint64_t v256;
  void (**v257)(void *, void *, void *, uint64_t, double);
  uint64_t v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  _QWORD aBlock[4];
  id v308;
  id v309;
  id v310;
  id v311;
  id v312;
  _BYTE v313[128];
  uint8_t v314[128];
  uint8_t v315[4];
  id v316;
  __int16 v317;
  id v318;
  _BYTE v319[128];
  _BYTE v320[128];
  _QWORD v321[3];
  _BYTE v322[128];
  _BYTE v323[128];
  _BYTE v324[128];
  _BYTE v325[128];
  _BYTE v326[128];
  _BYTE v327[128];
  uint8_t v328[128];
  uint8_t buf[4];
  uint64_t v330;
  __int16 v331;
  id v332;
  __int16 v333;
  uint64_t v334;
  uint64_t v335;

  v335 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v234 = a2;
  v232 = a4;
  v243 = a7;
  v228 = v11;
  if (!objc_msgSend(v11, "count"))
  {
    v213 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_175;
  }
  v245 = (void *)objc_opt_new();
  pp_contacts_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v229 = a3;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v330 = a3;
    _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_INFO, "predictionForContact fields: %lu", buf, 0xCu);
  }

  v265 = 0u;
  v266 = 0u;
  v263 = 0u;
  v264 = 0u;
  obj = v11;
  v233 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v263, v314, 16);
  if (v233)
  {
    v231 = *(_QWORD *)v264;
    v246 = (void *)*MEMORY[0x1E0C97118];
    v242 = a3;
    do
    {
      for (i = 0; i != v233; i = v208 + 1)
      {
        if (*(_QWORD *)v264 != v231)
          objc_enumerationMutation(obj);
        v239 = i;
        v14 = *(void **)(*((_QWORD *)&v263 + 1) + 8 * i);
        v238 = MEMORY[0x1C3BD6630]();
        pp_private_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v330 = (uint64_t)v14;
          _os_log_debug_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEBUG, "predictionForContact contact: %@", buf, 0xCu);
        }

        objc_msgSend(v14, "contact");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "source");

        v18 = v17 == 1;
        if (v17 == 2)
          v18 = 2;
        v253 = v18;
        v254 = v14;
        v19 = v234;
        v20 = v232;
        v237 = (void *)MEMORY[0x1C3BD6630]();
        v21 = (void *)objc_opt_new();
        v22 = (void *)objc_opt_new();
        +[PPLabelMatcher sharedInstance](PPLabelMatcher, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = ___labelAndValueForContactFields_block_invoke;
        aBlock[3] = &unk_1E7E18160;
        v235 = v23;
        v308 = v235;
        v236 = v19;
        v309 = v236;
        v248 = v20;
        v310 = v248;
        v240 = v22;
        v311 = v240;
        v241 = v21;
        v312 = v241;
        v24 = (void (**)(void *, void *, void *, uint64_t, double))_Block_copy(aBlock);
        PPContactLabelScoringMap();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((a3 & 1) != 0)
        {
          v306 = 0u;
          v305 = 0u;
          v303 = 0u;
          v304 = 0u;
          objc_msgSend(v254, "contact");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "phoneNumbers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v303, buf, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v304;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v304 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v303 + 1) + 8 * j);
                objc_msgSend(v32, "label");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKeyedSubscript:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "doubleValue");
                v36 = v35;

                objc_msgSend(v32, "label");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "value");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v24[2](v24, v37, v38, 1, v36);

              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v303, buf, 16);
            }
            while (v29);
          }

          a3 = v242;
          if ((v242 & 2) == 0)
          {
LABEL_15:
            if ((a3 & 4) == 0)
              goto LABEL_16;
            goto LABEL_37;
          }
        }
        else if ((a3 & 2) == 0)
        {
          goto LABEL_15;
        }
        v301 = 0u;
        v302 = 0u;
        v299 = 0u;
        v300 = 0u;
        objc_msgSend(v254, "contact");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "emailAddresses");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v299, v328, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v300;
          do
          {
            for (k = 0; k != v42; ++k)
            {
              if (*(_QWORD *)v300 != v43)
                objc_enumerationMutation(v40);
              v45 = *(void **)(*((_QWORD *)&v299 + 1) + 8 * k);
              objc_msgSend(v45, "label");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "doubleValue");
              v49 = v48;

              objc_msgSend(v45, "label");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "value");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v24[2](v24, v50, v51, 2, v49);

            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v299, v328, 16);
          }
          while (v42);
        }

        a3 = v242;
        if ((v242 & 4) == 0)
        {
LABEL_16:
          if ((a3 & 0x10) == 0)
            goto LABEL_17;
          goto LABEL_45;
        }
LABEL_37:
        v297 = 0u;
        v298 = 0u;
        v295 = 0u;
        v296 = 0u;
        objc_msgSend(v254, "contact");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "postalAddresses");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v295, v327, 16);
        if (v54)
        {
          v55 = v54;
          v56 = *(_QWORD *)v296;
          do
          {
            for (m = 0; m != v55; ++m)
            {
              if (*(_QWORD *)v296 != v56)
                objc_enumerationMutation(v53);
              v58 = *(void **)(*((_QWORD *)&v295 + 1) + 8 * m);
              objc_msgSend(v58, "label");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "doubleValue");
              v62 = v61;

              objc_msgSend(v58, "label");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "value");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v248, "formattedPostalAddress:", v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v24[2](v24, v63, v65, 4, v62);

            }
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v295, v327, 16);
          }
          while (v55);
        }

        a3 = v242;
        if ((v242 & 0x10) == 0)
        {
LABEL_17:
          if ((a3 & 8) == 0)
            goto LABEL_18;
          goto LABEL_53;
        }
LABEL_45:
        v293 = 0u;
        v294 = 0u;
        v291 = 0u;
        v292 = 0u;
        objc_msgSend(v254, "contact");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "postalAddresses");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v291, v326, 16);
        if (v68)
        {
          v69 = v68;
          v70 = *(_QWORD *)v292;
          do
          {
            for (n = 0; n != v69; ++n)
            {
              if (*(_QWORD *)v292 != v70)
                objc_enumerationMutation(v67);
              v72 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * n);
              objc_msgSend(v72, "label");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "doubleValue");
              v76 = v75;

              objc_msgSend(v72, "label");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "value");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "locality");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v24[2](v24, v77, v79, 16, v76);

            }
            v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v291, v326, 16);
          }
          while (v69);
        }

        a3 = v242;
        if ((v242 & 8) == 0)
        {
LABEL_18:
          if ((a3 & 0x20) == 0)
            goto LABEL_19;
          goto LABEL_61;
        }
LABEL_53:
        v289 = 0u;
        v290 = 0u;
        v287 = 0u;
        v288 = 0u;
        objc_msgSend(v254, "contact");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "postalAddresses");
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v287, v325, 16);
        if (v82)
        {
          v83 = v82;
          v84 = *(_QWORD *)v288;
          do
          {
            for (ii = 0; ii != v83; ++ii)
            {
              if (*(_QWORD *)v288 != v84)
                objc_enumerationMutation(v81);
              v86 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * ii);
              objc_msgSend(v86, "label");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v87);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "doubleValue");
              v90 = v89;

              objc_msgSend(v86, "label");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "value");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "thoroughfare");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v24[2](v24, v91, v93, 8, v90);

            }
            v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v287, v325, 16);
          }
          while (v83);
        }

        a3 = v242;
        if ((v242 & 0x20) == 0)
        {
LABEL_19:
          if ((a3 & 0x100000) == 0)
            goto LABEL_77;
LABEL_69:
          v281 = 0u;
          v282 = 0u;
          v279 = 0u;
          v280 = 0u;
          objc_msgSend(v254, "contact");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "postalAddresses");
          v109 = (void *)objc_claimAutoreleasedReturnValue();

          v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v279, v323, 16);
          if (v110)
          {
            v111 = v110;
            v112 = *(_QWORD *)v280;
            do
            {
              for (jj = 0; jj != v111; ++jj)
              {
                if (*(_QWORD *)v280 != v112)
                  objc_enumerationMutation(v109);
                v114 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * jj);
                objc_msgSend(v114, "label");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKeyedSubscript:", v115);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "doubleValue");
                v118 = v117;

                objc_msgSend(v114, "label");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "value");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "country");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                v24[2](v24, v119, v121, 0x100000, v118);

              }
              v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v279, v323, 16);
            }
            while (v111);
          }

          a3 = v242;
          goto LABEL_77;
        }
LABEL_61:
        v285 = 0u;
        v286 = 0u;
        v283 = 0u;
        v284 = 0u;
        objc_msgSend(v254, "contact");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "postalAddresses");
        v95 = (void *)objc_claimAutoreleasedReturnValue();

        v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v283, v324, 16);
        if (v96)
        {
          v97 = v96;
          v98 = *(_QWORD *)v284;
          do
          {
            for (kk = 0; kk != v97; ++kk)
            {
              if (*(_QWORD *)v284 != v98)
                objc_enumerationMutation(v95);
              v100 = *(void **)(*((_QWORD *)&v283 + 1) + 8 * kk);
              objc_msgSend(v100, "label");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v101);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "doubleValue");
              v104 = v103;

              objc_msgSend(v100, "label");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "value");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "administrativeArea");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v24[2](v24, v105, v107, 32, v104);

            }
            v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v283, v324, 16);
          }
          while (v97);
        }

        a3 = v242;
        if ((v242 & 0x100000) != 0)
          goto LABEL_69;
LABEL_77:
        v255 = v25;
        v257 = v24;
        if ((a3 & 0x200000) != 0)
        {
          v277 = 0u;
          v278 = 0u;
          v275 = 0u;
          v276 = 0u;
          objc_msgSend(v254, "contact");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "postalAddresses");
          v123 = (void *)objc_claimAutoreleasedReturnValue();

          v244 = v123;
          v249 = (id)objc_msgSend(v123, "countByEnumeratingWithState:objects:count:", &v275, v322, 16);
          if (v249)
          {
            v247 = *(_QWORD *)v276;
            do
            {
              for (mm = 0; mm != v249; mm = (char *)mm + 1)
              {
                if (*(_QWORD *)v276 != v247)
                  objc_enumerationMutation(v244);
                v125 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * (_QWORD)mm);
                objc_msgSend(v125, "label");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKeyedSubscript:", v126);
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "doubleValue");
                v129 = v128;

                objc_msgSend(v125, "label");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v125, "value");
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "locality");
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                v321[0] = v132;
                objc_msgSend(v125, "value");
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v133, "administrativeArea");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                v321[1] = v134;
                objc_msgSend(v125, "value");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v135, "country");
                v136 = (void *)objc_claimAutoreleasedReturnValue();
                v321[2] = v136;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v321, 3);
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v137, "_pas_componentsJoinedByString:", CFSTR("|"));
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                v257[2](v257, v130, v138, 0x200000, v129);

                v25 = v255;
              }
              v249 = (id)objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v275, v322, 16);
            }
            while (v249);
          }

          a3 = v242;
          v24 = v257;
          if ((v242 & 0x40) == 0)
          {
LABEL_79:
            if ((a3 & 0x80) == 0)
              goto LABEL_80;
            goto LABEL_103;
          }
        }
        else if ((a3 & 0x40) == 0)
        {
          goto LABEL_79;
        }
        v273 = 0u;
        v274 = 0u;
        v271 = 0u;
        v272 = 0u;
        objc_msgSend(v254, "contact");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "postalAddresses");
        v140 = (void *)objc_claimAutoreleasedReturnValue();

        v141 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v271, v320, 16);
        if (v141)
        {
          v142 = v141;
          v143 = *(_QWORD *)v272;
          do
          {
            for (nn = 0; nn != v142; ++nn)
            {
              if (*(_QWORD *)v272 != v143)
                objc_enumerationMutation(v140);
              v145 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * nn);
              objc_msgSend(v145, "label");
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v146);
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v147, "doubleValue");
              v149 = v148;

              objc_msgSend(v145, "label");
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v145, "value");
              v151 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v151, "postalCode");
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              v24[2](v24, v150, v152, 64, v149);

            }
            v142 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v271, v320, 16);
          }
          while (v142);
        }

        a3 = v242;
        if ((v242 & 0x80) == 0)
        {
LABEL_80:
          if ((a3 & 0x100) == 0)
            goto LABEL_81;
          goto LABEL_104;
        }
LABEL_103:
        objc_msgSend(v254, "contact");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "givenName");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2](v24, 0, v154, 128, 0.0);

        if ((a3 & 0x100) == 0)
        {
LABEL_81:
          if ((a3 & 0x200) == 0)
            goto LABEL_82;
          goto LABEL_105;
        }
LABEL_104:
        objc_msgSend(v254, "contact");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v155, "familyName");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2](v24, 0, v156, 256, 0.0);

        if ((a3 & 0x200) == 0)
        {
LABEL_82:
          if ((a3 & 0x400000) == 0)
            goto LABEL_83;
          goto LABEL_106;
        }
LABEL_105:
        objc_msgSend(v254, "contact");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v157, "localizedFullName");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2](v24, 0, v158, 512, 0.0);

        if ((a3 & 0x400000) == 0)
        {
LABEL_83:
          if ((a3 & 0x400) == 0)
            goto LABEL_84;
          goto LABEL_107;
        }
LABEL_106:
        objc_msgSend(v254, "contact");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "nickname");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2](v24, 0, v160, 0x400000, 0.0);

        if ((a3 & 0x400) == 0)
        {
LABEL_84:
          if ((a3 & 0x800) == 0)
            goto LABEL_85;
          goto LABEL_108;
        }
LABEL_107:
        objc_msgSend(v254, "contact");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "organizationName");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2](v24, 0, v162, 1024, 0.0);

        if ((a3 & 0x800) == 0)
        {
LABEL_85:
          if ((a3 & 0x2000) == 0)
            goto LABEL_123;
LABEL_113:
          v269 = 0u;
          v270 = 0u;
          v267 = 0u;
          v268 = 0u;
          objc_msgSend(v254, "contact");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "socialProfiles");
          v170 = (void *)objc_claimAutoreleasedReturnValue();

          v250 = v170;
          v171 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v267, v319, 16);
          if (v171)
          {
            v172 = v171;
            v173 = *(_QWORD *)v268;
            do
            {
              for (i1 = 0; i1 != v172; ++i1)
              {
                if (*(_QWORD *)v268 != v173)
                  objc_enumerationMutation(v250);
                v175 = *(void **)(*((_QWORD *)&v267 + 1) + 8 * i1);
                v176 = (void *)MEMORY[0x1C3BD6630]();
                objc_msgSend(v175, "value");
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v175, "label");
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v178, "lowercaseString");
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v246, "lowercaseString");
                v180 = (void *)objc_claimAutoreleasedReturnValue();
                v181 = objc_msgSend(v179, "isEqualToString:", v180);

                if (v181)
                {
                  objc_msgSend(CFSTR("@"), "stringByAppendingString:", v177);
                  v182 = objc_claimAutoreleasedReturnValue();

                  v177 = (void *)v182;
                }
                v25 = v255;
                v24 = v257;
                objc_msgSend(v175, "label");
                v183 = (void *)objc_claimAutoreleasedReturnValue();
                v24[2](v24, v183, v177, 0x2000, 0.0);

                objc_autoreleasePoolPop(v176);
              }
              v172 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v267, v319, 16);
            }
            while (v172);
          }

          v184 = objc_opt_new();
          v241 = (id)v184;
          a3 = v242;
          goto LABEL_123;
        }
LABEL_108:
        objc_msgSend(v254, "contact");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v163, "birthday");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v248, "formattedBirthday:", v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v165, "length"))
          v24[2](v24, 0, v165, 2048, 0.0);
        objc_msgSend(v254, "contact");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "nonGregorianBirthday");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v248, "formattedBirthday:", v167);
        v168 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v168, "length"))
          v24[2](v24, 0, v168, 2048, 0.0);

        if ((a3 & 0x2000) != 0)
          goto LABEL_113;
LABEL_123:
        pp_contacts_log_handle();
        v185 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v315 = 138412546;
          v316 = v240;
          v317 = 2112;
          v318 = v241;
          _os_log_debug_impl(&dword_1C392E000, v185, OS_LOG_TYPE_DEBUG, "labelAndValueForPrediction: strong: %@  weak: %@", v315, 0x16u);
        }

        if (objc_msgSend(v240, "count"))
          v186 = v240;
        else
          v186 = v241;
        v187 = v186;

        objc_autoreleasePoolPop(v237);
        if (objc_msgSend(v187, "count"))
        {
          v261 = 0u;
          v262 = 0u;
          v259 = 0u;
          v260 = 0u;
          v188 = v187;
          v258 = -[NSObject countByEnumeratingWithState:objects:count:](v188, "countByEnumeratingWithState:objects:count:", &v259, v313, 16);
          if (v258)
          {
            v251 = v187;
            v256 = *(_QWORD *)v260;
            do
            {
              for (i2 = 0; i2 != v258; ++i2)
              {
                if (*(_QWORD *)v260 != v256)
                  objc_enumerationMutation(v188);
                v190 = v188;
                v191 = *(void **)(*((_QWORD *)&v259 + 1) + 8 * i2);
                objc_msgSend(v254, "contact");
                v192 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v192, "localizedFullName");
                v193 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v254, "score");
                v195 = v194;
                objc_msgSend(v191, "scoreBoost");
                v197 = v195 * (v196 + 1.0);
                v198 = (void *)MEMORY[0x1E0D70C18];
                objc_msgSend(v191, "label");
                v199 = objc_claimAutoreleasedReturnValue();
                v200 = (void *)v199;
                if (v199)
                  v201 = (const __CFString *)v199;
                else
                  v201 = &stru_1E7E221D0;
                objc_msgSend(v191, "value");
                v202 = (void *)objc_claimAutoreleasedReturnValue();
                v203 = objc_msgSend(v191, "fields");
                objc_msgSend(v254, "contact");
                v204 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v204, "identifier");
                v205 = (void *)objc_claimAutoreleasedReturnValue();
                BYTE2(v226) = v253;
                BYTE1(v226) = a6;
                LOBYTE(v226) = 0;
                objc_msgSend(v198, "quickTypeItemWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v201, v202, v193, 0, v203, 0, v197, 0, -1, v226, v205);
                v206 = (void *)objc_claimAutoreleasedReturnValue();

                if (v206)
                {
                  objc_msgSend(v245, "addObject:", v206);
                }
                else
                {
                  pp_contacts_log_handle();
                  v207 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1C392E000, v207, OS_LOG_TYPE_ERROR, "failed to create quick type item for contact", buf, 2u);
                  }

                  objc_msgSend(v243, "push:", 2);
                }
                v188 = v190;

              }
              v258 = -[NSObject countByEnumeratingWithState:objects:count:](v190, "countByEnumeratingWithState:objects:count:", &v259, v313, 16);
            }
            while (v258);
            a3 = v242;
            v209 = (void *)v238;
            v208 = v239;
            v187 = v251;
          }
          else
          {
            v209 = (void *)v238;
            v208 = v239;
          }
        }
        else
        {
          pp_contacts_log_handle();
          v188 = objc_claimAutoreleasedReturnValue();
          v209 = (void *)v238;
          if (os_log_type_enabled(v188, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v254, "contact");
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v210, "identifier");
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v330 = (uint64_t)v211;
            v331 = 2112;
            v332 = v234;
            v333 = 2048;
            v334 = v229;
            _os_log_impl(&dword_1C392E000, v188, OS_LOG_TYPE_INFO, "contact %@ did not have field: %@: %lu", buf, 0x20u);

          }
          v208 = v239;
        }

        objc_autoreleasePoolPop(v209);
      }
      v233 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v263, v314, 16);
    }
    while (v233);
  }

  if (!objc_msgSend(obj, "count") || objc_msgSend(v245, "count"))
    goto LABEL_155;
  if (a3)
  {
    objc_msgSend(v243, "push:", 10);
LABEL_155:
    if ((a3 & 1) != 0)
    {
      if (v234)
        v214 = &__block_literal_global_7;
      else
        v214 = &__block_literal_global_6;
      deduplicateQuickTypeItems(v245, &__block_literal_global_63, &__block_literal_global_65_7470, v214);
      v215 = objc_claimAutoreleasedReturnValue();

      v212 = (void *)v215;
    }
    else
    {
      v212 = v245;
    }
    if (a3 >= 2)
    {
      if (v234)
        v216 = &__block_literal_global_7;
      else
        v216 = &__block_literal_global_6;
      deduplicateQuickTypeItems(v212, &__block_literal_global_66, &__block_literal_global_67_7471, v216);
      v217 = objc_claimAutoreleasedReturnValue();

      v212 = (void *)v217;
    }
    goto LABEL_167;
  }
  objc_msgSend(v243, "push:", 8);
  v212 = v245;
LABEL_167:
  objc_msgSend(v212, "sortWithOptions:usingComparator:", 16, &__block_literal_global_12);
  pp_contacts_log_handle();
  v218 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
  {
    v219 = objc_msgSend(v212, "count");
    *(_DWORD *)buf = 134217984;
    v330 = v219;
    _os_log_impl(&dword_1C392E000, v218, OS_LOG_TYPE_INFO, "people quick type item count: %lu", buf, 0xCu);
  }

  if (objc_msgSend(v212, "count") <= a5)
  {
    v222 = v212;
  }
  else
  {
    v220 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v212, "subarrayWithRange:", 0, a5);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    v222 = (void *)objc_msgSend(v221, "mutableCopy");

    pp_contacts_log_handle();
    v223 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v223, OS_LOG_TYPE_INFO))
    {
      v224 = objc_msgSend(v222, "count");
      *(_DWORD *)buf = 134217984;
      v330 = v224;
      _os_log_impl(&dword_1C392E000, v223, OS_LOG_TYPE_INFO, "people quick type item count trimmed to limit: %lu", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v220);
  }
  v213 = v222;

LABEL_175:
  return v213;
}

void ___labelAndValueForContactFields_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, double a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v9 = a3;
  if (v9)
  {
    PPCollapseWhitespaceAndStrip();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "matchFromLabel:toLabel:", *(_QWORD *)(a1 + 40), v18);
      v13 = v18;
      if (v13)
      {
        v14 = v13;
        objc_msgSend(*(id *)(a1 + 48), "formattedStringForLabel:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
      if (v12 == 1)
      {
        v16 = *(void **)(a1 + 64);
      }
      else
      {
        if (v12 != 2)
        {
LABEL_11:

          goto LABEL_12;
        }
        v16 = *(void **)(a1 + 56);
      }
      +[PPQuickTypeLabeledValue labeledValueWithLabel:value:scoreBoost:fields:](PPQuickTypeLabeledValue, "labeledValueWithLabel:value:scoreBoost:fields:", v15, v9, a4, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

      goto LABEL_11;
    }
  }
LABEL_12:

}

id deduplicateQuickTypeItems(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, _QWORD);
  void (**v9)(id, void *, void *);
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void (**v25)(id, void *, _QWORD);
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v25 = a4;
  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "count") == 1)
  {
    v11 = v7;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v7;
    obj = v7;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v8[2](v8, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v9[2](v9, v17, v10);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v25[2](v25, v19, v16);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v17);

              if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) == 0)
                objc_msgSend(v10, "removeObjectForKey:", v18);
            }
            else
            {
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);
            }

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }

    v21 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v10, "allValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v21);
    v11 = (id)objc_msgSend(v22, "mutableCopy");

    v7 = v24;
  }

  return v11;
}

id __deduplicateGenericQuickTypeItems_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    v5 = v4;

  return v5;
}

id __deduplicateGenericQuickTypeItems_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v2, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

id preferredQuickTypeItemByLabelAndScore_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {

LABEL_5:
    objc_msgSend(v5, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v4, "label");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");

      if (!v12)
      {
        v9 = v5;
        goto LABEL_10;
      }
    }
    else
    {

    }
    preferredQuickTypeItemByScore_block_invoke(v13, v4, v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v5, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
    goto LABEL_5;
  v9 = v4;
LABEL_10:
  v14 = v9;

  return v14;
}

id preferredQuickTypeItemByScore_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "source") != 1 || (v6 = objc_msgSend(v5, "source"), v7 = v4, v6 == 1))
  {
    if (objc_msgSend(v5, "source") != 1 || (v8 = objc_msgSend(v4, "source"), v7 = v5, v8 == 1))
    {
      objc_msgSend(v4, "score");
      v10 = v9;
      objc_msgSend(v5, "score");
      if (v10 < v11)
        v7 = v5;
      else
        v7 = v4;
    }
  }
  v12 = v7;

  return v12;
}

id __deduplicatePhoneQuickTypeItems_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD6630]();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsString:", v12, (_QWORD)v15) & 1) != 0
          || (objc_msgSend(v12, "containsString:", v4) & 1) != 0)
        {
          v13 = v12;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v13 = 0;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_13:

  objc_autoreleasePoolPop(v6);
  return v13;
}

id __deduplicatePhoneQuickTypeItems_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  if ((objc_msgSend(v2, "fields") & 1) != 0)
  {
    objc_msgSend(v2, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PPRemovePhoneExtensionAndNonDigits(v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v3);
  }

  return v5;
}

id PPRelatedNamesForContact(void *a1)
{
  id v1;
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  id v18;
  id v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    v19 = 0;
    goto LABEL_18;
  }
  v18 = v1;
  v19 = (id)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v1, "contactRelations");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v22)
    goto LABEL_16;
  v21 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v24 != v21)
        objc_enumerationMutation(obj);
      v3 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      v4 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        objc_msgSend(v3, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", &stru_1E7E221D0);

        if ((v12 & 1) != 0)
          goto LABEL_14;
        objc_msgSend(v3, "value");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "label");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (const __CFString *)v14;
        else
          v16 = CFSTR("unlabeled");
        objc_msgSend(v19, "setObject:forKey:", v13, v16);

      }
LABEL_14:
      objc_autoreleasePoolPop(v4);
    }
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v22);
LABEL_16:

  v1 = v18;
LABEL_18:

  return v19;
}

id PPStreetNamesForContact(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    v17 = 0;
    goto LABEL_15;
  }
  v16 = v1;
  v17 = (id)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v1, "postalAddresses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v2)
    goto LABEL_13;
  v3 = v2;
  v4 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v20 != v4)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      v7 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v6, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "street");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v6, "value");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "street");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", &stru_1E7E221D0);

        if ((v13 & 1) != 0)
          goto LABEL_11;
        objc_msgSend(v6, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "street");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v14);

      }
LABEL_11:
      objc_autoreleasePoolPop(v7);
    }
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v3);
LABEL_13:

  v1 = v16;
LABEL_15:

  return v17;
}

id PPCityNamesForContact(void *a1)
{
  id v1;
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v15;
  id v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    v16 = 0;
    goto LABEL_15;
  }
  v15 = v1;
  v16 = (id)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v1, "postalAddresses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v19)
    goto LABEL_13;
  v18 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v21 != v18)
        objc_enumerationMutation(obj);
      v3 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      v4 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "city");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        objc_msgSend(v3, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "city");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", &stru_1E7E221D0);

        if ((v12 & 1) != 0)
          goto LABEL_11;
        objc_msgSend(v3, "value");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "city");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v13);

      }
LABEL_11:
      objc_autoreleasePoolPop(v4);
    }
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v19);
LABEL_13:

  v1 = v15;
LABEL_15:

  return v16;
}

id PPKeysToFetchPeople()
{
  if (PPKeysToFetchPeople__pasOnceToken16 != -1)
    dispatch_once(&PPKeysToFetchPeople__pasOnceToken16, &__block_literal_global_17_7490);
  return (id)PPKeysToFetchPeople__pasExprOnceResult;
}

id PPFavoriteContacts()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  pthread_mutex_lock(&favoritesLock);
  v1 = objc_alloc(MEMORY[0x1E0C972F8]);
  PPSharedCNContactStore();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithContactStore:", v2);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = v3;
  objc_msgSend(v3, "entries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1C3BD6630]();
        v11 = objc_alloc(MEMORY[0x1E0D70B00]);
        objc_msgSend(v9, "contactProperty");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "contact");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v11, "initWithContactsContact:", v13);
        objc_msgSend(v0, "addObject:", v14);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  pthread_mutex_unlock(&favoritesLock);
  return v0;
}

id PPContactMeCardFromSource()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[8];
  id v8;

  PPSharedCNContactStore();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PPKeysToFetchPeople();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v0, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v1, &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;

  if (v2)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B00]), "initWithContactsContact:", v2);
  }
  else
  {
    pp_contacts_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1C392E000, v5, OS_LOG_TYPE_ERROR, "failed to load Me card from contacts framework", v7, 2u);
    }

    +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("CN_CS"), objc_msgSend(v3, "code"));
    v4 = 0;
  }

  return v4;
}

uint64_t PPSocialHighlightContactReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  void *v31;
  uint64_t result;
  BOOL v33;
  uint64_t v34;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 5)
        break;
      if ((_DWORD)v17 != 4)
      {
        if ((_DWORD)v17 != 2)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          goto LABEL_47;
        }
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_39;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_41:
        v33 = v20 != 0;
        v34 = 17;
        goto LABEL_46;
      }
      PBReaderReadString();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v30;

LABEL_47:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v24 = 0;
    v25 = 0;
    v26 = 0;
    *(_BYTE *)(a1 + 20) |= 1u;
    while (1)
    {
      v27 = *v3;
      v28 = *(_QWORD *)(a2 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
      *(_QWORD *)(a2 + v27) = v28 + 1;
      v26 |= (unint64_t)(v29 & 0x7F) << v24;
      if ((v29 & 0x80) == 0)
        goto LABEL_43;
      v24 += 7;
      v14 = v25++ >= 9;
      if (v14)
      {
        v26 = 0;
        goto LABEL_45;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
    if (*(_BYTE *)(a2 + *v5))
      v26 = 0;
LABEL_45:
    v33 = v26 != 0;
    v34 = 16;
LABEL_46:
    *(_BYTE *)(a1 + v34) = v33;
    goto LABEL_47;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C39E761C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1C39E79CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1C39E7FA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  _Unwind_Resume(exception_object);
}

void sub_1C39E92E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C39EA50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39EADD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39EB2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7653(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7654(uint64_t a1)
{

}

void sub_1C39EBCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39ECDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39ED4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39EE31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39EF0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7883(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7884(uint64_t a1)
{

}

void sub_1C39EFD9C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C39EFD60);
}

void sub_1C39EFDAC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C39EFE68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1C39EFF5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1C39F00F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1C39F0278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1C39F04C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1C39F05E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1C39F07A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1C39F09F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C39F0E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8083(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8084(uint64_t a1)
{

}

void sub_1C39F435C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8211(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8212(uint64_t a1)
{

}

void sub_1C39F45C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39F4CA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C39F50DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8250(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8251(uint64_t a1)
{

}

void sub_1C39F52A8(void *a1)
{
  _BYTE *v1;
  uint64_t v2;
  id v3;

  v3 = objc_begin_catch(a1);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 40), v3);
  *v1 = 1;
  objc_end_catch();
  JUMPOUT(0x1C39F5290);
}

uint64_t PPM2NamedEntitiesFilteredReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPM2TopicsPerDonationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  void *v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 3u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_39;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_41;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_41:
          v32 = 20;
          goto LABEL_46;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 24;
          goto LABEL_37;
        case 5u:
          v26 = 0;
          v27 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          break;
        case 6u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 8;
LABEL_37:
          v31 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          break;
        v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
        *(_QWORD *)(a2 + v28) = v29 + 1;
        v19 |= (unint64_t)(v30 & 0x7F) << v26;
        if ((v30 & 0x80) == 0)
          goto LABEL_43;
        v26 += 7;
        v14 = v27++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_45;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_45:
      v32 = 16;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPM2FeedbackAtKReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  void *v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 0x10u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_58;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_60;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_58:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_60:
          v46 = 32;
          goto LABEL_77;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_64:
          v46 = 24;
          goto LABEL_77;
        case 3u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (2)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
              *(_QWORD *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_68:
          v46 = 20;
          goto LABEL_77;
        case 4u:
          v34 = 0;
          v35 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 8u;
          while (2)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
              *(_QWORD *)(a2 + v36) = v37 + 1;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                v14 = v35++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_72:
          v46 = 28;
          goto LABEL_77;
        case 5u:
          PBReaderReadString();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v39;

          continue;
        case 6u:
          v41 = 0;
          v42 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v43 = *v3;
        v44 = *(_QWORD *)(a2 + v43);
        if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
          break;
        v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
        *(_QWORD *)(a2 + v43) = v44 + 1;
        v19 |= (unint64_t)(v45 & 0x7F) << v41;
        if ((v45 & 0x80) == 0)
          goto LABEL_74;
        v41 += 7;
        v14 = v42++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_76;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_74:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_76:
      v46 = 16;
LABEL_77:
      *(_DWORD *)(a1 + v46) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C39F80D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39F81EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C39F8304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8659(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8660(uint64_t a1)
{

}

BOOL PPM2UnmappedMatchedFeedbackReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 8;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PPPBLabeledPostalAddressReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_30;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 56;
          goto LABEL_30;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 72;
          goto LABEL_30;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_30;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 64;
          goto LABEL_30;
        case 6u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_30;
        case 7u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_30;
        case 8u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_30;
        case 9u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_30:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_31;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_31:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPStorableFeedbackReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  PPStorableFeedbackItem *v43;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = 0x1EF8E2000uLL;
  v8 = 0x1EF8E2000uLL;
  v9 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = *v3;
      v14 = *(_QWORD *)(a2 + v13);
      v15 = v14 + 1;
      if (v14 == -1 || v15 > *(_QWORD *)(a2 + *v4))
        break;
      v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
      *(_QWORD *)(a2 + v13) = v15;
      v12 |= (unint64_t)(v16 & 0x7F) << v10;
      if ((v16 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v17 = v11++ >= 9;
      if (v17)
      {
        v12 = 0;
        v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    if (v18 || (v12 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        *(_BYTE *)(a1 + *(int *)(v7 + 2284)) |= 1u;
        v20 = *v3;
        v21 = *(_QWORD *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        *(_QWORD *)(a1 + *(int *)(v8 + 2288)) = v22;
        goto LABEL_43;
      case 2u:
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 2284)) |= 2u;
        while (2)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v28);
            *(_QWORD *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              v17 = v25++ >= 9;
              if (v17)
              {
                LODWORD(v26) = 0;
                goto LABEL_51;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_51:
        *(_DWORD *)(a1 + 56) = v26;
        goto LABEL_43;
      case 3u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 24;
        goto LABEL_42;
      case 4u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 32;
        goto LABEL_42;
      case 5u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 48;
        goto LABEL_42;
      case 6u:
        v33 = 0;
        v34 = 0;
        v35 = 0;
        *(_BYTE *)(a1 + *(int *)(v7 + 2284)) |= 4u;
        while (2)
        {
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          v38 = v37 + 1;
          if (v37 == -1 || v38 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v37);
            *(_QWORD *)(a2 + v36) = v38;
            v35 |= (unint64_t)(v39 & 0x7F) << v33;
            if (v39 < 0)
            {
              v33 += 7;
              v17 = v34++ >= 9;
              if (v17)
              {
                v35 = 0;
                goto LABEL_55;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v35 = 0;
LABEL_55:
        *(_BYTE *)(a1 + 60) = v35 != 0;
        goto LABEL_43;
      case 7u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 16;
LABEL_42:
        v40 = *(void **)(a1 + v32);
        *(_QWORD *)(a1 + v32) = v31;

        goto LABEL_43;
      case 8u:
        v41 = v7;
        v42 = v8;
        v43 = objc_alloc_init(PPStorableFeedbackItem);
        objc_msgSend((id)a1, "addFeedbackItems:", v43);
        if (PBReaderPlaceMark() && (PPStorableFeedbackItemReadFrom((uint64_t)v43, a2) & 1) != 0)
        {
          PBReaderRecallMark();

          v8 = v42;
          v7 = v41;
LABEL_43:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_43;
    }
  }
}

uint64_t __Block_byref_object_copy__9082(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9083(uint64_t a1)
{

}

uint64_t PPM2DatabaseCheckViolationCountReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v24;

      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v26 = 0;
          v27 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 1u;
          while (1)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
              break;
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v20 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0)
              goto LABEL_43;
            v26 += 7;
            v14 = v27++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_45;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_45:
          v32 = 16;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_39;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_41;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_41:
          v32 = 20;
        }
        *(_DWORD *)(a1 + v32) = v20;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void setGeoNavigationListenerFactoryForTesting(void *a1)
{
  id v1;

  v1 = a1;
  __assert_rtn("setGeoNavigationListenerFactoryForTesting", "PPQuickTypeNavigationSupport.m", 31, "0");
}

id newGEONavigationListener()
{
  id v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0D27278]);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.proactive.PersonalizationPortrait.Navigation.serialQueue", v2);
  v4 = (void *)objc_msgSend(v0, "initWithQueue:", v3);

  return v4;
}

uint64_t PPM2DatabaseRecordCountReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 32) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_36:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 24;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPM2NamedEntitySourceLanguageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  void *v36;
  uint64_t v37;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_45;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_45;
        case 3u:
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 48) |= 4u;
          while (2)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
              *(_QWORD *)(a2 + v22) = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                v14 = v20++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_49:
          v37 = 36;
          goto LABEL_58;
        case 6u:
          v26 = 0;
          v27 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 48) |= 2u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v21 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_53:
          v37 = 32;
          goto LABEL_58;
        case 7u:
          v31 = 0;
          v32 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          break;
        case 8u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_45:
          v36 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
          break;
        v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
        *(_QWORD *)(a2 + v33) = v34 + 1;
        v21 |= (unint64_t)(v35 & 0x7F) << v31;
        if ((v35 & 0x80) == 0)
          goto LABEL_55;
        v31 += 7;
        v14 = v32++ >= 9;
        if (v14)
        {
          LODWORD(v21) = 0;
          goto LABEL_57;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_55:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v21) = 0;
LABEL_57:
      v37 = 16;
LABEL_58:
      *(_DWORD *)(a1 + v37) = v21;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C39FFD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9582(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9583(uint64_t a1)
{

}

void sub_1C3A0092C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A00A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A013E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9703(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9704(uint64_t a1)
{

}

void sub_1C3A01D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9770(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9771(uint64_t a1)
{

}

void sub_1C3A03714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2NamedEntityInitialDonationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v24;

      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v26 = 0;
          v27 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 1u;
          while (1)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
              break;
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v20 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0)
              goto LABEL_43;
            v26 += 7;
            v14 = v27++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_45;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_45:
          v32 = 16;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_39;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_41;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_41:
          v32 = 20;
        }
        *(_DWORD *)(a1 + v32) = v20;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PPPBContactRelatedNameReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A07704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10394(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10395(uint64_t a1)
{

}

void sub_1C3A08418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A08AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10439(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10440(uint64_t a1)
{

}

Class __getSGRecordIdClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreSuggestionsLibraryCore_frameworkLibrary)
    CoreSuggestionsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreSuggestionsLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSuggestionsLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPContactStorage+FoundInApps.m"), 29, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SGRecordId");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSGRecordIdClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPContactStorage+FoundInApps.m"), 30, CFSTR("Unable to find class %s"), "SGRecordId");

LABEL_8:
    __break(1u);
  }
  getSGRecordIdClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PPM2UniqueLocationsFoundReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A0BA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10610(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10611(uint64_t a1)
{

}

uint64_t PPM2LocationsScoredReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  void *v56;
  BOOL v57;
  uint64_t v58;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_65;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_69:
          *(_DWORD *)(a1 + 24) = v22;
          continue;
        case 3u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 36) |= 8u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_73:
          v57 = v28 != 0;
          v58 = 30;
          goto LABEL_90;
        case 4u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_BYTE *)(a1 + 36) |= 0x20u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_77:
          v57 = v34 != 0;
          v58 = 32;
          goto LABEL_90;
        case 5u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_BYTE *)(a1 + 36) |= 0x10u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_81:
          v57 = v40 != 0;
          v58 = 31;
          goto LABEL_90;
        case 6u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
              *(_QWORD *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  v46 = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_85:
          v57 = v46 != 0;
          v58 = 29;
          goto LABEL_90;
        case 7u:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          break;
        case 8u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_65:
          v56 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v53 = *v3;
        v54 = *(_QWORD *)(a2 + v53);
        if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
          break;
        v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
        *(_QWORD *)(a2 + v53) = v54 + 1;
        v52 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0)
          goto LABEL_87;
        v50 += 7;
        v14 = v51++ >= 9;
        if (v14)
        {
          v52 = 0;
          goto LABEL_89;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_87:
      if (*(_BYTE *)(a2 + *v5))
        v52 = 0;
LABEL_89:
      v57 = v52 != 0;
      v58 = 28;
LABEL_90:
      *(_BYTE *)(a1 + v58) = v57;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPPBExtractedDonationRecordReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  void *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 48;
          goto LABEL_34;
        case 2u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 32;
          goto LABEL_34;
        case 3u:
          *(_BYTE *)(a1 + 56) |= 1u;
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          *(_QWORD *)(a1 + 8) = v23;
          continue;
        case 4u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 56) |= 2u;
          while (2)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            v29 = v28 + 1;
            if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
              *(_QWORD *)(a2 + v27) = v29;
              v26 |= (unint64_t)(v30 & 0x7F) << v24;
              if (v30 < 0)
              {
                v24 += 7;
                v15 = v25++ >= 9;
                if (v15)
                {
                  v26 = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v26 = 0;
LABEL_45:
          v38 = 16;
          goto LABEL_50;
        case 5u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 40;
LABEL_34:
          v31 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        case 6u:
          v32 = 0;
          v33 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 56) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        v36 = v35 + 1;
        if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v36;
        v26 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_47;
        v32 += 7;
        v15 = v33++ >= 9;
        if (v15)
        {
          v26 = 0;
          goto LABEL_49;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
      if (*(_BYTE *)(a2 + *v5))
        v26 = 0;
LABEL_49:
      v38 = 24;
LABEL_50:
      *(_QWORD *)(a1 + v38) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A0F3DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1C3A10270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a69;
  uint64_t v69;

  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose((const void *)(v69 - 256), 8);
  _Block_object_dispose((const void *)(v69 - 224), 8);
  _Block_object_dispose((const void *)(v69 - 192), 8);
  _Block_object_dispose((const void *)(v69 - 160), 8);
  _Block_object_dispose((const void *)(v69 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A103AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A105D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A1099C(_Unwind_Exception *exception_object)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_1C3A109B8(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_1C3A10B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A10E68(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3A10DE4);
}

void sub_1C3A1222C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C3A1224C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3A121F4);
}

uint64_t __Block_byref_object_copy__11353(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11354(uint64_t a1)
{

}

void sub_1C3A13574(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3A13538);
}

void sub_1C3A13584(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C3A13AEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A13BDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A13D84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A13EDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A14028(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A1484C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A14ABC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A14BB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A14CAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A14DF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A14FE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A15828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11599(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11600(uint64_t a1)
{

}

id _PASValidatedFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20[2];
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v20[1] = &a9;
  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a2;
  v12 = a1;
  v20[0] = 0;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v12, v11, 0, &a9, v20);

  v14 = v20[0];
  if (!v13)
  {
    v15 = objc_alloc(MEMORY[0x1E0C99DA0]);
    v16 = *MEMORY[0x1E0C99778];
    v21 = *MEMORY[0x1E0CB3388];
    v22[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithName:reason:userInfo:", v16, CFSTR("An error occurred while formatting the string."), v17);

    objc_msgSend(v18, "raise");
  }

  return v13;
}

id getIntlUtilityClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getIntlUtilityClass_softClass;
  v7 = getIntlUtilityClass_softClass;
  if (!getIntlUtilityClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getIntlUtilityClass_block_invoke;
    v3[3] = &unk_1E7E1F798;
    v3[4] = &v4;
    __getIntlUtilityClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1C3A1657C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIntlUtilityClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!IntlPreferencesLibraryCore_frameworkLibrary)
    IntlPreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!IntlPreferencesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IntlPreferencesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPQuickTypeFormatter.m"), 26, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("IntlUtility");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIntlUtilityClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPQuickTypeFormatter.m"), 27, CFSTR("Unable to find class %s"), "IntlUtility");

LABEL_8:
    __break(1u);
  }
  getIntlUtilityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C3A169CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPPBFeatureIdFeatureValuePairReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 20) |= 1u;
        v20 = *v3;
        v21 = *(_QWORD *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        *(_DWORD *)(a1 + 16) = v22;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v18;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t threadKey_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "domainIdentifier");
}

id senderKey_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "sender");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t highlightIdentifierKey_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "highlightIdentifier");
}

const __CFString *staticKeyBlock_block_invoke_3()
{
  return &stru_1E7E221D0;
}

double domainAndSenderKey_block_invoke_21(uint64_t a1, void *a2)
{
  int v2;
  double result;

  v2 = objc_msgSend(a2, "isCollaboration");
  result = 0.0;
  if (v2)
    return 1.0;
  return result;
}

double domainAndSenderKey_block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  void *v4;

  v2 = a2;
  v3 = 0.0;
  if ((objc_msgSend(v2, "fromMeEntitlementOverrideIsPresent") & 1) == 0)
  {
    objc_msgSend(v2, "sender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isMe"))
      v3 = 1.0;
    else
      v3 = 0.0;

  }
  return v3;
}

double domainAndSenderKey_block_invoke_19(uint64_t a1, void *a2)
{
  int v2;
  double result;

  v2 = objc_msgSend(a2, "isConversationAutoDonating");
  result = 0.0;
  if (v2)
    return 1.0;
  return result;
}

double domainAndSenderKey_block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  double v3;

  objc_msgSend(a2, "groupPhotoPathDigest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 1.0;
  else
    v3 = 0.0;

  return v3;
}

double domainAndSenderKey_block_invoke_17(uint64_t a1, void *a2)
{
  void *v2;
  double v3;

  objc_msgSend(a2, "displayName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 1.0;
  else
    v3 = 0.0;

  return v3;
}

double domainAndSenderKey_block_invoke_16(uint64_t a1, void *a2)
{
  int v2;
  double result;

  v2 = objc_msgSend(a2, "highlightType");
  result = 0.0;
  if (v2 == 2)
    return 1.0;
  return result;
}

double domainAndSenderKey_block_invoke_15(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v2 = (objc_class *)MEMORY[0x1E0C99D68];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "syndicationSecondsSinceReferenceDate");
  v6 = v5;

  v7 = (void *)objc_msgSend(v4, "initWithTimeIntervalSinceReferenceDate:", v6);
  objc_msgSend(v7, "timeIntervalSinceNow");
  v9 = -v8;

  return v9;
}

double domainAndSenderKey_block_invoke_14(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v2 = (objc_class *)MEMORY[0x1E0C99D68];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "contentCreationSecondsSinceReferenceDate");
  v6 = v5;

  v7 = (void *)objc_msgSend(v4, "initWithTimeIntervalSinceReferenceDate:", v6);
  objc_msgSend(v7, "timeIntervalSinceNow");
  v9 = -v8;

  return v9;
}

uint64_t __Block_byref_object_copy__11844(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11845(uint64_t a1)
{

}

uint64_t attributionIdentifierKey_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attributionIdentifier");
}

id domainAndSenderKey_block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "highlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id domainAndSenderKey_block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "highlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id domainAndSenderKey_block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a2;
  objc_msgSend(v2, "resourceUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v2, "resourceUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithString:", v5);

  }
  objc_msgSend(v3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v6 && v8)
  {
    v10 = (void *)MEMORY[0x1C3BD6630]();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\t%@"), v6, v8);
    objc_autoreleasePoolPop(v10);
  }

  return v9;
}

id domainAndSenderKey_block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a2;
  objc_msgSend(v2, "highlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "highlight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v5 && v8)
  {
    v10 = (void *)MEMORY[0x1C3BD6630]();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\t%@"), v5, v8);
    objc_autoreleasePoolPop(v10);
  }

  return v9;
}

id domainKey_block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "resourceUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v2, "resourceUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithString:", v5);

  }
  objc_msgSend(v3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id domainAndSenderKey_block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "highlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id domainAndSenderKey_block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "highlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id domainAndSenderKey_block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "highlight");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1C3A1AC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

Class __getEMDaemonInterfaceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!EmailLibraryCore_frameworkLibrary)
    EmailLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!EmailLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *EmailLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPEventScorer.m"), 41, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("EMDaemonInterface");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getEMDaemonInterfaceClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPEventScorer.m"), 43, CFSTR("Unable to find class %s"), "EMDaemonInterface");

LABEL_8:
    __break(1u);
  }
  getEMDaemonInterfaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PPM2LocationDonationErrorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 28) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_36:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPPBDateComponentsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_46;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_48;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_48:
          v37 = 16;
          goto LABEL_57;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 2u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_52;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_52:
          v37 = 20;
          goto LABEL_57;
        case 3u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 36) |= 4u;
          break;
        case 4u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = 8;
          goto LABEL_44;
        case 5u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = 24;
LABEL_44:
          v36 = *(void **)(a1 + v35);
          *(_QWORD *)(a1 + v35) = v34;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v31 = *v3;
        v32 = *(_QWORD *)(a2 + v31);
        if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
          break;
        v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
        *(_QWORD *)(a2 + v31) = v32 + 1;
        v19 |= (unint64_t)(v33 & 0x7F) << v29;
        if ((v33 & 0x80) == 0)
          goto LABEL_54;
        v29 += 7;
        v14 = v30++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_56;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_56:
      v37 = 32;
LABEL_57:
      *(_DWORD *)(a1 + v37) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PPM2SourceAlgPairReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A1FA20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A1FEEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A2045C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A20BD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A2154C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C3A21664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A21710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A218A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12592(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12593(uint64_t a1)
{

}

void sub_1C3A21F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A227FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2NamedEntityDonationErrorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v24;

      }
      else if ((_DWORD)v17 == 2)
      {
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            break;
          v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
          *(_QWORD *)(a2 + v29) = v30 + 1;
          v28 |= (unint64_t)(v31 & 0x7F) << v26;
          if ((v31 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            v28 = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_45:
        *(_QWORD *)(a1 + 8) = v28;
      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_39;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_41:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPM2TopicInitialDonationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v24;

      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v26 = 0;
          v27 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 1u;
          while (1)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
              break;
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v20 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0)
              goto LABEL_43;
            v26 += 7;
            v14 = v27++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_45;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_45:
          v32 = 16;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_39;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_41;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_41:
          v32 = 20;
        }
        *(_DWORD *)(a1 + v32) = v20;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPSocialHighlightFeatureReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
        v20 = *v3;
        v21 = *(_QWORD *)(a2 + v20);
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v22 = 0;
        }
        *(_QWORD *)(a1 + 8) = v22;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v18;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A25914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFAnalyticsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AssistantServicesLibraryCore_frameworkLibrary_13144)
    AssistantServicesLibraryCore_frameworkLibrary_13144 = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary_13144)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *AssistantServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPLocalConnectionsStore.m"), 34, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AFAnalytics");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getAFAnalyticsClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPLocalConnectionsStore.m"), 35, CFSTR("Unable to find class %s"), "AFAnalytics");

LABEL_8:
    __break(1u);
  }
  getAFAnalyticsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C3A25CB4(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3A25C78);
}

void sub_1C3A25CC4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C3A26974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void __blockNotifyQueue_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "blockNotifyQueue");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)blockNotifyQueue__pasExprOnceResult;
  blockNotifyQueue__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t PPM2LocationDonationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 5)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      else
      {
        if ((_DWORD)v17 != 4)
        {
          if ((_DWORD)v17 == 2)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 32) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_36:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 24;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A280F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A28518(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A28B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A295EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A29888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2NamedEntityNewItemDonationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  void *v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 60) |= 8u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_68;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_70;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_68:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_70:
          v55 = 32;
          goto LABEL_83;
        case 4u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 60) |= 4u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_74:
          v55 = 28;
          goto LABEL_83;
        case 5u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 40;
          goto LABEL_52;
        case 6u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 48;
          goto LABEL_52;
        case 7u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_BYTE *)(a1 + 60) |= 0x10u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  v33 = 0;
                  goto LABEL_78;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v33 = 0;
LABEL_78:
          v56 = v33 != 0;
          v57 = 56;
          goto LABEL_88;
        case 8u:
          v37 = 0;
          v38 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 60) |= 2u;
          while (2)
          {
            v39 = *v3;
            v40 = *(_QWORD *)(a2 + v39);
            if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
              *(_QWORD *)(a2 + v39) = v40 + 1;
              v19 |= (unint64_t)(v41 & 0x7F) << v37;
              if (v41 < 0)
              {
                v37 += 7;
                v14 = v38++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_82;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_82:
          v55 = 24;
LABEL_83:
          *(_DWORD *)(a1 + v55) = v19;
          continue;
        case 9u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 16;
LABEL_52:
          v42 = *(void **)(a1 + v30);
          *(_QWORD *)(a1 + v30) = v29;

          continue;
        case 0xAu:
          v43 = 0;
          v44 = 0;
          v45 = 0;
          *(_BYTE *)(a1 + 60) |= 0x20u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v45 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v14 = v44++ >= 9;
                if (v14)
                {
                  v45 = 0;
                  goto LABEL_87;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v45 = 0;
LABEL_87:
          v56 = v45 != 0;
          v57 = 57;
LABEL_88:
          *(_BYTE *)(a1 + v57) = v56;
          continue;
        case 0xBu:
          v49 = 0;
          v50 = 0;
          v51 = 0;
          *(_BYTE *)(a1 + 60) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v52 = *v3;
        v53 = *(_QWORD *)(a2 + v52);
        if (v53 == -1 || v53 >= *(_QWORD *)(a2 + *v4))
          break;
        v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
        *(_QWORD *)(a2 + v52) = v53 + 1;
        v51 |= (unint64_t)(v54 & 0x7F) << v49;
        if ((v54 & 0x80) == 0)
          goto LABEL_90;
        v49 += 7;
        v14 = v50++ >= 9;
        if (v14)
        {
          v51 = 0;
          goto LABEL_92;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_90:
      if (*(_BYTE *)(a2 + *v5))
        v51 = 0;
LABEL_92:
      *(_QWORD *)(a1 + 8) = v51;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A2F00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  objc_destroyWeak(v25);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_1C3A2F928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A30368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A306F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14454(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14455(uint64_t a1)
{

}

void sub_1C3A31AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a46, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A329C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A333C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A33710(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A340B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__14807(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__14808(uint64_t a1)
{

}

void sub_1C3A357EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A36034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A368C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A36CD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A37100(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A37500(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3988C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A39B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3A058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3AABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3AE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3B0E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3B5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3BA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3BEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3C30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3CAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3D38C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3D9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3E050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3EE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15153(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15154(uint64_t a1)
{

}

void sub_1C3A3F7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A3FFF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A40A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A414E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A41BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A42614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A42E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A43504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A43C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A44680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A471C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A476CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A47C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A480B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A485B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A48A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A48CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A48FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!HealthKitLibraryCore_frameworkLibrary)
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *HealthKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPMaintenance.m"), 132, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("HKHealthStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKHealthStoreClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPMaintenance.m"), 133, CFSTR("Unable to find class %s"), "HKHealthStore");

LABEL_8:
    __break(1u);
  }
  getHKHealthStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C3A49584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A498B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A4A5A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A4E22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;

  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_1C3A4E674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A4EDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15872(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15873(uint64_t a1)
{

}

void sub_1C3A50988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A50AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A50E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A512D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A51508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A51614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A5175C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A51844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A51B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15965(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15966(uint64_t a1)
{

}

void sub_1C3A53554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A55410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C3A55AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C3A55C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A56360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16503(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16504(uint64_t a1)
{

}

void sub_1C3A573FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t PPM2EngagementRatioReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  void *v51;
  uint64_t v52;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 8u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_67;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_69;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_67:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_69:
          v52 = 28;
          goto LABEL_90;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 4u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_73:
          v52 = 24;
          goto LABEL_90;
        case 3u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 2u;
          while (2)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
              *(_QWORD *)(a2 + v31) = v32 + 1;
              v19 |= (unint64_t)(v33 & 0x7F) << v29;
              if (v33 < 0)
              {
                v29 += 7;
                v14 = v30++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_77:
          v52 = 20;
          goto LABEL_90;
        case 4u:
          v34 = 0;
          v35 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 0x20u;
          while (2)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
              *(_QWORD *)(a2 + v36) = v37 + 1;
              v19 |= (unint64_t)(v38 & 0x7F) << v34;
              if (v38 < 0)
              {
                v34 += 7;
                v14 = v35++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_81;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_81:
          v52 = 44;
          goto LABEL_90;
        case 5u:
          v39 = 0;
          v40 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v19 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                v14 = v40++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_85:
          v52 = 16;
          goto LABEL_90;
        case 6u:
          PBReaderReadString();
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = 8;
          goto LABEL_65;
        case 7u:
          v46 = 0;
          v47 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 48) |= 0x10u;
          break;
        case 8u:
          PBReaderReadString();
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = 32;
LABEL_65:
          v51 = *(void **)(a1 + v45);
          *(_QWORD *)(a1 + v45) = v44;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v48 = *v3;
        v49 = *(_QWORD *)(a2 + v48);
        if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v4))
          break;
        v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
        *(_QWORD *)(a2 + v48) = v49 + 1;
        v19 |= (unint64_t)(v50 & 0x7F) << v46;
        if ((v50 & 0x80) == 0)
          goto LABEL_87;
        v46 += 7;
        v14 = v47++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_89;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_87:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_89:
      v52 = 40;
LABEL_90:
      *(_DWORD *)(a1 + v52) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPPBEvaluationRecordReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  void *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v19 += 7;
          v14 = v20++ >= 9;
          if (v14)
          {
            v21 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_33:
        *(_QWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A5D2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17038(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17039(uint64_t a1)
{

}

void sub_1C3A5DED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17185(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17186(uint64_t a1)
{

}

void PPExit(int a1)
{
  _exit(a1);
}

void sub_1C3A5F32C(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;

  if (a2)
  {
    objc_begin_catch(exception_object);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 48));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1C3A5F630(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;

  if (a2)
  {
    objc_begin_catch(exception_object);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 48));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t PPM2FrustrationEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_31;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_31;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_31:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          break;
        v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
        *(_QWORD *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0)
          goto LABEL_33;
        v20 += 7;
        v14 = v21++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_35;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_35:
      *(_DWORD *)(a1 + 32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A62364(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A625FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A62970(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A62CFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A63044(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2ExperimentDeployedReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 32) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_36:
            *(_DWORD *)(a1 + 16) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 24;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A64238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A64318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A644C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A647A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A648AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17837(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17838(uint64_t a1)
{

}

void sub_1C3A67820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C3A68FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a68;
  char a72;

  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&a72, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A698DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A6ADC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A6CFF4(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x320], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18107(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18108(uint64_t a1)
{

}

void sub_1C3A7063C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A71574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A72B10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A72D94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A72F20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C3A73074(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PPPBFeedbackMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_24;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
LABEL_24:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 4u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          while (2)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v14 = v22++ >= 9;
                if (v14)
                {
                  v23 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v23 = 0;
LABEL_42:
          *(_QWORD *)(a1 + 8) = v23;
          continue;
        case 5u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          break;
        v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
        *(_QWORD *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0)
          goto LABEL_44;
        v27 += 7;
        v14 = v28++ >= 9;
        if (v14)
        {
          v29 = 0;
          goto LABEL_46;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
      if (*(_BYTE *)(a2 + *v5))
        v29 = 0;
LABEL_46:
      *(_BYTE *)(a1 + 40) = v29 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPStorableFeedbackItemReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadString();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v23;

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_31;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_33:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A74794(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3A74758);
}

void sub_1C3A747A4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C3A75530(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A75958(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2DonationIntervalReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 24) |= 1u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_50;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_52;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_52:
          v40 = 8;
          goto LABEL_65;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 24) |= 4u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_56:
          v40 = 16;
          goto LABEL_65;
        case 3u:
          v29 = 0;
          v30 = 0;
          v31 = 0;
          *(_BYTE *)(a1 + 24) |= 8u;
          while (2)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
              *(_QWORD *)(a2 + v32) = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                v14 = v30++ >= 9;
                if (v14)
                {
                  v31 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v31 = 0;
LABEL_60:
          *(_BYTE *)(a1 + 20) = v31 != 0;
          continue;
        case 4u:
          v35 = 0;
          v36 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 24) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v37 = *v3;
        v38 = *(_QWORD *)(a2 + v37);
        if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
          break;
        v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
        *(_QWORD *)(a2 + v37) = v38 + 1;
        v19 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0)
          goto LABEL_62;
        v35 += 7;
        v14 = v36++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_64;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_62:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_64:
      v40 = 12;
LABEL_65:
      *(_DWORD *)(a1 + v40) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A7737C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C3A7812C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A78390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A78610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A78778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A78908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A78AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A78C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A78E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A78EEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A78FA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A79340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  uint64_t v46;

  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose((const void *)(v46 - 232), 8);
  _Block_object_dispose((const void *)(v46 - 184), 8);
  _Block_object_dispose((const void *)(v46 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A7963C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19200(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19201(uint64_t a1)
{

}

void sub_1C3A7C948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2ObjectsDeletedReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t result;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 4)
      {
        v24 = 0;
        v25 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v20 |= (unint64_t)(v28 & 0x7F) << v24;
          if ((v28 & 0x80) == 0)
            goto LABEL_49;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_51:
        v36 = 12;
      }
      else
      {
        if ((_DWORD)v17 == 3)
        {
          v29 = 0;
          v30 = 0;
          v31 = 0;
          *(_BYTE *)(a1 + 20) |= 4u;
          while (1)
          {
            v32 = *v3;
            v33 = *(_QWORD *)(a2 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
              break;
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if ((v34 & 0x80) == 0)
              goto LABEL_54;
            v29 += 7;
            v14 = v30++ >= 9;
            if (v14)
            {
              v31 = 0;
              goto LABEL_56;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
          if (*(_BYTE *)(a2 + *v5))
            v31 = 0;
LABEL_56:
          *(_BYTE *)(a1 + 16) = v31 != 0;
          continue;
        }
        if ((_DWORD)v17 != 2)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
        }
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_45;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_47;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_47:
        v36 = 8;
      }
      *(_DWORD *)(a1 + v36) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A7F4F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19681(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19682(uint64_t a1)
{

}

void sub_1C3A7F878(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;

  if (a2)
  {
    objc_begin_catch(exception_object);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 40));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1C3A7F9F0(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3A7F9B4);
}

void sub_1C3A7FA04(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void PPPostNotification(const char *a1)
{
  uint32_t v2;
  uint32_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = notify_post(a1);
  if (v2)
  {
    v3 = v2;
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = a1;
      v7 = 2048;
      v8 = v3;
      _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "PPNotifications failed to post notification %s: error %lu", (uint8_t *)&v5, 0x16u);
    }

  }
}

void sub_1C3A7FBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A7FF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getHKAnchoredObjectQueryClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  HealthKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKAnchoredObjectQuery");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKAnchoredObjectQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKAnchoredObjectQueryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPHealthKitImporter.m"), 31, CFSTR("Unable to find class %s"), "HKAnchoredObjectQuery");

    __break(1u);
  }
}

void __getHKObjectTypeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  HealthKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKObjectType");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKObjectTypeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKObjectTypeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPHealthKitImporter.m"), 32, CFSTR("Unable to find class %s"), "HKObjectType");

    __break(1u);
  }
}

void sub_1C3A813B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a19 + 40));
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__20004(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20005(uint64_t a1)
{

}

void sub_1C3A8177C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getHKQueryAnchorClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  HealthKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKQueryAnchor");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKQueryAnchorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKQueryAnchorClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPHealthKitImporter.m"), 33, CFSTR("Unable to find class %s"), "HKQueryAnchor");

    __break(1u);
  }
}

void HealthKitLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!HealthKitLibraryCore_frameworkLibrary_20007)
    HealthKitLibraryCore_frameworkLibrary_20007 = _sl_dlopen();
  if (!HealthKitLibraryCore_frameworkLibrary_20007)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *HealthKitLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PPHealthKitImporter.m"), 29, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getHKHealthStoreClass_block_invoke_20015(uint64_t a1)
{
  void *v2;
  void *v3;

  HealthKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HKHealthStore");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass_20014 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKHealthStoreClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PPHealthKitImporter.m"), 30, CFSTR("Unable to find class %s"), "HKHealthStore");

    __break(1u);
  }
}

void sub_1C3A82F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A84BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A84F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A85140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A852F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A86C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A86D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A87040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20106(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20107(uint64_t a1)
{

}

void sub_1C3A8A5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _nowPlayingInfoCallback(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  uint8_t v6[16];

  pp_entities_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEBUG, "PPMediaPlayerDelegate: _nowPlayingInfoCallback was called!", v6, 2u);
  }

  v4 = a2;
  objc_sync_enter(v4);
  objc_msgSend(v4, "getResponse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processResponse:", v5);

  objc_sync_exit(v4);
}

void sub_1C3A8CA90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PPPBFeedbackItemReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3A8F3F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  id *v22;
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_1C3A90CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C3A90EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A911B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A91870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A91C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21335(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21336(uint64_t a1)
{

}

void sub_1C3A92A70(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1C3A92A3CLL);
}

void sub_1C3A92A7C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C3A9353C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A93770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A93B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3A93C1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A93CD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21499(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21500(uint64_t a1)
{

}

void sub_1C3A951AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1C3A9772C(_Unwind_Exception *exception_object, int a2)
{
  unsigned __int8 *v2;

  if (a2)
  {
    objc_begin_catch(exception_object);
    atomic_store(0, v2);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1C3A9C3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C3AA186C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA1934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA19FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA1AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA1B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA1C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA1E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA1EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA23D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA252C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA25D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA273C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA27E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA294C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA29F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA2F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA302C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA30D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA32CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA341C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA34C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA36AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA37F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA38A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA39E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA3FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA41DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA43C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA446C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA45BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA47DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA492C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA49D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA4F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA5040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA50E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA5188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA5234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA52E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA538C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA5430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA54DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA5580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA5624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AA571C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22184(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22185(uint64_t a1)
{

}

uint64_t PPM2PositivePersonalizationEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_31;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_31;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
LABEL_31:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
          break;
        v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
        *(_QWORD *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0)
          goto LABEL_33;
        v20 += 7;
        v14 = v21++ >= 9;
        if (v14)
        {
          LODWORD(v22) = 0;
          goto LABEL_35;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_35:
      *(_DWORD *)(a1 + 32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PPPBExperimentalGroupReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 16;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 8;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void PPSetSuggestionsURLServiceFactoryForTesting(void *a1)
{
  id v1;

  v1 = a1;
  __assert_rtn("PPSetSuggestionsURLServiceFactoryForTesting", "PPFoundInAppsSupport.m", 50, "0");
}

id PPNewSuggestionsURLService()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSGSuggestionsServiceClass_softClass;
  v7 = getSGSuggestionsServiceClass_softClass;
  if (!getSGSuggestionsServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSGSuggestionsServiceClass_block_invoke;
    v3[3] = &unk_1E7E1F798;
    v3[4] = &v4;
    __getSGSuggestionsServiceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  objc_msgSend(v1, "serviceForURLs");
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1C3AA74AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSGSuggestionsServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreSuggestionsLibraryCore_frameworkLibrary_22708)
    CoreSuggestionsLibraryCore_frameworkLibrary_22708 = _sl_dlopen();
  if (!CoreSuggestionsLibraryCore_frameworkLibrary_22708)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSuggestionsLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPFoundInAppsSupport.m"), 19, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SGSuggestionsService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSGSuggestionsServiceClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PPFoundInAppsSupport.m"), 20, CFSTR("Unable to find class %s"), "SGSuggestionsService");

LABEL_8:
    __break(1u);
  }
  getSGSuggestionsServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PPSharedSuggestionsURLService()
{
  if (PPSharedSuggestionsURLService__pasOnceToken2 != -1)
    dispatch_once(&PPSharedSuggestionsURLService__pasOnceToken2, &__block_literal_global_22721);
  return (id)PPSharedSuggestionsURLService__pasExprOnceResult;
}

uint64_t PPPBContactReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  PPPBLabeledString *v20;
  uint64_t v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  void *v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 56;
        goto LABEL_54;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 48;
        goto LABEL_54;
      case 3u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 64;
        goto LABEL_54;
      case 4u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_54;
      case 5u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 88;
        goto LABEL_54;
      case 6u:
        v20 = objc_alloc_init(PPPBLabeledString);
        objc_msgSend((id)a1, "addPhoneNumbers:", v20);
        goto LABEL_28;
      case 7u:
        v20 = objc_alloc_init(PPPBLabeledString);
        objc_msgSend((id)a1, "addEmailAddresses:", v20);
LABEL_28:
        if (!PBReaderPlaceMark() || !PPPBLabeledStringReadFrom((uint64_t)v20, a2))
          goto LABEL_73;
        goto LABEL_42;
      case 8u:
        v20 = objc_alloc_init(PPPBLabeledPostalAddress);
        objc_msgSend((id)a1, "addPostalAddresses:", v20);
        if (!PBReaderPlaceMark() || !PPPBLabeledPostalAddressReadFrom((uint64_t)v20, a2))
          goto LABEL_73;
        goto LABEL_42;
      case 9u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 104;
        goto LABEL_54;
      case 0xAu:
        v20 = objc_alloc_init(PPPBDateComponents);
        v21 = 16;
        goto LABEL_37;
      case 0xBu:
        v20 = objc_alloc_init(PPPBDateComponents);
        v21 = 96;
LABEL_37:
        objc_storeStrong((id *)(a1 + v21), v20);
        if (!PBReaderPlaceMark() || (PPPBDateComponentsReadFrom((uint64_t)v20, a2) & 1) == 0)
          goto LABEL_73;
        goto LABEL_42;
      case 0xCu:
        v20 = objc_alloc_init(PPPBLabeledSocialProfile);
        objc_msgSend((id)a1, "addSocialProfiles:", v20);
        if (PBReaderPlaceMark() && PPPBLabeledSocialProfileReadFrom((uint64_t)v20, a2))
        {
LABEL_42:
          PBReaderRecallMark();

LABEL_55:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_73:

        return 0;
      case 0xDu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 72;
        goto LABEL_54;
      case 0xEu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 80;
        goto LABEL_54;
      case 0xFu:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 152) |= 2u;
        while (2)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              v14 = v23++ >= 9;
              if (v14)
              {
                LODWORD(v24) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v24) = 0;
LABEL_67:
        *(_DWORD *)(a1 + 24) = v24;
        goto LABEL_55;
      case 0x10u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 144;
        goto LABEL_54;
      case 0x11u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 136;
LABEL_54:
        v28 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_55;
      case 0x12u:
        v29 = 0;
        v30 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 152) |= 1u;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              v14 = v30++ >= 9;
              if (v14)
              {
                v31 = 0;
                goto LABEL_71;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v31 = 0;
LABEL_71:
        *(_QWORD *)(a1 + 8) = v31;
        goto LABEL_55;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_55;
    }
  }
}

void sub_1C3AAC41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PPM2LogEventOccurredReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL PPPBLabeledStringReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PPPBContactNameRecordCacheReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  PPPBContactNameRecord *v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            v20 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_35:
        *(_QWORD *)(a1 + 8) = v20;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(PPPBContactNameRecord);
        objc_msgSend((id)a1, "addRecords:", v17);
        if (!PBReaderPlaceMark() || (PPPBContactNameRecordReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3AB06FC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2F8], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23441(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23442(uint64_t a1)
{

}

uint64_t PPM2UserCreatedMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 28) |= 4u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_44;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_46;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_46:
          v36 = 24;
          goto LABEL_55;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 28) |= 1u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_50:
          v36 = 16;
          goto LABEL_55;
        case 3u:
          v29 = 0;
          v30 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 28) |= 2u;
          break;
        case 4u:
          PBReaderReadString();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = *(void **)(a1 + 8);
          *(_QWORD *)(a1 + 8) = v34;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v31 = *v3;
        v32 = *(_QWORD *)(a2 + v31);
        if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
          break;
        v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
        *(_QWORD *)(a2 + v31) = v32 + 1;
        v19 |= (unint64_t)(v33 & 0x7F) << v29;
        if ((v33 & 0x80) == 0)
          goto LABEL_52;
        v29 += 7;
        v14 = v30++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_54;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_54:
      v36 = 20;
LABEL_55:
      *(_DWORD *)(a1 + v36) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1C3AB25C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C3AB36B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose((const void *)(v9 - 160), 8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AB3E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 224), 8);
  _Block_object_dispose((const void *)(v32 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1C3AB3FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AB4068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AB4130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AB41F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C3AB599C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&STACK[0x390], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23759(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23760(uint64_t a1)
{

}

uint64_t sub_1C3AB7E88()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1C3AB7E94()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1C3AB7EA0()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1C3AB7EAC()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1C3AB7EB8()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1C3AB7EC4()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1C3AB7ED0()
{
  return MEMORY[0x1E0CB0B28]();
}

uint64_t sub_1C3AB7EDC()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1C3AB7EE8()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1C3AB7EF4()
{
  return MEMORY[0x1E0CB1268]();
}

uint64_t sub_1C3AB7F00()
{
  return MEMORY[0x1E0CB12A8]();
}

uint64_t sub_1C3AB7F0C()
{
  return MEMORY[0x1E0CB12C0]();
}

uint64_t sub_1C3AB7F18()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_1C3AB7F24()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C3AB7F30()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1C3AB7F3C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C3AB7F48()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1C3AB7F54()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1C3AB7F60()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C3AB7F6C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C3AB7F78()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1C3AB7F84()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1C3AB7F90()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C3AB7F9C()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1C3AB7FA8()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1C3AB7FB4()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C3AB7FC0()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C3AB7FCC()
{
  return MEMORY[0x1E0DEA8F8]();
}

uint64_t sub_1C3AB7FD8()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1C3AB7FE4()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1C3AB7FF0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1C3AB7FFC()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1C3AB8008()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1C3AB8014()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1C3AB8020()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1C3AB802C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1C3AB8038()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1C3AB8044()
{
  return MEMORY[0x1E0CB1B68]();
}

uint64_t sub_1C3AB8050()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1C3AB805C()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1C3AB8068()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1C3AB8074()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1C3AB8080()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1C3AB808C()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1C3AB8098()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C3AB80A4()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1C3AB80B0()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C3AB80BC()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1C3AB80C8()
{
  return MEMORY[0x1E0CB23E0]();
}

uint64_t sub_1C3AB80D4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C3AB80E0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C3AB80EC()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1C3AB80F8()
{
  return MEMORY[0x1E0DEBFC8]();
}

uint64_t sub_1C3AB8104()
{
  return MEMORY[0x1E0DEBFD8]();
}

uint64_t sub_1C3AB8110()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1C3AB811C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1C3AB8128()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C3AB8134()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C3AB8140()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C3AB814C()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1C3AB8158()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C3AB8164()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1C3AB8170()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1C3AB817C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1C3AB8188()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1C3AB8194()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1C3AB81A0()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C3AB81AC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C3AB81B8()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C3AB81C4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C3AB81D0()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1C3AB81DC()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1C3AB81E8()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C3AB81F4()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C3AB8200()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C3AB820C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C3AB8218()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C3AB8224()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C3AB8230()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFBitVectorRef CFBitVectorCreateCopy(CFAllocatorRef allocator, CFBitVectorRef bv)
{
  return (CFBitVectorRef)MEMORY[0x1E0C97F60](allocator, bv);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1E0C97F68](allocator, capacity);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x1E0C97F78](bv, idx);
}

CFIndex CFBitVectorGetCount(CFBitVectorRef bv)
{
  return MEMORY[0x1E0C97F88](bv);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
  MEMORY[0x1E0C97FB0](bv, idx, *(_QWORD *)&value);
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
  MEMORY[0x1E0C97FC0](bv, count);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C987F0]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D71058]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D71068]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98FA0](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
  MEMORY[0x1E0C99078](theString, theFlags, theLocale);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x1E0C991D8](theString, theForm);
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
  MEMORY[0x1E0C99200](theString, chars, length, capacity);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1E0C9E300]((__n128)coord, *(__n128 *)&coord.longitude);
}

uint64_t DDResultGetCategory()
{
  return MEMORY[0x1E0D1CC90]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x1E0D1CCD0]();
}

uint64_t DDResultGetSubResults()
{
  return MEMORY[0x1E0D1CCF0]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x1E0D1CD00]();
}

uint64_t DDResultGetValue()
{
  return MEMORY[0x1E0D1CD08]();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x1E0D1CDA8]();
}

uint64_t DDScannerCreate()
{
  return MEMORY[0x1E0D1CDB0]();
}

uint64_t DDScannerScanStringWithRange()
{
  return MEMORY[0x1E0D1CDF0]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackState()
{
  return MEMORY[0x1E0D4BF18]();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueSync()
{
  return MEMORY[0x1E0D4C0A8]();
}

uint64_t MRMediaRemoteSetWantsNowPlayingNotifications()
{
  return MEMORY[0x1E0D4C180]();
}

uint64_t MRPlaybackQueueRequestCreateDefault()
{
  return MEMORY[0x1E0D4C280]();
}

uint64_t NLGazetteerCreate()
{
  return MEMORY[0x1E0D17070]();
}

uint64_t NLTaggerCopyTagForCurrentToken()
{
  return MEMORY[0x1E0D17248]();
}

uint64_t NLTaggerCreate()
{
  return MEMORY[0x1E0D17250]();
}

uint64_t NLTaggerEnumerateTokens()
{
  return MEMORY[0x1E0D17258]();
}

uint64_t NLTaggerSetGazetteers()
{
  return MEMORY[0x1E0D17268]();
}

uint64_t NLTaggerSetString()
{
  return MEMORY[0x1E0D17278]();
}

uint64_t NLTokenizerCreate()
{
  return MEMORY[0x1E0D17298]();
}

uint64_t NLTokenizerEnumerateTokens()
{
  return MEMORY[0x1E0D172A0]();
}

uint64_t NLTokenizerRelease()
{
  return MEMORY[0x1E0D172C8]();
}

uint64_t NLTokenizerSetString()
{
  return MEMORY[0x1E0D172D8]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1E0CB2FE8]();
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x1E0CB3170](bytes);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1E0D82C50]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t PPCollapseWhitespaceAndStrip()
{
  return MEMORY[0x1E0D70D08]();
}

uint64_t PPNewCNContactStore()
{
  return MEMORY[0x1E0D70D20]();
}

uint64_t PPNewEKEventStore()
{
  return MEMORY[0x1E0D70D28]();
}

uint64_t PPNextMidnight()
{
  return MEMORY[0x1E0D70D30]();
}

uint64_t PPSharedCNContactStore()
{
  return MEMORY[0x1E0D70D38]();
}

uint64_t PPSharedSuggestionsContactService()
{
  return MEMORY[0x1E0D70D40]();
}

uint64_t PPStringAllWhiteSpace()
{
  return MEMORY[0x1E0D70D48]();
}

uint64_t PPStringIsWellFormed()
{
  return MEMORY[0x1E0D70D50]();
}

uint64_t PPStringLooksLikeNumber()
{
  return MEMORY[0x1E0D70D58]();
}

uint64_t SGPostalAddressParse()
{
  return MEMORY[0x1E0D19EB0]();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return MEMORY[0x1E0DB0FA0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _PASBytesToHex()
{
  return MEMORY[0x1E0D81668]();
}

uint64_t _PASCollapseWhitespaceAndStrip()
{
  return MEMORY[0x1E0D81670]();
}

uint64_t _PASEvaluateLogFaultAndProbCrashCriteria()
{
  return MEMORY[0x1E0D816A0]();
}

uint64_t _PASInsensitiveStringContainsString()
{
  return MEMORY[0x1E0D816D0]();
}

uint64_t _PASMurmur3_x86_32()
{
  return MEMORY[0x1E0D81728]();
}

uint64_t _PASRemoveCharacterSet()
{
  return MEMORY[0x1E0D81748]();
}

uint64_t _PASTrimTrailingWhitespace()
{
  return MEMORY[0x1E0D81798]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return MEMORY[0x1E0DE4AE8]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E7E133C0(__p);
}

uint64_t operator delete()
{
  return off_1E7E133C8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E7E133D0(__sz);
}

uint64_t operator new()
{
  return off_1E7E133D8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _exit(int a1)
{
  MEMORY[0x1E0C80F80](*(_QWORD *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1E0C81678](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int cblas_icamax(const int __N, const void *__X, const int __incX)
{
  return MEMORY[0x1E0C8BBA0](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
}

float cblas_sasum(const int __N, const float *__X, const int __incX)
{
  float result;

  MEMORY[0x1E0C8BBB0](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
  return result;
}

void cblas_sgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const float __alpha, const float *__A, const int __lda, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
  MEMORY[0x1E0C8BC20](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__M, *(_QWORD *)&__N, __A, *(_QWORD *)&__lda, __X, *(_QWORD *)&__incX, __alpha, __beta);
}

float cblas_snrm2(const int __N, const float *__X, const int __incX)
{
  float result;

  MEMORY[0x1E0C8BC48](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
  return result;
}

void cblas_sscal(const int __N, const float __alpha, float *__X, const int __incX)
{
  MEMORY[0x1E0C8BC60](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __alpha);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

void dispatch_block_notify(dispatch_block_t block, dispatch_queue_t queue, dispatch_block_t notification_block)
{
  MEMORY[0x1E0C82C80](block, queue, notification_block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

uint64_t pp_connections_log_handle()
{
  return MEMORY[0x1E0D70F38]();
}

uint64_t pp_connections_signpost_handle()
{
  return MEMORY[0x1E0D70F40]();
}

uint64_t pp_contacts_log_handle()
{
  return MEMORY[0x1E0D70F48]();
}

uint64_t pp_contacts_signpost_handle()
{
  return MEMORY[0x1E0D70F50]();
}

uint64_t pp_default_log_handle()
{
  return MEMORY[0x1E0D70F58]();
}

uint64_t pp_default_signpost_handle()
{
  return MEMORY[0x1E0D70F60]();
}

uint64_t pp_entities_log_handle()
{
  return MEMORY[0x1E0D70F68]();
}

uint64_t pp_entities_signpost_handle()
{
  return MEMORY[0x1E0D70F70]();
}

uint64_t pp_events_log_handle()
{
  return MEMORY[0x1E0D70F78]();
}

uint64_t pp_events_signpost_handle()
{
  return MEMORY[0x1E0D70F80]();
}

uint64_t pp_locations_log_handle()
{
  return MEMORY[0x1E0D70F88]();
}

uint64_t pp_locations_signpost_handle()
{
  return MEMORY[0x1E0D70F90]();
}

uint64_t pp_maintenance_signpost_handle()
{
  return MEMORY[0x1E0D70F98]();
}

uint64_t pp_private_log_handle()
{
  return MEMORY[0x1E0D70FA0]();
}

uint64_t pp_quicktype_log_handle()
{
  return MEMORY[0x1E0D70FA8]();
}

uint64_t pp_quicktype_signpost_handle()
{
  return MEMORY[0x1E0D70FB0]();
}

uint64_t pp_score_interpreter_log_handle()
{
  return MEMORY[0x1E0D70FB8]();
}

uint64_t pp_social_highlights_log_handle()
{
  return MEMORY[0x1E0D70FC0]();
}

uint64_t pp_social_highlights_signpost_handle()
{
  return MEMORY[0x1E0D70FC8]();
}

uint64_t pp_temporal_clusters_log_handle()
{
  return MEMORY[0x1E0D70FD0]();
}

uint64_t pp_temporal_clusters_signpost_handle()
{
  return MEMORY[0x1E0D70FD8]();
}

uint64_t pp_topics_log_handle()
{
  return MEMORY[0x1E0D70FE0]();
}

uint64_t pp_topics_signpost_handle()
{
  return MEMORY[0x1E0D70FE8]();
}

uint64_t pp_universal_search_log_handle()
{
  return MEMORY[0x1E0D70FF0]();
}

uint64_t pp_xpc_server_log_handle()
{
  return MEMORY[0x1E0D70FF8]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8640](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

float tanhf(float a1)
{
  float result;

  MEMORY[0x1E0C85800](a1);
  return result;
}

void vvexpf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8D9D8](a1, a2, a3);
}

void vvlog1pf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8DA68](a1, a2, a3);
}

void vvlogf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8DA98](a1, a2, a3);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

