void sub_2479C3D2C()
{
  void *v0;
  id v1;

  v0 = (void *)sub_2479C3ED8();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  if (v1)
    qword_2576D2750 = (uint64_t)v1;
  else
    __break(1u);
}

uint64_t static String.stk_localized(_:tableName:value:comment:)()
{
  if (qword_2576D2748 != -1)
    swift_once();
  return sub_2479C3ECC();
}

uint64_t String.stk_localized.getter()
{
  if (qword_2576D2748 != -1)
    swift_once();
  return sub_2479C3ECC();
}

uint64_t sub_2479C3ECC()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_2479C3ED8()
{
  return MEMORY[0x24BDCF9E0]();
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

