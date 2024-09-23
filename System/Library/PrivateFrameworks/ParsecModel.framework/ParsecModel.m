uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A17134](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

unint64_t OUTLINED_FUNCTION_0()
{
  return 0xD000000000000013;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_217DC8650();
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return sub_217DC8650();
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

id OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, (SEL)(v3 + 1864), v1, a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A17128]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void static PAREntity.createRequest()()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E85C70);
  (*(void (**)(uint64_t, uint64_t))(v0 + 16))(v1, v0);
  sub_217DC54AC();
  OUTLINED_FUNCTION_2();
}

id sub_217DC54AC()
{
  id v0;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_217DC716C();
}

void static PAREntity.createGenericRequest()(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;

  (*(void (**)(void))(a2 + 16))();
  v2 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v3 = (void *)sub_217DC8650();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_initWithEntityName_, v3);

  OUTLINED_FUNCTION_2();
}

uint64_t static PAREvent.timestampKeyPath.getter()
{
  return 0x6D617473656D6974;
}

id PAREvent.init(entity:insertInto:)()
{
  return sub_217DC6C40();
}

uint64_t type metadata accessor for PAREvent()
{
  return objc_opt_self();
}

id PAREvent.__deallocating_deinit()
{
  return sub_217DC6D08(type metadata accessor for PAREvent);
}

uint64_t sub_217DC5610@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PAREvent();
  result = sub_217DC868C();
  *a1 = result;
  return result;
}

id sub_217DC5650@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_type);
  *a2 = (_DWORD)result;
  return result;
}

id sub_217DC5680(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

void static PARFlushEvent.entityName.getter()
{
  OUTLINED_FUNCTION_1();
}

id PARFlushEvent.init(entity:insertInto:)()
{
  return sub_217DC6C40();
}

uint64_t type metadata accessor for PARFlushEvent()
{
  return objc_opt_self();
}

id PARFlushEvent.__deallocating_deinit()
{
  return sub_217DC6D08(type metadata accessor for PARFlushEvent);
}

uint64_t sub_217DC5730()
{
  return 0x6873756C46524150;
}

id sub_217DC5754()
{
  id *v0;

  return objc_msgSend(*v0, sel_type);
}

id sub_217DC5764@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_clientIntVal);
  *a2 = (_DWORD)result;
  return result;
}

id sub_217DC5794(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setClientIntVal_, *a1);
}

id sub_217DC57A8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_invokedDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_217DC57D8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setInvokedDays_, *a1);
}

id sub_217DC57EC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_zkwEngagedDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_217DC581C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setZkwEngagedDays_, *a1);
}

id sub_217DC5830@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_searchedDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_217DC5860(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSearchedDays_, *a1);
}

id sub_217DC5874@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_suggestionOrAppleResultEngagedDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_217DC58A4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSuggestionOrAppleResultEngagedDays_, *a1);
}

id sub_217DC58B8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_webEngagedDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_217DC58E8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setWebEngagedDays_, *a1);
}

id sub_217DC58FC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_voiceSearchDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_217DC592C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVoiceSearchDays_, *a1);
}

id sub_217DC5940@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_numSearchEngagements);
  *a2 = (_DWORD)result;
  return result;
}

id sub_217DC5970(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNumSearchEngagements_, *a1);
}

id sub_217DC5984@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_activeDays);
  *a2 = (_BYTE)result;
  return result;
}

id sub_217DC59B4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setActiveDays_, *a1);
}

void static PARUsageEvent.entityName.getter()
{
  OUTLINED_FUNCTION_1();
}

uint64_t static PARUsageEvent.clientSearchKeyPath.getter()
{
  return 0x6E49746E65696C63;
}

id PARUsageEvent.init(entity:insertInto:)()
{
  return sub_217DC6C40();
}

uint64_t type metadata accessor for PARUsageEvent()
{
  return objc_opt_self();
}

id PARUsageEvent.__deallocating_deinit()
{
  return sub_217DC6D08(type metadata accessor for PARUsageEvent);
}

uint64_t sub_217DC5A80()
{
  return 0x6567617355524150;
}

id sub_217DC5AA4()
{
  id *v0;

  return objc_msgSend(*v0, sel_clientIntVal);
}

id sub_217DC5AB4()
{
  id *v0;

  return objc_msgSend(*v0, sel_invokedDays);
}

