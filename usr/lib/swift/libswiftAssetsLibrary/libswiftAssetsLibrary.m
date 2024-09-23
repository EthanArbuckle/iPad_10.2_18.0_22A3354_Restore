void ALAssetsLibrary.enumerateGroupsWithTypes(_:usingBlock:failureBlock:)(unsigned int a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v5;
  void *v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v7 = a4;
  v9 = MEMORY[0x24BDAC760];
  if (a2)
  {
    v16 = a2;
    v17 = a3;
    v12 = MEMORY[0x24BDAC760];
    v13 = 1107296256;
    v14 = sub_2218D0DCC;
    v15 = &block_descriptor_3;
    v10 = _Block_copy(&v12);
    swift_retain();
    swift_release();
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  v10 = 0;
  if (a4)
  {
LABEL_3:
    v16 = v7;
    v17 = a5;
    v12 = v9;
    v13 = 1107296256;
    v14 = sub_2218D0E2C;
    v15 = &block_descriptor;
    v7 = _Block_copy(&v12);
    swift_retain();
    swift_release();
  }
LABEL_4:
  if (a1 == -1)
    v11 = 63;
  else
    v11 = a1;
  objc_msgSend(v5, sel_enumerateGroupsWithTypes_usingBlock_failureBlock_, v11, v10, v7);
  _Block_release(v7);
  _Block_release(v10);
}

void sub_2218D0DCC(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(void *, uint64_t);
  id v6;

  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  v6 = a2;
  v5(a2, a3);
  swift_release();

}

void sub_2218D0E2C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

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

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

