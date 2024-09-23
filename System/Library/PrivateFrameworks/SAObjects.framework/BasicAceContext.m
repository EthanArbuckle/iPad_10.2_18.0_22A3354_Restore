@implementation BasicAceContext

+ (id)sharedBasicAceContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__BasicAceContext_sharedBasicAceContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED010DF0 != -1)
    dispatch_once(&qword_1ED010DF0, block);
  return (id)_MergedGlobals_0;
}

void __40__BasicAceContext_sharedBasicAceContext__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = (uint64_t)v1;

}

- (void)registerGroupAcronym:(id)a3 forGroupWithIdentifier:(id)a4
{
  +[SAClassRegistry registerAcronym:forGroupWithIdentifier:](SAClassRegistry, "registerAcronym:forGroupWithIdentifier:", a3, a4);
}

- (Class)classWithClassName:(id)a3 group:(id)a4
{
  return +[SAClassRegistry classForAceClassName:inGroupWithIdentifier:](SAClassRegistry, "classForAceClassName:inGroupWithIdentifier:", a3, a4);
}

- (id)aceObjectWithDictionary:(id)a3
{
  return +[AceObject aceObjectWithDictionary:](AceObject, "aceObjectWithDictionary:", a3);
}

@end