id sub_217DC5AD4()
{
  id *v0;

  return objc_msgSend(*v0, sel_zkwEngagedDays);
}

id sub_217DC5AF4()
{
  id *v0;

  return objc_msgSend(*v0, sel_searchedDays);
}

id sub_217DC5B14()
{
  id *v0;

  return objc_msgSend(*v0, sel_suggestionOrAppleResultEngagedDays);
}

id sub_217DC5B34()
{
  id *v0;

  return objc_msgSend(*v0, sel_webEngagedDays);
}

id sub_217DC5B54()
{
  id *v0;

  return objc_msgSend(*v0, sel_voiceSearchDays);
}

id sub_217DC5B74()
{
  id *v0;

  return objc_msgSend(*v0, sel_numSearchEngagements);
}

id sub_217DC5B84()
{
  id *v0;

  return objc_msgSend(*v0, sel_activeDays);
}

id sub_217DC5BA4@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_client);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC5BD4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setClient_, *a1);
}

id sub_217DC5BE8@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_go);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC5C18(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGo_, *a1);
}

id sub_217DC5C2C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isSuggestion);
  *a2 = (_BYTE)result;
  return result;
}

id sub_217DC5C5C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsSuggestion_, *a1);
}

id sub_217DC5C70@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isTopHit);
  *a2 = (_BYTE)result;
  return result;
}

id sub_217DC5CA0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsTopHit_, *a1);
}

id sub_217DC5CB4@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_tap);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC5CE4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTap_, *a1);
}

unint64_t static PARSessionEngagementsByTrigger.entityName.getter()
{
  return 0xD00000000000001ELL;
}

id PARSessionEngagementsByTrigger.init(entity:insertInto:)()
{
  return sub_217DC6C40();
}

uint64_t type metadata accessor for PARSessionEngagementsByTrigger()
{
  return objc_opt_self();
}

id PARSessionEngagementsByTrigger.__deallocating_deinit()
{
  return sub_217DC6D08(type metadata accessor for PARSessionEngagementsByTrigger);
}

uint64_t sub_217DC5D98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PARSessionEngagementsByTrigger();
  result = sub_217DC868C();
  *a1 = result;
  return result;
}

unint64_t sub_217DC5DD4()
{
  static PARSessionEngagementsByTrigger.entityName.getter();
  return 0xD00000000000001ELL;
}

id sub_217DC5DF0()
{
  id *v0;

  return objc_msgSend(*v0, sel_client);
}

id sub_217DC5E10()
{
  id *v0;

  return objc_msgSend(*v0, sel_go);
}

id sub_217DC5E30()
{
  id *v0;

  return objc_msgSend(*v0, sel_isSuggestion);
}

id sub_217DC5E50()
{
  id *v0;

  return objc_msgSend(*v0, sel_isTopHit);
}

id sub_217DC5E70()
{
  id *v0;

  return objc_msgSend(*v0, sel_tap);
}

id sub_217DC5E90@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_image);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC5EC0(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setImage_, *a1);
}

id sub_217DC5ED4@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_other);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC5F04(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOther_, *a1);
}

id sub_217DC5F18@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_querySuggestion);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC5F48(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setQuerySuggestion_, *a1);
}

id sub_217DC5F5C@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_recentResult);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC5F8C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setRecentResult_, *a1);
}

id sub_217DC5FA0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_zkw);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC5FD0(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setZkw_, *a1);
}

unint64_t static PARImagesPropensity.entityName.getter()
{
  return OUTLINED_FUNCTION_0();
}

id PARImagesPropensity.init(entity:insertInto:)()
{
  return sub_217DC6C40();
}

uint64_t type metadata accessor for PARImagesPropensity()
{
  return objc_opt_self();
}

id PARImagesPropensity.__deallocating_deinit()
{
  return sub_217DC6D08(type metadata accessor for PARImagesPropensity);
}

uint64_t sub_217DC6074@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PARImagesPropensity();
  result = sub_217DC868C();
  *a1 = result;
  return result;
}

unint64_t sub_217DC60B0()
{
  static PARImagesPropensity.entityName.getter();
  return 0xD000000000000013;
}

id sub_217DC60CC()
{
  id *v0;

  return objc_msgSend(*v0, sel_image);
}

