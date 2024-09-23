@implementation ICAppDefinitionRegistry

+ (void)appDefinitionForDrafts
{
  swift_getObjCClassMetadata();
  sub_1C16570F4();
}

+ (void)appDefinitionForThings
{
  swift_getObjCClassMetadata();
  sub_1C167E5C8();
}

+ (void)appDefinitionForClear
{
  swift_getObjCClassMetadata();
  sub_1C168A418();
}

+ (void)appDefinitionForBooks
{
  swift_getObjCClassMetadata();
  sub_1C170DC40();
}

+ (void)appDefinitionForSkype
{
  swift_getObjCClassMetadata();
  sub_1C170E8F4();
}

+ (void)appDefinitionForiTranslate
{
  swift_getObjCClassMetadata();
  sub_1C170F7B4();
}

+ (void)appDefinitionForAssociate
{
  swift_getObjCClassMetadata();
  sub_1C17189FC();
}

+ (void)appDefinitionForCaptio
{
  swift_getObjCClassMetadata();
  sub_1C171A7C4();
}

+ (void)appDefinitionForLine
{
  swift_getObjCClassMetadata();
  sub_1C171BE08();
}

+ (void)appDefinitionForInstagram
{
  swift_getObjCClassMetadata();
  sub_1C171CBB4();
}

+ (void)appDefinitionForOmniFocus
{
  swift_getObjCClassMetadata();
  sub_1C171DD9C();
}

+ (void)appDefinitionForDue
{
  swift_getObjCClassMetadata();
  sub_1C17238C8();
}

+ (void)appDefinitionForFantastical2
{
  swift_getObjCClassMetadata();
  sub_1C1725D70();
}

+ (void)appDefinitionForDayOne
{
  swift_getObjCClassMetadata();
  sub_1C1729350();
}

+ (void)appDefinitionForQuotebook
{
  swift_getObjCClassMetadata();
  sub_1C172B128();
}

+ (void)appDefinitionForUlysses
{
  swift_getObjCClassMetadata();
  sub_1C172C71C();
}

+ (void)appDefinitionForEditorial
{
  swift_getObjCClassMetadata();
  sub_1C1737694();
}

+ (void)appDefinitionForTweetbot
{
  swift_getObjCClassMetadata();
  sub_1C1738F60();
}

+ (void)appDefinitionForOvercast
{
  swift_getObjCClassMetadata();
  sub_1C173C7E4();
}

+ (void)appDefinitionForGoogleChrome
{
  swift_getObjCClassMetadata();
  sub_1C173D8F0();
}

+ (void)appDefinitionForOpener
{
  swift_getObjCClassMetadata();
  sub_1C173E9E8();
}

+ (void)appDefinitionForBlink
{
  swift_getObjCClassMetadata();
  sub_1C173F99C();
}

+ (void)appDefinitionForWhatsApp
{
  swift_getObjCClassMetadata();
  sub_1C1741180();
}

+ (void)appDefinitionForPythonista
{
  swift_getObjCClassMetadata();
  sub_1C1742D1C();
}

+ (void)appDefinitionForTextTool
{
  swift_getObjCClassMetadata();
  sub_1C1744AD8();
}

+ (void)appDefinitionForSchemes
{
  swift_getObjCClassMetadata();
  sub_1C174D2C8();
}

+ (void)appDefinitionForTally
{
  swift_getObjCClassMetadata();
  sub_1C174E460();
}

+ (void)appDefinitionForTheHitList
{
  swift_getObjCClassMetadata();
  sub_1C1750A14();
}

+ (void)appDefinitionForTelegram
{
  swift_getObjCClassMetadata();
  sub_1C1753DC0();
}

+ (void)appDefinitionForBear
{
  swift_getObjCClassMetadata();
  sub_1C175518C();
}

+ (void)appDefinitionFor2Do
{
  swift_getObjCClassMetadata();
  sub_1C17B90D0();
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)_mutableRegisteredDefinitions_59854;
    _mutableRegisteredDefinitions_59854 = v2;

  }
}

+ (void)registerDefinitionForKey:(id)a3 definition:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)_mutableRegisteredDefinitions_59854;
  v6 = a3;
  v7 = _Block_copy(a4);
  objc_msgSend(v5, "setObject:forKey:", v7, v6);

}

+ (id)registeredDefinitions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "rediscoverDefinitionsIfNeeded");
  v2 = (void *)objc_msgSend((id)_mutableRegisteredDefinitions_59854, "copy");
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return v5;
}

+ (void)rediscoverDefinitionsIfNeeded
{
  if (rediscoverDefinitionsIfNeeded_onceToken_59847 != -1)
    dispatch_once(&rediscoverDefinitionsIfNeeded_onceToken_59847, &__block_literal_global_59848);
  WFCallRegistrationMethodsIfNeeded();
}

uint64_t __56__ICAppDefinitionRegistry_rediscoverDefinitionsIfNeeded__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)rediscoverDefinitionsIfNeeded_calledDefinitionVendingSelectors_59849;
  rediscoverDefinitionsIfNeeded_calledDefinitionVendingSelectors_59849 = v0;

  rediscoverDefinitionsIfNeeded_lock_59851 = 0;
  return _dyld_register_for_bulk_image_loads();
}

@end
