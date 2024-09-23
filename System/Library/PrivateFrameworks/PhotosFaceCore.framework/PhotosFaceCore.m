void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void PFCRectForTimePosition(uint64_t a1)
{
  CGFloat *v1;
  CGFloat *v2;
  CGFloat *v3;
  CGFloat *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect v11;

  v1 = (CGFloat *)(MEMORY[0x24BDBF090] + 8);
  v2 = (CGFloat *)(MEMORY[0x24BDBF090] + 16);
  v3 = (CGFloat *)(MEMORY[0x24BDBF090] + 24);
  v4 = (CGFloat *)((char *)&unk_243C26618 + 8 * a1 - 8);
  if ((unint64_t)(a1 - 1) > 7)
  {
    v4 = (CGFloat *)MEMORY[0x24BDBF090];
  }
  else
  {
    v3 = (CGFloat *)((char *)&unk_243C26558 + 8 * a1 - 8);
    v2 = (CGFloat *)((char *)&unk_243C26598 + 8 * a1 - 8);
    v1 = (CGFloat *)((char *)&unk_243C265D8 + 8 * a1 - 8);
  }
  v5 = *v4;
  v6 = *v1;
  v7 = *v2;
  v8 = *v3;
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, 0.00308641975, 0.00253807107);
  v9 = v10;
  v11.origin.x = v5;
  v11.origin.y = v6;
  v11.size.width = v7;
  v11.size.height = v8;
  CGRectApplyAffineTransform(v11, &v9);
}

id pfc_shuffle_log()
{
  if (pfc_shuffle_log_onceToken != -1)
    dispatch_once(&pfc_shuffle_log_onceToken, &__block_literal_global_1);
  return (id)pfc_shuffle_log___logger;
}

void __pfc_shuffle_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photosface", "shuffle");
  v1 = (void *)pfc_shuffle_log___logger;
  pfc_shuffle_log___logger = (uint64_t)v0;

}

uint64_t sub_243C25A64()
{
  sub_243C25E08();
  sub_243C25E14();
  return sub_243C25E20();
}

uint64_t sub_243C25AA8()
{
  return sub_243C25E14();
}

uint64_t sub_243C25AD0()
{
  sub_243C25E08();
  sub_243C25E14();
  return sub_243C25E20();
}

uint64_t PFCTimePosition.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 27756;
  switch(a1)
  {
    case 0:
      result = 1701736302;
      break;
    case 1:
      result = 29811;
      break;
    case 2:
      result = 25203;
      break;
    case 3:
      result = 29805;
      break;
    case 4:
      result = 25197;
      break;
    case 5:
      return result;
    case 6:
      result = 29292;
      break;
    case 7:
      result = 7631736;
      break;
    case 8:
      result = 6452088;
      break;
    default:
      result = sub_243C25DFC();
      __break(1u);
      break;
  }
  return result;
}

unint64_t sub_243C25BE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572F8970;
  if (!qword_2572F8970)
  {
    type metadata accessor for PFCTimePosition();
    result = MEMORY[0x249502FC8](&unk_243C26730, v1);
    atomic_store(result, (unint64_t *)&qword_2572F8970);
  }
  return result;
}

void type metadata accessor for PFCTimePosition()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2572F8978)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2572F8978);
  }
}

uint64_t sub_243C25C80()
{
  uint64_t *v0;

  return PFCTimePosition.description.getter(*v0);
}

BOOL sub_243C25C88(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_243C25C9C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_243C25CAC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_243C25DFC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_243C25E08()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_243C25E14()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_243C25E20()
{
  return MEMORY[0x24BEE4328]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t PHSuggestionStringWithSubtype()
{
  return MEMORY[0x24BDE38B8]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