id sub_217DC60EC()
{
  id *v0;

  return objc_msgSend(*v0, sel_other);
}

id sub_217DC610C()
{
  id *v0;

  return objc_msgSend(*v0, sel_querySuggestion);
}

id sub_217DC612C()
{
  id *v0;

  return objc_msgSend(*v0, sel_recentResult);
}

id sub_217DC614C()
{
  id *v0;

  return objc_msgSend(*v0, sel_zkw);
}

id sub_217DC616C@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_goToSite);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC619C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGoToSite_, *a1);
}

id sub_217DC61B0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_localGoto);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC61E0(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLocalGoto_, *a1);
}

id sub_217DC61F4@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_localTap);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6224(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLocalTap_, *a1);
}

id sub_217DC6238@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsecAppStore);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6268(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecAppStore_, *a1);
}

id sub_217DC627C@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsecGoto);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC62AC(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecGoto_, *a1);
}

id sub_217DC62C0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsecMaps);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC62F0(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecMaps_, *a1);
}

id sub_217DC6304@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsecNews);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6334(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecNews_, *a1);
}

id sub_217DC6348@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsecOther);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6378(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecOther_, *a1);
}

id sub_217DC638C@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsecStocks);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC63BC(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecStocks_, *a1);
}

id sub_217DC63D0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsecTap);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6400(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecTap_, *a1);
}

id sub_217DC6414@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsecWeather);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6444(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecWeather_, *a1);
}

id sub_217DC6458@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsecWeb);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6488(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecWeb_, *a1);
}

id sub_217DC649C@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsecWiki);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC64CC(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsecWiki_, *a1);
}

id sub_217DC64E0@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_thirdPartyCompletionOrRecentSearch);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6510(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setThirdPartyCompletionOrRecentSearch_, *a1);
}

id sub_217DC6524@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_thirdPartyGoto);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6554(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setThirdPartyGoto_, *a1);
}

id sub_217DC6568@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_thirdPartyTap);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6598(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setThirdPartyTap_, *a1);
}

unint64_t static PARSafariPropensity.entityName.getter()
{
  return OUTLINED_FUNCTION_0();
}

id PARSafariPropensity.init(entity:insertInto:)()
{
  return sub_217DC6C40();
}

uint64_t type metadata accessor for PARSafariPropensity()
{
  return objc_opt_self();
}

id PARSafariPropensity.__deallocating_deinit()
{
  return sub_217DC6D08(type metadata accessor for PARSafariPropensity);
}

uint64_t sub_217DC663C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PARSafariPropensity();
  result = sub_217DC868C();
  *a1 = result;
  return result;
}

unint64_t sub_217DC6678()
{
  static PARSafariPropensity.entityName.getter();
  return 0xD000000000000013;
}

id sub_217DC6694()
{
  id *v0;

  return objc_msgSend(*v0, sel_goToSite);
}

id sub_217DC66B4()
{
  id *v0;

  return objc_msgSend(*v0, sel_localGoto);
}

id sub_217DC66D4()
{
  id *v0;

  return objc_msgSend(*v0, sel_localTap);
}

id sub_217DC66F4()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsecGoto);
}

id sub_217DC6714()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsecTap);
}

id sub_217DC6734()
{
  id *v0;

  return objc_msgSend(*v0, sel_thirdPartyCompletionOrRecentSearch);
}

id sub_217DC6754()
{
  id *v0;

  return objc_msgSend(*v0, sel_thirdPartyGoto);
}

id sub_217DC6774()
{
  id *v0;

  return objc_msgSend(*v0, sel_thirdPartyTap);
}

id sub_217DC6794()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsecWeb);
}

id sub_217DC67B4()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsecAppStore);
}

id sub_217DC67D4()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsecMaps);
}

id sub_217DC67F4()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsecWiki);
}

id sub_217DC6814()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsecNews);
}

id sub_217DC6834()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsecStocks);
}

id sub_217DC6854()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsecWeather);
}

id sub_217DC6874()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsecOther);
}

id sub_217DC6894@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_appLaunch);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC68C4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAppLaunch_, *a1);
}

id sub_217DC68D8@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_onDeviceAddressBookData);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6908(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOnDeviceAddressBookData_, *a1);
}

id sub_217DC691C@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_onDeviceOtherPersonalData);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC694C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setOnDeviceOtherPersonalData_, *a1);
}

