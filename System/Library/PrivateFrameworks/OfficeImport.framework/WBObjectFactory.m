@implementation WBObjectFactory

+ (WrdObject)create:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (+[WBObjectFactory create:]::once != -1)
    dispatch_once(&+[WBObjectFactory create:]::once, &__block_literal_global_78);
  return (WrdObject *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)s_objectFactory + 16))(s_objectFactory, v3);
}

void __26__WBObjectFactory_create___block_invoke()
{
  WrdObjectFactory *v0;

  v0 = (WrdObjectFactory *)operator new(0x10uLL);
  WrdObjectFactory::WrdObjectFactory(v0);
  s_objectFactory = (uint64_t)v0;
}

@end