id sub_217DC6960@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_parsec);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6990(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setParsec_, *a1);
}

id sub_217DC69A4@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_punchout);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC69D4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPunchout_, *a1);
}

id sub_217DC69E8@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_siriSuggestions);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6A18(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSiriSuggestions_, *a1);
}

id sub_217DC6A2C@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_thirdPartyInAppContent);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6A5C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setThirdPartyInAppContent_, *a1);
}

uint64_t sub_217DC6A70(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (objc_msgSend(*a1, sel_timestamp))
  {
    OUTLINED_FUNCTION_6();

  }
  OUTLINED_FUNCTION_4();
  v2 = OUTLINED_FUNCTION_7();
  return OUTLINED_FUNCTION_3(v2, v3, v4, v5);
}

void sub_217DC6AC0()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254F25CE0);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_217DC7118(v1, (uint64_t)v3);
  v4 = *v0;
  v5 = OUTLINED_FUNCTION_4();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v5) != 1)
  {
    v6 = (void *)sub_217DC862C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  }
  objc_msgSend(v4, sel_setTimestamp_, v6);

}

id sub_217DC6B88@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_webSuggestions);
  *a2 = (_WORD)result;
  return result;
}

id sub_217DC6BB8(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setWebSuggestions_, *a1);
}

unint64_t static PARSpotlightPropensity.entityName.getter()
{
  return 0xD000000000000016;
}

void _s11ParsecModel8PAREventC6entity10insertIntoACSo19NSEntityDescriptionC_So22NSManagedObjectContextCSgtcfC_0()
{
  void *v0;
  objc_class *v1;
  void *v2;

  OUTLINED_FUNCTION_5();
  objc_msgSend(objc_allocWithZone(v1), sel_initWithEntity_insertIntoManagedObjectContext_, v2, v0);

  OUTLINED_FUNCTION_2();
}

id PARSpotlightPropensity.init(entity:insertInto:)()
{
  return sub_217DC6C40();
}

id sub_217DC6C40()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t (*v3)(void);
  id v4;
  objc_super v6;

  OUTLINED_FUNCTION_5();
  v6.receiver = v1;
  v6.super_class = (Class)v3();
  v4 = objc_msgSendSuper2(&v6, sel_initWithEntity_insertIntoManagedObjectContext_, v2, v0);

  return v4;
}

uint64_t type metadata accessor for PARSpotlightPropensity()
{
  return objc_opt_self();
}

id PARSpotlightPropensity.__deallocating_deinit()
{
  return sub_217DC6D08(type metadata accessor for PARSpotlightPropensity);
}

id sub_217DC6D08(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_217DC6D38()
{
  return MEMORY[0x24BEE0948];
}

uint64_t sub_217DC6D4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for PARSpotlightPropensity();
  result = sub_217DC868C();
  *a1 = result;
  return result;
}

unint64_t sub_217DC6D88()
{
  static PARSpotlightPropensity.entityName.getter();
  return 0xD000000000000016;
}

id sub_217DC6DA4()
{
  id *v0;

  return objc_msgSend(*v0, sel_appLaunch);
}

id sub_217DC6DC4()
{
  id *v0;

  return objc_msgSend(*v0, sel_onDeviceAddressBookData);
}

id sub_217DC6DE4()
{
  id *v0;

  return objc_msgSend(*v0, sel_onDeviceOtherPersonalData);
}

id sub_217DC6E04()
{
  id *v0;

  return objc_msgSend(*v0, sel_parsec);
}

id sub_217DC6E24()
{
  id *v0;

  return objc_msgSend(*v0, sel_punchout);
}

id sub_217DC6E44()
{
  id *v0;

  return objc_msgSend(*v0, sel_siriSuggestions);
}

id sub_217DC6E64()
{
  id *v0;

  return objc_msgSend(*v0, sel_thirdPartyInAppContent);
}

id sub_217DC6E84()
{
  id *v0;

  return objc_msgSend(*v0, sel_webSuggestions);
}

uint64_t sub_217DC6EA4()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (objc_msgSend(*v0, sel_timestamp))
  {
    OUTLINED_FUNCTION_6();

  }
  OUTLINED_FUNCTION_4();
  v1 = OUTLINED_FUNCTION_7();
  return OUTLINED_FUNCTION_3(v1, v2, v3, v4);
}

char *keypath_get_selector_timestamp()
{
  return sel_timestamp;
}

char *keypath_get_selector_type()
{
  return sel_type;
}

char *keypath_get_selector_clientIntVal()
{
  return sel_clientIntVal;
}

char *keypath_get_selector_invokedDays()
{
  return sel_invokedDays;
}

char *keypath_get_selector_zkwEngagedDays()
{
  return sel_zkwEngagedDays;
}

char *keypath_get_selector_searchedDays()
{
  return sel_searchedDays;
}

char *keypath_get_selector_suggestionOrAppleResultEngagedDays()
{
  return sel_suggestionOrAppleResultEngagedDays;
}

char *keypath_get_selector_webEngagedDays()
{
  return sel_webEngagedDays;
}

char *keypath_get_selector_voiceSearchDays()
{
  return sel_voiceSearchDays;
}

char *keypath_get_selector_numSearchEngagements()
{
  return sel_numSearchEngagements;
}

char *keypath_get_selector_activeDays()
{
  return sel_activeDays;
}

char *keypath_get_selector_client()
{
  return sel_client;
}

char *keypath_get_selector_go()
{
  return sel_go;
}

char *keypath_get_selector_isSuggestion()
{
  return sel_isSuggestion;
}

char *keypath_get_selector_isTopHit()
{
  return sel_isTopHit;
}

char *keypath_get_selector_tap()
{
  return sel_tap;
}

char *keypath_get_selector_image()
{
  return sel_image;
}

char *keypath_get_selector_other()
{
  return sel_other;
}

char *keypath_get_selector_querySuggestion()
{
  return sel_querySuggestion;
}

char *keypath_get_selector_recentResult()
{
  return sel_recentResult;
}

char *keypath_get_selector_zkw()
{
  return sel_zkw;
}

char *keypath_get_selector_goToSite()
{
  return sel_goToSite;
}

char *keypath_get_selector_localGoto()
{
  return sel_localGoto;
}

char *keypath_get_selector_localTap()
{
  return sel_localTap;
}

char *keypath_get_selector_parsecAppStore()
{
  return sel_parsecAppStore;
}

char *keypath_get_selector_parsecGoto()
{
  return sel_parsecGoto;
}

char *keypath_get_selector_parsecMaps()
{
  return sel_parsecMaps;
}

char *keypath_get_selector_parsecNews()
{
  return sel_parsecNews;
}

char *keypath_get_selector_parsecOther()
{
  return sel_parsecOther;
}

char *keypath_get_selector_parsecStocks()
{
  return sel_parsecStocks;
}

char *keypath_get_selector_parsecTap()
{
  return sel_parsecTap;
}

char *keypath_get_selector_parsecWeather()
{
  return sel_parsecWeather;
}

char *keypath_get_selector_parsecWeb()
{
  return sel_parsecWeb;
}

char *keypath_get_selector_parsecWiki()
{
  return sel_parsecWiki;
}

char *keypath_get_selector_thirdPartyCompletionOrRecentSearch()
{
  return sel_thirdPartyCompletionOrRecentSearch;
}

char *keypath_get_selector_thirdPartyGoto()
{
  return sel_thirdPartyGoto;
}

char *keypath_get_selector_thirdPartyTap()
{
  return sel_thirdPartyTap;
}

char *keypath_get_selector_appLaunch()
{
  return sel_appLaunch;
}

char *keypath_get_selector_onDeviceAddressBookData()
{
  return sel_onDeviceAddressBookData;
}

char *keypath_get_selector_onDeviceOtherPersonalData()
{
  return sel_onDeviceOtherPersonalData;
}

char *keypath_get_selector_parsec()
{
  return sel_parsec;
}

char *keypath_get_selector_punchout()
{
  return sel_punchout;
}

char *keypath_get_selector_siriSuggestions()
{
  return sel_siriSuggestions;
}

char *keypath_get_selector_thirdPartyInAppContent()
{
  return sel_thirdPartyInAppContent;
}

char *keypath_get_selector_webSuggestions()
{
  return sel_webSuggestions;
}

uint64_t dispatch thunk of static PAREntity.entityName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_217DC7118(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254F25CE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

id sub_217DC716C()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_217DC8650();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_217DC8644();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_217DC8638();
}

uint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v0;

  return v0;
}

ParsecModel::PMEntityProperty_optional __swiftcall PMEntityProperty.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  ParsecModel::PMEntityProperty_optional result;
  char v5;
  char v6;

  v2 = v1;
  v3 = sub_217DC86B0();
  result.value = swift_bridgeObjectRelease();
  v5 = 0;
  v6 = 26;
  switch(v3)
  {
    case 0:
      goto LABEL_27;
    case 1:
      v5 = 1;
      goto LABEL_27;
    case 2:
      v5 = 2;
      goto LABEL_27;
    case 3:
      v5 = 3;
      goto LABEL_27;
    case 4:
      v5 = 4;
      goto LABEL_27;
    case 5:
      v5 = 5;
      goto LABEL_27;
    case 6:
      v5 = 6;
      goto LABEL_27;
    case 7:
      v5 = 7;
      goto LABEL_27;
    case 8:
      v5 = 8;
      goto LABEL_27;
    case 9:
      v5 = 9;
      goto LABEL_27;
    case 10:
      v5 = 10;
      goto LABEL_27;
    case 11:
      v5 = 11;
      goto LABEL_27;
    case 12:
      v5 = 12;
      goto LABEL_27;
    case 13:
      v5 = 13;
      goto LABEL_27;
    case 14:
      v5 = 14;
      goto LABEL_27;
    case 15:
      v5 = 15;
      goto LABEL_27;
    case 16:
      v5 = 16;
      goto LABEL_27;
    case 17:
      v5 = 17;
      goto LABEL_27;
    case 18:
      v5 = 18;
      goto LABEL_27;
    case 19:
      v5 = 19;
      goto LABEL_27;
    case 20:
      v5 = 20;
      goto LABEL_27;
    case 21:
      v5 = 21;
      goto LABEL_27;
    case 22:
      v5 = 22;
      goto LABEL_27;
    case 23:
      v5 = 23;
      goto LABEL_27;
    case 24:
      v5 = 24;
      goto LABEL_27;
    case 25:
      v5 = 25;
LABEL_27:
      v6 = v5;
      break;
    case 26:
      break;
    case 27:
      v6 = 27;
      break;
    case 28:
      v6 = 28;
      break;
    case 29:
      v6 = 29;
      break;
    case 30:
      v6 = 30;
      break;
    case 31:
      v6 = 31;
      break;
    case 32:
      v6 = 32;
      break;
    case 33:
      v6 = 33;
      break;
    case 34:
      v6 = 34;
      break;
    case 35:
      v6 = 35;
      break;
    case 36:
      v6 = 36;
      break;
    case 37:
      v6 = 37;
      break;
    case 38:
      v6 = 38;
      break;
    case 39:
      v6 = 39;
      break;
    case 40:
      v6 = 40;
      break;
    case 41:
      v6 = 41;
      break;
    case 42:
      v6 = 42;
      break;
    case 43:
      v6 = 43;
      break;
    default:
      v6 = 44;
      break;
  }
  *v2 = v6;
  return result;
}

void *static PMEntityProperty.allCases.getter()
{
  return &unk_24D904370;
}

uint64_t PMEntityProperty.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_217DC748C + 4 * word_217DC8E9C[*v0]))(0x636E75614C707061, 0xE900000000000068);
}

uint64_t sub_217DC748C()
{
  return 0x746E65696C63;
}

uint64_t sub_217DC74A0()
{
  return 0x6E49746E65696C63;
}

uint64_t sub_217DC74C0()
{
  return 28519;
}

uint64_t sub_217DC74CC()
{
  return 0x657469536F546F67;
}

uint64_t sub_217DC74E4()
{
  return 0x6567616D69;
}

uint64_t sub_217DC74F8()
{
  return 0x4464656B6F766E69;
}

uint64_t sub_217DC7518()
{
  return 0x7365676775537369;
}

uint64_t sub_217DC7538()
{
  return 0x746948706F547369;
}

uint64_t sub_217DC7550()
{
  return 0x746F476C61636F6CLL;
}

uint64_t sub_217DC7568()
{
  return 0x7061546C61636F6CLL;
}

unint64_t sub_217DC7580()
{
  return 0xD000000000000014;
}

uint64_t sub_217DC786C()
{
  return 1701869940;
}

uint64_t sub_217DC787C()
{
  return 0x6165536563696F76;
}

uint64_t sub_217DC78A0()
{
  return 0x6761676E45626577;
}

uint64_t sub_217DC7904()
{
  return sub_217DC7910();
}

uint64_t sub_217DC7910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = PMEntityProperty.rawValue.getter();
  v2 = v1;
  if (v0 == PMEntityProperty.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_217DC86A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

ParsecModel::PMEntityProperty_optional sub_217DC79A4(Swift::String *a1)
{
  return PMEntityProperty.init(rawValue:)(*a1);
}

uint64_t sub_217DC79B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PMEntityProperty.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_217DC79D8()
{
  unint64_t result;

  result = qword_254F25D50;
  if (!qword_254F25D50)
  {
    result = MEMORY[0x219A17140](&protocol conformance descriptor for PMEntityProperty, &type metadata for PMEntityProperty);
    atomic_store(result, (unint64_t *)&qword_254F25D50);
  }
  return result;
}

uint64_t sub_217DC7A14()
{
  return sub_217DC7A1C();
}

uint64_t sub_217DC7A1C()
{
  return sub_217DC7ACC();
}

uint64_t sub_217DC7A28()
{
  return sub_217DC7A30();
}

uint64_t sub_217DC7A30()
{
  PMEntityProperty.rawValue.getter();
  sub_217DC8668();
  return swift_bridgeObjectRelease();
}

uint64_t sub_217DC7A7C()
{
  return sub_217DC7ACC();
}

unint64_t sub_217DC7A88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254F25D58;
  if (!qword_254F25D58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254F25D60);
    result = MEMORY[0x219A17140](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254F25D58);
  }
  return result;
}

uint64_t sub_217DC7ACC()
{
  sub_217DC86BC();
  PMEntityProperty.rawValue.getter();
  sub_217DC8668();
  swift_bridgeObjectRelease();
  return sub_217DC86C8();
}

void sub_217DC7B2C(_QWORD *a1@<X8>)
{
  *a1 = &unk_24D904370;
}

uint64_t dispatch thunk of PMTimestampedEntity.timestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PMSpotlightPropensity.webSuggestions.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t getEnumTagSinglePayload for PMEntityProperty(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xD5)
  {
    if (a2 + 43 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 43) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 44;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x2C;
  v5 = v6 - 44;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PMEntityProperty(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 43 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 43) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD4)
    return ((uint64_t (*)(void))((char *)&loc_217DC7C68 + 4 * byte_217DC8EF9[v4]))();
  *a1 = a2 + 43;
  return ((uint64_t (*)(void))((char *)sub_217DC7C9C + 4 * byte_217DC8EF4[v4]))();
}

uint64_t sub_217DC7C9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_217DC7CA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x217DC7CACLL);
  return result;
}

uint64_t sub_217DC7CB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x217DC7CC0);
  *(_BYTE *)result = a2 + 43;
  return result;
}

uint64_t sub_217DC7CC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_217DC7CCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_217DC7CD8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_217DC7CE0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PMEntityProperty()
{
  return &type metadata for PMEntityProperty;
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

void *static PARUsageEventMigration.tracker.getter()
{
  void *v0;

  OUTLINED_FUNCTION_3_1();
  v0 = off_254F25D68;
  sub_217DC7DE8((uint64_t)off_254F25D68);
  return v0;
}

uint64_t sub_217DC7DE8(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t static PARUsageEventMigration.tracker.setter(void *a1, uint64_t a2)
{
  void *v4;

  OUTLINED_FUNCTION_3_1();
  v4 = off_254F25D68;
  off_254F25D68 = a1;
  qword_254F25D70 = a2;
  return sub_217DC7E4C((uint64_t)v4);
}

uint64_t sub_217DC7E4C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*static PARUsageEventMigration.tracker.modify())()
{
  OUTLINED_FUNCTION_3_1();
  return j__swift_endAccess;
}

id sub_217DC7E9C(void *a1, void *a2, void *a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  char v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  unsigned int v26;
  void *v27;
  void (*v28)(_QWORD);
  id v29;
  id v31;
  void *v32;
  objc_super v33;
  _OWORD v34[2];
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = sub_217DC84B0(a2);
  if (!v8)
    goto LABEL_19;
  if (v7 == 0x6567617355524150 && v8 == 0xED0000746E657645)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_217DC86A4();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
LABEL_19:
      *(_QWORD *)&v35 = 0;
      v33.receiver = v3;
      v33.super_class = (Class)type metadata accessor for PARUsageEventMigration();
      v26 = objc_msgSendSuper2(&v33, sel_createDestinationInstancesForSourceInstance_entityMapping_manager_error_, a1, a2, a3, &v35);
      v27 = (void *)v35;
      if (v26)
      {
        OUTLINED_FUNCTION_4_1();
        v28 = (void (*)(_QWORD))off_254F25D68;
        if (off_254F25D68)
        {
          v29 = v27;
          sub_217DC7DE8((uint64_t)v28);
          v28(0);
          return (id)sub_217DC7E4C((uint64_t)v28);
        }
        else
        {
          return v27;
        }
      }
      else
      {
        v31 = (id)v35;
        sub_217DC8620();

        return (id)swift_willThrow();
      }
    }
  }
  v11 = (void *)sub_217DC8650();
  v12 = objc_msgSend(a1, sel_valueForKey_, v11);

  if (v12)
  {
    sub_217DC8680();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v34, 0, sizeof(v34));
  }
  sub_217DC8530((uint64_t)v34, (uint64_t)&v35);
  if (!v36)
  {
    sub_217DC8578((uint64_t)&v35);
    goto LABEL_19;
  }
  sub_217DC85C8(0, &qword_254F25D80);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_19;
  v13 = (void *)OUTLINED_FUNCTION_0_1();
  v14 = objc_msgSend(v32, sel_valueForKey_, v13);

  if (!v14)
  {

    goto LABEL_19;
  }
  sub_217DC8680();
  swift_unknownObjectRelease();
  sub_217DC85B8(v34, &v35);
  v15 = (void *)objc_opt_self();
  v16 = (void *)sub_217DC8650();
  v17 = objc_msgSend(a3, sel_destinationContext);
  v18 = objc_msgSend(v15, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v16, v17);

  v19 = (void *)OUTLINED_FUNCTION_1_1();
  v20 = objc_msgSend(a1, (SEL)&selRef_suggestionOrAppleResultEngagedDays, v19);

  v21 = (void *)OUTLINED_FUNCTION_1_1();
  objc_msgSend(v18, sel_setValue_forKey_, v20, v21);
  swift_unknownObjectRelease();

  __swift_project_boxed_opaque_existential_0(&v35, v36);
  sub_217DC8698();
  v22 = OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1(v22);
  swift_unknownObjectRelease();

  sub_217DC85C8(0, &qword_254F25D88);
  v23 = (void *)sub_217DC8674();
  v24 = sub_217DC8650();
  OUTLINED_FUNCTION_2_1(v24);

  objc_msgSend(a3, sel_associateSourceInstance_withDestinationInstance_forEntityMapping_, a1, v18, a2);
  OUTLINED_FUNCTION_4_1();
  v25 = (void (*)(uint64_t))off_254F25D68;
  if (off_254F25D68)
  {
    swift_retain();
    v25(1);

    sub_217DC7E4C((uint64_t)v25);
  }
  else
  {

    v18 = v32;
  }

  return (id)__swift_destroy_boxed_opaque_existential_0((uint64_t)&v35);
}

id PARUsageEventMigration.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PARUsageEventMigration.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PARUsageEventMigration();
  return objc_msgSendSuper2(&v2, sel_init);
}

id PARUsageEventMigration.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PARUsageEventMigration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_217DC84B0(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_destinationEntityName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_217DC865C();

  return v3;
}

uint64_t type metadata accessor for PARUsageEventMigration()
{
  return objc_opt_self();
}

uint64_t sub_217DC8530(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254F25D78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_217DC8578(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254F25D78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_217DC85B8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_217DC85C8(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_beginAccess();
}

uint64_t sub_217DC8614()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_217DC8620()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_217DC862C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_217DC8638()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_217DC8644()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_217DC8650()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_217DC865C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_217DC8668()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_217DC8674()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_217DC8680()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_217DC868C()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_217DC8698()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_217DC86A4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_217DC86B0()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_217DC86BC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_217DC86C8()
{
  return MEMORY[0x24BEE4328]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

