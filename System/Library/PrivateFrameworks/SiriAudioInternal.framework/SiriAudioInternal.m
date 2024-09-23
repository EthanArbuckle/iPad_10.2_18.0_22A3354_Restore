id SAHWorkaroundInitialize(void)
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "string");
}

void sub_22723C454()
{
  qword_2558CC1D0 = 0x6C7070612E6D6F63;
  *(_QWORD *)algn_2558CC1D8 = 0xEF636973754D2E65;
}

uint64_t sub_22723C484(uint64_t a1, uint64_t a2)
{
  return sub_22723C648(a1, a2, &qword_2558CB320, &qword_2558CC1D0);
}

unint64_t sub_22723C4A4()
{
  return 0xD000000000000016;
}

void sub_22723C4C4()
{
  qword_2558CC1E0 = 0x6C7070612E6D6F63;
  *(_QWORD *)algn_2558CC1E8 = 0xEF636973754D2E65;
}

uint64_t sub_22723C4F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_22727D26C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = sub_22727D2A8();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v6;
}

uint64_t sub_22723C5A8()
{
  sub_22727D29C();
  return swift_deallocClassInstance();
}

uint64_t sub_22723C5C4()
{
  return sub_22727D248();
}

uint64_t sub_22723C5E4()
{
  return sub_22727D260() & 1;
}

uint64_t sub_22723C608()
{
  return sub_22727D254();
}

uint64_t sub_22723C628(uint64_t a1, uint64_t a2)
{
  return sub_22723C648(a1, a2, &qword_2558CB328, &qword_2558CC1E0);
}

uint64_t sub_22723C648(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v5;

  if (*a3 != -1)
    swift_once();
  v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_22723C69C()
{
  uint64_t v0;

  v0 = qword_2558CB330;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_22723C6D0()
{
  MEMORY[0x2276AF644](&unk_22727E258);
  return sub_22727D350();
}

uint64_t sub_22723C710(uint64_t a1)
{
  MEMORY[0x2276AF644](&unk_22727E2E0, a1);
  return sub_22727D2E4();
}

uint64_t sub_22723C744()
{
  return sub_22727D290();
}

uint64_t sub_22723C764()
{
  MEMORY[0x2276AF644](&unk_22727E258);
  return sub_22727D344();
}

uint64_t sub_22723C7A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_22727D278();
  *a1 = result;
  return result;
}

uint64_t sub_22723C7C8()
{
  return sub_22727D284();
}

uint64_t variable initialization expression of ArtistNameParameterBuilder.parameterName()
{
  return 1;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.songIsDisliked()
{
  return 2;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.songIsLiked()
{
  return 2;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.mediaItemType()
{
  return 0;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.queueIsPlayingShuffled()
{
  return 2;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.queueLength()
{
  return 0;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.supportsAffinityIntent()
{
  return 0;
}

uint64_t variable initialization expression of InternalSignalsManager.lock()
{
  sub_22727CB34();
  sub_22727CB28();
  sub_22727CC18();
  swift_allocObject();
  return sub_22727CC00();
}

uint64_t type metadata accessor for GenericMusicItemEntity()
{
  uint64_t result;

  result = qword_2558CB410;
  if (!qword_2558CB410)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22723C8E0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22723C91C()
{
  return type metadata accessor for GenericMusicItemEntity();
}

void type metadata accessor for INMediaItemType(uint64_t a1)
{
  sub_22723CC40(a1, &qword_2558CB460);
}

void type metadata accessor for INMediaAffinityType(uint64_t a1)
{
  sub_22723CC40(a1, &qword_2558CB468);
}

_QWORD *sub_22723C94C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_22723C95C()
{
  return sub_22723CA60(&qword_2558CB470, (uint64_t (*)(uint64_t))type metadata accessor for INMediaItemType, (uint64_t)&unk_22727E16C);
}

uint64_t sub_22723C988()
{
  sub_22727DA70();
  sub_22727DA7C();
  return sub_22727DA88();
}

uint64_t sub_22723C9CC()
{
  return sub_22727DA7C();
}

uint64_t sub_22723C9F4()
{
  sub_22727DA70();
  sub_22727DA7C();
  return sub_22727DA88();
}

uint64_t sub_22723CA34()
{
  return sub_22723CA60(&qword_2558CB478, (uint64_t (*)(uint64_t))type metadata accessor for GenericMusicItemEntity, (uint64_t)&unk_22727E1D4);
}

uint64_t sub_22723CA60(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2276AF644](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22723CAA0()
{
  return sub_22723CA60(&qword_2558CB480, (uint64_t (*)(uint64_t))type metadata accessor for GenericMusicItemEntity, (uint64_t)&unk_22727E288);
}

uint64_t sub_22723CACC()
{
  return sub_22723CA60(&qword_2558CB488, (uint64_t (*)(uint64_t))type metadata accessor for GenericMusicItemEntity, (uint64_t)&unk_22727E218);
}

uint64_t sub_22723CAF8()
{
  return sub_22723CA60(&qword_2558CB490, (uint64_t (*)(uint64_t))type metadata accessor for GenericMusicItemEntity, (uint64_t)&unk_22727E1F0);
}

uint64_t sub_22723CB24()
{
  return sub_22723CA60(&qword_2558CB498, (uint64_t (*)(uint64_t))type metadata accessor for GenericMusicItemEntity, (uint64_t)&unk_22727E310);
}

uint64_t sub_22723CB50()
{
  return sub_22723CA60(&qword_2558CB4A0, (uint64_t (*)(uint64_t))type metadata accessor for GenericMusicItemEntity, (uint64_t)&unk_22727E2E0);
}

uint64_t sub_22723CB7C()
{
  return sub_22723CA60(&qword_2558CB4A8, (uint64_t (*)(uint64_t))type metadata accessor for GenericMusicItemEntity, (uint64_t)&unk_22727E2B8);
}

uint64_t sub_22723CBA8()
{
  return sub_22723CA60(&qword_2558CB4B0, (uint64_t (*)(uint64_t))type metadata accessor for GenericMusicItemEntity, (uint64_t)&unk_22727E258);
}

BOOL sub_22723CBD4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL sub_22723CBE8(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_22723CBFC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

ValueMetadata *type metadata accessor for OpenMusicItemAppIntent()
{
  return &type metadata for OpenMusicItemAppIntent;
}

void type metadata accessor for FavoriteEntityChangeRequestAction(uint64_t a1)
{
  sub_22723CC40(a1, &qword_2558CB4B8);
}

void type metadata accessor for INPlaybackQueueLocation(uint64_t a1)
{
  sub_22723CC40(a1, &qword_2558CB4C0);
}

void sub_22723CC40(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22723CC90()
{
  uint64_t v0;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB568);
  sub_22727CA44();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22727E4A0;
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  result = sub_22727CA38();
  qword_2558CC200 = v0;
  return result;
}

uint64_t sub_22723CE7C()
{
  uint64_t v0;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB568);
  sub_22727CA44();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22727E4B0;
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  sub_22727CA38();
  result = sub_22727CA38();
  qword_2558CC208 = v0;
  return result;
}

uint64_t sub_22723D37C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t, _QWORD, uint64_t);
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB560);
  v0 = sub_22727D398();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22727E4C0;
  v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x24BEA6E60], v0);
  v6(v5 + v2, *MEMORY[0x24BEA6E50], v0);
  v6(v5 + 2 * v2, *MEMORY[0x24BEA6E58], v0);
  v6(v5 + 3 * v2, *MEMORY[0x24BEA6E48], v0);
  v6(v5 + 4 * v2, *MEMORY[0x24BEA6E40], v0);
  v6(v5 + 5 * v2, *MEMORY[0x24BEA6E78], v0);
  v6(v5 + 6 * v2, *MEMORY[0x24BEA6E68], v0);
  result = ((uint64_t (*)(unint64_t, _QWORD, uint64_t))v6)(v5 + 7 * v2, *MEMORY[0x24BEA6E70], v0);
  qword_2558CC210 = v4;
  return result;
}

uint64_t sub_22723D4E8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22723D520 + 4 * byte_22727E4D0[a1]))(0xD000000000000012, 0x800000022727F3D0);
}

uint64_t sub_22723D520()
{
  return 0x6C7070612E6D6F63;
}

uint64_t sub_22723D588()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AudioSuggestionsConstants()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276AF62C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t INLocalSearchProvider.init(localSearch:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22723D600(a1, a2);
}

uint64_t sub_22723D600(__int128 *a1, uint64_t a2)
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

void INLocalSearchProvider.search(for:requesterSharedUserID:bundleIdentifier:intent:completion:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(_QWORD), uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  id v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  uint8_t *v47;
  uint8_t *v48;
  uint64_t v49;
  void (*v50)(_QWORD);
  uint8_t *v51;
  id v52;
  BOOL v53;
  uint64_t v54;
  id v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  void *v60;
  id v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  _QWORD *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  char *v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  void (*v75)(id);
  os_log_type_t v76;
  uint8_t *v77;
  const char *v78;
  void *v79;
  id v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  uint64_t v84;
  _QWORD *v85;
  id v86;
  void (*v87)(_QWORD);
  char *v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  _QWORD *v99;
  id v100;
  os_log_type_t v101;
  uint8_t *v102;
  _QWORD *v103;
  id v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(_QWORD);
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(char *, uint64_t, uint64_t);
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint8_t *v125;
  uint8_t *v126;
  uint64_t v127[6];

  v113 = a4;
  v114 = a5;
  v122 = a3;
  v117 = a2;
  v12 = sub_22727D4E8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v112 = (char *)&v105 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v110 = (char *)&v105 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v105 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v109 = (char *)&v105 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v108 = (char *)&v105 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v124 = (char *)&v105 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&v105 - v30;
  if (qword_2558CB378 != -1)
    swift_once();
  v32 = __swift_project_value_buffer(v12, (uint64_t)qword_2558CC248);
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v120 = v32;
  v121 = v33;
  ((void (*)(char *))v33)(v31);
  v34 = a1;
  v123 = v13;
  v35 = v34;
  v36 = sub_22727D4D0();
  v125 = (uint8_t *)a1;
  v37 = v36;
  v38 = sub_22727D794();
  v39 = os_log_type_enabled(v37, v38);
  v115 = a6;
  if (v39)
  {
    v111 = v16;
    v40 = swift_slowAlloc();
    v118 = a8;
    v41 = (uint8_t *)v40;
    v42 = swift_slowAlloc();
    v106 = v23;
    *(_DWORD *)v41 = 136315138;
    v116 = a7;
    v126 = v125;
    v127[0] = v42;
    v43 = v35;
    v107 = v12;
    v44 = v43;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB570);
    v45 = sub_22727D590();
    v126 = (uint8_t *)sub_2272403C4(v45, v46, v127);
    a7 = v116;
    v23 = v106;
    sub_22727D920();

    v12 = v107;
    v16 = v111;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v37, v38, "INLocalSearchProvider#search Request for local search with INMediaSearch: %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v42, -1, -1);
    v47 = v41;
    a8 = v118;
    MEMORY[0x2276AF6D4](v47, -1, -1);

  }
  else
  {

  }
  v123 = *(_QWORD *)(v123 + 8);
  ((void (*)(char *, uint64_t))v123)(v31, v12);
  v48 = v125;
  if (v125)
  {
    v49 = a8;
    v50 = a7;
    v51 = v125;
    v52 = v35;
    v53 = sub_22723E428(v52);

    if (v53)
      goto LABEL_24;
    v54 = sub_22727D7A0();
    v55 = objc_msgSend(v52, sel_mediaType);
    v48 = v51;
    a7 = v50;
    a8 = v49;
  }
  else
  {
    v54 = sub_22727D7A0();
    v55 = 0;
  }
  v56 = sub_22723E300((uint64_t)v55, v54);
  swift_bridgeObjectRelease();
  if ((v56 & 1) != 0)
  {
LABEL_17:
    sub_2272402B4();
    v60 = (void *)sub_22727D710();
    v121(v124, v120, v12);
    v61 = v60;
    v62 = sub_22727D4D0();
    v63 = sub_22727D794();
    if (os_log_type_enabled(v62, v63))
    {
      v116 = a7;
      v64 = (uint8_t *)swift_slowAlloc();
      v65 = swift_slowAlloc();
      v118 = a8;
      v66 = (_QWORD *)v65;
      *(_DWORD *)v64 = 138412290;
      v127[0] = (uint64_t)v61;
      v67 = v61;
      a7 = v116;
      sub_22727D920();
      *v66 = v61;

      _os_log_impl(&dword_22723A000, v62, v63, "INLocalSearchProvider#search Request for local search with podcastShow type (or Podcasts app identifier), falling back with synthetic item: %@", v64, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v66, -1, -1);
      MEMORY[0x2276AF6D4](v64, -1, -1);

    }
    else
    {

    }
    ((void (*)(char *, uint64_t))v123)(v124, v12);
    v68 = v61;
    v69 = v61;
LABEL_21:
    a7(v69);
LABEL_22:

    return;
  }
  v57 = sub_22727CEF4();
  if (v114)
  {
    if (v57 == v113 && v58 == v114)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    v59 = sub_22727DA10();
    swift_bridgeObjectRelease();
    if ((v59 & 1) != 0)
      goto LABEL_17;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v49 = a8;
  v50 = a7;
  if (!v48)
  {
    sub_2272402B4();
    v79 = (void *)sub_22727D6F8();
    v121(v16, v120, v12);
    v80 = v79;
    v81 = sub_22727D4D0();
    v82 = sub_22727D794();
    if (os_log_type_enabled(v81, v82))
    {
      v116 = a7;
      v83 = (uint8_t *)swift_slowAlloc();
      v84 = swift_slowAlloc();
      v118 = v49;
      v85 = (_QWORD *)v84;
      v111 = v16;
      *(_DWORD *)v83 = 138412290;
      v127[0] = (uint64_t)v80;
      v86 = v80;
      a7 = v116;
      v16 = v111;
      sub_22727D920();
      *v85 = v80;

      _os_log_impl(&dword_22723A000, v81, v82, "INLocalSearchProvider#search Request for local search with nil INMediaSearch, falling back with synthetic item: %@", v83, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v85, -1, -1);
      MEMORY[0x2276AF6D4](v83, -1, -1);

    }
    else
    {

    }
    ((void (*)(char *, uint64_t))v123)(v16, v12);
    v68 = v80;
    v69 = v80;
    goto LABEL_21;
  }
LABEL_24:
  v70 = v35;
  if ((sub_22727D890() & 1) != 0)
  {
    v71 = v112;
    v121(v112, v120, v12);
    v72 = sub_22727D4D0();
    v73 = sub_22727D77C();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_22723A000, v72, v73, "INLocalSearchProvider#search SkipWholeLibraryFallbackForPlayThis internal signal present. Returning no results.", v74, 2u);
      MEMORY[0x2276AF6D4](v74, -1, -1);
    }
    goto LABEL_27;
  }
  v75 = (void (*)(id))v50;
  if (!sub_22723E428(v70))
  {
    if ((sub_22723E300((uint64_t)objc_msgSend(v70, sel_mediaType), (uint64_t)&unk_24EF89430) & 1) == 0)
    {
      sub_2272402B4();
      objc_msgSend(v70, sel_mediaType);
      v94 = (void *)sub_22727D6F8();
      v121(v23, v120, v12);
      v95 = v94;
      v96 = sub_22727D4D0();
      v97 = sub_22727D794();
      if (os_log_type_enabled(v96, v97))
      {
        v118 = v49;
        v98 = (uint8_t *)swift_slowAlloc();
        v99 = (_QWORD *)swift_slowAlloc();
        v116 = v50;
        v125 = v98;
        *(_DWORD *)v98 = 138412290;
        v107 = v12;
        v127[0] = (uint64_t)v95;
        v100 = v95;
        v12 = v107;
        v75 = (void (*)(id))v116;
        sub_22727D920();
        *v99 = v95;

        v101 = v97;
        v102 = v125;
        _os_log_impl(&dword_22723A000, v96, v101, "INLocalSearchProvider#search Request for non-specific local INMediaSearch, falling back with synthetic item: %@", v125, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v99, -1, -1);
        MEMORY[0x2276AF6D4](v102, -1, -1);

      }
      else
      {

      }
      ((void (*)(char *, uint64_t))v123)(v23, v12);
      v68 = v95;
      v75(v95);

      goto LABEL_22;
    }
    v71 = v110;
    v121(v110, v120, v12);
    v72 = sub_22727D4D0();
    v76 = sub_22727D77C();
    if (!os_log_type_enabled(v72, v76))
      goto LABEL_27;
    v77 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v77 = 0;
    v78 = "INLocalSearchProvider#search Specified type without search parameter, not searching locally and instead will prompt for value";
    goto LABEL_35;
  }
  if ((sub_22727D7F4() & 1) != 0)
  {
    v71 = v109;
    v121(v109, v120, v12);
    v72 = sub_22727D4D0();
    v76 = sub_22727D794();
    if (!os_log_type_enabled(v72, v76))
    {
LABEL_27:

      ((void (*)(char *, uint64_t))v123)(v71, v12);
      v50(0);

      return;
    }
    v77 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v77 = 0;
    v78 = "INLocalSearchProvider#search Skipping actual local search as isPommesResponse=true";
LABEL_35:
    _os_log_impl(&dword_22723A000, v72, v76, v78, v77, 2u);
    MEMORY[0x2276AF6D4](v77, -1, -1);
    goto LABEL_27;
  }
  v87 = v50;
  v118 = v49;
  v88 = v108;
  v121(v108, v120, v12);
  v89 = sub_22727D4D0();
  v90 = sub_22727D77C();
  if (os_log_type_enabled(v89, v90))
  {
    v91 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v91 = 0;
    _os_log_impl(&dword_22723A000, v89, v90, "INLocalSearchProvider#search using actual local search (likely CoreSpotlight...", v91, 2u);
    MEMORY[0x2276AF6D4](v91, -1, -1);
  }

  ((void (*)(char *, uint64_t))v123)(v88, v12);
  sub_227240AC4(v119, (uint64_t)v127);
  v124 = (char *)v127[4];
  v125 = (uint8_t *)__swift_project_boxed_opaque_existential_1(v127, v127[3]);
  v123 = sub_22727D758();
  v122 = sub_22727D764();
  sub_22727D74C();
  v92 = objc_msgSend(v70, sel_genreNames);
  if (v92)
  {
    v93 = v92;
    sub_22727D638();

  }
  objc_msgSend(v70, sel_mediaType);
  v103 = (_QWORD *)swift_allocObject();
  v103[2] = v87;
  v103[3] = v118;
  v103[4] = v70;
  v104 = v70;
  swift_retain();
  sub_22727D11C();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v127);
}

uint64_t sub_22723E300(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_22723E364(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_22727DA10();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_22727DA10() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

BOOL sub_22723E428(void *a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v2 = objc_msgSend(a1, sel_mediaName);
  if (v2)
  {
    v3 = sub_22727D584();
    v5 = v4;

    v2 = (id)(v3 & 0xFFFFFFFFFFFFLL);
  }
  else
  {
    v5 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  v6 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0)
    v6 = (uint64_t)v2;
  if (v6)
    return 1;
  v7 = objc_msgSend(a1, sel_artistName);
  if (v7)
  {
    v8 = sub_22727D584();
    v10 = v9;

    v7 = (id)(v8 & 0xFFFFFFFFFFFFLL);
  }
  else
  {
    v10 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = (uint64_t)v7;
  if (v11)
    return 1;
  v13 = objc_msgSend(a1, sel_genreNames);
  if (v13)
  {
    v14 = v13;
    v15 = sub_22727D638();

    v16 = *(_QWORD *)(v15 + 16);
    swift_bridgeObjectRelease();
    if (v16)
      return 1;
  }
  v17 = objc_msgSend(a1, sel_moodNames);
  if (v17
    && (v18 = v17,
        v19 = sub_22727D638(),
        v18,
        v20 = *(_QWORD *)(v19 + 16),
        swift_bridgeObjectRelease(),
        v20))
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, sel_mediaType) == (id)20;
  }
}

void sub_22723E5A0(unint64_t a1, void (*a2)(void *), uint64_t a3, void *a4)
{
  uint64_t v5;
  char *v6;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  NSObject *v62;
  char v63;
  void (*v64)(char *, NSObject *);
  uint64_t v65;
  uint64_t v66;
  os_log_type_t v67;
  uint8_t *v68;
  unint64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  void (*v95)(uint64_t, uint64_t, uint64_t);
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  void (*v99)(char *, uint64_t);
  unint64_t v100;
  BOOL v101;
  char *v102;
  char *v103;
  uint64_t v104;
  char *v105;
  char *v106;
  void (*v107)(char *, char *);
  uint64_t v108;
  NSObject *v109;
  os_log_type_t v110;
  uint8_t *v111;
  char *v112;
  id v113;
  id v114;
  void (*v115)(char *, char *);
  unint64_t v116;
  char *v117;
  char *v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  void (*v123)(uint64_t, uint64_t, uint64_t);
  NSObject *v124;
  os_log_type_t v125;
  uint8_t *v126;
  uint64_t v127;
  NSObject *v128;
  os_log_type_t v129;
  _BOOL4 v130;
  uint8_t *v131;
  id v132;
  SEL *v133;
  char *v134;
  id v135;
  id v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  char *v141;
  NSObject *v142;
  os_log_type_t v143;
  _BOOL4 v144;
  uint8_t *v145;
  uint64_t *v146;
  id v147;
  unint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  char *v153;
  void (*v154)(char *, unint64_t, char *);
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void (*v158)(char *, char *);
  uint64_t v159;
  unint64_t v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void (*v165)(char *, char *);
  char *v166;
  char *v167;
  NSObject *v168;
  os_log_type_t v169;
  _BOOL4 v170;
  uint8_t *v171;
  id v172;
  void *v173;
  uint64_t v174;
  char *v175;
  char *v176;
  id v177;
  void *v178;
  uint64_t v179;
  NSObject *v180;
  os_log_type_t v181;
  uint8_t *v182;
  char v183;
  unint64_t v184;
  char *v185;
  char *v186;
  uint64_t v187;
  void (*v188)(uint64_t, uint64_t, uint64_t);
  NSObject *v189;
  os_log_type_t v190;
  uint8_t *v191;
  uint64_t v192;
  NSObject *v193;
  os_log_type_t v194;
  uint8_t *v195;
  _QWORD *v196;
  uint64_t v197;
  uint64_t v198;
  unint64_t v199;
  void *v200;
  char *v201;
  char *v202;
  char v203;
  char *v204;
  void (*v205)(char *, char *);
  char *v206;
  void (*v207)(char *, uint64_t, void *);
  uint64_t v208;
  unint64_t v209;
  unint64_t v210;
  uint64_t v211;
  char *v212;
  uint64_t v213;
  uint64_t v214;
  _QWORD *v215;
  char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  unint64_t v220;
  unint64_t v221;
  _QWORD *v222;
  void *v223;
  uint64_t v224;
  void (*v225)(uint64_t, uint64_t);
  void (*v226)(uint64_t, uint64_t, uint64_t);
  NSObject *v227;
  char *v228;
  uint64_t v229;
  char *v230;
  char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  char *v237;
  char *v238;
  uint64_t v239;
  char *v240;
  char *v241;
  uint64_t v242;
  void (*v243)(void *);
  char *v244;
  unint64_t v245;
  char *v246;
  id v247;
  char *v248;
  uint64_t v249;
  void (*v250)(char *, char *);
  void (*v251)(char *, uint64_t, uint64_t);
  char *v252;
  char *v253;
  char *v254;
  uint64_t v255;
  void (*v256)(char *, uint64_t);
  char *v257;
  char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  unint64_t v262;

  v247 = a4;
  v242 = a3;
  v243 = a2;
  v5 = sub_22727CBA0();
  v6 = *(char **)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v257 = (char *)&v224 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v258 = (char *)&v224 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v253 = (char *)&v224 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v252 = (char *)&v224 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v246 = (char *)&v224 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v240 = (char *)&v224 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v241 = (char *)&v224 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v248 = (char *)&v224 - v21;
  v255 = sub_22727CD80();
  v22 = *(_QWORD *)(v255 - 8);
  v23 = MEMORY[0x24BDAC7A8](v255);
  v254 = (char *)&v224 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v224 - v25;
  v249 = sub_22727D4E8();
  v27 = *(_QWORD *)(v249 - 8);
  v28 = MEMORY[0x24BDAC7A8](v249);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v224 - v31;
  v33 = MEMORY[0x24BDAC7A8](v30);
  v35 = (char *)&v224 - v34;
  MEMORY[0x24BDAC7A8](v33);
  v37 = MEMORY[0x24BDAC7A8]((char *)&v224 - v36);
  v38 = MEMORY[0x24BDAC7A8](v37);
  v39 = MEMORY[0x24BDAC7A8](v38);
  v40 = MEMORY[0x24BDAC7A8](v39);
  v41 = MEMORY[0x24BDAC7A8](v40);
  v42 = MEMORY[0x24BDAC7A8](v41);
  v43 = MEMORY[0x24BDAC7A8](v42);
  v44 = MEMORY[0x24BDAC7A8](v43);
  v46 = (char *)&v224 - v45;
  v47 = MEMORY[0x24BDAC7A8](v44);
  v58 = (char *)&v224 - v57;
  if (a1)
  {
    v262 = a1;
    if (!*(_QWORD *)(a1 + 16))
    {
      v85 = qword_2558CB378;
      swift_bridgeObjectRetain();
      if (v85 != -1)
        swift_once();
      v86 = v249;
      v87 = __swift_project_value_buffer(v249, (uint64_t)qword_2558CC248);
      v88 = v27;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v32, v87, v86);
      v89 = sub_22727D4D0();
      v90 = sub_22727D794();
      if (os_log_type_enabled(v89, v90))
      {
        v91 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v91 = 0;
        _os_log_impl(&dword_22723A000, v89, v90, "INLocalSearchProvider#search Results from search non-nil, but empty", v91, 2u);
        MEMORY[0x2276AF6D4](v91, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v88 + 8))(v32, v249);
      v243(0);
      goto LABEL_109;
    }
    v239 = v53;
    v237 = v52;
    v233 = v51;
    v238 = v50;
    v234 = v49;
    v230 = v48;
    v232 = v47;
    v235 = v56;
    v231 = v55;
    v229 = v54;
    v245 = (v6[80] + 32) & ~(unint64_t)v6[80];
    swift_bridgeObjectRetain();
    sub_22727CB58();
    v59 = *MEMORY[0x24BE911C8];
    v60 = v254;
    v61 = v26;
    v62 = v255;
    v251 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 104);
    v251(v254, v59, v255);
    sub_227240EB8();
    v63 = sub_22727D56C();
    v64 = *(void (**)(char *, NSObject *))(v22 + 8);
    v64(v60, v62);
    v244 = v61;
    v250 = (void (*)(char *, char *))v64;
    v64(v61, v62);
    if ((v63 & 1) != 0)
    {
      v61 = v248;
      if (qword_2558CB378 != -1)
        swift_once();
      v65 = v249;
      v66 = __swift_project_value_buffer(v249, (uint64_t)qword_2558CC248);
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v35, v66, v65);
      v62 = sub_22727D4D0();
      v67 = sub_22727D794();
      if (os_log_type_enabled(v62, v67))
      {
        v68 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v68 = 0;
        _os_log_impl(&dword_22723A000, v62, v67, "INLocalSearchProvider#search Found playlist item as first in results", v68, 2u);
        MEMORY[0x2276AF6D4](v68, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v27 + 8))(v35, v249);
      v69 = sub_2272402B4();
      if (*(_QWORD *)(v262 + 16))
      {
        v256 = (void (*)(char *, uint64_t))v69;
        v70 = v245;
        v46 = v6;
        v6 = (char *)*((_QWORD *)v6 + 2);
        ((void (*)(char *, unint64_t, uint64_t))v6)(v61, v262 + v245, v5);
        v27 = sub_22727CB4C();
        v64 = (void (*)(char *, NSObject *))*((_QWORD *)v46 + 1);
        v64(v61, v5);
        if (*(_QWORD *)(v262 + 16))
        {
          v71 = v258;
          ((void (*)(char *, unint64_t, uint64_t))v6)(v258, v262 + v70, v5);
          sub_22727CB7C();
          v64(v71, v5);
          __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB588);
          v72 = swift_allocObject();
          *(_OWORD *)(v72 + 16) = xmmword_22727E530;
          if (*(_QWORD *)(v262 + 16))
          {
            v73 = v72;
            v74 = v257;
            ((void (*)(char *, unint64_t, uint64_t))v6)(v257, v262 + v70, v5);
            v75 = sub_22727CB4C();
            v77 = v76;
            v64(v74, v5);
            *(_QWORD *)(v73 + 32) = v75;
            *(_QWORD *)(v73 + 40) = v77;
            v78 = (void *)sub_22727D6E0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v243(v78);

LABEL_109:
            swift_bridgeObjectRelease();
            return;
          }
          __break(1u);
          goto LABEL_116;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    else
    {
      v92 = v248;
      if (*(_QWORD *)(v262 + 16))
      {
        v64 = (void (*)(char *, NSObject *))*((_QWORD *)v6 + 2);
        ((void (*)(char *, unint64_t, uint64_t))v64)(v248, v262 + v245, v5);
        v62 = sub_22727CB4C();
        v61 = v93;
        v256 = (void (*)(char *, uint64_t))*((_QWORD *)v6 + 1);
        v257 = (char *)v5;
        v256(v92, v5);
        v5 = (uint64_t)v246;
        if (qword_2558CB378 == -1)
          goto LABEL_24;
        goto LABEL_114;
      }
    }
    __break(1u);
LABEL_114:
    swift_once();
LABEL_24:
    v94 = __swift_project_value_buffer(v249, (uint64_t)qword_2558CC248);
    v95 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
    v236 = v94;
    v226 = v95;
    ((void (*)(char *))v95)(v46);
    v96 = sub_22727D4D0();
    v97 = sub_22727D794();
    if (os_log_type_enabled(v96, v97))
    {
      v98 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v98 = 0;
      _os_log_impl(&dword_22723A000, v96, v97, "INLocalSearchProvider#search Evaluating what the title/artist/sort of INMediaItem should be from results and input", v98, 2u);
      MEMORY[0x2276AF6D4](v98, -1, -1);
    }

    v99 = *(void (**)(char *, uint64_t))(v27 + 8);
    v99(v46, v249);
    v100 = v262;
    v101 = *(_QWORD *)(v262 + 16) == 1;
    v258 = (char *)v64;
    v228 = v61;
    v227 = v62;
    if (v101)
    {
      v225 = (void (*)(uint64_t, uint64_t))v99;
      v99 = (void (*)(char *, uint64_t))v245;
      v102 = v248;
      v103 = v257;
      ((void (*)(char *, unint64_t, char *))v64)(v248, v262 + v245, v257);
      v104 = sub_22727CB7C();
      v106 = v105;
      v107 = (void (*)(char *, char *))v256;
      v256(v102, (uint64_t)v103);
      if (!*(_QWORD *)(v262 + 16))
      {
LABEL_116:
        __break(1u);
        goto LABEL_117;
      }
      v240 = (char *)v104;
      v241 = v106;
      ((void (*)(char *, char *, char *))v64)(v102, (char *)v99 + v262, v103);
      v233 = sub_22727CB94();
      v234 = v108;
      v107(v102, v103);
      v226(v239, v236, v249);
      v109 = sub_22727D4D0();
      v110 = sub_22727D794();
      if (os_log_type_enabled(v109, v110))
      {
        v111 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v111 = 0;
        _os_log_impl(&dword_22723A000, v109, v110, "INLocalSearchProvider#search Using single-result title/artist", v111, 2u);
        MEMORY[0x2276AF6D4](v111, -1, -1);
      }

      v225(v239, v249);
      v112 = v244;
LABEL_87:
      while (1)
      {
        v196 = (_QWORD *)v262;
        v197 = MEMORY[0x24BEE4AF8];
        v261 = MEMORY[0x24BEE4AF8];
        v198 = *(_QWORD *)(v262 + 16);
        swift_bridgeObjectRetain();
        v249 = v198;
        if (!v198)
          break;
        v199 = 0;
        v248 = (char *)v196 + v245;
        LODWORD(v247) = *MEMORY[0x24BE911C0];
        v200 = v257;
        while (v199 < v196[2])
        {
          v27 = *((_QWORD *)v6 + 9);
          ((void (*)(uint64_t, char *, void *))v64)(v5, &v248[v27 * v199], v200);
          sub_22727CB58();
          v201 = v6;
          v202 = v254;
          v99 = (void (*)(char *, uint64_t))v255;
          v251(v254, v247, v255);
          v203 = sub_22727CD74();
          v204 = v202;
          v205 = v250;
          v250(v204, (char *)v99);
          v205(v112, (char *)v99);
          if ((v203 & 1) != 0)
          {
            v206 = v201;
            v207 = (void (*)(char *, uint64_t, void *))*((_QWORD *)v201 + 4);
            v207(v252, v5, v200);
            v208 = v261;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_227278E20(0, *(_QWORD *)(v208 + 16) + 1, 1);
              v208 = v261;
            }
            v64 = (void (*)(char *, NSObject *))v258;
            v210 = *(_QWORD *)(v208 + 16);
            v209 = *(_QWORD *)(v208 + 24);
            v99 = (void (*)(char *, uint64_t))(v210 + 1);
            if (v210 >= v209 >> 1)
            {
              sub_227278E20(v209 > 1, v210 + 1, 1);
              v208 = v261;
            }
            *(_QWORD *)(v208 + 16) = v99;
            v207((char *)(v208 + v245 + v210 * v27), (uint64_t)v252, v257);
            v261 = v208;
            v6 = v206;
            v5 = (uint64_t)v246;
            v112 = v244;
          }
          else
          {
            v256((char *)v5, (uint64_t)v200);
            v6 = v201;
            v64 = (void (*)(char *, NSObject *))v258;
          }
          if (v249 == ++v199)
          {
            v197 = v261;
            goto LABEL_99;
          }
        }
        __break(1u);

        v99((char *)v27, v249);
        v5 = (uint64_t)v246;
        v64 = (void (*)(char *, NSObject *))v258;
      }
LABEL_99:
      swift_bridgeObjectRelease();
      v211 = *(_QWORD *)(v197 + 16);
      v212 = v257;
      if (v211)
      {
        v213 = v197 + v245;
        v214 = *((_QWORD *)v6 + 9);
        swift_retain();
        v215 = (_QWORD *)MEMORY[0x24BEE4AF8];
        do
        {
          v216 = v253;
          ((void (*)(char *, uint64_t, char *))v64)(v253, v213, v212);
          v217 = sub_22727CB4C();
          v219 = v218;
          v256(v216, (uint64_t)v212);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v215 = sub_227278930(0, v215[2] + 1, 1, v215);
          v221 = v215[2];
          v220 = v215[3];
          if (v221 >= v220 >> 1)
            v215 = sub_227278930((_QWORD *)(v220 > 1), v221 + 1, 1, v215);
          v215[2] = v221 + 1;
          v222 = &v215[2 * v221];
          v222[4] = v217;
          v222[5] = v219;
          v213 += v214;
          --v211;
          v64 = (void (*)(char *, NSObject *))v258;
        }
        while (v211);
        swift_release_n();
      }
      else
      {
        swift_release();
      }
      sub_2272402B4();
      v223 = (void *)sub_22727D6E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v243(v223);

      goto LABEL_109;
    }
    v113 = v247;
    v114 = objc_msgSend(v247, sel_albumName);
    v115 = (void (*)(char *, char *))v256;
    if (v114)
    {

      if (!*(_QWORD *)(v100 + 16))
      {
LABEL_117:
        __break(1u);
        goto LABEL_118;
      }
      v116 = v245;
      v117 = v248;
      v118 = v257;
      ((void (*)(char *, unint64_t, char *))v64)(v248, v100 + v245, v257);
      v119 = sub_22727CB64();
      v121 = v120;
      v115(v117, v118);
      if (!*(_QWORD *)(v262 + 16))
      {
LABEL_118:
        __break(1u);
        goto LABEL_119;
      }
      v240 = (char *)v119;
      v241 = v121;
      ((void (*)(char *, unint64_t, char *))v64)(v117, v262 + v116, v118);
      v233 = sub_22727CB94();
      v234 = v122;
      v115(v117, v118);
      v123 = v226;
      v226((uint64_t)v237, v236, v249);
      v124 = sub_22727D4D0();
      v125 = sub_22727D794();
      if (os_log_type_enabled(v124, v125))
      {
        v126 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v126 = 0;
        _os_log_impl(&dword_22723A000, v124, v125, "INLocalSearchProvider#search Using album from search request", v126, 2u);
        MEMORY[0x2276AF6D4](v126, -1, -1);
      }

      v127 = v249;
      v99(v237, v249);
      v123((uint64_t)v238, v236, v127);
      v128 = sub_22727D4D0();
      v129 = sub_22727D794();
      v130 = os_log_type_enabled(v128, v129);
      v112 = v244;
      if (v130)
      {
        v131 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v131 = 0;
        _os_log_impl(&dword_22723A000, v128, v129, "INLocalSearchProvider#search Sorting by album, track", v131, 2u);
        MEMORY[0x2276AF6D4](v131, -1, -1);
      }

      v99(v238, v249);
      sub_227240214(&v262);
      goto LABEL_86;
    }
    v27 = (uint64_t)&unk_24EF8C000;
    v132 = objc_msgSend(v113, sel_artistName);
    v133 = (SEL *)&unk_24EF8C000;
    v134 = v257;
    if (v132)
    {

      v135 = objc_msgSend(v113, sel_mediaName);
      if (!v135)
      {
        if (!*(_QWORD *)(v100 + 16))
        {
LABEL_121:
          __break(1u);
          goto LABEL_122;
        }
        v166 = v248;
        v64 = (void (*)(char *, NSObject *))v258;
        ((void (*)(char *, unint64_t, char *))v258)(v248, v100 + v245, v134);
        v240 = (char *)sub_22727CB94();
        v241 = v167;
        v115(v166, v134);
        v226(v233, v236, v249);
        v168 = sub_22727D4D0();
        v169 = sub_22727D794();
        v170 = os_log_type_enabled(v168, v169);
        v5 = (uint64_t)v246;
        v112 = v244;
        if (v170)
        {
          v171 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v171 = 0;
          _os_log_impl(&dword_22723A000, v168, v169, "INLocalSearchProvider#search Using artist from search request", v171, 2u);
          MEMORY[0x2276AF6D4](v171, -1, -1);
        }

        v146 = &v259;
LABEL_63:
        v99((char *)*(v146 - 32), v249);
        v233 = 0;
        v234 = 0;
        goto LABEL_87;
      }

    }
    v136 = objc_msgSend(v113, sel_genreNames);
    if (v136)
    {
      v137 = v136;
      v138 = sub_22727D638();

      v139 = *(_QWORD *)(v138 + 16);
      v115 = (void (*)(char *, char *))v256;
      swift_bridgeObjectRelease();
      if (v139)
      {
        if (!*(_QWORD *)(v100 + 16))
        {
LABEL_119:
          __break(1u);
          goto LABEL_120;
        }
        v140 = v248;
        v64 = (void (*)(char *, NSObject *))v258;
        ((void (*)(char *, unint64_t, char *))v258)(v248, v100 + v245, v134);
        v240 = (char *)sub_22727CB70();
        v241 = v141;
        v115(v140, v134);
        v226(v234, v236, v249);
        v142 = sub_22727D4D0();
        v143 = sub_22727D794();
        v144 = os_log_type_enabled(v142, v143);
        v5 = (uint64_t)v246;
        v112 = v244;
        if (v144)
        {
          v145 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v145 = 0;
          _os_log_impl(&dword_22723A000, v142, v143, "INLocalSearchProvider#search Using genre title/artist", v145, 2u);
          MEMORY[0x2276AF6D4](v145, -1, -1);
        }

        v146 = &v260;
        goto LABEL_63;
      }
    }
    v147 = objc_msgSend(v247, sel_mediaName);
    if (!v147)
    {
      v233 = 0;
      v234 = 0;
      v240 = 0;
      v241 = 0;
      v5 = (uint64_t)v246;
      v112 = v244;
      v64 = (void (*)(char *, NSObject *))v258;
      goto LABEL_87;
    }

    v112 = v244;
    if (!*(_QWORD *)(v100 + 16))
    {
LABEL_120:
      __break(1u);
      goto LABEL_121;
    }
    v148 = v100 + v245;
    v149 = v248;
    ((void (*)(char *, unint64_t, char *))v258)(v248, v148, v134);
    sub_22727CB64();
    v151 = v150;
    v115(v149, v134);
    swift_bridgeObjectRelease();
    if (!v151)
      goto LABEL_69;
    v225 = (void (*)(uint64_t, uint64_t))v99;
    if (!*(_QWORD *)(v262 + 16))
    {
LABEL_122:
      __break(1u);
      goto LABEL_123;
    }
    v152 = v245;
    v153 = v241;
    v154 = (void (*)(char *, unint64_t, char *))v258;
    ((void (*)(char *, unint64_t, char *))v258)(v241, v262 + v245, v134);
    v155 = sub_22727CB64();
    v157 = v156;
    v158 = (void (*)(char *, char *))v256;
    v256(v153, (uint64_t)v134);
    v159 = *(_QWORD *)(v262 + 16);
    if (!v159)
    {
LABEL_123:
      __break(1u);
      goto LABEL_124;
    }
    v160 = v262 + v152 + *((_QWORD *)v6 + 9) * (v159 - 1);
    v161 = v240;
    v154(v240, v160, v134);
    v162 = sub_22727CB64();
    v164 = v163;
    v158(v161, v134);
    if (v157)
    {
      v133 = (SEL *)&unk_24EF8C000;
      if (v164)
      {
        if (v155 == v162 && v157 == v164)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v165 = (void (*)(char *, char *))v256;
          v99 = (void (*)(char *, uint64_t))v225;
LABEL_79:
          if (!*(_QWORD *)(v262 + 16))
          {
LABEL_124:
            __break(1u);
            goto LABEL_125;
          }
          v184 = v245;
          v185 = v248;
          v64 = (void (*)(char *, NSObject *))v258;
          ((void (*)(char *, unint64_t, char *))v258)(v248, v262 + v245, v134);
          v240 = (char *)sub_22727CB64();
          v241 = v186;
          v165(v185, v134);
          if (!*(_QWORD *)(v262 + 16))
          {
LABEL_125:
            __break(1u);
            return;
          }
          ((void (*)(char *, unint64_t, char *))v64)(v185, v262 + v184, v134);
          v233 = sub_22727CB94();
          v234 = v187;
          v165(v185, v134);
          v188 = v226;
          v226((uint64_t)v230, v236, v249);
          v189 = sub_22727D4D0();
          v190 = sub_22727D794();
          if (os_log_type_enabled(v189, v190))
          {
            v191 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v191 = 0;
            _os_log_impl(&dword_22723A000, v189, v190, "INLocalSearchProvider#search Matching album from results to trigger album response", v191, 2u);
            MEMORY[0x2276AF6D4](v191, -1, -1);
          }

          v192 = v249;
          v99(v230, v249);
          v188((uint64_t)v231, v236, v192);
          v193 = sub_22727D4D0();
          v194 = sub_22727D794();
          if (os_log_type_enabled(v193, v194))
          {
            v195 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v195 = 0;
            _os_log_impl(&dword_22723A000, v193, v194, "INLocalSearchProvider#search Sorting by album, track", v195, 2u);
            MEMORY[0x2276AF6D4](v195, -1, -1);
          }

          v99(v231, v249);
          sub_227240214(&v262);
LABEL_86:
          v5 = (uint64_t)v246;
          goto LABEL_87;
        }
        v183 = sub_22727DA10();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v165 = (void (*)(char *, char *))v256;
        v99 = (void (*)(char *, uint64_t))v225;
        if ((v183 & 1) != 0)
          goto LABEL_79;
LABEL_69:
        v172 = objc_msgSend(v247, v133[450]);
        if (v172)
        {
          v173 = v172;
          v174 = sub_22727D584();
          v176 = v175;

        }
        else
        {
          v174 = 0;
          v176 = 0;
        }
        v5 = (uint64_t)v246;
        v64 = (void (*)(char *, NSObject *))v258;
        v177 = objc_msgSend(v247, sel_artistName);
        v241 = v176;
        v240 = (char *)v174;
        if (v177)
        {
          v178 = v177;
          v233 = sub_22727D584();
          v234 = v179;

        }
        else
        {
          v233 = 0;
          v234 = 0;
        }
        v226(v232, v236, v249);
        v180 = sub_22727D4D0();
        v181 = sub_22727D794();
        if (os_log_type_enabled(v180, v181))
        {
          v182 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v182 = 0;
          _os_log_impl(&dword_22723A000, v180, v181, "INLocalSearchProvider#search Falling back on media name for title", v182, 2u);
          MEMORY[0x2276AF6D4](v182, -1, -1);
        }

        v99((char *)v232, v249);
        goto LABEL_87;
      }
      v99 = (void (*)(char *, uint64_t))v225;
    }
    else
    {
      v165 = (void (*)(char *, char *))v256;
      v99 = (void (*)(char *, uint64_t))v225;
      v133 = (SEL *)&unk_24EF8C000;
      if (!v164)
        goto LABEL_79;
    }
    swift_bridgeObjectRelease();
    goto LABEL_69;
  }
  if (qword_2558CB378 != -1)
    swift_once();
  v79 = v249;
  v80 = __swift_project_value_buffer(v249, (uint64_t)qword_2558CC248);
  v81 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v58, v80, v79);
  v82 = sub_22727D4D0();
  v83 = sub_22727D794();
  if (os_log_type_enabled(v82, v83))
  {
    v84 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v84 = 0;
    _os_log_impl(&dword_22723A000, v82, v83, "INLocalSearchProvider#search Missing result from local search", v84, 2u);
    MEMORY[0x2276AF6D4](v84, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v81 + 8))(v58, v249);
  v243(0);
}

uint64_t sub_227240214(unint64_t *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(sub_22727CBA0() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_2272653F0(v3);
  v4 = *(_QWORD *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_227240F00(v6);
  *a1 = v3;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_2272402B4()
{
  unint64_t result;

  result = qword_2558CB810;
  if (!qword_2558CB810)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558CB810);
  }
  return result;
}

uint64_t sub_2272402F0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_227240300(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_227240334(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_227240354(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2272403C4(v6, v7, a3);
  v8 = *a1 + 8;
  sub_22727D920();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2272403C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_227240494(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_227240E78((uint64_t)v12, *a3);
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
      sub_227240E78((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_227240494(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_22727D92C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_22724064C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_22727D9A4();
  if (!v8)
  {
    sub_22727D9B0();
    __break(1u);
LABEL_17:
    result = sub_22727D9E0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_22724064C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2272406E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2272408B8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2272408B8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2272406E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_227240854(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_22727D980();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_22727D9B0();
      __break(1u);
LABEL_10:
      v2 = sub_22727D5E4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_22727D9E0();
    __break(1u);
LABEL_14:
    result = sub_22727D9B0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_227240854(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB578);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2272408B8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB578);
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
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_22727D9E0();
  __break(1u);
  return result;
}

_BYTE **sub_227240A04(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_227240A14(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_22727D920();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_227240AC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_227240B2C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_227240B58(unint64_t a1)
{
  uint64_t v1;

  sub_22723E5A0(a1, *(void (**)(void *))(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t initializeBufferWithCopyOfBuffer for INLocalSearchProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for INLocalSearchProvider(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1Tm(a1);
}

uint64_t initializeWithCopy for INLocalSearchProvider(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for INLocalSearchProvider(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for INLocalSearchProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for INLocalSearchProvider(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for INLocalSearchProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for INLocalSearchProvider()
{
  return &type metadata for INLocalSearchProvider;
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

uint64_t sub_227240E78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_227240EB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558CB580;
  if (!qword_2558CB580)
  {
    v1 = sub_22727CD80();
    result = MEMORY[0x2276AF644](MEMORY[0x24BE911D8], v1);
    atomic_store(result, (unint64_t *)&qword_2558CB580);
  }
  return result;
}

uint64_t sub_227240F00(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  _BOOL4 v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  _BOOL4 v54;
  char v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t);
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  void (*v93)(char *, uint64_t, uint64_t);
  uint64_t v94;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v96;
  unint64_t v97;
  char *v98;
  char *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  BOOL v111;
  unint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  BOOL v121;
  uint64_t v122;
  char v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  BOOL v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  char *v141;
  char *v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  char *v159;
  char *v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  unint64_t v164;
  char *v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  char *v170;
  uint64_t v171;
  char *v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t *v176;
  uint64_t v177;
  uint64_t v178;

  v2 = sub_22727CBA0();
  v177 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v162 = (char *)&v155 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v173 = (char *)&v155 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v155 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v155 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v166 = (char *)&v155 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v155 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v160 = (char *)&v155 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v159 = (char *)&v155 - v20;
  v176 = a1;
  v21 = a1[1];
  result = sub_22727D9F8();
  if (result >= v21)
  {
    if (v21 < 0)
      goto LABEL_164;
    if (v21)
      return sub_227241B08(0, v21, 1, v176);
    return result;
  }
  if (v21 >= 0)
    v23 = v21;
  else
    v23 = v21 + 1;
  if (v21 < -1)
    goto LABEL_172;
  v178 = v2;
  v165 = v17;
  v157 = result;
  if (v21 < 2)
  {
    v27 = (char *)MEMORY[0x24BEE4AF8];
    v164 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v177 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v177 + 80));
    v156 = MEMORY[0x24BEE4AF8];
    if (v21 != 1)
    {
      v29 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_130:
      if (v29 >= 2)
      {
        v148 = *v176;
        do
        {
          v149 = v29 - 2;
          if (v29 < 2)
            goto LABEL_159;
          if (!v148)
            goto LABEL_171;
          v150 = *(_QWORD *)&v27[16 * v149 + 32];
          v151 = *(_QWORD *)&v27[16 * v29 + 24];
          v152 = v167;
          sub_227241E08(v148 + *(_QWORD *)(v177 + 72) * v150, v148 + *(_QWORD *)(v177 + 72) * *(_QWORD *)&v27[16 * v29 + 16], v148 + *(_QWORD *)(v177 + 72) * v151, v164);
          v167 = v152;
          if (v152)
            break;
          if (v151 < v150)
            goto LABEL_160;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v27 = sub_2272425E4((uint64_t)v27);
          if (v149 >= *((_QWORD *)v27 + 2))
            goto LABEL_161;
          v153 = &v27[16 * v149 + 32];
          *(_QWORD *)v153 = v150;
          *((_QWORD *)v153 + 1) = v151;
          v154 = *((_QWORD *)v27 + 2);
          if (v29 > v154)
            goto LABEL_162;
          memmove(&v27[16 * v29 + 16], &v27[16 * v29 + 32], 16 * (v154 - v29));
          *((_QWORD *)v27 + 2) = v154 - 1;
          v29 = v154 - 1;
        }
        while (v154 > 2);
      }
LABEL_141:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v156 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v24 = v23 >> 1;
    v25 = sub_22727D668();
    *(_QWORD *)(v25 + 16) = v24;
    v26 = *(unsigned __int8 *)(v177 + 80);
    v156 = v25;
    v164 = v25 + ((v26 + 32) & ~v26);
  }
  v28 = 0;
  v27 = (char *)MEMORY[0x24BEE4AF8];
  v169 = v9;
  v172 = v12;
LABEL_15:
  v30 = v28++;
  v163 = v30;
  if (v28 >= v21)
  {
    v43 = v167;
    goto LABEL_81;
  }
  v174 = v21;
  v31 = *v176;
  v32 = *(_QWORD *)(v177 + 72);
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v177 + 16);
  v34 = v178;
  v33(v159, *v176 + v32 * v28, v178);
  v170 = (char *)v31;
  v175 = v32;
  v33(v160, v31 + v32 * v30, v34);
  sub_22727CB64();
  if (!v35)
    goto LABEL_22;
  swift_bridgeObjectRelease();
  sub_22727CB64();
  if (!v36)
    goto LABEL_24;
  swift_bridgeObjectRelease();
  v37 = sub_22727CB88();
  if ((v38 & 1) != 0)
  {
LABEL_22:
    v42 = 1;
    goto LABEL_23;
  }
  v39 = v37;
  v40 = sub_22727CB88();
  if ((v41 & 1) == 0)
  {
    v42 = v40 < v39;
LABEL_23:
    LODWORD(v171) = v42;
    goto LABEL_25;
  }
LABEL_24:
  LODWORD(v171) = 0;
LABEL_25:
  v44 = *(void (**)(char *, uint64_t))(v177 + 8);
  v45 = v178;
  v44(v160, v178);
  v44(v159, v45);
  if (v163 + 2 < v174)
  {
    v158 = v27;
    v46 = v175 * v28;
    v47 = v170;
    v28 = v163 + 2;
    v48 = v175 * (v163 + 2);
    while (1)
    {
      v49 = v178;
      v33(v165, (uint64_t)&v47[v48], v178);
      v33(v166, (uint64_t)&v47[v46], v49);
      sub_22727CB64();
      if (!v50)
        break;
      swift_bridgeObjectRelease();
      sub_22727CB64();
      if (v51)
      {
        swift_bridgeObjectRelease();
        v52 = sub_22727CB88();
        if ((v53 & 1) != 0)
          break;
        v54 = sub_22727CB88() < v52;
        v56 = (v55 & 1) == 0 && v54;
      }
      else
      {
        v56 = 0;
      }
LABEL_35:
      v57 = v178;
      v44(v166, v178);
      v44(v165, v57);
      if ((_DWORD)v171 != v56)
      {
        v43 = v167;
        v27 = v158;
        v12 = v172;
        goto LABEL_40;
      }
      v47 += v175;
      if (v174 == ++v28)
      {
        v58 = v174;
        v28 = v174;
        v43 = v167;
        v27 = v158;
        v12 = v172;
        goto LABEL_41;
      }
    }
    v56 = 1;
    goto LABEL_35;
  }
  v28 = v163 + 2;
  v43 = v167;
LABEL_40:
  v58 = v174;
LABEL_41:
  v30 = v163;
  if (!(_DWORD)v171)
    goto LABEL_54;
  if (v28 < v163)
    goto LABEL_165;
  if (v163 < v28)
  {
    v158 = v27;
    v59 = 0;
    v60 = v175 * (v28 - 1);
    v61 = v28 * v175;
    v62 = v28;
    v63 = v163;
    v64 = v163 * v175;
    v168 = v62;
    do
    {
      if (v63 != v62 + v59 - 1)
      {
        v66 = v43;
        v67 = v170;
        if (!v170)
          goto LABEL_170;
        v68 = &v170[v64];
        v69 = &v170[v60];
        v171 = *(_QWORD *)(v177 + 32);
        ((void (*)(char *, char *, uint64_t))v171)(v162, &v170[v64], v178);
        if (v64 < v60 || v68 >= &v67[v61])
        {
          v65 = v178;
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v65 = v178;
          if (v64 != v60)
            swift_arrayInitWithTakeBackToFront();
        }
        ((void (*)(char *, char *, uint64_t))v171)(v69, v162, v65);
        v43 = v66;
        v12 = v172;
      }
      ++v63;
      --v59;
      v62 = v168;
      v60 -= v175;
      v61 -= v175;
      v64 += v175;
    }
    while (v63 < v168 + v59);
    v27 = v158;
    v70 = v169;
    v28 = v168;
    v30 = v163;
    v58 = v174;
    if (v168 >= v174)
      goto LABEL_81;
  }
  else
  {
LABEL_54:
    v70 = v169;
    if (v28 >= v58)
      goto LABEL_81;
  }
  if (__OFSUB__(v28, v30))
    goto LABEL_163;
  if (v28 - v30 >= v157)
    goto LABEL_81;
  if (__OFADD__(v30, v157))
    goto LABEL_166;
  if (v30 + v157 >= v58)
    v71 = v58;
  else
    v71 = v30 + v157;
  if (v71 >= v30)
  {
    if (v28 == v71)
      goto LABEL_81;
    v158 = v27;
    v167 = v43;
    v72 = *(_QWORD *)(v177 + 72);
    v170 = *(char **)(v177 + 16);
    v171 = v72;
    v174 = v28 * v72;
    v175 = v72 * (v28 - 1);
    v73 = v178;
    v161 = v71;
LABEL_69:
    v75 = 0;
    v168 = v28;
    while (1)
    {
      v76 = *v176;
      v77 = (void (*)(char *, uint64_t, uint64_t))v170;
      ((void (*)(char *, uint64_t, uint64_t))v170)(v12, v174 + v75 + *v176, v73);
      v77(v70, v175 + v75 + v76, v73);
      sub_22727CB64();
      if (!v78)
        goto LABEL_77;
      swift_bridgeObjectRelease();
      sub_22727CB64();
      if (!v79)
      {
        v74 = *(void (**)(char *, uint64_t))(v177 + 8);
LABEL_67:
        v73 = v178;
        v74(v70, v178);
        v12 = v172;
        v74(v172, v73);
        v28 = v168;
LABEL_68:
        ++v28;
        v175 += v171;
        v174 += v171;
        v30 = v163;
        if (v28 != v161)
          goto LABEL_69;
        v28 = v161;
        v43 = v167;
        v27 = v158;
LABEL_81:
        if (v28 < v30)
          goto LABEL_158;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v167 = v43;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v27 = sub_2272423E0(0, *((_QWORD *)v27 + 2) + 1, 1, v27);
        v97 = *((_QWORD *)v27 + 2);
        v96 = *((_QWORD *)v27 + 3);
        v29 = v97 + 1;
        if (v97 >= v96 >> 1)
          v27 = sub_2272423E0((char *)(v96 > 1), v97 + 1, 1, v27);
        *((_QWORD *)v27 + 2) = v29;
        v98 = v27 + 32;
        v99 = &v27[16 * v97 + 32];
        *(_QWORD *)v99 = v163;
        *((_QWORD *)v99 + 1) = v28;
        if (v97)
        {
LABEL_87:
          v100 = v29 - 1;
          if (v29 >= 4)
          {
            v105 = &v98[16 * v29];
            v106 = *((_QWORD *)v105 - 8);
            v107 = *((_QWORD *)v105 - 7);
            v111 = __OFSUB__(v107, v106);
            v108 = v107 - v106;
            if (v111)
              goto LABEL_147;
            v110 = *((_QWORD *)v105 - 6);
            v109 = *((_QWORD *)v105 - 5);
            v111 = __OFSUB__(v109, v110);
            v103 = v109 - v110;
            v104 = v111;
            if (v111)
              goto LABEL_148;
            v112 = v29 - 2;
            v113 = &v98[16 * v29 - 32];
            v115 = *(_QWORD *)v113;
            v114 = *((_QWORD *)v113 + 1);
            v111 = __OFSUB__(v114, v115);
            v116 = v114 - v115;
            if (v111)
              goto LABEL_150;
            v111 = __OFADD__(v103, v116);
            v117 = v103 + v116;
            if (v111)
              goto LABEL_153;
            if (v117 >= v108)
            {
              v135 = &v98[16 * v100];
              v137 = *(_QWORD *)v135;
              v136 = *((_QWORD *)v135 + 1);
              v111 = __OFSUB__(v136, v137);
              v138 = v136 - v137;
              if (v111)
                goto LABEL_157;
              v128 = v103 < v138;
            }
            else
            {
LABEL_100:
              if ((v104 & 1) != 0)
                goto LABEL_149;
              v112 = v29 - 2;
              v118 = &v98[16 * v29 - 32];
              v120 = *(_QWORD *)v118;
              v119 = *((_QWORD *)v118 + 1);
              v121 = __OFSUB__(v119, v120);
              v122 = v119 - v120;
              v123 = v121;
              if (v121)
                goto LABEL_152;
              v124 = &v98[16 * v100];
              v126 = *(_QWORD *)v124;
              v125 = *((_QWORD *)v124 + 1);
              v111 = __OFSUB__(v125, v126);
              v127 = v125 - v126;
              if (v111)
                goto LABEL_155;
              if (__OFADD__(v122, v127))
                goto LABEL_156;
              if (v122 + v127 < v103)
                goto LABEL_112;
              v128 = v103 < v127;
            }
            if (v128)
              v100 = v112;
          }
          else
          {
            if (v29 == 3)
            {
              v102 = *((_QWORD *)v27 + 4);
              v101 = *((_QWORD *)v27 + 5);
              v111 = __OFSUB__(v101, v102);
              v103 = v101 - v102;
              v104 = v111;
              goto LABEL_100;
            }
            v129 = *((_QWORD *)v27 + 4);
            v130 = *((_QWORD *)v27 + 5);
            v111 = __OFSUB__(v130, v129);
            v122 = v130 - v129;
            v123 = v111;
LABEL_112:
            if ((v123 & 1) != 0)
              goto LABEL_151;
            v131 = &v98[16 * v100];
            v133 = *(_QWORD *)v131;
            v132 = *((_QWORD *)v131 + 1);
            v111 = __OFSUB__(v132, v133);
            v134 = v132 - v133;
            if (v111)
              goto LABEL_154;
            if (v134 < v122)
              goto LABEL_14;
          }
          v139 = v100 - 1;
          if (v100 - 1 >= v29)
          {
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
LABEL_152:
            __break(1u);
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            __break(1u);
LABEL_161:
            __break(1u);
LABEL_162:
            __break(1u);
LABEL_163:
            __break(1u);
LABEL_164:
            __break(1u);
LABEL_165:
            __break(1u);
LABEL_166:
            __break(1u);
            break;
          }
          if (!*v176)
            goto LABEL_169;
          v140 = v28;
          v141 = v27;
          v142 = &v98[16 * v139];
          v143 = *(_QWORD *)v142;
          v144 = &v98[16 * v100];
          v145 = *((_QWORD *)v144 + 1);
          v146 = v167;
          sub_227241E08(*v176 + *(_QWORD *)(v177 + 72) * *(_QWORD *)v142, *v176 + *(_QWORD *)(v177 + 72) * *(_QWORD *)v144, *v176 + *(_QWORD *)(v177 + 72) * v145, v164);
          v167 = v146;
          if (v146)
            goto LABEL_141;
          if (v145 < v143)
            goto LABEL_144;
          if (v100 > *((_QWORD *)v141 + 2))
            goto LABEL_145;
          *(_QWORD *)v142 = v143;
          *(_QWORD *)&v98[16 * v139 + 8] = v145;
          v147 = *((_QWORD *)v141 + 2);
          if (v100 >= v147)
            goto LABEL_146;
          v27 = v141;
          v29 = v147 - 1;
          memmove(&v98[16 * v100], v144 + 16, 16 * (v147 - 1 - v100));
          *((_QWORD *)v141 + 2) = v147 - 1;
          v12 = v172;
          v28 = v140;
          if (v147 <= 2)
            goto LABEL_14;
          goto LABEL_87;
        }
        v29 = 1;
LABEL_14:
        v21 = v176[1];
        if (v28 >= v21)
          goto LABEL_130;
        goto LABEL_15;
      }
      swift_bridgeObjectRelease();
      v80 = sub_22727CB88();
      if ((v81 & 1) != 0)
      {
LABEL_77:
        v88 = *(void (**)(char *, uint64_t))(v177 + 8);
        v89 = v70;
        v90 = v178;
        v88(v89, v178);
        v88(v12, v90);
      }
      else
      {
        v82 = v80;
        v83 = sub_22727CB88();
        v74 = *(void (**)(char *, uint64_t))(v177 + 8);
        if ((v84 & 1) != 0)
          goto LABEL_67;
        v85 = v83;
        v86 = v70;
        v87 = v178;
        v74(v86, v178);
        v74(v12, v87);
        v28 = v168;
        if (v85 >= v82)
        {
          v73 = v178;
          v70 = v169;
          goto LABEL_68;
        }
      }
      v91 = *v176;
      if (!*v176)
        goto LABEL_168;
      v92 = (char *)(v91 + v175 + v75);
      v93 = *(void (**)(char *, uint64_t, uint64_t))(v177 + 32);
      v94 = v178;
      v93(v173, v91 + v174 + v75, v178);
      v73 = v94;
      swift_arrayInitWithTakeFrontToBack();
      v93(v92, (uint64_t)v173, v94);
      v12 = v172;
      v75 -= v171;
      ++v30;
      v70 = v169;
      if (v28 == v30)
        goto LABEL_68;
    }
  }
  __break(1u);
LABEL_168:
  __break(1u);
LABEL_169:
  __break(1u);
LABEL_170:
  __break(1u);
LABEL_171:
  __break(1u);
LABEL_172:
  result = sub_22727D9B0();
  __break(1u);
  return result;
}

uint64_t sub_227241B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char *v30;
  BOOL v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;

  v45 = a4;
  v38 = a1;
  v6 = sub_22727CBA0();
  v46 = *(_QWORD **)(v6 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v44 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v36 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v36 - v13;
  v42 = a3;
  v37 = a2;
  if (a3 != a2)
  {
    v15 = v46[9];
    v40 = (void (*)(char *, uint64_t, uint64_t))v46[2];
    v41 = v15;
    v48 = v15 * (v42 - 1);
    v47 = v15 * v42;
    v43 = v11;
LABEL_7:
    v17 = 0;
    v18 = v38;
    while (1)
    {
      v19 = *v45;
      v20 = v40;
      v40(v14, v47 + v17 + *v45, v6);
      v20(v11, v48 + v17 + v19, v6);
      sub_22727CB64();
      v21 = v14;
      if (!v22)
        goto LABEL_15;
      swift_bridgeObjectRelease();
      sub_22727CB64();
      if (!v23)
      {
        v16 = (void (*)(char *, uint64_t))v46[1];
LABEL_5:
        v16(v11, v6);
        result = ((uint64_t (*)(char *, uint64_t))v16)(v14, v6);
LABEL_6:
        v48 += v41;
        v47 += v41;
        if (++v42 == v37)
          return result;
        goto LABEL_7;
      }
      swift_bridgeObjectRelease();
      v24 = sub_22727CB88();
      v21 = v14;
      if ((v25 & 1) != 0)
      {
LABEL_15:
        v32 = (void (*)(char *, uint64_t))v46[1];
        v32(v11, v6);
        result = ((uint64_t (*)(char *, uint64_t))v32)(v21, v6);
        v14 = v21;
      }
      else
      {
        v26 = v24;
        v27 = sub_22727CB88();
        v16 = (void (*)(char *, uint64_t))v46[1];
        if ((v28 & 1) != 0)
        {
          v14 = v21;
          v11 = v43;
          goto LABEL_5;
        }
        v29 = v27;
        v39 = v26;
        v30 = v43;
        v16(v43, v6);
        result = ((uint64_t (*)(char *, uint64_t))v16)(v21, v6);
        v31 = v29 < v39;
        v11 = v30;
        v14 = v21;
        if (!v31)
          goto LABEL_6;
      }
      v33 = *v45;
      if (!*v45)
      {
        __break(1u);
        return result;
      }
      v34 = v33 + v48 + v17;
      v35 = (void (*)(char *, uint64_t, uint64_t))v46[4];
      v35(v44, v33 + v47 + v17, v6);
      swift_arrayInitWithTakeFrontToBack();
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v35)(v34, v44, v6);
      v17 -= v41;
      ++v18;
      v11 = v43;
      if (v42 == v18)
        goto LABEL_6;
    }
  }
  return result;
}

uint64_t sub_227241E08(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v25)(char *, unint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  char v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v41;
  void (*v42)(char *, unint64_t, uint64_t);
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  _BOOL4 v51;
  unint64_t v52;
  void (*v53)(char *, uint64_t);
  unint64_t v54;
  unint64_t v55;
  uint64_t result;
  uint64_t v57;
  void (*v58)(char *, unint64_t, uint64_t);
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;

  v8 = sub_22727CBA0();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v61 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v57 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v57 - v16;
  v60 = v18;
  v62 = *(_QWORD *)(v18 + 72);
  if (!v62)
  {
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  if (a2 - a1 == 0x8000000000000000 && v62 == -1)
    goto LABEL_77;
  v19 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v62 == -1)
    goto LABEL_78;
  v20 = (uint64_t)(a2 - a1) / v62;
  v65 = a1;
  v64 = a4;
  v21 = v19 / v62;
  if (v20 >= v19 / v62)
  {
    if (v21 < 0)
      goto LABEL_79;
    v59 = v15;
    v23 = v21 * v62;
    if (a4 < a2 || a2 + v23 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v39 = a4 + v23;
    v63 = a4 + v23;
    v65 = a2;
    if (v23 < 1 || a1 >= a2)
    {
LABEL_75:
      sub_2272424D8(&v65, &v64, (uint64_t *)&v63);
      return 1;
    }
    v41 = -v62;
    v58 = *(void (**)(char *, unint64_t, uint64_t))(v60 + 16);
    v62 = a1;
    while (1)
    {
      v42 = v58;
      v58(v59, v39 + v41, v8);
      v43 = a2 + v41;
      v42(v61, a2 + v41, v8);
      sub_22727CB64();
      if (!v44)
        goto LABEL_58;
      swift_bridgeObjectRelease();
      sub_22727CB64();
      if (!v45)
        goto LABEL_59;
      swift_bridgeObjectRelease();
      v46 = sub_22727CB88();
      if ((v47 & 1) != 0)
      {
LABEL_58:
        v51 = 1;
      }
      else
      {
        v48 = v46;
        v49 = sub_22727CB88();
        if ((v50 & 1) != 0)
        {
LABEL_59:
          v51 = 0;
          goto LABEL_60;
        }
        v51 = v49 < v48;
      }
LABEL_60:
      v52 = a3 + v41;
      v53 = *(void (**)(char *, uint64_t))(v60 + 8);
      v53(v61, v8);
      v53(v59, v8);
      if (v51)
      {
        if (a3 < a2 || v52 >= a2)
        {
          swift_arrayInitWithTakeFrontToBack();
          v54 = v62;
        }
        else
        {
          v54 = v62;
          if (a3 != a2)
            swift_arrayInitWithTakeBackToFront();
        }
        v65 += v41;
      }
      else
      {
        v55 = v63;
        v63 += v41;
        if (a3 < v55 || v52 >= v55)
        {
          swift_arrayInitWithTakeFrontToBack();
          v43 = a2;
          v54 = v62;
        }
        else
        {
          v54 = v62;
          if (a3 != v55)
            swift_arrayInitWithTakeBackToFront();
          v43 = a2;
        }
      }
      v39 = v63;
      if (v63 > a4)
      {
        a2 = v43;
        a3 += v41;
        if (v43 > v54)
          continue;
      }
      goto LABEL_75;
    }
  }
  if ((v20 & 0x8000000000000000) == 0)
  {
    v22 = v20 * v62;
    if (a4 < a1 || a1 + v22 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v61 = (char *)(a4 + v22);
    v63 = a4 + v22;
    if (v22 >= 1 && a2 < a3)
    {
      v25 = *(void (**)(char *, unint64_t, uint64_t))(v60 + 16);
      while (1)
      {
        v25(v17, a2, v8);
        v25(v14, a4, v8);
        sub_22727CB64();
        if (!v26)
          goto LABEL_29;
        swift_bridgeObjectRelease();
        sub_22727CB64();
        if (!v27)
        {
          v32 = *(void (**)(char *, uint64_t))(v60 + 8);
LABEL_36:
          v32(v14, v8);
          v32(v17, v8);
LABEL_37:
          v36 = v65;
          v38 = v64 + v62;
          if (v65 < v64 || v65 >= v38)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v65 != v64)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v64 = v38;
          v37 = a2;
          goto LABEL_44;
        }
        swift_bridgeObjectRelease();
        v28 = sub_22727CB88();
        if ((v29 & 1) != 0)
        {
LABEL_29:
          v35 = *(void (**)(char *, uint64_t))(v60 + 8);
          v35(v14, v8);
          v35(v17, v8);
        }
        else
        {
          v30 = v28;
          v31 = sub_22727CB88();
          v32 = *(void (**)(char *, uint64_t))(v60 + 8);
          if ((v33 & 1) != 0)
            goto LABEL_36;
          v34 = v31;
          v32(v14, v8);
          v32(v17, v8);
          if (v34 >= v30)
            goto LABEL_37;
        }
        v36 = v65;
        v37 = a2 + v62;
        if (v65 < a2 || v65 >= v37)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v65 == a2)
        {
          v36 = a2;
        }
        else
        {
          swift_arrayInitWithTakeBackToFront();
        }
LABEL_44:
        v65 = v36 + v62;
        a4 = v64;
        if (v64 < (unint64_t)v61)
        {
          a2 = v37;
          if (v37 < a3)
            continue;
        }
        goto LABEL_75;
      }
    }
    goto LABEL_75;
  }
LABEL_79:
  result = sub_22727D9E0();
  __break(1u);
  return result;
}

char *sub_2272423E0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB590);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2272424D8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = sub_22727CBA0();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_22727D9E0();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_2272425E4(uint64_t a1)
{
  return sub_2272423E0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t *FirstPartyMusicSubscriber.__allocating_init(subscriptionProvider:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  v6 = sub_227242E28(v5, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v6;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *FirstPartyMusicSubscriber.init(subscriptionProvider:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = __swift_mutable_project_boxed_opaque_existential_1(a1, v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  v9 = sub_227242DD8((uint64_t)v7, v1, v3, v4);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v9;
}

uint64_t FirstPartyMusicSubscriber.filter(suggestion:environment:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[2] = v0;
  v2 = sub_22727D080();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  v3 = sub_22727D14C();
  v1[7] = v3;
  v1[8] = *(_QWORD *)(v3 - 8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v4 = sub_22727D014();
  v1[11] = v4;
  v1[12] = *(_QWORD *)(v4 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2272427F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void (*v8)(void);
  void (*v9)(uint64_t, unint64_t, uint64_t);
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(void);
  void (*v26)(uint64_t, unint64_t, uint64_t);
  char v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 40));
  sub_22727D0D4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB5A0);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_22727E590;
  v7 = v6 + v5;
  v8 = *(void (**)(void))(v3 + 104);
  ((void (*)(unint64_t, _QWORD, uint64_t))v8)(v7, *MEMORY[0x24BE915E0], v2);
  v45 = v7 + v4;
  v8();
  sub_22727D008();
  v9 = *(void (**)(uint64_t, unint64_t, uint64_t))(v3 + 16);
  v9(v1, v7, v2);
  sub_22723CA60(&qword_2558CB5A8, (uint64_t (*)(uint64_t))MEMORY[0x24BE915E8], MEMORY[0x24BE915F8]);
  LOBYTE(v4) = sub_22727D56C();
  v10 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  swift_bridgeObjectRetain();
  v10(v1, v2);
  v11 = *(_QWORD *)(v0 + 112);
  v12 = *(_QWORD *)(v0 + 96);
  v47 = *(_QWORD *)(v0 + 88);
  v49 = *(_QWORD *)(v0 + 104);
  v13 = *(_QWORD *)(v0 + 80);
  if ((v4 & 1) != 0)
  {
    v14 = *(_QWORD *)(v0 + 56);
    swift_bridgeObjectRelease();
    v10(v13, v14);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v49, v11, v47);
  }
  else
  {
    v43 = *(_QWORD *)(v0 + 112);
    v15 = *(_QWORD *)(v0 + 72);
    v16 = *(_QWORD *)(v0 + 56);
    v9(v15, v45, v16);
    v17 = sub_22727D56C();
    v10(v15, v16);
    swift_bridgeObjectRelease();
    v10(v13, v16);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v49, v43, v47);
    if ((v17 & 1) == 0)
    {
      v18 = *(_QWORD *)(v0 + 40);
      v19 = *(_QWORD *)(v0 + 24);
      v20 = *(_QWORD *)(v0 + 32);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB5B0);
      v21 = *(_QWORD *)(v20 + 72);
      v22 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
      v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_22727E5A0;
      v24 = v23 + v22;
      v25 = *(void (**)(void))(v20 + 104);
      ((void (*)(unint64_t, _QWORD, uint64_t))v25)(v24, *MEMORY[0x24BE914B0], v19);
      v48 = v24 + v21;
      v25();
      v46 = v24 + 2 * v21;
      v25();
      v44 = v24 + 3 * v21;
      v25();
      sub_22727CFFC();
      v26 = *(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 16);
      v26(v18, v24, v19);
      sub_22723CA60((unint64_t *)&unk_2558CB5B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE914C8], MEMORY[0x24BE914D8]);
      v27 = sub_22727D56C();
      v28 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      swift_bridgeObjectRetain();
      v28(v18, v19);
      if ((v27 & 1) != 0)
        goto LABEL_7;
      v29 = *(_QWORD *)(v0 + 40);
      v30 = *(_QWORD *)(v0 + 24);
      v26(v29, v48, v30);
      v31 = sub_22727D56C();
      v28(v29, v30);
      if ((v31 & 1) != 0
        || (v32 = *(_QWORD *)(v0 + 40),
            v33 = *(_QWORD *)(v0 + 24),
            v26(v32, v46, v33),
            v34 = sub_22727D56C(),
            v28(v32, v33),
            (v34 & 1) != 0))
      {
LABEL_7:
        swift_bridgeObjectRelease();
      }
      else
      {
        v40 = *(_QWORD *)(v0 + 40);
        v41 = *(_QWORD *)(v0 + 24);
        v26(v40, v44, v41);
        v42 = sub_22727D56C();
        v28(v40, v41);
        swift_bridgeObjectRelease();
        if ((v42 & 1) == 0)
        {
          v28(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 24));
          swift_bridgeObjectRelease();
          v35 = 1;
          goto LABEL_10;
        }
      }
      v28(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 24));
      swift_bridgeObjectRelease();
    }
  }
  v35 = 0;
LABEL_10:
  v36 = *(_QWORD *)(v0 + 112);
  v37 = *(_QWORD *)(v0 + 88);
  v38 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 96) + 8);
  v38(*(_QWORD *)(v0 + 104), v37);
  v38(v36, v37);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v35);
}

uint64_t FirstPartyMusicSubscriber.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t FirstPartyMusicSubscriber.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_227242D40()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_227242D88;
  return FirstPartyMusicSubscriber.filter(suggestion:environment:)();
}

uint64_t sub_227242D88(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t *sub_227242DD8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;

  a2[5] = a3;
  a2[6] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a2 + 2);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  return a2;
}

uint64_t *sub_227242E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;

  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for FirstPartyMusicSubscriber();
  v10 = (uint64_t *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  v10[5] = a3;
  v10[6] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10 + 2);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 32))(boxed_opaque_existential_1, v9, a3);
  return v10;
}

uint64_t type metadata accessor for FirstPartyMusicSubscriber()
{
  return objc_opt_self();
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

uint64_t destroy for SearchMusicAppIntent()
{
  swift_release();
  return swift_release();
}

_QWORD *_s17SiriAudioInternal20SearchMusicAppIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SearchMusicAppIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SearchMusicAppIntent(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchMusicAppIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchMusicAppIntent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchMusicAppIntent()
{
  return &type metadata for SearchMusicAppIntent;
}

void sub_2272430C8()
{
  qword_2558CC218 = 0x6C7070612E6D6F63;
  unk_2558CC220 = 0xEF636973754D2E65;
}

uint64_t sub_2272430F8()
{
  uint64_t v0;

  if (qword_2558CB358 != -1)
    swift_once();
  v0 = qword_2558CC218;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_227243154()
{
  return 0xD000000000000014;
}

uint64_t sub_227243170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v0 = sub_22727D8B4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22727D554();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22727D548();
  sub_22727D8A8();
  v8 = MEMORY[0x2276AE570](0xD000000000000029, 0x800000022727F810, v7, v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  qword_2558CB670 = v8;
  return result;
}

id INUpdateMediaAffinityIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id INUpdateMediaAffinityIntentHandler.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v12;

  v0 = sub_22727CF3C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v12 - v5;
  sub_22727D0F8();
  sub_22727D0EC();
  sub_22727CF30();
  sub_22727D1F4();
  swift_allocObject();
  v7 = sub_22727D1E8();
  sub_22727D470();
  v8 = sub_22727D464();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v9 = swift_retain();
  v10 = sub_227246090(v9, (uint64_t)v4, v7, v8);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

void INUpdateMediaAffinityIntentHandler.handle(intent:completion:)(void *a1, void (*a2)(id), uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  SEL *v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  char *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  _QWORD v39[2];
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  char *v44;
  void (*v45)(id);
  id v46;
  char *v47;

  v45 = a2;
  v5 = sub_22727D4E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v39 - v10;
  if (qword_2558CB378 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v5, (uint64_t)qword_2558CC248);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v42 = v12;
  v43 = v13;
  ((void (*)(char *))v13)(v11);
  v14 = a1;
  v15 = sub_22727D4D0();
  v16 = sub_22727D794();
  v17 = (SEL *)&unk_24EF8C000;
  if (os_log_type_enabled(v15, v16))
  {
    v41 = a3;
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v47 = (char *)v19;
    v40 = v9;
    *(_DWORD *)v18 = 136315138;
    v39[1] = v18 + 4;
    v46 = objc_msgSend(v14, sel_affinityType);
    type metadata accessor for INMediaAffinityType(0);
    v20 = sub_22727D590();
    v46 = (id)sub_2272403C4(v20, v21, (uint64_t *)&v47);
    v9 = v40;
    sub_22727D920();

    a3 = v41;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v15, v16, "INUpdateMediaAffinityIntentHandler#handle affinityType: %s", v18, 0xCu);
    swift_arrayDestroy();
    v22 = v19;
    v17 = (SEL *)&unk_24EF8C000;
    MEMORY[0x2276AF6D4](v22, -1, -1);
    MEMORY[0x2276AF6D4](v18, -1, -1);

  }
  else
  {

  }
  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v11, v5);
  v24 = (char *)objc_msgSend(v14, v17[453]);
  if ((unint64_t)(v24 - 1) > 1)
  {
    v43(v9, v42, v5);
    v28 = sub_22727D4D0();
    v29 = sub_22727D788();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v30 = 134217984;
      v47 = v24;
      sub_22727D920();
      _os_log_impl(&dword_22723A000, v28, v29, "INUpdateMediaAffinityIntentHandler#handle unknown affinityType: %ld)", v30, 0xCu);
      MEMORY[0x2276AF6D4](v30, -1, -1);
    }

    v23(v9, v5);
    v31 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v32 = (void *)sub_22727D578();
    v33 = objc_msgSend(v31, sel_initWithActivityType_, v32);

    v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA2A8]), sel_initWithCode_userActivity_, 4, v33);
    v45(v34);

  }
  else
  {
    v25 = objc_msgSend(v14, sel_mediaSearch);
    v26 = v25;
    if (v25)
    {
      v27 = objc_msgSend(v25, sel_mediaType);

    }
    else
    {
      v27 = 0;
    }
    v35 = v44;
    __swift_project_boxed_opaque_existential_1(&v44[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_nowPlayingProvider], *(_QWORD *)&v44[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_nowPlayingProvider + 24]);
    v36 = swift_allocObject();
    *(_QWORD *)(v36 + 16) = v45;
    *(_QWORD *)(v36 + 24) = a3;
    *(_QWORD *)(v36 + 32) = v35;
    *(_QWORD *)(v36 + 40) = v24;
    *(_QWORD *)(v36 + 48) = v27;
    *(_BYTE *)(v36 + 56) = v26 == 0;
    *(_QWORD *)(v36 + 64) = v14;
    v37 = v14;
    swift_retain();
    v38 = v35;
    sub_22727CFE4();
    swift_release();
  }
}

uint64_t sub_22724398C(uint64_t a1, void (*a2)(void), uint64_t a3, char *a4, uint64_t a5, void (*a6)(char *, char *, uint64_t), int a7, void *a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (**v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  void (**v36)(char *, char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  void (*v53)(char *, char *, uint64_t);
  char *v54;
  char *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  void (*v62)(char *, char *, uint64_t);
  int v63;
  char *v64;
  void (**v65)(char *, char *, uint64_t);
  char *v66;
  char *v67;
  char v68;
  char v69;
  void *v70;
  uint64_t v71;
  void (**v72)(char *, char *, uint64_t);
  void (*v73)(char *, char *, uint64_t);
  void (**v74)(char *, uint64_t, uint64_t, uint64_t);
  char v75;
  uint64_t v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, char *, uint64_t);
  NSObject *v84;
  os_log_type_t v85;
  uint64_t v86;
  uint8_t *v87;
  void *v88;
  void *v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  void (*v94)(char *, char *, uint64_t);
  char *v95;
  char *v96;
  uint64_t v97;
  char v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  id v104;
  NSObject *v105;
  uint64_t v106;
  os_log_type_t v107;
  uint8_t *v108;
  void *v109;
  id v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  char *v117;
  id v118;
  void *v119;
  id v120;
  id v121;
  BOOL v123;
  int v124;
  char *v125;
  uint64_t v126;
  char *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  void *v132;
  id v133;
  id v134;
  uint64_t v136;
  id v137;
  id v138;
  char v139;
  uint64_t v140;
  id v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  void (*v146)(char *, char *, uint64_t);
  char *v147;
  NSObject *v148;
  os_log_type_t v149;
  uint8_t *v150;
  void *v151;
  uint64_t v152;
  unint64_t v153;
  void (*v154)(char *, char *, uint64_t);
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  void (*v159)(char *, char *, uint64_t);
  char *v160;
  NSObject *v161;
  os_log_type_t v162;
  uint8_t *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  unint64_t v167;
  void (*v168)(char *, char *, uint64_t);
  uint64_t v169;
  id v170;
  id v171;
  uint64_t v172;
  id v173;
  id v174;
  char *v175;
  char *v176;
  char *v177;
  char *v178;
  char *v179;
  char *v180;
  char *v181;
  char *v182;
  void *v183;
  char *v184;
  char *v185;
  char *v186;
  char *v187;
  void (**v188)(char *, uint64_t, uint64_t, uint64_t);
  char *v189;
  char *v190;
  void (*v191)(char *, char *, uint64_t);
  uint64_t v192;
  void (*v193)(void);
  uint64_t v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  id v200;
  uint64_t v201;
  uint64_t v202;

  v183 = a8;
  LODWORD(v185) = a7;
  v191 = a6;
  v194 = a5;
  v181 = a4;
  v192 = a3;
  v193 = a2;
  v195 = (char *)a1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB750);
  MEMORY[0x24BDAC7A8](v8);
  v182 = (char *)&v175 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22727CD68();
  v11 = *(void (***)(char *, char *, uint64_t))(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v187 = (char *)&v175 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v176 = (char *)&v175 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v180 = (char *)&v175 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v175 = (char *)&v175 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v175 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB758);
  MEMORY[0x24BDAC7A8](v22);
  v190 = (char *)&v175 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_22727D4E8();
  v25 = *(_QWORD *)(v24 - 8);
  v196 = v24;
  v197 = v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v184 = (char *)&v175 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v189 = (char *)&v175 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v178 = (char *)&v175 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v177 = (char *)&v175 - v33;
  MEMORY[0x24BDAC7A8](v32);
  v186 = (char *)&v175 - v34;
  v35 = sub_22727CFCC();
  v36 = *(void (***)(char *, char *, uint64_t))(v35 - 8);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v179 = (char *)&v175 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = MEMORY[0x24BDAC7A8](v37);
  v188 = (void (**)(char *, uint64_t, uint64_t, uint64_t))((char *)&v175 - v40);
  v41 = MEMORY[0x24BDAC7A8](v39);
  v43 = (char *)&v175 - v42;
  MEMORY[0x24BDAC7A8](v41);
  v45 = (char *)&v175 - v44;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB760);
  MEMORY[0x24BDAC7A8](v46);
  v48 = (char *)&v175 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2272471A0((uint64_t)v195, (uint64_t)v48, &qword_2558CB760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v36[4](v45, v48, v35);
    if (qword_2558CB378 != -1)
      swift_once();
    v49 = v196;
    v50 = __swift_project_value_buffer(v196, (uint64_t)qword_2558CC248);
    v51 = v197;
    v52 = v186;
    (*(void (**)(char *, uint64_t, uint64_t))(v197 + 16))(v186, v50, v49);
    v53 = v36[2];
    v195 = v45;
    v54 = v45;
    v55 = v52;
    v191 = v53;
    v53(v43, v54, v35);
    v56 = sub_22727D4D0();
    v57 = sub_22727D788();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = (uint8_t *)swift_slowAlloc();
      v59 = (void *)swift_slowAlloc();
      v200 = v59;
      *(_DWORD *)v58 = 136446210;
      v189 = (char *)(v58 + 4);
      sub_22723CA60(&qword_2558CB780, (uint64_t (*)(uint64_t))MEMORY[0x24BE91400], MEMORY[0x24BE91418]);
      v60 = sub_22727DA34();
      v198 = (id)sub_2272403C4(v60, v61, (uint64_t *)&v200);
      sub_22727D920();
      swift_bridgeObjectRelease();
      v62 = v36[1];
      ((void (*)(char *, uint64_t))v62)(v43, v35);
      _os_log_impl(&dword_22723A000, v56, v57, "INUpdateMediaAffinityIntentHandler#handle resolveNowPlayingMediaItem nowPlaying item error: %{public}s", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v59, -1, -1);
      MEMORY[0x2276AF6D4](v58, -1, -1);

      (*(void (**)(char *, uint64_t))(v197 + 8))(v55, v196);
    }
    else
    {
      v62 = v36[1];
      ((void (*)(char *, uint64_t))v62)(v43, v35);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v55, v49);
    }
    v71 = v194;
    v72 = v36;
    v73 = v36[13];
    v74 = v188;
    v73((char *)v188, (char *)*MEMORY[0x24BE913F0], v35);
    sub_22723CA60(&qword_2558CB778, (uint64_t (*)(uint64_t))MEMORY[0x24BE91400], MEMORY[0x24BE91410]);
    sub_22727D608();
    sub_22727D608();
    if (v200 == v198 && v201 == v199)
    {
      swift_bridgeObjectRelease_n();
      ((void (*)(void (**)(char *, uint64_t, uint64_t, uint64_t), uint64_t))v62)(v74, v35);
LABEL_18:
      v76 = (uint64_t)v190;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v72[7])(v190, 1, 1, v35);
      v77 = sub_227246988(v71, v76);
      sub_227246BC0(v76, &qword_2558CB758);
      v78 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA2A8]), sel_initWithCode_userActivity_, 4, v77);

      ((void (*)(id))v193)(v78);
      v79 = (uint64_t)v195;
      return ((uint64_t (*)(uint64_t, uint64_t))v62)(v79, v35);
    }
    v75 = sub_22727DA10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ((void (*)(void (**)(char *, uint64_t, uint64_t, uint64_t), uint64_t))v62)(v74, v35);
    if ((v75 & 1) != 0)
      goto LABEL_18;
    v96 = v179;
    v73(v179, (char *)*MEMORY[0x24BE913E8], v35);
    v97 = (uint64_t)v195;
    sub_22727D608();
    sub_22727D608();
    if (v200 == v198 && v201 == v199)
    {
      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v62)(v96, v35);
    }
    else
    {
      v139 = sub_22727DA10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v62)(v96, v35);
      if ((v139 & 1) == 0)
      {
LABEL_55:
        v79 = v97;
        return ((uint64_t (*)(uint64_t, uint64_t))v62)(v79, v35);
      }
    }
    v140 = (uint64_t)v190;
    v191(v190, (char *)v97, v35);
    ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v72[7])(v140, 0, 1, v35);
    v141 = sub_227246988(v71, v140);
    sub_227246BC0(v140, &qword_2558CB758);
    v142 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA2A8]), sel_initWithCode_userActivity_, 4, v141);

    ((void (*)(id))v193)(v142);
    goto LABEL_55;
  }
  v188 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v36;
  v195 = (char *)v35;
  v63 = v185 & 1;
  v11[4](v21, v48, v10);
  v64 = v21;
  v65 = v11;
  v66 = v187;
  v67 = v189;
  if (v63)
    goto LABEL_11;
  if (v191 != (void (*)(char *, char *, uint64_t))2)
  {
    if (v191 == (void (*)(char *, char *, uint64_t))3)
    {
      sub_22727CD5C();
      if ((v68 & 1) == 0)
        goto LABEL_27;
      v143 = v196;
      if (qword_2558CB378 != -1)
        swift_once();
      v144 = __swift_project_value_buffer(v143, (uint64_t)qword_2558CC248);
      v145 = v177;
      (*(void (**)(char *, uint64_t, uint64_t))(v197 + 16))(v177, v144, v143);
      v146 = v65[2];
      v147 = v175;
      v146(v175, v21, v10);
      v148 = sub_22727D4D0();
      v149 = sub_22727D788();
      if (os_log_type_enabled(v148, v149))
      {
        v150 = (uint8_t *)swift_slowAlloc();
        v151 = (void *)swift_slowAlloc();
        v200 = v151;
        v186 = (char *)v65;
        *(_DWORD *)v150 = 136315138;
        v191 = (void (*)(char *, char *, uint64_t))(v150 + 4);
        v146(v180, v147, v10);
        v152 = sub_22727D590();
        v202 = sub_2272403C4(v152, v153, (uint64_t *)&v200);
        sub_22727D920();
        swift_bridgeObjectRelease();
        v154 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v186 + 1);
        ((void (*)(char *, uint64_t))v154)(v147, v10);
        _os_log_impl(&dword_22723A000, v148, v149, "INUpdateMediaAffinityIntentHandler#handle missing artistId from nowPlayingInfo: %s", v150, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v151, -1, -1);
        MEMORY[0x2276AF6D4](v150, -1, -1);

        (*(void (**)(char *, uint64_t))(v197 + 8))(v177, v196);
      }
      else
      {
        v154 = v65[1];
        ((void (*)(char *, uint64_t))v154)(v147, v10);

        (*(void (**)(char *, uint64_t))(v197 + 8))(v145, v143);
      }
      v169 = (uint64_t)v190;
      v188[7](v190, 1, 1, (uint64_t)v195);
      v170 = sub_227246988(v194, v169);
      sub_227246BC0(v169, &qword_2558CB758);
      v171 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA2A8]), sel_initWithCode_userActivity_, 4, v170);

      ((void (*)(id))v193)(v171);
      return ((uint64_t (*)(char *, uint64_t))v154)(v64, v10);
    }
LABEL_11:
    sub_22727CD44();
    if ((v69 & 1) == 0)
    {
      sub_22727CE94();
      swift_allocObject();
      sub_22727CE88();
      sub_22727CD14();
      v70 = (void *)sub_22727CE7C();
      swift_release();
      swift_bridgeObjectRelease();
      v198 = v70;
      goto LABEL_28;
    }
    if (qword_2558CB378 != -1)
      swift_once();
    v80 = v196;
    v81 = __swift_project_value_buffer(v196, (uint64_t)qword_2558CC248);
    v82 = v197;
    (*(void (**)(char *, uint64_t, uint64_t))(v197 + 16))(v67, v81, v80);
    v83 = v65[2];
    v83(v66, v64, v10);
    v84 = sub_22727D4D0();
    v85 = sub_22727D788();
    if (os_log_type_enabled(v84, v85))
    {
      v185 = v64;
      v86 = v10;
      v87 = (uint8_t *)swift_slowAlloc();
      v88 = (void *)swift_slowAlloc();
      v186 = (char *)v65;
      v89 = v88;
      v200 = v88;
      *(_DWORD *)v87 = 136315138;
      v191 = (void (*)(char *, char *, uint64_t))(v87 + 4);
      v90 = v66;
      v83(v180, v66, v86);
      v91 = sub_22727D590();
      v202 = sub_2272403C4(v91, v92, (uint64_t *)&v200);
      v93 = v86;
      v64 = v185;
      sub_22727D920();
      swift_bridgeObjectRelease();
      v94 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v186 + 1);
      v95 = v90;
      v10 = v93;
      ((void (*)(char *, uint64_t))v94)(v95, v93);
      _os_log_impl(&dword_22723A000, v84, v85, "INUpdateMediaAffinityIntentHandler#handle missing songId from nowPlayingInfo: %s", v87, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v89, -1, -1);
      MEMORY[0x2276AF6D4](v87, -1, -1);

      (*(void (**)(char *, uint64_t))(v197 + 8))(v189, v80);
    }
    else
    {
      v94 = v65[1];
      ((void (*)(char *, uint64_t))v94)(v66, v10);

      (*(void (**)(char *, uint64_t))(v82 + 8))(v189, v80);
    }
    v136 = (uint64_t)v190;
    v188[7](v190, 1, 1, (uint64_t)v195);
    v137 = sub_227246988(v194, v136);
    sub_227246BC0(v136, &qword_2558CB758);
    v138 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA2A8]), sel_initWithCode_userActivity_, 4, v137);

    ((void (*)(id))v193)(v138);
    return ((uint64_t (*)(char *, uint64_t))v94)(v64, v10);
  }
  sub_22727CD50();
  if ((v98 & 1) == 0)
  {
LABEL_27:
    sub_22727CE94();
    swift_allocObject();
    sub_22727CE88();
    sub_22727CD14();
    v99 = (void *)sub_22727CE7C();
    swift_release();
    swift_bridgeObjectRelease();
    v198 = v99;
LABEL_28:
    v101 = v196;
    v100 = v197;
    v186 = (char *)v65;
    v102 = v184;
    if (qword_2558CB378 != -1)
      swift_once();
    LODWORD(v195) = v63;
    v103 = __swift_project_value_buffer(v101, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v100 + 16))(v102, v103, v101);
    v104 = v198;
    v105 = sub_22727D4D0();
    v106 = v100;
    v107 = sub_22727D770();
    if (os_log_type_enabled(v105, v107))
    {
      v108 = (uint8_t *)swift_slowAlloc();
      v109 = (void *)swift_slowAlloc();
      v200 = v109;
      *(_DWORD *)v108 = 136315138;
      v190 = (char *)(v108 + 4);
      v110 = v104;
      v111 = v10;
      v112 = objc_msgSend(v110, sel_description);
      v113 = sub_22727D584();
      v185 = v64;
      v115 = v114;

      v10 = v111;
      v202 = sub_2272403C4(v113, v115, (uint64_t *)&v200);
      sub_22727D920();

      v64 = v185;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v105, v107, "INUpdateMediaAffinityIntentHandler#model object is %s", v108, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v109, -1, -1);
      MEMORY[0x2276AF6D4](v108, -1, -1);

      (*(void (**)(char *, uint64_t))(v197 + 8))(v184, v196);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v106 + 8))(v102, v101);
    }
    v116 = v194;
    v117 = v181;
    v118 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v119 = (void *)sub_22727D578();
    v120 = objc_msgSend(v118, sel_initWithActivityType_, v119);

    __swift_project_boxed_opaque_existential_1(&v117[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider], *(_QWORD *)&v117[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider+ 24]);
    swift_beginAccess();
    v121 = v198;
    sub_22727D200();

    v123 = v116 == 2 && (_DWORD)v195 == 0 && v191 == (void (*)(char *, char *, uint64_t))1;
    v124 = v123;
    if (v123)
    {
      __swift_project_boxed_opaque_existential_1(&v117[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_mediaRemoteAPIProvider], *(_QWORD *)&v117[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_mediaRemoteAPIProvider+ 24]);
      if (qword_2558CB360 != -1)
        swift_once();
      *(_QWORD *)(swift_allocObject() + 16) = v117;
      v125 = v117;
      sub_22727D140();
      swift_release();
    }
    else if (v116 == 1)
    {
      v126 = 3;
LABEL_50:
      v127 = v186;
      v128 = v198;
      sub_2272450B0(v128, v126, v124);

      v129 = (uint64_t)v182;
      sub_22727D6A4();
      v130 = sub_22727D6BC();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v130 - 8) + 56))(v129, 0, 1, v130);
      v131 = (_QWORD *)swift_allocObject();
      v131[2] = 0;
      v131[3] = 0;
      v132 = v183;
      v131[4] = v183;
      v133 = v132;
      sub_22726AD40(v129, (uint64_t)&unk_2558CB770, (uint64_t)v131);
      swift_release();
      v134 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA2A8]), sel_initWithCode_userActivity_, 3, v120);
      v193();

      return (*((uint64_t (**)(char *, uint64_t))v127 + 1))(v64, v10);
    }
    v126 = 1;
    goto LABEL_50;
  }
  v155 = v196;
  if (qword_2558CB378 != -1)
    swift_once();
  v156 = __swift_project_value_buffer(v155, (uint64_t)qword_2558CC248);
  v157 = v197;
  v158 = v178;
  (*(void (**)(char *, uint64_t, uint64_t))(v197 + 16))(v178, v156, v155);
  v159 = v65[2];
  v160 = v176;
  v159(v176, v21, v10);
  v161 = sub_22727D4D0();
  v162 = sub_22727D788();
  if (os_log_type_enabled(v161, v162))
  {
    v163 = (uint8_t *)swift_slowAlloc();
    v164 = (void *)swift_slowAlloc();
    v186 = (char *)v65;
    v165 = v164;
    v200 = v164;
    *(_DWORD *)v163 = 136315138;
    v191 = (void (*)(char *, char *, uint64_t))(v163 + 4);
    v159(v180, v160, v10);
    v166 = sub_22727D590();
    v202 = sub_2272403C4(v166, v167, (uint64_t *)&v200);
    sub_22727D920();
    swift_bridgeObjectRelease();
    v168 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v186 + 1);
    ((void (*)(char *, uint64_t))v168)(v160, v10);
    _os_log_impl(&dword_22723A000, v161, v162, "INUpdateMediaAffinityIntentHandler#handle missing albumId from nowPlayingInfo: %s", v163, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v165, -1, -1);
    MEMORY[0x2276AF6D4](v163, -1, -1);

    (*(void (**)(char *, uint64_t))(v197 + 8))(v178, v196);
  }
  else
  {
    v168 = v65[1];
    ((void (*)(char *, uint64_t))v168)(v160, v10);

    (*(void (**)(char *, uint64_t))(v157 + 8))(v158, v155);
  }
  v172 = (uint64_t)v190;
  v188[7](v190, 1, 1, (uint64_t)v195);
  v173 = sub_227246988(v194, v172);
  sub_227246BC0(v172, &qword_2558CB758);
  v174 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA2A8]), sel_initWithCode_userActivity_, 4, v173);

  ((void (*)(id))v193)(v174);
  return ((uint64_t (*)(char *, uint64_t))v168)(v64, v10);
}

uint64_t sub_227244E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 96) = a4;
  return swift_task_switch();
}

uint64_t sub_227244E9C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  sub_22727CB10();
  if (sub_22727CB04())
  {
    sub_22727CAF8();
    swift_release();
    v1 = sub_22727D440();
    v3 = v2;
    swift_release();
  }
  else
  {
    v1 = 0;
    v3 = 0;
  }
  v0[13] = v3;
  sub_22727D368();
  sub_22727D35C();
  v4 = v0[10];
  v5 = v0[11];
  v6 = __swift_project_boxed_opaque_existential_1(v0 + 7, v4);
  v0[5] = v4;
  v7 = *(_QWORD *)(v5 + 16);
  v0[6] = v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_1, v6, v4);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2558CB850
                                                                                     + dword_2558CB850);
  v9 = (_QWORD *)swift_task_alloc();
  v0[14] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_227244FDC;
  return v11(v0[12], v1, v3, (uint64_t)boxed_opaque_existential_1, v4, v7);
}

uint64_t sub_227244FDC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *v0 + 16;
  v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_2272450B0(void *a1, uint64_t a2, int a3)
{
  void *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30[3];
  uint64_t v31;
  _OWORD v32[2];
  uint64_t v33;

  v4 = v3;
  v28 = a3;
  v7 = sub_22727D4E8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_22727CB1C())
  {
    sub_22727CAEC();
    swift_release();
    sub_22727CAC8();
    swift_release();
  }
  else
  {
    v33 = 0;
    memset(v32, 0, sizeof(v32));
  }
  if (qword_2558CB378 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v7, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  v12 = sub_22727D4D0();
  v13 = sub_22727D77C();
  v14 = os_log_type_enabled(v12, v13);
  v27 = a2;
  if (v14)
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v26 = v4;
    v17 = v16;
    v29 = a2;
    v30[0] = v16;
    *(_DWORD *)v15 = 136315394;
    type metadata accessor for FavoriteEntityChangeRequestAction(0);
    v18 = sub_22727D590();
    v29 = sub_2272403C4(v18, v19, v30);
    sub_22727D920();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 1024;
    LODWORD(v29) = v28 & 1;
    sub_22727D920();
    _os_log_impl(&dword_22723A000, v12, v13, "INUpdateMediaAffinityIntentHandler#registerCorrection Registering correction/undo with %s, movedToNextTrack: %{BOOL}d", (uint8_t *)v15, 0x12u);
    swift_arrayDestroy();
    v20 = v17;
    v4 = v26;
    MEMORY[0x2276AF6D4](v20, -1, -1);
    MEMORY[0x2276AF6D4](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_2272471A0((uint64_t)v32, (uint64_t)v30, &qword_2558CB728);
  if (v31)
  {
    __swift_project_boxed_opaque_existential_1(v30, v31);
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v27;
    *(_QWORD *)(v21 + 24) = v4;
    *(_QWORD *)(v21 + 32) = a1;
    *(_BYTE *)(v21 + 40) = v28 & 1;
    v22 = v4;
    v23 = a1;
    sub_22727CABC();
    swift_release();
    sub_227246BC0((uint64_t)v32, &qword_2558CB728);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  }
  else
  {
    sub_227246BC0((uint64_t)v32, &qword_2558CB728);
    return sub_227246BC0((uint64_t)v30, &qword_2558CB728);
  }
}

uint64_t sub_2272453CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 + 96) = a5;
  *(_QWORD *)(v5 + 48) = a3;
  *(_QWORD *)(v5 + 56) = a4;
  *(_QWORD *)(v5 + 32) = a1;
  *(_QWORD *)(v5 + 40) = a2;
  v6 = sub_22727D4E8();
  *(_QWORD *)(v5 + 64) = v6;
  *(_QWORD *)(v5 + 72) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 80) = swift_task_alloc();
  *(_QWORD *)(v5 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_227245444()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  int v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;

  if (qword_2558CB378 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2558CC248);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v5(v1, v4, v3);
  v6 = sub_22727D4D0();
  v7 = sub_22727D77C();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 64);
  v10 = *(_QWORD *)(v0 + 72);
  if (v8)
  {
    v31 = *(_QWORD *)(v0 + 64);
    v12 = *(_QWORD *)(v0 + 40);
    v30 = *(_QWORD *)(v0 + 88);
    v13 = (uint8_t *)swift_slowAlloc();
    v32 = v5;
    v33 = swift_slowAlloc();
    v14 = v33;
    *(_DWORD *)v13 = 136315138;
    *(_QWORD *)(v0 + 16) = v12;
    type metadata accessor for FavoriteEntityChangeRequestAction(0);
    v15 = sub_22727D590();
    *(_QWORD *)(v0 + 24) = sub_2272403C4(v15, v16, &v33);
    sub_22727D920();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v6, v7, "INUpdateMediaAffinityIntentHandler#registerCorrection executing %s as a correction/undo", v13, 0xCu);
    swift_arrayDestroy();
    v17 = v14;
    v5 = v32;
    MEMORY[0x2276AF6D4](v17, -1, -1);
    MEMORY[0x2276AF6D4](v13, -1, -1);

    v18 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v18(v30, v31);
  }
  else
  {

    v18 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v18(v9, v11);
  }
  v19 = *(unsigned __int8 *)(v0 + 96);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 48)+ OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider), *(_QWORD *)(*(_QWORD *)(v0 + 48)+ OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider+ 24));
  sub_22727D200();
  if (v19 == 1)
  {
    v5(*(_QWORD *)(v0 + 80), v4, *(_QWORD *)(v0 + 64));
    v20 = sub_22727D4D0();
    v21 = sub_22727D77C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_22723A000, v20, v21, "INUpdateMediaAffinityIntentHandler#registerCorrection moving to previous track as a correction/undo", v22, 2u);
      MEMORY[0x2276AF6D4](v22, -1, -1);
    }
    v23 = *(_QWORD *)(v0 + 80);
    v24 = *(_QWORD *)(v0 + 64);
    v25 = *(_QWORD *)(v0 + 48);

    v18(v23, v24);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v25 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_playbackController), *(_QWORD *)(v25 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_playbackController + 24));
    sub_22727D47C();
  }
  v26 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v26 + 32) = 0;
  *(_OWORD *)v26 = 0u;
  *(_OWORD *)(v26 + 16) = 0u;
  v27 = *MEMORY[0x24BE987D0];
  v28 = sub_22727CAE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v26, v27, v28);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22724579C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  void (*v37)(char *, uint64_t);
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;

  v2 = sub_22727D488();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v42 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v38 - v6;
  v8 = sub_22727D4E8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v38 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB740);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2272471A0(a1, (uint64_t)v16, &qword_2558CB740);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v7, v16, v2);
    v17 = v7;
    if (qword_2558CB378 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v8, (uint64_t)qword_2558CC248);
    v19 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v43, v18, v8);
    v20 = v42;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v42, v17, v2);
    v21 = sub_22727D4D0();
    v22 = sub_22727D788();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v40 = v8;
      v41 = v17;
      v24 = v2;
      v25 = v20;
      v26 = (uint8_t *)v23;
      v39 = swift_slowAlloc();
      v45 = v39;
      *(_DWORD *)v26 = 136446210;
      v38 = v26 + 4;
      sub_22723CA60(&qword_2558CB748, (uint64_t (*)(uint64_t))MEMORY[0x24BEA4290], MEMORY[0x24BEA42A0]);
      v27 = sub_22727DA34();
      v44 = sub_2272403C4(v27, v28, &v45);
      sub_22727D920();
      swift_bridgeObjectRelease();
      v29 = *(void (**)(char *, uint64_t))(v3 + 8);
      v29(v25, v24);
      _os_log_impl(&dword_22723A000, v21, v22, "INUpdateMediaAffinityIntentHandler#registerCorrection error sending previous track command %{public}s", v26, 0xCu);
      v30 = v39;
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v30, -1, -1);
      MEMORY[0x2276AF6D4](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v19, v40);
      return ((uint64_t (*)(char *, uint64_t))v29)(v41, v24);
    }
    else
    {

      v37 = *(void (**)(char *, uint64_t))(v3 + 8);
      v37(v20, v2);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v19, v8);
      return ((uint64_t (*)(char *, uint64_t))v37)(v17, v2);
    }
  }
  else
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v32 = __swift_project_value_buffer(v8, (uint64_t)qword_2558CC248);
    v33 = v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, v32, v8);
    v34 = sub_22727D4D0();
    v35 = sub_22727D77C();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_22723A000, v34, v35, "INUpdateMediaAffinityIntentHandler#registerCorrection successfully moved to previous track", v36, 2u);
      MEMORY[0x2276AF6D4](v36, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v13, v8);
  }
}

uint64_t sub_227245BD4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD v18[3];
  uint64_t v19;

  v2 = sub_22727D4E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_227246CB4(a1);
  if ((v7 & 1) != 0)
  {
    v8 = (void *)result;
    if (qword_2558CB378 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v2, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
    v10 = v8;
    v11 = v8;
    v12 = sub_22727D4D0();
    v13 = sub_22727D788();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v19 = v15;
      *(_DWORD *)v14 = 136446210;
      v18[1] = v14 + 4;
      swift_getErrorValue();
      v16 = sub_22727DA34();
      v18[2] = sub_2272403C4(v16, v17, &v19);
      sub_22727D920();
      swift_bridgeObjectRelease();
      sub_227247114(v8, 1);
      sub_227247114(v8, 1);
      _os_log_impl(&dword_22723A000, v12, v13, "INUpdateMediaAffinityIntentHandler#handle error sending next track command %{public}s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v15, -1, -1);
      MEMORY[0x2276AF6D4](v14, -1, -1);

      sub_227247114(v8, 1);
    }
    else
    {
      sub_227247114(v8, 1);
      sub_227247114(v8, 1);

    }
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

id INUpdateMediaAffinityIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INUpdateMediaAffinityIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static MRCommandError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t MRCommandError.hash(into:)()
{
  return sub_22727DA7C();
}

uint64_t MRCommandError.hashValue.getter()
{
  sub_22727DA70();
  sub_22727DA7C();
  return sub_22727DA88();
}

uint64_t sub_227245F1C()
{
  return 1;
}

uint64_t sub_227245F24()
{
  sub_22727DA70();
  sub_22727DA7C();
  return sub_22727DA88();
}

uint64_t sub_227245F64()
{
  return sub_22727DA7C();
}

uint64_t sub_227245F88()
{
  sub_22727DA70();
  sub_22727DA7C();
  return sub_22727DA88();
}

void *sub_227245FD4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_22727D9E0();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_227246068@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

id sub_227246090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t *boxed_opaque_existential_1;
  objc_class *v10;
  id v11;
  id v12;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  v18[3] = sub_22727D470();
  v18[4] = MEMORY[0x24BEA40F0];
  v18[0] = a4;
  v17[3] = sub_22727D0F8();
  v17[4] = MEMORY[0x24BE91570];
  v17[0] = a1;
  v8 = sub_22727CF3C();
  v16[3] = v8;
  v16[4] = MEMORY[0x24BE91368];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(boxed_opaque_existential_1, a2, v8);
  v15[3] = sub_22727D1F4();
  v15[4] = MEMORY[0x24BE91690];
  v15[0] = a3;
  v10 = (objc_class *)type metadata accessor for INUpdateMediaAffinityIntentHandler();
  v11 = objc_allocWithZone(v10);
  sub_227240AC4((uint64_t)v17, (uint64_t)v11 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_mediaRemoteAPIProvider);
  sub_227240AC4((uint64_t)v16, (uint64_t)v11 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_nowPlayingProvider);
  sub_227240AC4((uint64_t)v15, (uint64_t)v11 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider);
  sub_227240AC4((uint64_t)v18, (uint64_t)v11 + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_playbackController);
  v14.receiver = v11;
  v14.super_class = v10;
  v12 = objc_msgSendSuper2(&v14, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  return v12;
}

uint64_t type metadata accessor for INUpdateMediaAffinityIntentHandler()
{
  return objc_opt_self();
}

unint64_t sub_22724620C()
{
  unint64_t result;

  result = qword_2558CB680;
  if (!qword_2558CB680)
  {
    result = MEMORY[0x2276AF644](&protocol conformance descriptor for MRCommandError, &type metadata for MRCommandError);
    atomic_store(result, (unint64_t *)&qword_2558CB680);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MRCommandError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MRCommandError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2272462E8 + 4 * byte_22727E6B0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_227246308 + 4 * byte_22727E6B5[v4]))();
}

_BYTE *sub_2272462E8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_227246308(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_227246310(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_227246318(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_227246320(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_227246328(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_227246334()
{
  return 0;
}

ValueMetadata *type metadata accessor for MRCommandError()
{
  return &type metadata for MRCommandError;
}

uint64_t sub_22724634C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_227246378(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_2272463F4;
  return sub_2272453CC(a1, v4, v5, v6, v7);
}

uint64_t sub_2272463F4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_22724643C(void *a1, char *a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  SEL *v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  char *v33;
  uint8_t *v34;
  uint8_t *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  char *v40;
  uint64_t v41;
  id v42;
  char *v43;
  _QWORD v44[2];
  uint64_t v45;
  char *v46;
  void (**v47)(_QWORD, _QWORD);
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  id v51;
  char *v52;

  v48 = a2;
  v5 = sub_22727D4E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v44 - v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  _Block_copy(a3);
  if (qword_2558CB378 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v5, (uint64_t)qword_2558CC248);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v49 = v13;
  v50 = v14;
  ((void (*)(char *))v14)(v11);
  v15 = a1;
  v16 = sub_22727D4D0();
  v17 = sub_22727D794();
  v18 = (SEL *)&unk_24EF8C000;
  if (os_log_type_enabled(v16, v17))
  {
    v45 = v6;
    v19 = swift_slowAlloc();
    v46 = v9;
    v20 = (uint8_t *)v19;
    v21 = swift_slowAlloc();
    v52 = (char *)v21;
    v47 = a3;
    *(_DWORD *)v20 = 136315138;
    v44[1] = v20 + 4;
    v51 = objc_msgSend(v15, sel_affinityType);
    type metadata accessor for INMediaAffinityType(0);
    v22 = sub_22727D590();
    v51 = (id)sub_2272403C4(v22, v23, (uint64_t *)&v52);
    a3 = v47;
    sub_22727D920();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v16, v17, "INUpdateMediaAffinityIntentHandler#handle affinityType: %s", v20, 0xCu);
    swift_arrayDestroy();
    v24 = v21;
    v18 = (SEL *)&unk_24EF8C000;
    MEMORY[0x2276AF6D4](v24, -1, -1);
    v25 = v20;
    v9 = v46;
    MEMORY[0x2276AF6D4](v25, -1, -1);

    v26 = *(void (**)(char *, uint64_t))(v45 + 8);
  }
  else
  {

    v26 = *(void (**)(char *, uint64_t))(v6 + 8);
  }
  v26(v11, v5);
  v27 = (char *)objc_msgSend(v15, v18[453]);
  if ((unint64_t)(v27 - 1) > 1)
  {
    v50(v9, v49, v5);
    v31 = sub_22727D4D0();
    v32 = sub_22727D788();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = v9;
      v34 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v34 = 134217984;
      v52 = v27;
      sub_22727D920();
      _os_log_impl(&dword_22723A000, v31, v32, "INUpdateMediaAffinityIntentHandler#handle unknown affinityType: %ld)", v34, 0xCu);
      v35 = v34;
      v9 = v33;
      MEMORY[0x2276AF6D4](v35, -1, -1);
    }

    v26(v9, v5);
    v36 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v37 = (void *)sub_22727D578();
    v38 = objc_msgSend(v36, sel_initWithActivityType_, v37);

    v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA2A8]), sel_initWithCode_userActivity_, 4, v38);
    ((void (**)(_QWORD, id))a3)[2](a3, v39);
    swift_release();

  }
  else
  {
    v28 = objc_msgSend(v15, sel_mediaSearch);
    v29 = v28;
    if (v28)
    {
      v30 = objc_msgSend(v28, sel_mediaType);

    }
    else
    {
      v30 = 0;
    }
    v40 = v48;
    __swift_project_boxed_opaque_existential_1(&v40[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_nowPlayingProvider], *(_QWORD *)&v40[OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_nowPlayingProvider + 24]);
    v41 = swift_allocObject();
    *(_QWORD *)(v41 + 16) = sub_227246928;
    *(_QWORD *)(v41 + 24) = v12;
    *(_QWORD *)(v41 + 32) = v40;
    *(_QWORD *)(v41 + 40) = v27;
    *(_QWORD *)(v41 + 48) = v30;
    *(_BYTE *)(v41 + 56) = v29 == 0;
    *(_QWORD *)(v41 + 64) = v15;
    v42 = v15;
    swift_retain();
    v43 = v40;
    sub_22727CFE4();
    swift_release();
    swift_release();
  }
}

uint64_t sub_227246904()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_227246928()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_227246970(uint64_t a1)
{
  uint64_t v1;

  return sub_22724398C(a1, *(void (**)(void))(v1 + 16), *(_QWORD *)(v1 + 24), *(char **)(v1 + 32), *(_QWORD *)(v1 + 40), *(void (**)(char *, char *, uint64_t))(v1 + 48), *(unsigned __int8 *)(v1 + 56), *(void **)(v1 + 64));
}

id sub_227246988(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[3];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB758);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22727CFCC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_allocWithZone(MEMORY[0x24BDD1960]);
  v11 = (void *)sub_22727D578();
  v12 = objc_msgSend(v10, sel_initWithActivityType_, v11);

  sub_2272471A0(a2, (uint64_t)v5, &qword_2558CB758);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_227246BC0((uint64_t)v5, &qword_2558CB758);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB798);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22727E530;
    v19[1] = 0x726F727265;
    v19[2] = 0xE500000000000000;
    v14 = MEMORY[0x24BEE0D00];
    sub_22727D95C();
    v15 = sub_22727CFC0();
    *(_QWORD *)(inited + 96) = v14;
    *(_QWORD *)(inited + 72) = v15;
    *(_QWORD *)(inited + 80) = v16;
    sub_227248364(inited);
    v17 = (void *)sub_22727D560();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setUserInfo_, v17);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v12;
}

uint64_t sub_227246BC0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_227246BFC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_227246C28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2272471E4;
  v3[12] = v2;
  return swift_task_switch();
}

uint64_t sub_227246C88()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_227246CAC(uint64_t a1)
{
  return sub_227245BD4(a1);
}

uint64_t sub_227246CB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char *v23;
  uint8_t *v24;
  uint8_t *v25;
  void (*v26)(char *, uint64_t);
  uint64_t result;
  unint64_t v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  unint64_t v47;

  v2 = sub_22727D4E8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v44 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)&v44 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v44 - v12;
  if (qword_2558CB378 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v2, (uint64_t)qword_2558CC248);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v15(v13, v14, v2);
  v16 = sub_22727D4D0();
  v17 = sub_22727D77C();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v45 = v6;
    v19 = v2;
    v20 = a1;
    v21 = v14;
    v22 = v15;
    v23 = v9;
    v24 = v18;
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_22723A000, v16, v17, "INUpdateMediaAffinityIntentHandler#handleSendCommandResult handling statuses from affinity MRMediaRemoteCommand", v18, 2u);
    v25 = v24;
    v9 = v23;
    v15 = v22;
    v14 = v21;
    a1 = v20;
    v2 = v19;
    v6 = v45;
    MEMORY[0x2276AF6D4](v25, -1, -1);
  }

  v26 = *(void (**)(char *, uint64_t))(v3 + 8);
  v26(v13, v2);
  if (!a1 || (v47 = 0, sub_227247164(), result = sub_22727D62C(), (v28 = v47) == 0))
  {
    v15(v6, v14, v2);
    v35 = sub_22727D4D0();
    v36 = sub_22727D77C();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_22723A000, v35, v36, "INUpdateMediaAffinityIntentHandler#handleSendCommandResult command statuses are nil, command failed", v37, 2u);
      MEMORY[0x2276AF6D4](v37, -1, -1);
    }

    v38 = v6;
    goto LABEL_24;
  }
  if (!(v47 >> 62))
  {
    if (*(_QWORD *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_9;
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    v40 = v46;
    v15(v46, v14, v2);
    v41 = sub_22727D4D0();
    v42 = sub_22727D77C();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_22723A000, v41, v42, "INUpdateMediaAffinityIntentHandler#handleSendCommandResult command statuses are empty or non-zero, command failed", v43, 2u);
      MEMORY[0x2276AF6D4](v43, -1, -1);
    }

    v38 = v40;
LABEL_24:
    v26(v38, v2);
    sub_227247120();
    return swift_allocError();
  }
  swift_bridgeObjectRetain();
  v39 = sub_22727D9BC();
  result = swift_bridgeObjectRelease();
  if (!v39)
    goto LABEL_20;
LABEL_9:
  if ((v28 & 0xC000000000000001) != 0)
  {
    v29 = (id)MEMORY[0x2276AF200](0, v28);
  }
  else
  {
    if (!*(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    v29 = *(id *)(v28 + 32);
  }
  v30 = v29;
  swift_bridgeObjectRelease();
  v31 = objc_msgSend(v30, sel_integerValue);

  if (v31)
    goto LABEL_21;
  v15(v9, v14, v2);
  v32 = sub_22727D4D0();
  v33 = sub_22727D77C();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_22723A000, v32, v33, "INUpdateMediaAffinityIntentHandler#handleSendCommandResult command succeeded", v34, 2u);
    MEMORY[0x2276AF6D4](v34, -1, -1);
  }

  v26(v9, v2);
  return 0;
}

void sub_227247114(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

unint64_t sub_227247120()
{
  unint64_t result;

  result = qword_2558CB788;
  if (!qword_2558CB788)
  {
    result = MEMORY[0x2276AF644](&protocol conformance descriptor for MRCommandError, &type metadata for MRCommandError);
    atomic_store(result, (unint64_t *)&qword_2558CB788);
  }
  return result;
}

unint64_t sub_227247164()
{
  unint64_t result;

  result = qword_2558CB790;
  if (!qword_2558CB790)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558CB790);
  }
  return result;
}

uint64_t sub_2272471A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ArtistNameParameterBuilder(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *((unsigned __int8 *)a1 + 1);
  v7 = v6 >= 2;
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ArtistNameParameterBuilder(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2272472E4 + 4 * byte_22727E7D5[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_227247318 + 4 * asc_22727E7D0[v4]))();
}

uint64_t sub_227247318(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_227247320(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x227247328);
  return result;
}

uint64_t sub_227247334(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x22724733CLL);
  *(_BYTE *)(result + 1) = a2 + 1;
  return result;
}

uint64_t sub_227247340(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_227247348(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ArtistNameParameterBuilder()
{
  return &type metadata for ArtistNameParameterBuilder;
}

uint64_t sub_227247364()
{
  uint64_t v0;

  v0 = sub_22727D4E8();
  __swift_allocate_value_buffer(v0, static Logger.audio);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.audio);
  return sub_22727D4DC();
}

uint64_t Logger.audio.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_2558CB368 != -1)
    swift_once();
  v0 = sub_22727D4E8();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.audio);
}

uint64_t static Logger.audio.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2558CB368 != -1)
    swift_once();
  v2 = sub_22727D4E8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.audio);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

uint64_t INSearchForMediaIntentHandler.resolveMediaItems(for:with:)(void *a1, void (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint8_t *v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  os_log_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint8_t *v44;
  uint8_t *v45;
  int v46;
  uint64_t v47;
  os_log_t v48;
  uint64_t v49;
  uint64_t v50[5];

  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, sel_privateSearchForMediaIntentData);
  if (!v8)
    goto LABEL_21;
  v9 = v8;
  v10 = objc_msgSend(v8, sel_audioSearchResults);

  if (!v10)
    goto LABEL_21;
  sub_227247C88(0, (unint64_t *)&qword_2558CB810);
  v11 = sub_22727D638();

  if (!(v11 >> 62))
  {
    v12 = *(void **)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
      goto LABEL_5;
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  v12 = (void *)sub_22727D9BC();
  swift_bridgeObjectRelease();
  if (!v12)
  {
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_22727E830;
    sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
    *(_QWORD *)(v40 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v50[0] = v40;
    sub_22727D650();
    a2(v50[0]);
    return swift_bridgeObjectRelease();
  }
LABEL_5:
  if ((v11 & 0xC000000000000001) != 0)
  {
    v13 = (id)MEMORY[0x2276AF200](0, v11);
  }
  else
  {
    if (!*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_25;
    }
    v13 = *(id *)(v11 + 32);
  }
  v12 = v13;
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_privateMediaItemValueData);
  if (!v14)
    goto LABEL_16;
  v15 = v14;
  v16 = objc_msgSend(v14, sel_punchoutURI);

  if (!v16)
    goto LABEL_16;
  v17 = sub_22727D584();
  v19 = v18;

  swift_bridgeObjectRelease();
  v20 = HIBYTE(v19) & 0xF;
  if ((v19 & 0x2000000000000000) == 0)
    v20 = v17 & 0xFFFFFFFFFFFFLL;
  if (!v20)
  {
LABEL_16:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_22727E830;
    sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
    *(_QWORD *)(v36 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v50[0] = v36;
    sub_22727D650();
    a2(v50[0]);

    return swift_bridgeObjectRelease();
  }
  if (qword_2558CB378 != -1)
LABEL_25:
    swift_once();
  v21 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v21, v4);
  v22 = v12;
  v23 = sub_22727D4D0();
  v24 = sub_22727D77C();
  v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    v48 = v23;
    v26 = swift_slowAlloc();
    v46 = v25;
    v27 = (uint8_t *)v26;
    v47 = swift_slowAlloc();
    v50[0] = v47;
    v45 = v27;
    *(_DWORD *)v27 = 136315138;
    v44 = v27 + 4;
    v28 = v22;
    v29 = objc_msgSend(v28, sel_description);
    v43 = v22;
    v30 = v29;
    v42 = sub_22727D584();
    v32 = v31;

    v22 = v43;
    v49 = sub_2272403C4(v42, v32, v50);
    sub_22727D920();

    swift_bridgeObjectRelease();
    v33 = v48;
    v34 = v45;
    _os_log_impl(&dword_22723A000, v48, (os_log_type_t)v46, "INSearchForMediaIntentHandler#resolveMediaItems resolving item: %s", v45, 0xCu);
    v35 = v47;
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v35, -1, -1);
    MEMORY[0x2276AF6D4](v34, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v50[3] = sub_227247C88(0, &qword_2558CB9E0);
  v50[4] = MEMORY[0x24BE91800];
  v50[0] = (uint64_t)a1;
  v37 = a1;
  sub_22727D728();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_22727E830;
  sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
  *(_QWORD *)(v38 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v22);
  v50[0] = v38;
  sub_22727D650();
  a2(v50[0]);

  return swift_bridgeObjectRelease();
}

void INSearchForMediaIntentHandler.handle(intent:completion:)(uint64_t a1, void (*a2)(void))
{
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA070]), sel_initWithCode_userActivity_, 4, 0);
  a2();

}

id INSearchForMediaIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id INSearchForMediaIntentHandler.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INSearchForMediaIntentHandler();
  return objc_msgSendSuper2(&v2, sel_init);
}

id INSearchForMediaIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INSearchForMediaIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_227247C88(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for INSearchForMediaIntentHandler()
{
  return objc_opt_self();
}

void sub_227247CE0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint8_t *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  os_log_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint8_t *v43;
  uint8_t *v44;
  int v45;
  uint64_t v46;
  os_log_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50[5];

  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, sel_privateSearchForMediaIntentData);
  if (!v8)
    goto LABEL_21;
  v9 = v8;
  v10 = objc_msgSend(v8, sel_audioSearchResults);

  if (!v10)
    goto LABEL_21;
  sub_227247C88(0, (unint64_t *)&qword_2558CB810);
  v11 = sub_22727D638();

  if (!(v11 >> 62))
  {
    v12 = *(void **)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
      goto LABEL_5;
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  v12 = (void *)sub_22727D9BC();
  swift_bridgeObjectRelease();
  if (!v12)
  {
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_22727E830;
    sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
    *(_QWORD *)(v42 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v50[0] = v42;
    sub_22727D650();
    v48 = (id)sub_22727D620();
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v48);
    goto LABEL_22;
  }
LABEL_5:
  if ((v11 & 0xC000000000000001) != 0)
  {
    v13 = (id)MEMORY[0x2276AF200](0, v11);
  }
  else
  {
    if (!*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_25;
    }
    v13 = *(id *)(v11 + 32);
  }
  v12 = v13;
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_privateMediaItemValueData);
  if (!v14)
    goto LABEL_16;
  v15 = v14;
  v16 = objc_msgSend(v14, sel_punchoutURI);

  if (!v16)
    goto LABEL_16;
  v17 = sub_22727D584();
  v19 = v18;

  swift_bridgeObjectRelease();
  v20 = HIBYTE(v19) & 0xF;
  if ((v19 & 0x2000000000000000) == 0)
    v20 = v17 & 0xFFFFFFFFFFFFLL;
  if (!v20)
  {
LABEL_16:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_22727E830;
    sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
    *(_QWORD *)(v38 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v50[0] = v38;
    sub_22727D650();
    v48 = (id)sub_22727D620();
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v48);

LABEL_22:
    swift_bridgeObjectRelease();

    return;
  }
  if (qword_2558CB378 != -1)
LABEL_25:
    swift_once();
  v21 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v21, v4);
  v22 = v12;
  v23 = sub_22727D4D0();
  v24 = sub_22727D77C();
  v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    v47 = v23;
    v26 = swift_slowAlloc();
    v45 = v25;
    v27 = (uint8_t *)v26;
    v46 = swift_slowAlloc();
    v50[0] = v46;
    v44 = v27;
    *(_DWORD *)v27 = 136315138;
    v43 = v27 + 4;
    v28 = v22;
    v29 = objc_msgSend(v28, sel_description);
    v30 = sub_22727D584();
    v48 = v22;
    v31 = v30;
    v33 = v32;

    v34 = v31;
    v22 = v48;
    v49 = sub_2272403C4(v34, v33, v50);
    sub_22727D920();

    swift_bridgeObjectRelease();
    v35 = v47;
    v36 = v44;
    _os_log_impl(&dword_22723A000, v47, (os_log_type_t)v45, "INSearchForMediaIntentHandler#resolveMediaItems resolving item: %s", v44, 0xCu);
    v37 = v46;
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v37, -1, -1);
    MEMORY[0x2276AF6D4](v36, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v50[3] = sub_227247C88(0, &qword_2558CB9E0);
  v50[4] = MEMORY[0x24BE91800];
  v50[0] = (uint64_t)a1;
  v39 = a1;
  sub_22727D728();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_22727E830;
  sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
  *(_QWORD *)(v40 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v22);
  v50[0] = v40;
  sub_22727D650();
  v41 = (void *)sub_22727D620();
  (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v41);

  swift_bridgeObjectRelease();
}

uint64_t static SuggestionsDonationProvider.donateIntentForEngagement(intent:currentRequestId:suggestionsAPIClient:)(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  char *v13;

  v8 = a4[3];
  v9 = a4[4];
  v10 = __swift_project_boxed_opaque_existential_1(a4, v8);
  v13 = (char *)&dword_2558CB850 + dword_2558CB850;
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v11;
  *v11 = v4;
  v11[1] = sub_2272463F4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))v13)(a1, a2, a3, v10, v8, v9);
}

unint64_t sub_227248364(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8E0);
  v2 = sub_22727D9D4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2272471A0(v6, (uint64_t)v15, &qword_2558CB8E8);
    result = sub_22724B3BC((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_22724D5E8(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2272484A4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8C8);
  v2 = (_QWORD *)sub_22727D9D4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *((unsigned __int8 *)v4 - 8);
    v6 = *v4;
    swift_bridgeObjectRetain();
    result = sub_22724B3EC(v5);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v2[6] + result) = v5;
    *(_QWORD *)(v2[7] + 8 * result) = v6;
    v9 = v2[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      goto LABEL_11;
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2272485A4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8D0);
  v2 = (_QWORD *)sub_22727D9D4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_22724B460(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2272486C4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8B0);
  v2 = (_QWORD *)sub_22727D9D4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_22724B460(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2272487DC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17[3];

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB870);
  v2 = sub_22727D9D4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2272471A0(v6, (uint64_t)&v15, &qword_2558CB878);
    v7 = v15;
    v8 = v16;
    result = sub_22724B460(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_22724D3F8(v17, (_OWORD *)(v3[7] + 48 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 64;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22724891C()
{
  uint64_t result;

  result = sub_22724CD10((uint64_t)&unk_24EF89548);
  qword_2558CC240 = result;
  return result;
}

uint64_t sub_227248940(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[23] = a1;
  v2 = sub_22727D4E8();
  v1[24] = v2;
  v1[25] = *(_QWORD *)(v2 - 8);
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v3 = sub_22727D4C4();
  v1[28] = v3;
  v1[29] = *(_QWORD *)(v3 - 8);
  v1[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2272489D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, id);

  if (sub_22727CB1C()
    && (sub_22727CAF8(),
        swift_release(),
        v1 = sub_22727D440(),
        v3 = v2,
        swift_release(),
        *(_QWORD *)(v0 + 248) = v1,
        (*(_QWORD *)(v0 + 256) = v3) != 0))
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE64D78]), sel_init);
    *(_QWORD *)(v0 + 264) = v4;
    v17 = (uint64_t (*)(uint64_t, id))((char *)&dword_2558CB860 + dword_2558CB860);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 272) = v5;
    *v5 = v0;
    v5[1] = sub_227248BB8;
    return v17(v0 + 136, v4);
  }
  else
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v7 = *(_QWORD *)(v0 + 216);
    v8 = *(_QWORD *)(v0 + 192);
    v9 = *(_QWORD *)(v0 + 200);
    v10 = __swift_project_value_buffer(v8, (uint64_t)qword_2558CC248);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v10, v8);
    v11 = sub_22727D4D0();
    v12 = sub_22727D788();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_22723A000, v11, v12, "SuggestionsDonationProvider#donatePlayMediaIntentForSuggestions Unable to get requestId. Not donating intent to SiriSuggestions", v13, 2u);
      MEMORY[0x2276AF6D4](v13, -1, -1);
    }
    v14 = *(_QWORD *)(v0 + 216);
    v15 = *(_QWORD *)(v0 + 192);
    v16 = *(_QWORD *)(v0 + 200);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_227248BB8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 280) = v0;
  swift_task_dealloc();

  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

void sub_227248C34()
{
  uint64_t v0;
  id v1;
  void *v2;
  unint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = objc_msgSend(*(id *)(v0 + 184), sel_mediaItems);
  if (!v1)
    goto LABEL_10;
  v2 = v1;
  sub_227247C88(0, (unint64_t *)&qword_2558CB810);
  v3 = sub_22727D638();

  if (!(v3 >> 62))
  {
    if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  v9 = sub_22727D9BC();
  swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
LABEL_10:
    v10 = *(_QWORD *)(v0 + 184);
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 288) = v11;
    *(_QWORD *)(v11 + 16) = v10;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 296) = v12;
    *v12 = v0;
    v12[1] = sub_227249048;
    goto LABEL_11;
  }
LABEL_4:
  if ((v3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2276AF200](0, v3);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v4 = *(id *)(v3 + 32);
LABEL_7:
    v5 = v4;
    v6 = *(_QWORD *)(v0 + 184);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 312) = objc_msgSend(v5, sel_type);

    v7 = swift_task_alloc();
    *(_QWORD *)(v0 + 320) = v7;
    *(_QWORD *)(v7 + 16) = v6;
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 328) = v8;
    *v8 = v0;
    v8[1] = sub_22724954C;
LABEL_11:
    sub_22727DA28();
    return;
  }
  __break(1u);
}

uint64_t sub_227248E44()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;

  v1 = *(void **)(v0 + 280);
  if (qword_2558CB378 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 208);
  v4 = *(_QWORD *)(v0 + 192);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_22727D4D0();
  v9 = sub_22727D788();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 176) = v13;
    sub_22727D920();
    *v11 = v13;

    _os_log_impl(&dword_22723A000, v8, v9, "SuggestionsDonationProvider#donatePlayMediaIntentForSuggestions donating to SiriSuggestions: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v11, -1, -1);
    MEMORY[0x2276AF6D4](v10, -1, -1);

  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227249048()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2272490B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v20 = *(_BYTE *)(v0 + 130);
  sub_22727D8D8();
  if (qword_2558CB390 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 224);
  v4 = *(void **)(v0 + 184);
  sub_22727D4B8();
  v5 = MEMORY[0x24BEE4AF8];
  v18 = MEMORY[0x24BEE4AF8];
  LOBYTE(v17) = 2;
  sub_22727D494();
  v6 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  *(_QWORD *)(v0 + 344) = v6;
  v6(v2, v3);
  sub_22727D368();
  sub_22727D35C();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  LOWORD(v1) = *(_WORD *)(v0 + 136);
  v7 = *(_BYTE *)(v0 + 153);
  v8 = *(_QWORD *)(v0 + 160);
  v19 = *(_BYTE *)(v0 + 168);
  v9 = sub_22727D3A4();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BEA6F78];
  swift_allocObject();
  v11 = MEMORY[0x2276AEC18](0x6964754169726953, 0xE90000000000006FLL);
  *(_QWORD *)(v0 + 40) = v9;
  *(_QWORD *)(v0 + 48) = sub_22723CA60(&qword_2558CB868, v10, MEMORY[0x24BEA6F70]);
  *(_QWORD *)(v0 + 16) = v11;
  *(_QWORD *)(v0 + 352) = sub_2272487DC(v5);
  v12 = objc_msgSend(v4, sel_verb, 21, v17, v18);
  sub_22727D584();
  v14 = v13;

  *(_QWORD *)(v0 + 360) = v14;
  *(_WORD *)(v0 + 96) = v1;
  *(_QWORD *)(v0 + 104) = 0;
  *(_BYTE *)(v0 + 112) = 0;
  *(_BYTE *)(v0 + 113) = v7;
  *(_QWORD *)(v0 + 120) = v8;
  *(_BYTE *)(v0 + 128) = v19;
  *(_BYTE *)(v0 + 129) = v20;
  *(_QWORD *)(v0 + 368) = sub_22725496C();
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 376) = v15;
  *v15 = v0;
  v15[1] = sub_227249A5C;
  return sub_22727D374();
}

uint64_t sub_227249334()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  v1 = *(void **)(v0 + 304);
  if (qword_2558CB378 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 208);
  v4 = *(_QWORD *)(v0 + 192);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_22727D4D0();
  v9 = sub_22727D788();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 176) = v13;
    sub_22727D920();
    *v11 = v13;

    _os_log_impl(&dword_22723A000, v8, v9, "SuggestionsDonationProvider#donatePlayMediaIntentForSuggestions donating to SiriSuggestions: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v11, -1, -1);
    MEMORY[0x2276AF6D4](v10, -1, -1);

  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22724954C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 336) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2272495B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;

  v21 = *(_BYTE *)(v0 + 131);
  v20 = *(_QWORD *)(v0 + 312);
  sub_22727D8D8();
  if (qword_2558CB390 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 224);
  v4 = *(void **)(v0 + 184);
  sub_22727D4B8();
  v5 = MEMORY[0x24BEE4AF8];
  v18 = MEMORY[0x24BEE4AF8];
  LOBYTE(v17) = 2;
  sub_22727D494();
  v6 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  *(_QWORD *)(v0 + 344) = v6;
  v6(v2, v3);
  sub_22727D368();
  sub_22727D35C();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
  LOWORD(v1) = *(_WORD *)(v0 + 136);
  v19 = *(_BYTE *)(v0 + 153);
  v7 = *(_QWORD *)(v0 + 160);
  v8 = *(_BYTE *)(v0 + 168);
  v9 = sub_22727D3A4();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BEA6F78];
  swift_allocObject();
  v11 = MEMORY[0x2276AEC18](0x6964754169726953, 0xE90000000000006FLL);
  *(_QWORD *)(v0 + 40) = v9;
  *(_QWORD *)(v0 + 48) = sub_22723CA60(&qword_2558CB868, v10, MEMORY[0x24BEA6F70]);
  *(_QWORD *)(v0 + 16) = v11;
  *(_QWORD *)(v0 + 352) = sub_2272487DC(v5);
  v12 = objc_msgSend(v4, sel_verb, 21, v17, v18);
  sub_22727D584();
  v14 = v13;

  *(_QWORD *)(v0 + 360) = v14;
  *(_WORD *)(v0 + 96) = v1;
  *(_QWORD *)(v0 + 104) = v20;
  *(_BYTE *)(v0 + 112) = 0;
  *(_BYTE *)(v0 + 113) = v19;
  *(_QWORD *)(v0 + 120) = v7;
  *(_BYTE *)(v0 + 128) = v8;
  *(_BYTE *)(v0 + 129) = v21;
  *(_QWORD *)(v0 + 368) = sub_22725496C();
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 376) = v15;
  *v15 = v0;
  v15[1] = sub_227249A5C;
  return sub_22727D374();
}

uint64_t sub_227249844()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  v1 = *(void **)(v0 + 336);
  if (qword_2558CB378 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 208);
  v4 = *(_QWORD *)(v0 + 192);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_22727D4D0();
  v9 = sub_22727D788();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v1;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 176) = v13;
    sub_22727D920();
    *v11 = v13;

    _os_log_impl(&dword_22723A000, v8, v9, "SuggestionsDonationProvider#donatePlayMediaIntentForSuggestions donating to SiriSuggestions: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v11, -1, -1);
    MEMORY[0x2276AF6D4](v10, -1, -1);

  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227249A5C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 384) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_227249B24()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 224);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  sub_22727D8CC();
  sub_22727D4B8();
  sub_22727D4A0();
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227249BDC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 224);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  sub_22727D8CC();
  sub_22727D4B8();
  sub_22727D4A0();
  v1(v2, v3);
  v4 = *(void **)(v0 + 384);
  if (qword_2558CB378 != -1)
    swift_once();
  v6 = *(_QWORD *)(v0 + 200);
  v5 = *(_QWORD *)(v0 + 208);
  v7 = *(_QWORD *)(v0 + 192);
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2558CC248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  v9 = v4;
  v10 = v4;
  v11 = sub_22727D4D0();
  v12 = sub_22727D788();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    v15 = v4;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 176) = v16;
    sub_22727D920();
    *v14 = v16;

    _os_log_impl(&dword_22723A000, v11, v12, "SuggestionsDonationProvider#donatePlayMediaIntentForSuggestions donating to SiriSuggestions: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v14, -1, -1);
    MEMORY[0x2276AF6D4](v13, -1, -1);

  }
  else
  {

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227249E50(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v22 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB880);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v21 = v5;
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22727D1A0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22727D050();
  v23 = *(_QWORD *)(v11 - 8);
  v24 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22727D044();
  v25 = a2;
  v26 = a2;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BE91650], v7);
  sub_227247C88(0, &qword_2558CB888);
  sub_22727D1B8();
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v15)
  {
    sub_22727D59C();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v22, v3);
  v16 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v17 = swift_allocObject();
  v18 = v25;
  *(_QWORD *)(v17 + 16) = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v17 + v16, v6, v3);
  v19 = v18;
  sub_22727D038();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v13, v24);
}

uint64_t sub_22724A08C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint8_t *v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  _QWORD *v43;
  char v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  char v55;
  char *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  char *v63;
  _QWORD *v64;
  char v65;
  char *v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t, uint64_t);
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  v85 = a1;
  v86 = a3;
  v4 = sub_22727CBE8();
  v88 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v80 = (char *)&v75 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v75 - v10;
  v12 = sub_22727D4E8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v84 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v75 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v81 = (char *)&v75 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v75 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v75 - v24;
  v26 = MEMORY[0x2276AE738](a2);
  if (!v27)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v39 = __swift_project_value_buffer(v12, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v25, v39, v12);
    v40 = sub_22727D4D0();
    v41 = sub_22727D77C();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_22723A000, v40, v41, "SuggestionsDonationService#supportsAffinityIntent returning false since there is no localBundleIdentifier", v42, 2u);
      MEMORY[0x2276AF6D4](v42, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v25, v12);
    LOBYTE(v90) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB880);
    return sub_22727D698();
  }
  v28 = v26;
  v29 = v27;
  v77 = v18;
  v78 = v11;
  if (qword_2558CB378 != -1)
    swift_once();
  v87 = v4;
  v30 = __swift_project_value_buffer(v12, (uint64_t)qword_2558CC248);
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v82 = v30;
  v83 = v31;
  ((void (*)(char *))v31)(v23);
  swift_bridgeObjectRetain_n();
  v32 = sub_22727D4D0();
  v33 = sub_22727D77C();
  if (os_log_type_enabled(v32, v33))
  {
    v76 = v13;
    v34 = swift_slowAlloc();
    v79 = v12;
    v35 = (uint8_t *)v34;
    v36 = swift_slowAlloc();
    v90 = v36;
    *(_DWORD *)v35 = 136315138;
    swift_bridgeObjectRetain();
    v89 = sub_2272403C4(v28, v29, &v90);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22723A000, v32, v33, "SuggestionsDonationService#supportsAffinityIntent for bundleID: %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v36, -1, -1);
    v37 = v35;
    v12 = v79;
    MEMORY[0x2276AF6D4](v37, -1, -1);

    v38 = *(void (**)(char *, uint64_t))(v76 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v38 = *(void (**)(char *, uint64_t))(v13 + 8);
  }
  v38(v23, v12);
  v43 = (_QWORD *)sub_22727CEDC();
  v44 = sub_22723E364(v28, v29, v43);
  swift_bridgeObjectRelease();
  if ((v44 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v45 = v84;
    v83(v84, v82, v12);
    v46 = sub_22727D4D0();
    v47 = sub_22727D77C();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_22723A000, v46, v47, "SuggestionsDonationService#supportsAffinityIntent returning true for first party app.", v48, 2u);
      MEMORY[0x2276AF6D4](v48, -1, -1);
    }

    v38(v45, v12);
    LOBYTE(v90) = 1;
LABEL_27:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB880);
    return sub_22727D698();
  }
  v49 = *(_QWORD *)(v85 + 16);
  if (!v49)
  {
    swift_bridgeObjectRelease();
LABEL_24:
    v56 = v81;
    v83(v81, v82, v12);
    v57 = sub_22727D4D0();
    v58 = sub_22727D77C();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v59 = 0;
      _os_log_impl(&dword_22723A000, v57, v58, "SuggestionsDonationService#supportsAffinityIntent returning false since third party app was not found in installed apps.", v59, 2u);
      MEMORY[0x2276AF6D4](v59, -1, -1);
    }

    v38(v56, v12);
    LOBYTE(v90) = 0;
    goto LABEL_27;
  }
  v79 = v12;
  v50 = v85 + ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80));
  v51 = *(_QWORD *)(v88 + 72);
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v88 + 16);
  swift_bridgeObjectRetain();
  v53 = v87;
  while (1)
  {
    v52(v7, v50, v53);
    if (sub_22727CBD0() == v28 && v29 == v54)
    {
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    v55 = sub_22727DA10();
    swift_bridgeObjectRelease();
    if ((v55 & 1) != 0)
      break;
    v53 = v87;
    (*(void (**)(char *, uint64_t))(v88 + 8))(v7, v87);
    v50 += v51;
    if (!--v49)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = v79;
      goto LABEL_24;
    }
  }
  v53 = v87;
LABEL_31:
  swift_bridgeObjectRelease();
  v61 = *(void (**)(char *, char *, uint64_t))(v88 + 32);
  v62 = v80;
  v61(v80, v7, v53);
  v63 = v78;
  v61(v78, v62, v53);
  v64 = (_QWORD *)sub_22727CBDC();
  v65 = sub_22723E364(0xD00000000000001BLL, 0x800000022727F980, v64);
  swift_bridgeObjectRelease();
  v66 = v77;
  v67 = v79;
  v83(v77, v82, v79);
  swift_bridgeObjectRetain();
  v68 = sub_22727D4D0();
  v69 = sub_22727D77C();
  if (os_log_type_enabled(v68, v69))
  {
    v70 = swift_slowAlloc();
    v71 = swift_slowAlloc();
    v90 = v71;
    *(_DWORD *)v70 = 67109378;
    LODWORD(v89) = v65 & 1;
    sub_22727D920();
    *(_WORD *)(v70 + 8) = 2080;
    swift_bridgeObjectRetain();
    v89 = sub_2272403C4(v28, v29, &v90);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22723A000, v68, v69, "SuggestionsDonationService#supportsAffinityIntent returning: %{BOOL}d for third party app: %s.", (uint8_t *)v70, 0x12u);
    swift_arrayDestroy();
    v72 = v71;
    v63 = v78;
    MEMORY[0x2276AF6D4](v72, -1, -1);
    MEMORY[0x2276AF6D4](v70, -1, -1);

    v73 = v66;
    v74 = v79;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v73 = v66;
    v74 = v67;
  }
  v38(v73, v74);
  LOBYTE(v90) = v65 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB880);
  sub_22727D698();
  return (*(uint64_t (**)(char *, uint64_t))(v88 + 8))(v63, v87);
}

BOOL sub_22724A918(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  sub_22727DA70();
  sub_22727DA7C();
  v4 = sub_22727DA88();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(v8 + 8 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_QWORD *)(v8 + 8 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_22724AA04(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  uint8_t *v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v23 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8A0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = sub_22727D4E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2558CB378 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = sub_22727D4D0();
  v12 = sub_22727D770();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v22 = v3;
    v14 = a2;
    v15 = v13;
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_22723A000, v11, v12, "SuggestionsDonationService#createExecutionParameters Creating execution parameters for Siri Suggestions", v13, 2u);
    v16 = v15;
    a2 = v14;
    v3 = v22;
    MEMORY[0x2276AF6D4](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v3);
  v17 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v18 + v17, (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  aBlock[4] = sub_22724D538;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22724B348;
  aBlock[3] = &block_descriptor;
  v19 = _Block_copy(aBlock);
  swift_release();
  v20 = objc_msgSend(a2, sel_performWithCompletion_, v19);
  _Block_release(v19);
  return swift_unknownObjectRelease();
}

void sub_22724AC60(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  id v24;
  _BYTE *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  _BYTE *v31;
  void *v32;
  uint64_t v33;
  int v34;
  char v35;
  uint64_t v36;
  int v37;
  uint64_t (**v38)();
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  char v46;
  char v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  id v52;
  unsigned __int8 v53;
  uint64_t v54;
  unint64_t v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  unsigned __int8 v61;
  _BYTE v62[4];
  _BOOL4 v63;
  _BYTE *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char v74;
  id v75;
  __int16 v76;
  uint64_t v77[3];
  void *v78;
  uint64_t v79;
  char v80;
  char v81;
  id v82;
  char v83;
  char v84;

  v6 = sub_22727D4E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v62[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v62[-v11];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8A8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = &v62[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v14);
  v18 = &v62[-v17];
  v19 = sub_22727CA68();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = &v62[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a2)
  {
    v78 = a2;
    v24 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8A0);
    sub_22727D68C();
    return;
  }
  v66 = a3;
  v67 = v21;
  v64 = v12;
  v69 = v10;
  v70 = v7;
  if (!a1)
  {
    LOWORD(v78) = 514;
    v79 = 0;
    v80 = 1;
    v84 = 0;
    v27 = v6;
    goto LABEL_8;
  }
  v25 = v23;
  v26 = objc_msgSend(a1, sel_tracklist);
  LOWORD(v78) = 514;
  v79 = 0;
  v80 = 1;
  v84 = 0;
  v27 = v6;
  if (!v26)
  {
LABEL_8:
    v34 = 1;
    v81 = 1;
    v82 = 0;
    v83 = 1;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v18, 1, 1, v67);
    v29 = 0;
    v65 = 0;
    v35 = 1;
    v31 = v69;
LABEL_12:
    v38 = &off_2558CB000;
    v39 = v64;
    sub_227246BC0((uint64_t)v18, &qword_2558CB8A8);
    v40 = v70;
LABEL_13:
    LODWORD(v67) = v34;
    v68 = v29;
    if (v38[111] != (uint64_t (*)())-1)
      swift_once();
    v41 = __swift_project_value_buffer(v27, (uint64_t)qword_2558CC248);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v40 + 16))(v39, v41, v27);
    v42 = sub_22727D4D0();
    v43 = sub_22727D788();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_22723A000, v42, v43, "SuggestionsDonationService#createExecutionParameters Unable to query currently playing song.", v44, 2u);
      MEMORY[0x2276AF6D4](v44, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v40 + 8))(v39, v27);
    goto LABEL_18;
  }
  v28 = v26;
  v63 = objc_msgSend(v26, sel_shuffleType) != 0;
  v81 = v63;
  v29 = objc_msgSend(v28, sel_globalItemCount);
  v82 = v29;
  v83 = 0;
  v30 = objc_msgSend(v28, sel_playingItemIndexPath);
  v31 = v69;
  if (v30)
  {
    v32 = v30;
    sub_22727CA5C();

    v33 = 0;
  }
  else
  {
    v33 = 1;
  }
  v36 = v67;
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v16, v33, 1, v67);
  sub_22724D5A0((uint64_t)v16, (uint64_t)v18);
  v37 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v36);
  v65 = v28;
  if (v37 == 1)
  {
    v34 = 0;
    v35 = v63;
    goto LABEL_12;
  }
  v68 = v29;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v20 + 32))(v25, v18, v36);
  v56 = objc_msgSend(v28, sel_items);
  v57 = (void *)sub_22727CA50();
  v58 = objc_msgSend(v56, sel_itemAtIndexPath_, v57);

  v59 = objc_msgSend(v58, sel_metadataObject);
  if (!v59 || (v60 = objc_msgSend(v59, sel_song), v59, !v60))
  {
    (*(void (**)(_BYTE *, uint64_t))(v20 + 8))(v25, v67);
    v34 = 0;
    v40 = v70;
    v35 = v63;
    v29 = v68;
    v38 = &off_2558CB000;
    v39 = v64;
    goto LABEL_13;
  }
  LOBYTE(v78) = objc_msgSend(v60, sel_isDisliked);
  v61 = objc_msgSend(v60, sel_isFavorite);

  (*(void (**)(_BYTE *, uint64_t))(v20 + 8))(v25, v67);
  LODWORD(v67) = 0;
  BYTE1(v78) = v61;
  v40 = v70;
  v35 = v63;
  v38 = &off_2558CB000;
LABEL_18:
  if (v38[111] != (uint64_t (*)())-1)
    swift_once();
  v45 = __swift_project_value_buffer(v27, (uint64_t)qword_2558CC248);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v40 + 16))(v31, v45, v27);
  v46 = (char)v78;
  v47 = BYTE1(v78);
  v48 = sub_22727D4D0();
  v49 = sub_22727D770();
  if (os_log_type_enabled(v48, v49))
  {
    v64 = (_BYTE *)v27;
    v50 = (uint8_t *)swift_slowAlloc();
    v51 = swift_slowAlloc();
    *(_DWORD *)v50 = 136315138;
    v77[0] = v51;
    LOBYTE(v71) = v46;
    BYTE1(v71) = v47;
    v72 = 0;
    v73 = 1;
    v74 = v35;
    v52 = v68;
    v75 = v68;
    v53 = v67;
    v76 = v67;
    v54 = sub_22727D590();
    v71 = sub_2272403C4(v54, v55, v77);
    sub_22727D920();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v48, v49, "SuggestionsDonationService#createExecutionParameters Created execution parameters: %s", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v51, -1, -1);
    MEMORY[0x2276AF6D4](v50, -1, -1);

    (*(void (**)(_BYTE *, _BYTE *))(v70 + 8))(v69, v64);
  }
  else
  {

    (*(void (**)(_BYTE *, uint64_t))(v40 + 8))(v31, v27);
    v52 = v68;
    v53 = v67;
  }
  swift_beginAccess();
  LOWORD(v71) = (_WORD)v78;
  v72 = 0;
  v73 = 1;
  v74 = v35;
  v75 = v52;
  v76 = v53;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8A0);
  sub_22727D698();

}

void sub_22724B348(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

unint64_t sub_22724B3BC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22727D944();
  return sub_22724B4C4(a1, v2);
}

uint64_t sub_22724B3EC(uint64_t a1)
{
  uint64_t v2;

  sub_22727DA70();
  sub_227268268(a1);
  sub_22727D5B4();
  swift_bridgeObjectRelease();
  v2 = sub_22727DA88();
  return sub_22724B588(a1, v2);
}

unint64_t sub_22724B460(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22727DA70();
  sub_22727D5B4();
  v4 = sub_22727DA88();
  return sub_22724B9EC(a1, a2, v4);
}

unint64_t sub_22724B4C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_22724D5F8(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2276AF1B8](v9, a1);
      sub_22724D634((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_22724B588(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_22724B9EC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_22727DA10() & 1) == 0)
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
      while (!v14 && (sub_22727DA10() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_22724BACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6[11] = a5;
  v6[12] = a6;
  v6[9] = a2;
  v6[10] = a3;
  v6[8] = a1;
  v8 = sub_22727CCC0();
  v6[13] = v8;
  v6[14] = *(_QWORD *)(v8 - 8);
  v6[15] = swift_task_alloc();
  v6[16] = swift_task_alloc();
  v9 = sub_22727CC6C();
  v6[17] = v9;
  v6[18] = *(_QWORD *)(v9 - 8);
  v6[19] = swift_task_alloc();
  v10 = sub_22727D4C4();
  v6[20] = v10;
  v6[21] = *(_QWORD *)(v10 - 8);
  v6[22] = swift_task_alloc();
  v11 = sub_22727D3F8();
  v6[23] = v11;
  v6[24] = *(_QWORD *)(v11 - 8);
  v6[25] = swift_task_alloc();
  v12 = sub_22727D4E8();
  v6[26] = v12;
  v6[27] = *(_QWORD *)(v12 - 8);
  v6[28] = swift_task_alloc();
  v6[29] = swift_task_alloc();
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8B8);
  v6[33] = swift_task_alloc();
  v13 = sub_22727CA2C();
  v6[34] = v13;
  v6[35] = *(_QWORD *)(v13 - 8);
  v6[36] = swift_task_alloc();
  v14 = *(_QWORD *)(a5 - 8);
  v6[37] = v14;
  v6[38] = swift_task_alloc();
  (*(void (**)(void))(v14 + 16))();
  return swift_task_switch();
}

uint64_t sub_22724BCA0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  id *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  unsigned __int8 v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  unint64_t v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t);
  NSObject *v58;
  os_log_type_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  void (*v83)(uint64_t, uint64_t);
  id v84;
  unint64_t v85;
  id v86;
  unsigned __int8 v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v1 = v0;
  if (!v0[10])
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v13 = v0[32];
    v14 = v0[26];
    v15 = v0[27];
    v16 = __swift_project_value_buffer(v1[26], (uint64_t)qword_2558CC248);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v16, v14);
    v9 = sub_22727D4D0();
    v17 = sub_22727D788();
    if (os_log_type_enabled(v9, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_22723A000, v9, v17, "SuggestionsDonationProvider#donateIntentForEngagement Unable to get requestId. Not donating engagement to SiriSuggestions", v18, 2u);
      MEMORY[0x2276AF6D4](v18, -1, -1);
    }
    v12 = v1[32];
    goto LABEL_13;
  }
  v2 = v0[34];
  v3 = v0[35];
  v4 = v1[33];
  sub_22727CA20();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
    sub_227246BC0(v1[33], &qword_2558CB8B8);
    if (qword_2558CB378 != -1)
      swift_once();
    v5 = v1[31];
    v6 = v1[26];
    v7 = v1[27];
    v8 = __swift_project_value_buffer(v6, (uint64_t)qword_2558CC248);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v8, v6);
    v9 = sub_22727D4D0();
    v10 = sub_22727D788();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_22723A000, v9, v10, "SuggestionsDonationProvider#donateIntentForEngagement Unable to convert requestId to UUID. Not donating engagement to SiriSuggestions", v11, 2u);
      MEMORY[0x2276AF6D4](v11, -1, -1);
    }
    v12 = v1[31];
LABEL_13:
    v19 = v1[26];
    v20 = v1[27];

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v12, v19);
LABEL_14:
    (*(void (**)(_QWORD, _QWORD))(v1[37] + 8))(v1[38], v1[11]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return ((uint64_t (*)(void))v1[1])();
  }
  v22 = (id *)(v1 + 8);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v1[35] + 32))(v1[36], v1[33], v1[34]);
  objc_opt_self();
  v23 = swift_dynamicCastObjCClass();
  if (!v23)
  {
    objc_opt_self();
    v28 = swift_dynamicCastObjCClass();
    if (!v28)
    {
LABEL_47:
      if (qword_2558CB378 != -1)
        swift_once();
      v69 = v1[27];
      v70 = v1[28];
      v71 = v1[26];
      v72 = __swift_project_value_buffer(v71, (uint64_t)qword_2558CC248);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 16))(v70, v72, v71);
      v73 = sub_22727D4D0();
      v74 = sub_22727D770();
      if (os_log_type_enabled(v73, v74))
      {
        v75 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v75 = 0;
        _os_log_impl(&dword_22723A000, v73, v74, "SuggestionsDonationProvider#donateIntentForEngagement Unable to match intent to a SiriSuggestion. Not donating an engagement", v75, 2u);
        MEMORY[0x2276AF6D4](v75, -1, -1);
      }
      v77 = v1[35];
      v76 = v1[36];
      v78 = v1[34];
      v80 = v1[27];
      v79 = v1[28];
      v81 = v1[26];

      (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v79, v81);
      (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v78);
      goto LABEL_14;
    }
    v29 = (void *)v28;
    v30 = *v22;
    v31 = objc_msgSend(v29, sel_mediaItems);
    if (!v31)
      goto LABEL_45;
    v26 = v31;
    sub_227247C88(0, (unint64_t *)&qword_2558CB810);
    v32 = sub_22727D638();

    if (v32 >> 62)
    {
      swift_bridgeObjectRetain();
      v89 = sub_22727D9BC();
      swift_bridgeObjectRelease();
      if (v89)
      {
LABEL_24:
        if ((v32 & 0xC000000000000001) != 0)
        {
          v33 = (id)MEMORY[0x2276AF200](0, v32);
        }
        else
        {
          if (!*(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_73;
          }
          v33 = *(id *)(v32 + 32);
        }
        v26 = v33;
        swift_bridgeObjectRelease();
        v34 = objc_msgSend(v26, sel_identifier);
        if (v34)
        {
          v35 = v34;
          sub_22727D584();

          sub_22727CCCC();
          swift_allocObject();
          if (sub_22727CCD8())
          {
            v37 = v1[18];
            v36 = v1[19];
            v38 = v1[17];
            v39 = v1[15];
            v90 = v1[14];
            v40 = v1[13];
            sub_22727CC78();
            sub_22727CC60();
            (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
            (*(void (**)(uint64_t, _QWORD, uint64_t))(v90 + 104))(v39, *MEMORY[0x24BE910D0], v40);
            sub_22723CA60(&qword_2558CB8C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE91108], MEMORY[0x24BE91120]);
            sub_22727D608();
            sub_22727D608();
            v42 = v1[15];
            v41 = v1[16];
            v43 = v1[13];
            v44 = v1[14];
            if (v1[2] == v1[4] && v1[3] == v1[5])
            {
              swift_bridgeObjectRelease_n();
              v45 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
              v45(v42, v43);
              v45(v41, v43);
LABEL_53:
              if (qword_2558CB3A8 != -1)
                swift_once();
              v84 = *v22;
              v46 = sub_227268268(word_2558CC440);
              v48 = v85;

              swift_release();
              goto LABEL_37;
            }
            v82 = sub_22727DA10();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v83 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
            v83(v42, v43);
            v83(v41, v43);
            if ((v82 & 1) != 0)
              goto LABEL_53;
            swift_release();
          }
        }
        if (objc_msgSend(v26, sel_type) != (id)20 && objc_msgSend(v26, sel_type) != (id)6)
        {
          if (qword_2558CB370 != -1)
            swift_once();
          if (!sub_22724A918((uint64_t)objc_msgSend(v26, sel_type), qword_2558CC240))
          {

            goto LABEL_46;
          }
          if (qword_2558CB3B0 != -1)
            swift_once();
          v86 = *v22;
          v87 = word_2558CC4F8;
LABEL_61:
          v46 = sub_227268268(v87);
          v48 = v88;

          goto LABEL_37;
        }
        if (qword_2558CB3B8 == -1)
        {
LABEL_60:
          v86 = *v22;
          v87 = word_2558CC5B0;
          goto LABEL_61;
        }
LABEL_73:
        swift_once();
        goto LABEL_60;
      }
    }
    else if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_24;
    }
    v26 = *v22;
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
  v24 = (void *)v23;
  v25 = (id)v1[8];
  if (objc_msgSend(v24, sel_affinityType) != (id)1)
  {
    if (objc_msgSend(v24, sel_affinityType) == (id)2)
    {
      if (qword_2558CB3A0 != -1)
        swift_once();
      v26 = *v22;
      v27 = word_2558CC388;
      goto LABEL_36;
    }
LABEL_45:
    v26 = *v22;
LABEL_46:

    goto LABEL_47;
  }
  if (qword_2558CB398 != -1)
    swift_once();
  v26 = *v22;
  v27 = word_2558CC2D0;
LABEL_36:
  v46 = sub_227268268(v27);
  v48 = v47;
LABEL_37:

  swift_bridgeObjectRetain();
  sub_2272485A4(MEMORY[0x24BEE4AF8]);
  sub_22727D3EC();
  sub_22727D8D8();
  if (qword_2558CB390 != -1)
    swift_once();
  v49 = v1[21];
  v50 = v1[22];
  v51 = v1[20];
  sub_22727D4B8();
  sub_22727D494();
  v52 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
  v1[39] = v52;
  v52(v50, v51);
  if (qword_2558CB378 != -1)
    swift_once();
  v53 = v1[30];
  v54 = v1[26];
  v55 = v1[27];
  v56 = __swift_project_value_buffer(v54, (uint64_t)qword_2558CC248);
  v1[40] = v56;
  v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16);
  v1[41] = v57;
  v57(v53, v56, v54);
  swift_bridgeObjectRetain();
  v58 = sub_22727D4D0();
  v59 = sub_22727D770();
  v60 = os_log_type_enabled(v58, v59);
  v61 = v1[30];
  v62 = v1[26];
  v63 = v1[27];
  if (v60)
  {
    v92 = v1[27];
    v91 = v1[26];
    v64 = (uint8_t *)swift_slowAlloc();
    v65 = v46;
    v66 = swift_slowAlloc();
    v93 = v66;
    *(_DWORD *)v64 = 136315138;
    swift_bridgeObjectRetain();
    v1[7] = sub_2272403C4(v65, v48, &v93);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22723A000, v58, v59, "Submitting engagement for actionId: %s", v64, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v66, -1, -1);
    MEMORY[0x2276AF6D4](v64, -1, -1);

    v67 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
    v67(v61, v91);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    v67 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    v67(v61, v62);
  }
  v1[42] = v67;
  v68 = (_QWORD *)swift_task_alloc();
  v1[43] = v68;
  *v68 = v1;
  v68[1] = sub_22724C834;
  return sub_22727D380();
}

uint64_t sub_22724C834()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 352) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22724C898()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
  v2 = *(_QWORD *)(v0 + 280);
  v9 = *(_QWORD *)(v0 + 272);
  v10 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 200);
  v6 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 184);
  v7 = *(_QWORD *)(v0 + 160);
  sub_22727D8CC();
  sub_22727D4B8();
  sub_22727D4A0();
  v1(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v10, v9);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22724CA10()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  void *v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v28)(uint64_t, uint64_t, uint64_t);

  v1 = *(void **)(v0 + 352);
  v2 = *(_QWORD *)(v0 + 320);
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 328);
  v3 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
  v4 = *(_QWORD *)(v0 + 232);
  v5 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 176);
  v7 = *(_QWORD *)(v0 + 160);
  sub_22727D8CC();
  sub_22727D4B8();
  sub_22727D4A0();
  v3(v6, v7);
  v28(v4, v2, v5);
  v8 = v1;
  v9 = v1;
  v10 = sub_22727D4D0();
  v11 = sub_22727D788();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = *(void **)(v0 + 352);
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    v15 = v12;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 48) = v16;
    sub_22727D920();
    *v14 = v16;

    _os_log_impl(&dword_22723A000, v10, v11, "SuggestionsDonationProvider#donateIntentForEngagement Error donating engagement to SiriSuggestions: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v14, -1, -1);
    MEMORY[0x2276AF6D4](v13, -1, -1);

  }
  else
  {
    v17 = *(void **)(v0 + 352);

  }
  v18 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
  v20 = *(_QWORD *)(v0 + 280);
  v19 = *(_QWORD *)(v0 + 288);
  v21 = *(_QWORD *)(v0 + 272);
  v22 = *(_QWORD *)(v0 + 232);
  v24 = *(_QWORD *)(v0 + 200);
  v23 = *(_QWORD *)(v0 + 208);
  v25 = *(_QWORD *)(v0 + 184);
  v26 = *(_QWORD *)(v0 + 192);

  v18(v22, v23);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

ValueMetadata *type metadata accessor for SuggestionsDonationProvider()
{
  return &type metadata for SuggestionsDonationProvider;
}

uint64_t sub_22724CD10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8D8);
    v3 = sub_22727D968();
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    while (1)
    {
      v7 = *(_QWORD *)(v6 + 8 * v4);
      sub_22727DA70();
      sub_22727DA7C();
      result = sub_22727DA88();
      v9 = -1 << *(_BYTE *)(v3 + 32);
      v10 = result & ~v9;
      v11 = v10 >> 6;
      v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
      v13 = 1 << v10;
      v14 = *(_QWORD *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(_QWORD *)(v14 + 8 * v10) == v7)
          goto LABEL_3;
        v15 = ~v9;
        while (1)
        {
          v10 = (v10 + 1) & v15;
          v11 = v10 >> 6;
          v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
          v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0)
            break;
          if (*(_QWORD *)(v14 + 8 * v10) == v7)
            goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
      *(_QWORD *)(v14 + 8 * v10) = v7;
      v16 = *(_QWORD *)(v3 + 16);
      v17 = __OFADD__(v16, 1);
      v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_22724CE50(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[14] = a1;
  v2[15] = a2;
  v3 = sub_22727D4C4();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22724CEB0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;

  sub_22727D8D8();
  if (qword_2558CB390 != -1)
    swift_once();
  v2 = v0[17];
  v1 = v0[18];
  v3 = (void *)v0[15];
  v4 = v0[16];
  sub_22727D4B8();
  v22 = MEMORY[0x24BEE4AF8];
  LOBYTE(v21) = 2;
  sub_22727D494();
  v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[19] = v5;
  v5(v1, v4);
  objc_msgSend(v3, sel_setTracklistRange_, 1, 1, 21, v21, v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB890);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22727E530;
  *(_QWORD *)(inited + 32) = sub_22727D584();
  *(_QWORD *)(inited + 40) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB588);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_22727E900;
  *(_QWORD *)(v8 + 32) = sub_22727D584();
  *(_QWORD *)(v8 + 40) = v9;
  *(_QWORD *)(v8 + 48) = sub_22727D584();
  *(_QWORD *)(v8 + 56) = v10;
  *(_QWORD *)(v8 + 64) = sub_22727D584();
  *(_QWORD *)(v8 + 72) = v11;
  v12 = (void *)sub_22727D620();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend((id)objc_opt_self(), sel_propertySetWithProperties_, v12);

  *(_QWORD *)(inited + 48) = v13;
  sub_2272486C4(inited);
  v14 = objc_allocWithZone(MEMORY[0x24BDDCB30]);
  sub_227247C88(0, &qword_2558CB898);
  v15 = (void *)sub_22727D560();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v14, sel_initWithProperties_relationships_, 0, v15);
  v0[20] = v16;

  v17 = v16;
  objc_msgSend(v3, sel_setPlayingItemProperties_, v17);
  objc_msgSend(v3, sel_setQueueItemProperties_, v17);

  v18 = swift_task_alloc();
  v0[21] = v18;
  *(_QWORD *)(v18 + 16) = v3;
  v19 = (_QWORD *)swift_task_alloc();
  v0[22] = v19;
  *v19 = v0;
  v19[1] = sub_22724D1CC;
  return sub_22727DA28();
}

uint64_t sub_22724D1CC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22724D238()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  char v6;
  char v7;
  char v9;
  char v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);

  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 112);

  v4 = *(_WORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 80);
  v6 = *(_BYTE *)(v0 + 88);
  v7 = *(_BYTE *)(v0 + 89);
  v11 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 105);
  v10 = *(_BYTE *)(v0 + 104);
  sub_22727D8CC();
  sub_22727D4B8();
  sub_22727D4A0();
  v12(v1, v2);
  swift_task_dealloc();
  *(_WORD *)v3 = v4;
  *(_QWORD *)(v3 + 8) = v5;
  *(_BYTE *)(v3 + 16) = v6;
  *(_BYTE *)(v3 + 17) = v7;
  *(_QWORD *)(v3 + 24) = v11;
  *(_BYTE *)(v3 + 32) = v10;
  *(_BYTE *)(v3 + 33) = v9;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22724D344()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  v3 = *(_QWORD *)(v0 + 128);

  swift_task_dealloc();
  sub_22727D8CC();
  sub_22727D4B8();
  sub_22727D4A0();
  v2(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22724D3F0(uint64_t a1)
{
  uint64_t v1;

  return sub_227249E50(a1, *(void **)(v1 + 16));
}

_OWORD *sub_22724D3F8(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_22724D410()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB880);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_22724D488(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2558CB880) - 8) + 80);
  return sub_22724A08C(a1, *(_QWORD *)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_22724D4CC(uint64_t a1)
{
  uint64_t v1;

  return sub_22724AA04(a1, *(void **)(v1 + 16));
}

uint64_t sub_22724D4D4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8A0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_22724D538(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8A0) - 8) + 80);
  sub_22724AC60(a1, a2, v2 + ((v5 + 16) & ~v5));
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

uint64_t sub_22724D5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB8A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_22724D5E8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22724D5F8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_22724D634(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t AppInForeground.__allocating_init(onscreenEntityProvider:filterApps:)(__int128 *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_22723D600(a1, v4 + 16);
  *(_QWORD *)(v4 + 56) = a2;
  return v4;
}

uint64_t AppInForeground.init(onscreenEntityProvider:filterApps:)(__int128 *a1, uint64_t a2)
{
  uint64_t v2;

  sub_22723D600(a1, v2 + 16);
  *(_QWORD *)(v2 + 56) = a2;
  return v2;
}

uint64_t AppInForeground.filter(suggestion:environment:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_22724D700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v1 = *(_QWORD *)(v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  v2 = sub_22727D158();
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v2 = 0;
    v4 = 0xE000000000000000;
  }
  v5 = sub_22723E364(v2, v4, *(_QWORD **)(v1 + 56));
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(BOOL))(v0 + 8))((v5 & 1) == 0);
}

uint64_t AppInForeground.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AppInForeground.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_22724D7D4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *v0;
  return swift_task_switch();
}

uint64_t type metadata accessor for AppInForeground()
{
  return objc_opt_self();
}

id INSearchForMediaAppIntentHandler.__allocating_init(featureFlagProvider:appIntentInvoker:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  id v6;
  objc_super v8;

  v5 = objc_allocWithZone(v2);
  sub_227240AC4(a1, (uint64_t)v5 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider);
  sub_227240AC4(a2, (uint64_t)v5 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker);
  v8.receiver = v5;
  v8.super_class = v2;
  v6 = objc_msgSendSuper2(&v8, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v6;
}

id INSearchForMediaAppIntentHandler.init(featureFlagProvider:appIntentInvoker:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;
  objc_super v7;

  sub_227240AC4(a1, (uint64_t)v2 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider);
  sub_227240AC4(a2, (uint64_t)v2 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker);
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for INSearchForMediaAppIntentHandler();
  v5 = objc_msgSendSuper2(&v7, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v5;
}

uint64_t type metadata accessor for INSearchForMediaAppIntentHandler()
{
  return objc_opt_self();
}

uint64_t INSearchForMediaAppIntentHandler.resolveMediaItems(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_22727CC90();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = swift_task_alloc();
  v4 = sub_22727CCC0();
  v2[19] = v4;
  v2[20] = *(_QWORD *)(v4 - 8);
  v2[21] = swift_task_alloc();
  v5 = sub_22727CC6C();
  v2[22] = v5;
  v2[23] = *(_QWORD *)(v5 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v6 = sub_22727D4E8();
  v2[28] = v6;
  v2[29] = *(_QWORD *)(v6 - 8);
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  return swift_task_switch();
}

void sub_22724DA84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;
  id v20;
  unint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void (*v49)(uint64_t, os_log_t);
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  uint8_t *v62;
  uint64_t v63;
  id v64;
  NSObject *v65;
  os_log_type_t v66;
  _BOOL4 v67;
  uint64_t v68;
  uint64_t v69;
  uint8_t *v70;
  uint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  id v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(uint64_t, uint64_t, uint64_t);
  NSObject *v85;
  os_log_type_t v86;
  _BOOL4 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  id v119;
  NSObject *v120;
  os_log_type_t v121;
  _BOOL4 v122;
  uint64_t v123;
  uint64_t v124;
  uint8_t *v125;
  uint64_t v126;
  id v127;
  id v128;
  id v129;
  uint64_t v130;
  unint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  id v148;
  id v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  void *v154;
  void (*v155)(uint64_t, uint64_t, uint64_t);
  void *v156;
  uint64_t v157;
  uint64_t v158;
  NSObject *v159;
  os_log_type_t v160;
  _BOOL4 v161;
  uint64_t v162;
  uint64_t v163;
  uint8_t *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  os_log_type_t type[8];
  os_log_type_t typea;
  os_log_t log;
  NSObject *loga;
  void (*v175)(uint64_t, uint64_t, uint64_t);
  uint64_t v176;
  uint64_t v177;
  id v178;
  uint64_t *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t *v182;
  id v183;
  uint64_t v184;
  id v185;
  uint64_t *v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void (*v194)(uint64_t, uint64_t);
  void (*v195)(uint64_t, uint64_t);
  _QWORD *v196;
  uint64_t v197;

  if (qword_2558CB378 != -1)
    swift_once();
  v1 = v0[35];
  v2 = v0[28];
  v3 = v0[29];
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2558CC248);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  v6 = sub_22727D4D0();
  v7 = sub_22727D77C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22723A000, v6, v7, "INSearchForMediaAppIntentHandler#resolveMediaItems ...", v8, 2u);
    MEMORY[0x2276AF6D4](v8, -1, -1);
  }
  v9 = v0[35];
  v10 = v0[28];
  v11 = v0[29];
  v12 = v0[15];

  v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v13(v9, v10);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v12 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider), *(_QWORD *)(v12 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider + 24));
  v15 = sub_22727D020();
  v16 = (void *)v0[14];
  v196 = v0;
  if (v14)
  {
    v17 = v14;
    v18 = objc_msgSend(v16, sel_privateSearchForMediaIntentData);
    v189 = v4;
    v179 = v0 + 13;
    if (v18)
    {
      v19 = v18;
      v20 = objc_msgSend(v18, sel_audioSearchResults);

      if (v20)
      {
        sub_227247C88(0, (unint64_t *)&qword_2558CB810);
        v21 = sub_22727D638();

        if (v21 >> 62)
        {
          swift_bridgeObjectRetain();
          v147 = sub_22727D9BC();
          swift_bridgeObjectRelease();
          if (v147)
            goto LABEL_10;
        }
        else if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_10:
          if ((v21 & 0xC000000000000001) != 0)
          {
            v22 = (id)MEMORY[0x2276AF200](0, v21);
            goto LABEL_13;
          }
          if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v22 = *(id *)(v21 + 32);
LABEL_13:
            v23 = v22;
            swift_bridgeObjectRelease();
            v24 = objc_msgSend(v23, sel_title);
            if (v24)
            {
              v25 = v24;
              sub_22727D584();
              v27 = v26;

            }
            else
            {
              v27 = 0;
            }
            v183 = objc_msgSend(v23, sel_type);
LABEL_57:
            v148 = objc_msgSend(v23, sel_artwork);
            v195 = v13;
            v188 = v23;
            if (v23 && (v149 = objc_msgSend(v23, sel_artist)) != 0)
            {
              v150 = v149;
              sub_22727D584();
              v152 = v151;

            }
            else
            {
              v152 = 0;
            }
            swift_bridgeObjectRetain();
            v177 = v15;
            v153 = (void *)sub_22727D578();
            swift_bridgeObjectRelease();
            if (v27)
            {
              v154 = (void *)sub_22727D578();
              swift_bridgeObjectRelease();
            }
            else
            {
              v154 = 0;
            }
            v0 = v196;
            v155 = v5;
            if (v152)
            {
              v156 = (void *)sub_22727D578();
              swift_bridgeObjectRelease();
            }
            else
            {
              v156 = 0;
            }
            v157 = v196[34];
            v158 = v196[28];
            v185 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9E50]), sel_initWithIdentifier_title_type_artwork_artist_, v153, v154, v183, v148, v156);

            v155(v157, v189, v158);
            swift_bridgeObjectRetain();
            v159 = sub_22727D4D0();
            v160 = sub_22727D77C();
            v161 = os_log_type_enabled(v159, v160);
            v162 = v196[34];
            v163 = v196[28];
            if (v161)
            {
              v164 = (uint8_t *)swift_slowAlloc();
              v165 = swift_slowAlloc();
              v197 = v165;
              *(_DWORD *)v164 = 136315138;
              swift_bridgeObjectRetain();
              *v179 = sub_2272403C4(v177, v17, &v197);
              v0 = v196;
              sub_22727D920();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_22723A000, v159, v160, "INSearchForMediaAppIntentHandler#resolveMediaItems resolving item from user default: openMusicKitId=%s", v164, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2276AF6D4](v165, -1, -1);
              MEMORY[0x2276AF6D4](v164, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();
            }

            v195(v162, v163);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
            v166 = swift_allocObject();
            *(_OWORD *)(v166 + 16) = xmmword_22727E830;
            sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
            *(_QWORD *)(v166 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v185);
            v197 = v166;
            sub_22727D650();
            v192 = v197;

            goto LABEL_76;
          }
          __break(1u);
          goto LABEL_73;
        }
        swift_bridgeObjectRelease();
      }
    }
    v183 = 0;
    v27 = 0;
    v23 = 0;
    goto LABEL_57;
  }
  v28 = objc_msgSend(v16, sel_privateSearchForMediaIntentData);
  if (!v28)
    goto LABEL_75;
  v29 = v28;
  v30 = objc_msgSend(v28, sel_audioSearchResults);

  if (!v30)
    goto LABEL_75;
  sub_227247C88(0, (unint64_t *)&qword_2558CB810);
  v21 = sub_22727D638();

  if (v21 >> 62)
  {
LABEL_73:
    swift_bridgeObjectRetain();
    v167 = sub_22727D9BC();
    swift_bridgeObjectRelease();
    if (!v167)
      goto LABEL_74;
    goto LABEL_19;
  }
  if (!*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_74:
    swift_bridgeObjectRelease();
LABEL_75:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v168 = swift_allocObject();
    *(_OWORD *)(v168 + 16) = xmmword_22727E830;
    sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
    *(_QWORD *)(v168 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v197 = v168;
    sub_22727D650();
    v192 = v168;
LABEL_76:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    ((void (*)(uint64_t))v0[1])(v192);
    return;
  }
LABEL_19:
  if ((v21 & 0xC000000000000001) != 0)
  {
    v31 = (id)MEMORY[0x2276AF200](0, v21);
    goto LABEL_22;
  }
  if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v31 = *(id *)(v21 + 32);
LABEL_22:
    v32 = v31;
    v186 = v0 + 10;
    swift_bridgeObjectRelease();
    v33 = objc_msgSend(v32, sel_identifier);
    if (v33 && (v34 = v33, sub_22727D584(), v34, sub_22727CCCC(), swift_allocObject(), sub_22727CCD8()))
    {
      v182 = v0 + 11;
      v190 = v4;
      v175 = v5;
      v178 = v32;
      v194 = v13;
      v36 = v0[26];
      v35 = v0[27];
      v37 = v0[22];
      v38 = v0[23];
      v39 = v0[20];
      v40 = v0[21];
      v41 = v0[19];
      v42 = v0[18];
      *(_QWORD *)type = v0[17];
      log = (os_log_t)v0[16];
      sub_22727CC78();
      swift_release();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v35, v36, v37);
      sub_22727CC60();
      v43 = sub_22727CCA8();
      v45 = v44;
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v40, v41);
      sub_22727CC54();
      v46 = sub_22727CC84();
      v48 = v47;
      v49 = *(void (**)(uint64_t, os_log_t))(*(_QWORD *)type + 8);
      v49(v42, log);
      v50 = sub_22727CC3C();
      v52 = sub_227250A18(v46, v48, v43, v45, v50, v51);
      v54 = v53;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v55 = v196[28];
      if (v54)
      {
        v187 = v52;
        v56 = v196[33];
        swift_bridgeObjectRelease();
        v175(v56, v190, v55);
        swift_bridgeObjectRetain_n();
        v57 = sub_22727D4D0();
        v58 = sub_22727D77C();
        v59 = os_log_type_enabled(v57, v58);
        v60 = v196[33];
        v61 = v196[28];
        if (v59)
        {
          v62 = (uint8_t *)swift_slowAlloc();
          v63 = swift_slowAlloc();
          v197 = v63;
          *(_DWORD *)v62 = 136315138;
          swift_bridgeObjectRetain();
          v196[12] = sub_2272403C4(v187, v54, &v197);
          sub_22727D920();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_22723A000, v57, v58, "INSearchForMediaAppIntentHandler#resolveMediaItems with musicSiriRepresentationString = %s", v62, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v63, -1, -1);
          MEMORY[0x2276AF6D4](v62, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }

        v194(v60, v61);
        v103 = objc_msgSend(v178, sel_title);
        if (v103)
        {
          v104 = v103;
          sub_22727D584();
          v106 = v105;

        }
        else
        {
          v106 = 0;
        }
        v107 = objc_msgSend(v178, sel_type);
        v108 = objc_msgSend(v178, sel_artwork);
        v109 = objc_msgSend(v178, sel_artist);
        if (v109)
        {
          v110 = v109;
          sub_22727D584();
          v112 = v111;

        }
        else
        {
          v112 = 0;
        }
        v113 = (void *)sub_22727D578();
        swift_bridgeObjectRelease();
        if (v106)
        {
          v114 = (void *)sub_22727D578();
          swift_bridgeObjectRelease();
        }
        else
        {
          v114 = 0;
        }
        if (v112)
        {
          v115 = (void *)sub_22727D578();
          swift_bridgeObjectRelease();
        }
        else
        {
          v115 = 0;
        }
        v0 = v196;
        v116 = v196[32];
        v117 = v196[28];
        v118 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9E50]), sel_initWithIdentifier_title_type_artwork_artist_, v113, v114, v107, v108, v115);

        v175(v116, v190, v117);
        v119 = v118;
        v120 = sub_22727D4D0();
        v121 = sub_22727D77C();
        v122 = os_log_type_enabled(v120, v121);
        v123 = v196[32];
        v124 = v196[28];
        if (v122)
        {
          v125 = (uint8_t *)swift_slowAlloc();
          v126 = swift_slowAlloc();
          v197 = v126;
          *(_DWORD *)v125 = 136315138;
          v127 = v119;
          v128 = v119;
          v129 = objc_msgSend(v127, sel_description);
          v130 = sub_22727D584();
          v181 = v124;
          v132 = v131;

          v119 = v128;
          *v182 = sub_2272403C4(v130, v132, &v197);
          sub_22727D920();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_22723A000, v120, v121, "INSearchForMediaAppIntentHandler#resolveMediaItems resolving item: %s", v125, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v126, -1, -1);
          v0 = v196;
          MEMORY[0x2276AF6D4](v125, -1, -1);

          v133 = v123;
          v134 = v181;
        }
        else
        {

          v133 = v123;
          v134 = v124;
        }
        v194(v133, v134);
        v135 = v0[27];
        v137 = v0[22];
        v136 = v0[23];
        v138 = (void *)v0[14];
        v139 = sub_227247C88(0, &qword_2558CB9E0);
        v140 = MEMORY[0x24BE91800];
        v0[5] = v139;
        v0[6] = v140;
        v0[2] = v138;
        v141 = v138;
        sub_22727D728();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v196 + 2));
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v142 = swift_allocObject();
        *(_OWORD *)(v142 + 16) = xmmword_22727E830;
        sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
        *(_QWORD *)(v142 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v119);
        v197 = v142;
        sub_22727D650();
        v192 = v197;

        (*(void (**)(uint64_t, uint64_t))(v136 + 8))(v135, v137);
      }
      else
      {
        v184 = v43;
        v79 = v196[27];
        v81 = v196[24];
        v80 = v196[25];
        v82 = v196[23];
        v83 = v196[22];
        v175(v196[31], v190, v55);
        v84 = *(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 16);
        v0 = v196;
        v84(v80, v79, v83);
        v84(v81, v79, v83);
        swift_bridgeObjectRetain();
        v85 = sub_22727D4D0();
        v86 = sub_22727D788();
        v87 = os_log_type_enabled(v85, v86);
        v88 = v196[31];
        v89 = v196[28];
        v91 = v196[24];
        v90 = v196[25];
        v92 = v196[23];
        if (v87)
        {
          v193 = v196[31];
          v93 = v196[18];
          v94 = v196[16];
          v169 = v196[22];
          v170 = v196[24];
          v95 = swift_slowAlloc();
          v176 = swift_slowAlloc();
          v197 = v176;
          *(_DWORD *)v95 = 136315650;
          loga = v85;
          sub_22727CC54();
          v96 = sub_22727CC84();
          typea = v86;
          v98 = v97;
          v49(v93, v94);
          v196[7] = sub_2272403C4(v96, v98, &v197);
          sub_22727D920();
          swift_bridgeObjectRelease();
          v99 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
          v99(v90, v169);
          *(_WORD *)(v95 + 12) = 2080;
          swift_bridgeObjectRetain();
          v196[8] = sub_2272403C4(v184, v45, &v197);
          sub_22727D920();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v95 + 22) = 2080;
          v100 = sub_22727CC3C();
          v196[9] = sub_2272403C4(v100, v101, &v197);
          sub_22727D920();
          swift_bridgeObjectRelease();
          v99(v170, v169);
          _os_log_impl(&dword_22723A000, loga, typea, "INSearchForMediaAppIntentHandler#resolveMediaItems failed to create musicSiriRepresentation from source: %s, type: %s, and identifier: %s", (uint8_t *)v95, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v176, -1, -1);
          v0 = v196;
          MEMORY[0x2276AF6D4](v95, -1, -1);

          v102 = v193;
        }
        else
        {
          v99 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
          v143 = v196[22];
          v99(v196[25], v143);
          swift_bridgeObjectRelease_n();
          v99(v91, v143);

          v102 = v88;
        }
        v194(v102, v89);
        v144 = v0[27];
        v145 = v0[22];
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v146 = swift_allocObject();
        *(_OWORD *)(v146 + 16) = xmmword_22727E830;
        sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
        *(_QWORD *)(v146 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
        v197 = v146;
        sub_22727D650();
        v192 = v197;

        v99(v144, v145);
      }
    }
    else
    {
      v5(v0[30], v4, v0[28]);
      v64 = v32;
      v65 = sub_22727D4D0();
      v66 = sub_22727D788();
      v67 = os_log_type_enabled(v65, v66);
      v68 = v0[30];
      v69 = v0[28];
      if (v67)
      {
        v191 = v0[30];
        v70 = (uint8_t *)swift_slowAlloc();
        v71 = swift_slowAlloc();
        v197 = v71;
        *(_DWORD *)v70 = 136446210;
        v72 = v64;
        v180 = v69;
        v73 = objc_msgSend(v72, sel_description);
        v74 = sub_22727D584();
        v75 = v64;
        v77 = v76;

        *v186 = sub_2272403C4(v74, v77, &v197);
        sub_22727D920();
        v64 = v75;
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_22723A000, v65, v66, "INSearchForMediaAppIntentHandler#resolveMediaItems failed to convert identifier to PlaybackItem for mediaItem: %{public}s", v70, 0xCu);
        swift_arrayDestroy();
        v0 = v196;
        MEMORY[0x2276AF6D4](v71, -1, -1);
        MEMORY[0x2276AF6D4](v70, -1, -1);

        v13(v191, v180);
      }
      else
      {

        v13(v68, v69);
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
      v78 = swift_allocObject();
      *(_OWORD *)(v78 + 16) = xmmword_22727E830;
      sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
      *(_QWORD *)(v78 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      v197 = v78;
      sub_22727D650();
      v192 = v197;

    }
    goto LABEL_76;
  }
  __break(1u);
}

uint64_t sub_22724EF6C(void *a1, void *aBlock, void *a3)
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
  v7[1] = sub_22724EFE8;
  return INSearchForMediaAppIntentHandler.resolveMediaItems(for:)((uint64_t)v6);
}

uint64_t sub_22724EFE8()
{
  uint64_t *v0;
  void (**v1)(_QWORD, _QWORD);
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v1 = *(void (***)(_QWORD, _QWORD))(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v2 = *(void **)(*v0 + 24);
  v6 = *v0;
  swift_task_dealloc();

  sub_227247C88(0, (unint64_t *)&unk_2558CB9D0);
  v4 = (void *)sub_22727D620();
  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, void *))v1)[2](v1, v4);

  _Block_release(v1);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t INSearchForMediaAppIntentHandler.handle(intent:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[19] = a1;
  v2[20] = v1;
  v3 = sub_22727D4E8();
  v2[21] = v3;
  v2[22] = *(_QWORD *)(v3 - 8);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  return swift_task_switch();
}

void sub_22724F164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  char v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  unint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  _BOOL4 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92;

  if (qword_2558CB378 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2558CC248);
  *(_QWORD *)(v0 + 264) = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 272) = v5;
  v5(v1, v4, v2);
  v6 = sub_22727D4D0();
  v7 = sub_22727D77C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22723A000, v6, v7, "INSearchForMediaAppIntentHandler#handle ...", v8, 2u);
    MEMORY[0x2276AF6D4](v8, -1, -1);
  }
  v9 = *(_QWORD *)(v0 + 256);
  v10 = *(_QWORD *)(v0 + 168);
  v11 = *(_QWORD *)(v0 + 176);
  v12 = *(_QWORD *)(v0 + 160);

  v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  *(_QWORD *)(v0 + 280) = v13;
  v13(v9, v10);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v12 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider), *(_QWORD *)(v12 + OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_featureFlagProvider + 24));
  v14 = sub_22727D02C();
  v15 = *(_QWORD *)(v0 + 168);
  if ((v14 & 1) != 0)
  {
    v5(*(_QWORD *)(v0 + 248), v4, v15);
    v16 = sub_22727D4D0();
    v17 = sub_22727D77C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_22723A000, v16, v17, "INSearchForMediaAppIntentHandler#handle using OpenMusicItemIntent", v18, 2u);
      MEMORY[0x2276AF6D4](v18, -1, -1);
    }
    v19 = *(void **)(v0 + 152);
    v20 = *(_QWORD *)(v0 + 248);
    v21 = *(_QWORD *)(v0 + 168);

    v13(v20, v21);
    v22 = objc_msgSend(v19, sel_mediaItems);
    if (v22)
    {
      v23 = v22;
      sub_227247C88(0, (unint64_t *)&qword_2558CB810);
      v24 = sub_22727D638();

      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        v80 = sub_22727D9BC();
        swift_bridgeObjectRelease();
        if (v80)
        {
LABEL_11:
          if ((v24 & 0xC000000000000001) != 0)
          {
            v25 = (id)MEMORY[0x2276AF200](0, v24);
          }
          else
          {
            if (!*(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              return;
            }
            v25 = *(id *)(v24 + 32);
          }
          v26 = v25;
          swift_bridgeObjectRelease();
          v27 = objc_msgSend(v26, sel_identifier);

          if (v27)
          {
            v28 = *(_QWORD *)(v0 + 240);
            v29 = *(_QWORD *)(v0 + 168);
            v30 = sub_22727D584();
            v32 = v31;

            *(_QWORD *)(v0 + 288) = v32;
            v5(v28, v4, v29);
            swift_bridgeObjectRetain_n();
            v33 = sub_22727D4D0();
            v34 = sub_22727D77C();
            v35 = os_log_type_enabled(v33, v34);
            v36 = *(_QWORD *)(v0 + 240);
            v37 = *(_QWORD *)(v0 + 168);
            if (v35)
            {
              v86 = *(_QWORD *)(v0 + 240);
              v38 = (uint8_t *)swift_slowAlloc();
              v89 = v30;
              v92 = swift_slowAlloc();
              v39 = v92;
              *(_DWORD *)v38 = 136315138;
              swift_bridgeObjectRetain();
              *(_QWORD *)(v0 + 144) = sub_2272403C4(v89, v32, &v92);
              sub_22727D920();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_22723A000, v33, v34, "INSearchForMediaAppIntentHandler#handle invoking OpenMusicItemAppIntent with identifier: %s", v38, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2276AF6D4](v39, -1, -1);
              MEMORY[0x2276AF6D4](v38, -1, -1);

              v40 = v86;
              v41 = v37;
            }
            else
            {
              swift_bridgeObjectRelease_n();

              v40 = v36;
              v41 = v37;
            }
            v13(v40, v41);
            __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 160)+ OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker), *(_QWORD *)(*(_QWORD *)(v0 + 160)+ OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker+ 24));
            v79 = (_QWORD *)swift_task_alloc();
            *(_QWORD *)(v0 + 296) = v79;
            *v79 = v0;
            v79[1] = sub_22724FC9C;
            sub_22727CEC4();
            return;
          }
          goto LABEL_40;
        }
      }
      else if (*(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_11;
      }
      swift_bridgeObjectRelease();
    }
LABEL_40:
    v5(*(_QWORD *)(v0 + 232), v4, *(_QWORD *)(v0 + 168));
    v69 = sub_22727D4D0();
    v81 = sub_22727D788();
    if (os_log_type_enabled(v69, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v82 = 0;
      _os_log_impl(&dword_22723A000, v69, v81, "INSearchForMediaAppIntentHandler#handle failed to get identifier from mediaItem", v82, 2u);
      MEMORY[0x2276AF6D4](v82, -1, -1);
    }
    v72 = *(_QWORD *)(v0 + 232);
LABEL_43:
    v83 = *(_QWORD *)(v0 + 168);

    v13(v72, v83);
    v91 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA070]), sel_initWithCode_userActivity_, 5, 0);
LABEL_44:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(id))(v0 + 8))(v91);
    return;
  }
  v5(*(_QWORD *)(v0 + 224), v4, v15);
  v42 = sub_22727D4D0();
  v43 = sub_22727D77C();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    _os_log_impl(&dword_22723A000, v42, v43, "INSearchForMediaAppIntentHandler#handle using SearchForMusicIntent", v44, 2u);
    MEMORY[0x2276AF6D4](v44, -1, -1);
  }
  v45 = *(_QWORD *)(v0 + 224);
  v46 = *(_QWORD *)(v0 + 168);
  v47 = *(void **)(v0 + 152);

  v13(v45, v46);
  v48 = objc_msgSend(v47, sel_mediaSearch);
  *(_QWORD *)(v0 + 312) = v48;
  if (!v48)
  {
    v5(*(_QWORD *)(v0 + 200), v4, *(_QWORD *)(v0 + 168));
    v69 = sub_22727D4D0();
    v70 = sub_22727D788();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v71 = 0;
      _os_log_impl(&dword_22723A000, v69, v70, "INSearchForMediaAppIntentHandler#handle mediaSearch is nil", v71, 2u);
      MEMORY[0x2276AF6D4](v71, -1, -1);
    }
    v72 = *(_QWORD *)(v0 + 200);
    goto LABEL_43;
  }
  v49 = v48;
  v50 = sub_22727D740();
  *(_QWORD *)(v0 + 320) = v51;
  v52 = *(_QWORD *)(v0 + 168);
  if (!v51)
  {
    v5(*(_QWORD *)(v0 + 208), v4, *(_QWORD *)(v0 + 168));
    v73 = sub_22727D4D0();
    v74 = sub_22727D788();
    if (os_log_type_enabled(v73, v74))
    {
      v75 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v75 = 0;
      _os_log_impl(&dword_22723A000, v73, v74, "INSearchForMediaAppIntentHandler#handle failed to get criteria from mediaSearch", v75, 2u);
      MEMORY[0x2276AF6D4](v75, -1, -1);
    }
    v76 = *(_QWORD *)(v0 + 208);
    v77 = *(_QWORD *)(v0 + 168);

    v13(v76, v77);
    v91 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA070]), sel_initWithCode_userActivity_, 5, 0);

    goto LABEL_44;
  }
  v53 = v51;
  v90 = v50;
  v54 = *(_QWORD *)(v0 + 216);
  v55 = objc_msgSend(v49, sel_reference);
  *(_QWORD *)(v0 + 328) = v55;
  v56 = 0x7972617262696CLL;
  if (v55 != (id)2)
    v56 = 0;
  v88 = v56;
  if (v55 == (id)2)
    v57 = 0xE700000000000000;
  else
    v57 = 0;
  v58 = objc_msgSend(v49, sel_mediaType);
  v5(v54, v4, v52);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v59 = sub_22727D4D0();
  v60 = sub_22727D77C();
  v61 = os_log_type_enabled(v59, v60);
  v62 = *(_QWORD *)(v0 + 216);
  v63 = *(_QWORD *)(v0 + 168);
  if (v61)
  {
    v85 = *(_QWORD *)(v0 + 216);
    v87 = v58;
    v64 = swift_slowAlloc();
    v84 = swift_slowAlloc();
    v92 = v84;
    *(_DWORD *)v64 = 136315650;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 80) = sub_2272403C4(v90, v53, &v92);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v64 + 12) = 2080;
    *(_QWORD *)(v0 + 64) = v88;
    *(_QWORD *)(v0 + 72) = v57;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB9F0);
    v65 = sub_22727D590();
    *(_QWORD *)(v0 + 96) = sub_2272403C4(v65, v66, &v92);
    sub_22727D920();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v64 + 22) = 2080;
    *(_QWORD *)(v0 + 104) = v87;
    type metadata accessor for INMediaItemType(0);
    v67 = sub_22727D590();
    *(_QWORD *)(v0 + 112) = sub_2272403C4(v67, v68, &v92);
    sub_22727D920();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v59, v60, "INSearchForMediaAppIntentHandler#handle invoking SearchMusicAppIntent with criteria: %s, searchSource: %s, and mediaType: %s", (uint8_t *)v64, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v84, -1, -1);
    MEMORY[0x2276AF6D4](v64, -1, -1);

    v13(v85, v63);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    v13(v62, v63);
  }
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 160)+ OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker), *(_QWORD *)(*(_QWORD *)(v0 + 160)+ OBJC_IVAR____TtC17SiriAudioInternal32INSearchForMediaAppIntentHandler_appIntentInvoker+ 24));
  v78 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v78;
  *v78 = v0;
  v78[1] = sub_22724FDD8;
  sub_22727CEB8();
}

uint64_t sub_22724FC9C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_22724FD08()
{
  uint64_t v0;
  id v2;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA070]), sel_initWithCode_userActivity_, 4, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v2);
}

uint64_t sub_22724FDD8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 344) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_22724FE58()
{
  uint64_t v0;
  void *v1;
  id v3;

  v1 = *(void **)(v0 + 312);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA070]), sel_initWithCode_userActivity_, 4, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v3);
}

uint64_t sub_22724FF30()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  id v24;
  uint64_t v25;

  v1 = *(void **)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  v4 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 168);
  swift_bridgeObjectRelease();
  v3(v4, v2, v5);
  v6 = v1;
  v7 = v1;
  v8 = sub_22727D4D0();
  v9 = sub_22727D788();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 304);
    v22 = *(_QWORD *)(v0 + 192);
    v23 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v21 = *(_QWORD *)(v0 + 168);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v25 = v12;
    *(_DWORD *)v11 = 136315138;
    swift_getErrorValue();
    v13 = sub_22727DA34();
    *(_QWORD *)(v0 + 136) = sub_2272403C4(v13, v14, &v25);
    sub_22727D920();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22723A000, v8, v9, "INSearchForMediaAppIntentHandler#handle threw an error: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v12, -1, -1);
    MEMORY[0x2276AF6D4](v11, -1, -1);

    v23(v22, v21);
  }
  else
  {
    v15 = *(void **)(v0 + 304);
    v16 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v17 = *(_QWORD *)(v0 + 192);
    v18 = *(_QWORD *)(v0 + 168);

    v16(v17, v18);
  }
  v19 = *(void **)(v0 + 304);
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA070]), sel_initWithCode_userActivity_, 5, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v24);
}

uint64_t sub_2272501C0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  id v24;
  uint64_t v25;

  v1 = *(void **)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
  v4 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 168);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3(v4, v2, v5);
  v6 = v1;
  v7 = v1;
  v8 = sub_22727D4D0();
  v9 = sub_22727D788();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 344);
    v22 = *(_QWORD *)(v0 + 184);
    v23 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v21 = *(_QWORD *)(v0 + 168);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v25 = v12;
    *(_DWORD *)v11 = 136315138;
    swift_getErrorValue();
    v13 = sub_22727DA34();
    *(_QWORD *)(v0 + 88) = sub_2272403C4(v13, v14, &v25);
    sub_22727D920();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22723A000, v8, v9, "INSearchForMediaAppIntentHandler#handle threw an error: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v12, -1, -1);
    MEMORY[0x2276AF6D4](v11, -1, -1);

    v23(v22, v21);
  }
  else
  {
    v15 = *(void **)(v0 + 344);
    v16 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v17 = *(_QWORD *)(v0 + 184);
    v18 = *(_QWORD *)(v0 + 168);

    v16(v17, v18);
  }
  v19 = *(void **)(v0 + 344);
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA070]), sel_initWithCode_userActivity_, 5, 0);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v24);
}

uint64_t sub_22725059C(void *a1, void *aBlock, void *a3)
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
  v7[1] = sub_227250618;
  return INSearchForMediaAppIntentHandler.handle(intent:)((uint64_t)v6);
}

uint64_t sub_227250618(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v7 = *v1;
  swift_task_dealloc();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v7 + 8))();
}

id INSearchForMediaAppIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void INSearchForMediaAppIntentHandler.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id INSearchForMediaAppIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INSearchForMediaAppIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_227250774(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2272471E4;
  return v6();
}

uint64_t sub_2272507C8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2272471E4;
  return v7();
}

uint64_t sub_22725081C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_22727D6BC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22727D6B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_227246BC0(a1, &qword_2558CB750);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22727D680();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_227250968(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2272509CC;
  return v6(a1);
}

uint64_t sub_2272509CC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_227250A18(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  unint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  NSObject *v67;
  os_log_type_t v68;
  _BOOL4 v69;
  uint64_t v70;
  uint8_t *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  NSObject *v77;
  os_log_type_t v78;
  uint64_t v79;
  uint64_t v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  void (*v86)(char *, uint64_t);
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  NSObject *v95;
  os_log_type_t v96;
  uint8_t *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  char *v103;
  NSObject *v104;
  uint64_t v105;
  os_log_type_t v106;
  uint64_t v107;
  uint8_t *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  char *v116;
  NSObject *v117;
  os_log_type_t v118;
  uint8_t *v119;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  char *v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  char *v130;
  char *v131;
  uint64_t v132;
  char *v133;
  char *v134;
  char *v135;
  char *v136;
  void (*v137)(char *);
  uint64_t v138;
  void (*v139)(char *, uint64_t, uint64_t);
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;

  v149 = a6;
  v146 = a5;
  v147 = a1;
  v151 = a4;
  v142 = a3;
  v148 = sub_22727C9B4();
  v145 = *(_QWORD *)(v148 - 8);
  v7 = MEMORY[0x24BDAC7A8](v148);
  v129 = (char *)&v121 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v135 = (char *)&v121 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBAE8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v128 = (char *)&v121 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v133 = (char *)&v121 - v13;
  v150 = sub_22727CA14();
  v14 = *(_QWORD *)(v150 - 8);
  v15 = MEMORY[0x24BDAC7A8](v150);
  v17 = (char *)&v121 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v127 = (char *)&v121 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v121 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v134 = (char *)&v121 - v23;
  v141 = sub_22727C9FC();
  v24 = *(_QWORD *)(v141 - 8);
  MEMORY[0x24BDAC7A8](v141);
  v26 = (char *)&v121 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_22727D4E8();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v123 = (char *)&v121 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v124 = (char *)&v121 - v32;
  v33 = MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v121 - v34;
  v36 = MEMORY[0x24BDAC7A8](v33);
  v130 = (char *)&v121 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v144 = (char *)&v121 - v39;
  MEMORY[0x24BDAC7A8](v38);
  v41 = (char *)&v121 - v40;
  if (qword_2558CB378 != -1)
    swift_once();
  v131 = v22;
  v126 = v35;
  v125 = v17;
  v42 = __swift_project_value_buffer(v27, (uint64_t)qword_2558CC248);
  v43 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
  v138 = v42;
  v139 = v43;
  ((void (*)(char *))v43)(v41);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v44 = v149;
  swift_bridgeObjectRetain_n();
  v45 = sub_22727D4D0();
  v46 = sub_22727D77C();
  LODWORD(v137) = v46;
  v47 = os_log_type_enabled(v45, v46);
  v48 = v28;
  v136 = v26;
  v140 = v24;
  v143 = v14;
  if (v47)
  {
    v49 = swift_slowAlloc();
    v50 = swift_slowAlloc();
    v132 = v27;
    v51 = v50;
    v153 = v50;
    *(_DWORD *)v49 = 136315650;
    swift_bridgeObjectRetain();
    v152 = sub_2272403C4(v147, a2, &v153);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v49 + 12) = 2080;
    v52 = v151;
    swift_bridgeObjectRetain();
    v122 = v48;
    v53 = v142;
    v152 = sub_2272403C4(v142, v52, &v153);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v49 + 22) = 2080;
    swift_bridgeObjectRetain();
    v152 = sub_2272403C4(v146, v44, &v153);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22723A000, v45, (os_log_type_t)v137, "MusicSiriRepresentation#from called with source = %s, type = %s, and identifier = %s", (uint8_t *)v49, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v51, -1, -1);
    v54 = v49;
    v26 = v136;
    MEMORY[0x2276AF6D4](v54, -1, -1);

    v55 = v132;
    v137 = *(void (**)(char *))(v122 + 8);
    v137(v41);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v55 = v27;
    v137 = *(void (**)(char *))(v28 + 8);
    ((void (*)(char *, uint64_t))v137)(v41, v27);
    v53 = v142;
  }
  sub_22727C9F0();
  sub_22727C9E4();
  v57 = v144;
  v56 = v145;
  if (v53 == 0x6174536F69646172 && v151 == 0xEC0000006E6F6974)
  {
    v58 = v143;
  }
  else
  {
    v59 = sub_22727DA10();
    v58 = v143;
    if ((v59 & 1) == 0)
      swift_bridgeObjectRetain();
  }
  v60 = v56;
  sub_22727C9D8();
  v61 = v147;
  if ((v147 != 0x656369766564 || a2 != 0xE600000000000000) && (sub_22727DA10() & 1) == 0)
  {
    v90 = v55;
    if (v61 == 0x65726F7473 && a2 == 0xE500000000000000 || (sub_22727DA10() & 1) != 0)
    {
      v62 = v129;
      sub_22727C9A8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBAF0);
      v91 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
      v92 = swift_allocObject();
      *(_OWORD *)(v92 + 16) = xmmword_22727E530;
      (*(void (**)(unint64_t, char *, uint64_t))(v60 + 16))(v92 + v91, v62, v148);
      sub_22727C9C0();
      v93 = (uint64_t)v128;
      sub_22727C9CC();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v93, 1, v150) != 1)
      {
        v100 = v127;
        v101 = v150;
        (*(void (**)(char *, uint64_t, uint64_t))(v58 + 32))(v127, v93, v150);
        v102 = v126;
        v139(v126, v138, v55);
        v103 = v125;
        (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v125, v100, v101);
        v104 = sub_22727D4D0();
        v105 = v90;
        v106 = sub_22727D77C();
        if (os_log_type_enabled(v104, v106))
        {
          v132 = v105;
          v107 = v58;
          v108 = (uint8_t *)swift_slowAlloc();
          v109 = swift_slowAlloc();
          v153 = v109;
          *(_DWORD *)v108 = 136315138;
          v110 = v150;
          sub_227251B30();
          v111 = sub_22727DA04();
          v152 = sub_2272403C4(v111, v112, &v153);
          v62 = v129;
          sub_22727D920();
          swift_bridgeObjectRelease();
          v86 = *(void (**)(char *, uint64_t))(v107 + 8);
          v86(v103, v110);
          _os_log_impl(&dword_22723A000, v104, v106, "MusicSiriRepresentation#from returning %s", v108, 0xCu);
          swift_arrayDestroy();
          v113 = v109;
          v60 = v145;
          MEMORY[0x2276AF6D4](v113, -1, -1);
          MEMORY[0x2276AF6D4](v108, -1, -1);

          v114 = v126;
          v115 = v132;
        }
        else
        {
          v86 = *(void (**)(char *, uint64_t))(v58 + 8);
          v86(v103, v150);

          v114 = v102;
          v115 = v105;
        }
        ((void (*)(char *, uint64_t))v137)(v114, v115);
        v98 = v127;
        goto LABEL_29;
      }
      sub_227246BC0(v93, &qword_2558CBAE8);
      v94 = v124;
      v139(v124, v138, v55);
      v95 = sub_22727D4D0();
      v96 = sub_22727D788();
      if (os_log_type_enabled(v95, v96))
      {
        v97 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v97 = 0;
        _os_log_impl(&dword_22723A000, v95, v96, "MusicSiriRepresentation#from Failed to create valid URL for store content", v97, 2u);
        MEMORY[0x2276AF6D4](v97, -1, -1);
      }

      ((void (*)(char *, uint64_t))v137)(v94, v55);
      (*(void (**)(char *, uint64_t))(v60 + 8))(v62, v148);
    }
    else
    {
      v116 = v123;
      v139(v123, v138, v55);
      v117 = sub_22727D4D0();
      v118 = sub_22727D788();
      if (os_log_type_enabled(v117, v118))
      {
        v119 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v119 = 0;
        _os_log_impl(&dword_22723A000, v117, v118, "MusicSiriRepresentation#from unknown source type, returning nil", v119, 2u);
        MEMORY[0x2276AF6D4](v119, -1, -1);
      }

      ((void (*)(char *, uint64_t))v137)(v116, v55);
    }
    (*(void (**)(char *, uint64_t))(v140 + 8))(v26, v141);
    return 0;
  }
  v62 = v135;
  sub_22727C9A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBAF0);
  v63 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = xmmword_22727E530;
  (*(void (**)(unint64_t, char *, uint64_t))(v60 + 16))(v64 + v63, v62, v148);
  sub_22727C9C0();
  v65 = (uint64_t)v133;
  sub_22727C9CC();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v65, 1, v150) == 1)
  {
    sub_227246BC0(v65, &qword_2558CBAE8);
    v66 = v130;
    v139(v130, v138, v55);
    v67 = sub_22727D4D0();
    v68 = sub_22727D788();
    v69 = os_log_type_enabled(v67, v68);
    v70 = v140;
    if (v69)
    {
      v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v71 = 0;
      _os_log_impl(&dword_22723A000, v67, v68, "MusicSiriRepresentation#from Failed to create valid URL for library content", v71, 2u);
      MEMORY[0x2276AF6D4](v71, -1, -1);
    }

    ((void (*)(char *, uint64_t))v137)(v66, v55);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v62, v148);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v26, v141);
    return 0;
  }
  v72 = v134;
  v73 = v65;
  v74 = v150;
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 32))(v134, v73, v150);
  v139(v57, v138, v55);
  v75 = v57;
  v76 = v131;
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v131, v72, v74);
  v77 = sub_22727D4D0();
  v78 = sub_22727D77C();
  if (os_log_type_enabled(v77, v78))
  {
    v79 = swift_slowAlloc();
    v132 = v55;
    v80 = v58;
    v81 = (uint8_t *)v79;
    v82 = swift_slowAlloc();
    v153 = v82;
    *(_DWORD *)v81 = 136315138;
    v83 = v150;
    sub_227251B30();
    v84 = sub_22727DA04();
    v152 = sub_2272403C4(v84, v85, &v153);
    v62 = v135;
    sub_22727D920();
    swift_bridgeObjectRelease();
    v86 = *(void (**)(char *, uint64_t))(v80 + 8);
    v86(v76, v83);
    _os_log_impl(&dword_22723A000, v77, v78, "MusicSiriRepresentation#from returning %s", v81, 0xCu);
    swift_arrayDestroy();
    v87 = v82;
    v60 = v145;
    MEMORY[0x2276AF6D4](v87, -1, -1);
    MEMORY[0x2276AF6D4](v81, -1, -1);

    v88 = v144;
    v89 = v132;
  }
  else
  {
    v86 = *(void (**)(char *, uint64_t))(v58 + 8);
    v86(v76, v150);

    v88 = v75;
    v89 = v55;
  }
  ((void (*)(char *, uint64_t))v137)(v88, v89);
  v98 = v134;
LABEL_29:
  v99 = sub_22727CA08();
  v86(v98, v150);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v62, v148);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v136, v141);
  return v99;
}

uint64_t sub_227251854()
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
  v5[1] = sub_2272471E4;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_2558CBA88 + dword_2558CBA88))(v2, v3, v4);
}

uint64_t sub_2272518C4()
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
  v5[1] = sub_2272471E4;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2558CBA98 + dword_2558CBA98))(v2, v3, v4);
}

uint64_t sub_227251940(uint64_t a1)
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
  v7[1] = sub_2272471E4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2558CBAA8 + dword_2558CBAA8))(a1, v4, v5, v6);
}

uint64_t sub_2272519C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2272519E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2272463F4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2558CBAB8 + dword_2558CBAB8))(a1, v4);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_227251A90()
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
  v5[1] = sub_2272463F4;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_2558CBAC8 + dword_2558CBAC8))(v2, v3, v4);
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_227251B30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558CBAF8;
  if (!qword_2558CBAF8)
  {
    v1 = sub_22727CA14();
    result = MEMORY[0x2276AF644](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_2558CBAF8);
  }
  return result;
}

uint64_t sub_227251B78()
{
  uint64_t v0;
  id v1;

  v0 = sub_22727D4E8();
  __swift_allocate_value_buffer(v0, qword_2558CC248);
  __swift_project_value_buffer(v0, (uint64_t)qword_2558CC248);
  if (qword_2558CB390 != -1)
    swift_once();
  v1 = (id)logObject;
  return sub_22727D4F4();
}

uint64_t AppIntentInvoker.__allocating_init(localDispatcher:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_227251C38()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[5];

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultEnvironment);
  v5[3] = sub_2272545D8();
  v5[4] = MEMORY[0x24BE04080];
  v5[0] = v0;
  v1 = sub_22727D314();
  v3 = v2;
  result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);
  static AppIntentInvoker.defaultLocalDispatcher = v1;
  *(_QWORD *)algn_2558CC268 = v3;
  return result;
}

uint64_t *AppIntentInvoker.defaultLocalDispatcher.unsafeMutableAddressor()
{
  if (qword_2558CB380 != -1)
    swift_once();
  return &static AppIntentInvoker.defaultLocalDispatcher;
}

uint64_t static AppIntentInvoker.defaultLocalDispatcher.getter()
{
  if (qword_2558CB380 != -1)
    swift_once();
  return swift_unknownObjectRetain();
}

uint64_t AppIntentInvoker.init(localDispatcher:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t sub_227251D78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;

  v3[3] = a1;
  v3[4] = v2;
  v5 = sub_22727D2FC();
  v3[5] = v5;
  v3[6] = *(_QWORD *)(v5 - 8);
  v3[7] = swift_task_alloc();
  v3[2] = a2;
  return swift_task_switch();
}

uint64_t sub_227251DE0()
{
  uint64_t v0;
  _QWORD *v1;

  swift_getObjectType();
  sub_227254594();
  sub_22727D2F0();
  sub_22727D23C();
  swift_allocObject();
  *(_QWORD *)(v0 + 64) = sub_22727D230();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_227251EEC;
  return sub_22727D2C0();
}

uint64_t sub_227251EEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_227251F80()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227251FB4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227251FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v7;

  v4[4] = a1;
  v4[5] = v3;
  v7 = sub_22727D2FC();
  v4[6] = v7;
  v4[7] = *(_QWORD *)(v7 - 8);
  v4[8] = swift_task_alloc();
  v4[2] = a2;
  v4[3] = a3;
  return swift_task_switch();
}

uint64_t sub_22725205C()
{
  uint64_t v0;
  _QWORD *v1;

  swift_getObjectType();
  sub_227254550();
  sub_22727D2F0();
  sub_22727D23C();
  swift_allocObject();
  *(_QWORD *)(v0 + 72) = sub_22727D230();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_227252168;
  return sub_22727D2C0();
}

uint64_t sub_227252168()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_2272521FC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227252230()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AppIntentInvoker.invokeOpenMusicItemIntent(musicItemIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  v4 = sub_22727D2FC();
  v3[9] = v4;
  v3[10] = *(_QWORD *)(v4 - 8);
  v3[11] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB08);
  v3[12] = v5;
  v3[13] = *(_QWORD *)(v5 - 8);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB10);
  v3[17] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB18);
  v3[18] = v6;
  v3[19] = *(_QWORD *)(v6 - 8);
  v3[20] = swift_task_alloc();
  v7 = sub_22727D2CC();
  v3[21] = v7;
  v3[22] = *(_QWORD *)(v7 - 8);
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  v8 = sub_22727D4E8();
  v3[25] = v8;
  v3[26] = *(_QWORD *)(v8 - 8);
  v3[27] = swift_task_alloc();
  v3[28] = swift_task_alloc();
  v3[29] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB20);
  v3[30] = v9;
  v3[31] = *(_QWORD *)(v9 - 8);
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_227252424()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  type metadata accessor for GenericMusicItemEntity();
  sub_22723CA60(&qword_2558CBB28, (uint64_t (*)(uint64_t))type metadata accessor for GenericMusicItemEntity, (uint64_t)&unk_22727E358);
  swift_bridgeObjectRetain();
  v1 = sub_22727D224();
  v0[35] = v1;
  v0[2] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB30);
  swift_allocObject();
  swift_retain();
  v2 = sub_22727D32C();
  v0[36] = v2;
  v3 = (_QWORD *)swift_task_alloc();
  v0[37] = v3;
  *v3 = v0;
  v3[1] = sub_227252518;
  return sub_227251D78(v0[34], v2);
}

uint64_t sub_227252518()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22725257C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  void (*v9)(uint64_t, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t, uint64_t);
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  unint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  if (qword_2558CB378 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 232);
  v6 = *(_QWORD *)(v0 + 208);
  v7 = __swift_project_value_buffer(*(_QWORD *)(v0 + 200), (uint64_t)qword_2558CC248);
  *(_QWORD *)(v0 + 312) = v7;
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  *(_QWORD *)(v0 + 320) = v8;
  v59 = v8;
  v61 = v7;
  ((void (*)(uint64_t))v8)(v5);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v9(v1, v2, v4);
  v10 = sub_22727D4D0();
  v11 = sub_22727D794();
  v12 = os_log_type_enabled(v10, v11);
  v13 = *(_QWORD *)(v0 + 264);
  if (v12)
  {
    v14 = *(_QWORD *)(v0 + 256);
    v15 = *(_QWORD *)(v0 + 240);
    v54 = *(_QWORD *)(v0 + 248);
    v55 = *(_QWORD *)(v0 + 208);
    v56 = *(_QWORD *)(v0 + 200);
    v57 = *(_QWORD *)(v0 + 232);
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v62 = v17;
    *(_DWORD *)v16 = 136315138;
    v9(v14, v13, v15);
    v18 = sub_22727D590();
    *(_QWORD *)(v0 + 40) = sub_2272403C4(v18, v19, &v62);
    sub_22727D920();
    swift_bridgeObjectRelease();
    v20 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
    v20(v13, v15);
    _os_log_impl(&dword_22723A000, v10, v11, "AppIntentInvoker#invokeOpenMusicItemIntent response: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v17, -1, -1);
    MEMORY[0x2276AF6D4](v16, -1, -1);

    v21 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
    v21(v57, v56);
  }
  else
  {
    v22 = *(_QWORD *)(v0 + 232);
    v23 = *(_QWORD *)(v0 + 200);
    v24 = *(_QWORD *)(v0 + 208);
    v20 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 248) + 8);
    v20(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 240));

    v21 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v21(v22, v23);
  }
  *(_QWORD *)(v0 + 328) = v20;
  *(_QWORD *)(v0 + 336) = v21;
  v25 = *(_QWORD *)(v0 + 168);
  v26 = *(_QWORD *)(v0 + 176);
  v28 = *(_QWORD *)(v0 + 152);
  v27 = *(_QWORD *)(v0 + 160);
  v30 = *(_QWORD *)(v0 + 136);
  v29 = *(_QWORD *)(v0 + 144);
  sub_22727D2D8();
  sub_22727D320();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v30, 1, v25) == 1)
  {
    v31 = *(_QWORD *)(v0 + 136);
    v20(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 240));
    swift_release();
    swift_release();
    sub_2272544F0(v31);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v33 = *(_QWORD *)(v0 + 224);
    v35 = *(_QWORD *)(v0 + 192);
    v34 = *(_QWORD *)(v0 + 200);
    v37 = *(_QWORD *)(v0 + 176);
    v36 = *(_QWORD *)(v0 + 184);
    v38 = *(_QWORD *)(v0 + 168);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v37 + 32))(v35, *(_QWORD *)(v0 + 136), v38);
    v59(v33, v61, v34);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v36, v35, v38);
    v39 = sub_22727D4D0();
    v40 = sub_22727D794();
    v41 = os_log_type_enabled(v39, v40);
    v42 = *(_QWORD *)(v0 + 224);
    v43 = *(_QWORD *)(v0 + 200);
    v44 = *(_QWORD *)(v0 + 176);
    v45 = *(_QWORD *)(v0 + 184);
    v46 = *(_QWORD *)(v0 + 168);
    if (v41)
    {
      v60 = *(_QWORD *)(v0 + 224);
      v47 = (uint8_t *)swift_slowAlloc();
      v58 = swift_slowAlloc();
      v62 = v58;
      *(_DWORD *)v47 = 136315138;
      sub_22723CA60(&qword_2558CBB40, (uint64_t (*)(uint64_t))MEMORY[0x24BE03F60], MEMORY[0x24BE03F70]);
      v48 = sub_22727DA04();
      *(_QWORD *)(v0 + 32) = sub_2272403C4(v48, v49, &v62);
      sub_22727D920();
      swift_bridgeObjectRelease();
      v50 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v50(v45, v46);
      _os_log_impl(&dword_22723A000, v39, v40, "AppIntentInvoker#invokeOpenMusicItemIntent calling showResultIntent: %s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v58, -1, -1);
      MEMORY[0x2276AF6D4](v47, -1, -1);

      v51 = v60;
      v52 = v43;
    }
    else
    {
      v50 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v50(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168));

      v51 = v42;
      v52 = v43;
    }
    v21(v51, v52);
    *(_QWORD *)(v0 + 344) = v50;
    swift_getObjectType();
    sub_22727D2F0();
    sub_22727D23C();
    swift_allocObject();
    *(_QWORD *)(v0 + 352) = sub_22727D230();
    v53 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 360) = v53;
    *v53 = v0;
    v53[1] = sub_227252B7C;
    return sub_22727D2B4();
  }
}

uint64_t sub_227252B7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 368) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_227252C10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 104);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 320))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 200));
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v5(v2, v1, v3);
  v6 = sub_22727D4D0();
  v7 = sub_22727D794();
  if (os_log_type_enabled(v6, v7))
  {
    v38 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    v34 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
    v39 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
    v36 = *(_QWORD *)(v0 + 240);
    v37 = *(_QWORD *)(v0 + 272);
    v28 = *(_QWORD *)(v0 + 200);
    v29 = *(_QWORD *)(v0 + 216);
    v31 = *(_QWORD *)(v0 + 168);
    v32 = *(_QWORD *)(v0 + 192);
    v8 = *(_QWORD *)(v0 + 120);
    v30 = *(_QWORD *)(v0 + 128);
    v9 = *(_QWORD *)(v0 + 112);
    v27 = *(_QWORD *)(v0 + 104);
    v10 = *(_QWORD *)(v0 + 96);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v40 = v12;
    *(_DWORD *)v11 = 136315138;
    v5(v9, v8, v10);
    v13 = sub_22727D590();
    *(_QWORD *)(v0 + 24) = sub_2272403C4(v13, v14, &v40);
    sub_22727D920();
    swift_bridgeObjectRelease();
    v15 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
    v15(v8, v10);
    _os_log_impl(&dword_22723A000, v6, v7, "AppIntentInvoker#invokeOpenMusicItemIntent calling showResultIntentResponse: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v12, -1, -1);
    MEMORY[0x2276AF6D4](v11, -1, -1);
    swift_release();

    swift_release();
    v34(v29, v28);
    v15(v30, v10);
    v17 = v31;
    v16 = v32;
  }
  else
  {
    v38 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    v35 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
    v39 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
    v36 = *(_QWORD *)(v0 + 240);
    v37 = *(_QWORD *)(v0 + 272);
    v18 = *(_QWORD *)(v0 + 216);
    v19 = *(_QWORD *)(v0 + 200);
    v33 = *(_QWORD *)(v0 + 192);
    v20 = *(_QWORD *)(v0 + 168);
    v21 = *(_QWORD *)(v0 + 120);
    v22 = *(_QWORD *)(v0 + 128);
    v23 = *(_QWORD *)(v0 + 96);
    v24 = *(_QWORD *)(v0 + 104);
    swift_release();

    v25 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v25(v21, v23);
    swift_release();
    v35(v18, v19);
    v25(v22, v23);
    v16 = v33;
    v17 = v20;
  }
  v38(v16, v17);
  v39(v37, v36);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227252F70()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227253070()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
  v3 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 240);
  v5 = *(_QWORD *)(v0 + 192);
  v6 = *(_QWORD *)(v0 + 168);
  swift_release();
  swift_release();
  v1(v5, v6);
  v2(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AppIntentInvoker.invokeSearchMusicAppIntent(criteria:searchSource:mediaType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)(v7 + 89) = a6;
  *(_QWORD *)(v7 + 176) = a5;
  *(_QWORD *)(v7 + 184) = v6;
  *(_QWORD *)(v7 + 160) = a3;
  *(_QWORD *)(v7 + 168) = a4;
  *(_QWORD *)(v7 + 144) = a1;
  *(_QWORD *)(v7 + 152) = a2;
  v8 = sub_22727D2FC();
  *(_QWORD *)(v7 + 192) = v8;
  *(_QWORD *)(v7 + 200) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 208) = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB08);
  *(_QWORD *)(v7 + 216) = v9;
  *(_QWORD *)(v7 + 224) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v7 + 232) = swift_task_alloc();
  *(_QWORD *)(v7 + 240) = swift_task_alloc();
  *(_QWORD *)(v7 + 248) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB10);
  *(_QWORD *)(v7 + 256) = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB18);
  *(_QWORD *)(v7 + 264) = v10;
  *(_QWORD *)(v7 + 272) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v7 + 280) = swift_task_alloc();
  v11 = sub_22727D2CC();
  *(_QWORD *)(v7 + 288) = v11;
  *(_QWORD *)(v7 + 296) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v7 + 304) = swift_task_alloc();
  *(_QWORD *)(v7 + 312) = swift_task_alloc();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB20);
  *(_QWORD *)(v7 + 320) = v12;
  *(_QWORD *)(v7 + 328) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v7 + 336) = swift_task_alloc();
  *(_QWORD *)(v7 + 344) = swift_task_alloc();
  *(_QWORD *)(v7 + 352) = swift_task_alloc();
  v13 = sub_22727D4E8();
  *(_QWORD *)(v7 + 360) = v13;
  *(_QWORD *)(v7 + 368) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v7 + 376) = swift_task_alloc();
  *(_QWORD *)(v7 + 384) = swift_task_alloc();
  *(_QWORD *)(v7 + 392) = swift_task_alloc();
  *(_QWORD *)(v7 + 400) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_227253374()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (qword_2558CB378 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 400);
  v2 = *(_QWORD *)(v0 + 360);
  v3 = *(_QWORD *)(v0 + 368);
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2558CC248);
  *(_QWORD *)(v0 + 408) = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 416) = v5;
  v5(v1, v4, v2);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v6 = sub_22727D4D0();
  v7 = sub_22727D794();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 400);
  v10 = *(_QWORD *)(v0 + 360);
  v11 = *(_QWORD *)(v0 + 368);
  if (v8)
  {
    v34 = *(_QWORD *)(v0 + 400);
    v35 = *(_QWORD *)(v0 + 360);
    v12 = *(_QWORD *)(v0 + 144);
    v31 = *(_BYTE *)(v0 + 89);
    v30 = *(_QWORD *)(v0 + 176);
    v13 = *(_QWORD *)(v0 + 152);
    v28 = *(_QWORD *)(v0 + 160);
    v29 = *(_QWORD *)(v0 + 168);
    v33 = *(_QWORD *)(v0 + 368);
    v14 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v36 = v32;
    *(_DWORD *)v14 = 136315650;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 104) = sub_2272403C4(v12, v13, &v36);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2080;
    *(_QWORD *)(v0 + 64) = v28;
    *(_QWORD *)(v0 + 72) = v29;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB9F0);
    v15 = sub_22727D590();
    *(_QWORD *)(v0 + 120) = sub_2272403C4(v15, v16, &v36);
    sub_22727D920();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 22) = 2080;
    *(_QWORD *)(v0 + 80) = v30;
    *(_BYTE *)(v0 + 88) = v31 & 1;
    __swift_instantiateConcreteTypeFromMangledName(qword_2558CBB68);
    v17 = sub_22727D590();
    *(_QWORD *)(v0 + 136) = sub_2272403C4(v17, v18, &v36);
    sub_22727D920();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v6, v7, "AppIntentInvoker#invokeSearchMusicAppIntent with criteria: %s, searchSource: %s, and mediaType: %s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v32, -1, -1);
    MEMORY[0x2276AF6D4](v14, -1, -1);

    v19 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v19(v34, v35);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    v19 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v19(v9, v10);
  }
  *(_QWORD *)(v0 + 424) = v19;
  v21 = *(_QWORD *)(v0 + 160);
  v20 = *(_QWORD *)(v0 + 168);
  v23 = *(_QWORD *)(v0 + 144);
  v22 = *(_QWORD *)(v0 + 152);
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB50);
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = sub_22727D32C();
  *(_QWORD *)(v0 + 432) = v24;
  *(_QWORD *)(v0 + 32) = v23;
  *(_QWORD *)(v0 + 40) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB58);
  swift_allocObject();
  v25 = sub_22727D32C();
  *(_QWORD *)(v0 + 440) = v25;
  *(_QWORD *)(v0 + 48) = v21;
  *(_QWORD *)(v0 + 56) = v20;
  sub_22727D338();
  v26 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 448) = v26;
  *v26 = v0;
  v26[1] = sub_227253760;
  return sub_227251FE8(*(_QWORD *)(v0 + 352), v25, v24);
}

uint64_t sub_227253760()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 456) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2272537C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;

  v1 = *(_QWORD *)(v0 + 352);
  v2 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 320);
  v4 = *(_QWORD *)(v0 + 328);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 416))(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 360));
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v5(v2, v1, v3);
  v6 = sub_22727D4D0();
  v7 = sub_22727D794();
  if (os_log_type_enabled(v6, v7))
  {
    v52 = *(_QWORD *)(v0 + 392);
    v54 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    v9 = *(_QWORD *)(v0 + 336);
    v8 = *(_QWORD *)(v0 + 344);
    v10 = *(_QWORD *)(v0 + 320);
    v50 = *(_QWORD *)(v0 + 328);
    v51 = *(_QWORD *)(v0 + 360);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v56 = v12;
    *(_DWORD *)v11 = 136315138;
    v5(v9, v8, v10);
    v13 = sub_22727D590();
    *(_QWORD *)(v0 + 96) = sub_2272403C4(v13, v14, &v56);
    sub_22727D920();
    swift_bridgeObjectRelease();
    v15 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
    v15(v8, v10);
    _os_log_impl(&dword_22723A000, v6, v7, "AppIntentInvoker#invokeSearchMusicAppIntent response: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v12, -1, -1);
    MEMORY[0x2276AF6D4](v11, -1, -1);

    v54(v52, v51);
  }
  else
  {
    v16 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    v17 = *(_QWORD *)(v0 + 392);
    v18 = *(_QWORD *)(v0 + 360);
    v15 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 328) + 8);
    v15(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 320));

    v16(v17, v18);
  }
  *(_QWORD *)(v0 + 464) = v15;
  v19 = *(_QWORD *)(v0 + 288);
  v20 = *(_QWORD *)(v0 + 296);
  v22 = *(_QWORD *)(v0 + 272);
  v21 = *(_QWORD *)(v0 + 280);
  v24 = *(_QWORD *)(v0 + 256);
  v23 = *(_QWORD *)(v0 + 264);
  sub_22727D2D8();
  sub_22727D320();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v24, 1, v19) == 1)
  {
    v25 = *(_QWORD *)(v0 + 256);
    v15(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 320));
    swift_release();
    swift_release();
    sub_2272544F0(v25);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v27 = *(_QWORD *)(v0 + 408);
    v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 416);
    v29 = *(_QWORD *)(v0 + 384);
    v30 = *(_QWORD *)(v0 + 360);
    v32 = *(_QWORD *)(v0 + 304);
    v31 = *(_QWORD *)(v0 + 312);
    v33 = *(_QWORD *)(v0 + 288);
    v34 = *(_QWORD *)(v0 + 296);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v34 + 32))(v31, *(_QWORD *)(v0 + 256), v33);
    v28(v29, v27, v30);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v32, v31, v33);
    v35 = sub_22727D4D0();
    v36 = sub_22727D794();
    v37 = os_log_type_enabled(v35, v36);
    v38 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    v39 = *(_QWORD *)(v0 + 384);
    v40 = *(_QWORD *)(v0 + 360);
    v42 = *(_QWORD *)(v0 + 296);
    v41 = *(_QWORD *)(v0 + 304);
    v43 = *(_QWORD *)(v0 + 288);
    if (v37)
    {
      v55 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
      v44 = (uint8_t *)swift_slowAlloc();
      v53 = v40;
      v45 = swift_slowAlloc();
      v56 = v45;
      *(_DWORD *)v44 = 136315138;
      sub_22723CA60(&qword_2558CBB40, (uint64_t (*)(uint64_t))MEMORY[0x24BE03F60], MEMORY[0x24BE03F70]);
      v46 = sub_22727DA04();
      *(_QWORD *)(v0 + 112) = sub_2272403C4(v46, v47, &v56);
      sub_22727D920();
      swift_bridgeObjectRelease();
      v48 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
      v48(v41, v43);
      _os_log_impl(&dword_22723A000, v35, v36, "AppIntentInvoker#invokeSearchMusicAppIntent calling showResultIntent: %s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v45, -1, -1);
      MEMORY[0x2276AF6D4](v44, -1, -1);

      v55(v39, v53);
    }
    else
    {
      v48 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
      v48(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 288));

      v38(v39, v40);
    }
    *(_QWORD *)(v0 + 472) = v48;
    swift_getObjectType();
    sub_22727D2F0();
    sub_22727D23C();
    swift_allocObject();
    *(_QWORD *)(v0 + 480) = sub_22727D230();
    v49 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 488) = v49;
    *v49 = v0;
    v49[1] = sub_227253D90;
    return sub_22727D2B4();
  }
}

uint64_t sub_227253D90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 200);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 208);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 192);
  *(_QWORD *)(*(_QWORD *)v1 + 496) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_227253E24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  NSObject *log;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;

  v2 = *(_QWORD *)(v0 + 240);
  v1 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 224);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 416))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 360));
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v5(v2, v1, v3);
  v6 = sub_22727D4D0();
  v7 = sub_22727D794();
  if (os_log_type_enabled(v6, v7))
  {
    v35 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
    v36 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
    v29 = *(_QWORD *)(v0 + 376);
    v30 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    v33 = *(_QWORD *)(v0 + 320);
    v34 = *(_QWORD *)(v0 + 352);
    v31 = *(_QWORD *)(v0 + 288);
    v32 = *(_QWORD *)(v0 + 312);
    v8 = *(_QWORD *)(v0 + 240);
    v27 = *(_QWORD *)(v0 + 248);
    v28 = *(_QWORD *)(v0 + 360);
    v9 = *(_QWORD *)(v0 + 232);
    v26 = *(_QWORD *)(v0 + 224);
    v10 = *(_QWORD *)(v0 + 216);
    v11 = (uint8_t *)swift_slowAlloc();
    log = v6;
    v12 = swift_slowAlloc();
    v37 = v12;
    *(_DWORD *)v11 = 136315138;
    v5(v9, v8, v10);
    v13 = sub_22727D590();
    *(_QWORD *)(v0 + 128) = sub_2272403C4(v13, v14, &v37);
    sub_22727D920();
    swift_bridgeObjectRelease();
    v15 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v15(v8, v10);
    _os_log_impl(&dword_22723A000, log, v7, "AppIntentInvoker#invokeSearchMusicAppIntent calling showResultIntentResponse: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v12, -1, -1);
    MEMORY[0x2276AF6D4](v11, -1, -1);
    swift_release();
    swift_release();

    v30(v29, v28);
    v15(v27, v10);
  }
  else
  {
    v35 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
    v36 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
    v16 = *(void (**)(uint64_t, uint64_t))(v0 + 424);
    v17 = *(_QWORD *)(v0 + 376);
    v18 = *(_QWORD *)(v0 + 360);
    v33 = *(_QWORD *)(v0 + 320);
    v34 = *(_QWORD *)(v0 + 352);
    v31 = *(_QWORD *)(v0 + 288);
    v32 = *(_QWORD *)(v0 + 312);
    v19 = *(_QWORD *)(v0 + 240);
    v20 = *(_QWORD *)(v0 + 248);
    v21 = *(_QWORD *)(v0 + 216);
    v22 = *(_QWORD *)(v0 + 224);
    swift_release();
    swift_release();

    v23 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v23(v19, v21);
    v16(v17, v18);
    v23(v20, v21);
  }
  v35(v32, v31);
  v36(v34, v33);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227254180()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22725428C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 464);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 472);
  v3 = *(_QWORD *)(v0 + 352);
  v5 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 320);
  v6 = *(_QWORD *)(v0 + 288);
  swift_release();
  swift_release();
  v1(v5, v6);
  v2(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AppIntentInvoker.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t AppIntentInvoker.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_227254400(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2272471E4;
  return AppIntentInvoker.invokeOpenMusicItemIntent(musicItemIdentifier:)(a1, a2);
}

uint64_t sub_227254460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  char v12;
  _QWORD *v13;

  v12 = a6 & 1;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_2272463F4;
  return AppIntentInvoker.invokeSearchMusicAppIntent(criteria:searchSource:mediaType:)(a1, a2, a3, a4, a5, v12);
}

uint64_t sub_2272544F0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBB10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for AppIntentInvoker()
{
  return objc_opt_self();
}

unint64_t sub_227254550()
{
  unint64_t result;

  result = qword_2558CBC40;
  if (!qword_2558CBC40)
  {
    result = MEMORY[0x2276AF644](&unk_22727E658, &type metadata for SearchMusicAppIntent);
    atomic_store(result, (unint64_t *)&qword_2558CBC40);
  }
  return result;
}

unint64_t sub_227254594()
{
  unint64_t result;

  result = qword_2558CBC48;
  if (!qword_2558CBC48)
  {
    result = MEMORY[0x2276AF644](&unk_22727E408, &type metadata for OpenMusicItemAppIntent);
    atomic_store(result, (unint64_t *)&qword_2558CBC48);
  }
  return result;
}

unint64_t sub_2272545D8()
{
  unint64_t result;

  result = qword_2558CBC50;
  if (!qword_2558CBC50)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558CBC50);
  }
  return result;
}

uint64_t sub_227254614@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unsigned int *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;

  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a1)
  {
    case 0:
      v8 = (unsigned int *)MEMORY[0x24BE91540];
      goto LABEL_11;
    case 1:
      v8 = (unsigned int *)MEMORY[0x24BE91528];
      goto LABEL_11;
    case 2:
      v8 = (unsigned int *)MEMORY[0x24BE91530];
      goto LABEL_11;
    case 3:
      v8 = (unsigned int *)MEMORY[0x24BE91538];
LABEL_11:
      v19 = *v8;
      v20 = sub_22727D0C8();
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(a2, v19, v20);
      break;
    default:
      if (qword_2558CB378 != -1)
        swift_once();
      v9 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
      v10 = sub_22727D4D0();
      v11 = sub_22727D788();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)swift_slowAlloc();
        v13 = swift_slowAlloc();
        v22 = a1;
        v23 = v13;
        *(_DWORD *)v12 = 136315138;
        v21[1] = v12 + 4;
        type metadata accessor for INPlaybackQueueLocation(0);
        v14 = sub_22727D590();
        v22 = sub_2272403C4(v14, v15, &v23);
        sub_22727D920();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22723A000, v10, v11, "Unknown INPlaybackQueueLocation: %s", v12, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v13, -1, -1);
        MEMORY[0x2276AF6D4](v12, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v16 = *MEMORY[0x24BE91520];
      v17 = sub_22727D0C8();
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(a2, v16, v17);
      break;
  }
  return result;
}

__n128 __swift_memcpy34_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioSuggestionsExecutionParameters(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 34))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 33);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSuggestionsExecutionParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_WORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 34) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 34) = 0;
    if (a2)
      *(_BYTE *)(result + 33) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestionsExecutionParameters()
{
  return &type metadata for AudioSuggestionsExecutionParameters;
}

unint64_t sub_22725496C()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  _BYTE v14[15];
  char v15;
  _BYTE v16[14];
  char v17;
  char v18;
  uint64_t v19;
  char v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBC58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22727EAA0;
  strcpy((char *)(inited + 32), "songIsDisliked");
  *(_BYTE *)(inited + 47) = -18;
  sub_227254D24(v0, (uint64_t)&v18, &qword_2558CBC60);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBC60);
  *(_QWORD *)(inited + 72) = v2;
  v3 = MEMORY[0x24BEE4AC0];
  v4 = sub_227254CC8(&qword_2558CBC68, &qword_2558CBC60, MEMORY[0x24BEE1348], MEMORY[0x24BEE4AC0]);
  *(_QWORD *)(inited + 80) = v4;
  v5 = MEMORY[0x24BEE4AA8];
  v6 = sub_227254CC8(&qword_2558CBC70, &qword_2558CBC60, MEMORY[0x24BEE1330], MEMORY[0x24BEE4AA8]);
  *(_QWORD *)(inited + 88) = v6;
  sub_227254D24((uint64_t)&v18, inited + 48, &qword_2558CBC60);
  *(_QWORD *)(inited + 96) = 0x694C7349676E6F73;
  *(_QWORD *)(inited + 104) = 0xEB0000000064656BLL;
  sub_227254D24(v0 + 1, (uint64_t)&v17, &qword_2558CBC60);
  *(_QWORD *)(inited + 136) = v2;
  *(_QWORD *)(inited + 144) = v4;
  *(_QWORD *)(inited + 152) = v6;
  sub_227254D24((uint64_t)&v17, inited + 112, &qword_2558CBC60);
  strcpy((char *)(inited + 160), "mediaItemType");
  *(_WORD *)(inited + 174) = -4864;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBC78);
  *(_QWORD *)(inited + 200) = v7;
  v8 = sub_227254CC8(&qword_2558CBC80, &qword_2558CBC78, MEMORY[0x24BEE1798], v3);
  *(_QWORD *)(inited + 208) = v8;
  v9 = sub_227254CC8(&qword_2558CBC88, &qword_2558CBC78, MEMORY[0x24BEE1770], v5);
  *(_QWORD *)(inited + 216) = v9;
  sub_227254D24(v0 + 8, (uint64_t)v16, qword_2558CBB68);
  sub_227254D24((uint64_t)v16, (uint64_t)&v19, qword_2558CBB68);
  v10 = v20;
  v11 = v19;
  if (v20)
    v11 = 0;
  *(_QWORD *)(inited + 176) = v11;
  *(_BYTE *)(inited + 184) = v10;
  *(_QWORD *)(inited + 224) = 0xD000000000000016;
  *(_QWORD *)(inited + 232) = 0x800000022727FC30;
  sub_227254D24(v0 + 17, (uint64_t)&v15, &qword_2558CBC60);
  *(_QWORD *)(inited + 264) = v2;
  *(_QWORD *)(inited + 272) = v4;
  *(_QWORD *)(inited + 280) = v6;
  sub_227254D24((uint64_t)&v15, inited + 240, &qword_2558CBC60);
  *(_QWORD *)(inited + 288) = 0x6E654C6575657571;
  *(_QWORD *)(inited + 296) = 0xEB00000000687467;
  sub_227254D24(v0 + 24, (uint64_t)v14, &qword_2558CBC78);
  *(_QWORD *)(inited + 328) = v7;
  *(_QWORD *)(inited + 336) = v8;
  *(_QWORD *)(inited + 344) = v9;
  sub_227254D24((uint64_t)v14, inited + 304, &qword_2558CBC78);
  *(_QWORD *)(inited + 352) = 0xD000000000000016;
  *(_QWORD *)(inited + 360) = 0x800000022727FC50;
  v12 = *(_BYTE *)(v0 + 33);
  *(_QWORD *)(inited + 392) = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 400) = MEMORY[0x24BEE1348];
  *(_QWORD *)(inited + 408) = MEMORY[0x24BEE1330];
  *(_BYTE *)(inited + 368) = v12;
  return sub_2272487DC(inited);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2276AF638](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_227254CC8(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3;
    result = MEMORY[0x2276AF644](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_227254D24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id INAddMediaIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id INAddMediaIntentHandler.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  char *v22;
  objc_class *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  id v34;
  uint64_t v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48[6];

  v0 = sub_22727D074();
  v43 = *(_QWORD *)(v0 - 8);
  v44 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v42 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v36 - v3;
  v5 = sub_22727CF3C();
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v36 - v9;
  v11 = sub_22727CDBC();
  v39 = *(_QWORD *)(v11 - 8);
  v12 = v39;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v36 - v16;
  v18 = objc_msgSend((id)objc_opt_self(), sel_defaultMediaLibrary);
  v48[3] = sub_22727D134();
  v48[4] = MEMORY[0x24BE915B0];
  __swift_allocate_boxed_opaque_existential_1(v48);
  sub_22727D128();
  v19 = sub_22727D1F4();
  swift_allocObject();
  v20 = sub_22727D1E8();
  *((_QWORD *)&v46 + 1) = v19;
  v47 = MEMORY[0x24BE91690];
  *(_QWORD *)&v45 = v20;
  v21 = objc_msgSend((id)objc_opt_self(), sel_systemMusicPlayer);
  v38 = v17;
  sub_22727CDB0();
  sub_22727CF30();
  v22 = v4;
  sub_22727D068();
  sub_22727CAD4();
  v23 = (objc_class *)type metadata accessor for INAddMediaIntentHandler();
  v45 = 0u;
  v46 = 0u;
  v47 = 0;
  v37 = objc_allocWithZone(v23);
  v24 = v11;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  v26 = v40;
  v25 = v41;
  v27 = (uint64_t)v8;
  v28 = v10;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v8, v10, v41);
  v30 = (uint64_t)v42;
  v29 = v43;
  v31 = v22;
  v32 = v22;
  v33 = v44;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v42, v31, v44);
  v34 = sub_22725D29C((uint64_t)v15, v27, v30, (uint64_t)v48, (uint64_t)&v45, v37);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v32, v33);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v24);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v34;
}

uint64_t sub_2272550DC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t);

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = a3[3];
  v8 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v7);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_227263354;
  *(_QWORD *)(v9 + 24) = v6;
  v10 = *(void (**)(uint64_t (*)(uint64_t, void *), uint64_t, uint64_t, uint64_t))(v8 + 8);
  swift_retain();
  v10(sub_227263650, v9, v7, v8);
  return swift_release();
}

uint64_t sub_227255190(uint64_t a1, void *a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  _QWORD v26[2];
  uint64_t (*v27)(_QWORD);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v8 = sub_22727D4E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
    v13 = a2;
    v14 = a2;
    v15 = sub_22727D4D0();
    v16 = sub_22727D788();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v27 = a3;
      v18 = (uint8_t *)v17;
      v19 = swift_slowAlloc();
      v30 = v19;
      v26[1] = a4;
      *(_DWORD *)v18 = 136446210;
      v26[0] = v18 + 4;
      swift_getErrorValue();
      v28 = sub_22727DA34();
      v29 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB9F0);
      v21 = sub_22727D590();
      v28 = sub_2272403C4(v21, v22, &v30);
      sub_22727D920();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22723A000, v15, v16, "INAddMediaIntentHandler#init Unexpected error initializing podcasts controller: %{public}s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v19, -1, -1);
      v23 = v18;
      a3 = v27;
      MEMORY[0x2276AF6D4](v23, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v24 = 0;
  }
  else
  {
    v24 = a1;
  }
  return a3(v24);
}

uint64_t INAddMediaIntentHandler.resolveMediaItems(for:with:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void *v21[2];

  v21[0] = a1;
  v5 = sub_22727D4C4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  v13 = qword_2558CB390;
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = (id)logObject;
  sub_22727D4AC();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  v15 = (*(unsigned __int8 *)(v6 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v16 = (v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = "addMediaIntentHandlerResolveMediaItems";
  *(_QWORD *)(v17 + 24) = 38;
  *(_BYTE *)(v17 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v15, v9, v5);
  v18 = (_QWORD *)(v17 + v16);
  *v18 = sub_22725D528;
  v18[1] = v12;
  swift_retain();
  sub_22727D8D8();
  sub_22727D4A0();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = sub_22725D60C;
  *(_QWORD *)(v19 + 24) = v17;
  swift_retain();
  sub_227255610((uint64_t)sub_22725D668, v19, v21[0], v21[1]);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return swift_release();
}

uint64_t sub_227255610(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
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
  void (*v20)(char *);
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint8_t *v25;
  NSObject *v26;
  _QWORD *v27;
  uint8_t *v28;
  char *v29;
  void (*v30)(char *, uint64_t);
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  void (*v39)(char *);
  uint8_t *v40;
  uint8_t *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  _QWORD *v45;
  NSObject *v46;
  id v47;
  void *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  id v52;
  _QWORD *v54;
  uint64_t v55;
  void (*v56)(char *);
  void *v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  NSObject *v63;

  v8 = sub_22727D4E8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v59 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v58 = (char *)&v54 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v60 = (char *)&v54 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v62 = (char *)&v54 - v16;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  v18 = qword_2558CB378;
  swift_retain();
  if (v18 != -1)
    swift_once();
  v19 = __swift_project_value_buffer(v8, (uint64_t)qword_2558CC248);
  v20 = *(void (**)(char *))(v9 + 16);
  v61 = v19;
  v20(v62);
  v21 = a3;
  v22 = sub_22727D4D0();
  v23 = sub_22727D77C();
  if (os_log_type_enabled(v22, v23))
  {
    v56 = v20;
    v24 = swift_slowAlloc();
    v57 = a4;
    v25 = (uint8_t *)v24;
    v54 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v25 = 138412290;
    v55 = v17;
    v63 = v21;
    v26 = v21;
    v17 = v55;
    sub_22727D920();
    v27 = v54;
    *v54 = v21;

    v20 = v56;
    _os_log_impl(&dword_22723A000, v22, v23, "INAddMediaIntentHandler#resolveMediaItems for intent: %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v27, -1, -1);
    v28 = v25;
    a4 = v57;
    MEMORY[0x2276AF6D4](v28, -1, -1);
  }
  else
  {

    v22 = v21;
  }
  v29 = v60;

  v30 = *(void (**)(char *, uint64_t))(v9 + 8);
  v30(v62, v8);
  v31 = -[NSObject backingStore](v21, sel_backingStore);
  objc_opt_self();
  v32 = (void *)swift_dynamicCastObjCClass();
  if (!v32)

  v33 = objc_msgSend(v32, sel_mediaDestination);
  v34 = -[NSObject mediaSearch](v21, sel_mediaSearch);
  if (v34 && (v35 = v34, v36 = objc_msgSend(v34, sel_reference), v35, v36 == (id)1))
  {
    ((void (*)(char *, uint64_t, uint64_t))v20)(v58, v61, v8);
    v37 = sub_22727D4D0();
    v38 = sub_22727D77C();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = v20;
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_22723A000, v37, v38, "INAddMediaIntentHandler#resolveMediaItems referring to currently playing...", v40, 2u);
      v41 = v40;
      v20 = v39;
      MEMORY[0x2276AF6D4](v41, -1, -1);
    }

    v30(v58, v8);
    ((void (*)(char *, uint64_t, uint64_t))v20)(v59, v61, v8);
    v42 = sub_22727D4D0();
    v43 = sub_22727D77C();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_22723A000, v42, v43, "INAddMediaIntentHandler#resolveMediaItems trying to resolve from audioSearchResults first...", v44, 2u);
      MEMORY[0x2276AF6D4](v44, -1, -1);
    }

    v30(v59, v8);
    v45 = (_QWORD *)swift_allocObject();
    v45[2] = a4;
    v45[3] = v21;
    v45[4] = sub_227263354;
    v45[5] = v17;
    v46 = v21;
    v47 = a4;
    v48 = sub_2272633E0;
  }
  else
  {
    ((void (*)(char *, uint64_t, uint64_t))v20)(v29, v61, v8);
    v49 = sub_22727D4D0();
    v50 = sub_22727D77C();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_22723A000, v49, v50, "INAddMediaIntentHandler#resolveMediaItems from search result...", v51, 2u);
      MEMORY[0x2276AF6D4](v51, -1, -1);
    }

    v30(v29, v8);
    v45 = (_QWORD *)swift_allocObject();
    v45[2] = a4;
    v45[3] = v21;
    v45[4] = sub_227263354;
    v45[5] = v17;
    v46 = v21;
    v52 = a4;
    v48 = sub_2272633C0;
  }
  sub_227260284(v46, v33, (uint64_t)v48, (uint64_t)v45);

  return swift_release();
}

uint64_t sub_227255BA0(void *a1, char a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint8_t *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  os_log_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint8_t *v44;
  _QWORD *v45;
  id v46;
  id v47;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];
  uint8_t *v52;
  int v53;
  uint64_t v54;
  os_log_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;

  v12 = sub_22727D4E8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v51 - v17;
  if ((a2 & 1) != 0)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v39 = __swift_project_value_buffer(v12, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v39, v12);
    v40 = sub_22727D4D0();
    v41 = sub_22727D77C();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = a5;
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_22723A000, v40, v41, "INAddMediaIntentHandler#resolveMediaItems from now playing", v43, 2u);
      v44 = v43;
      a5 = v42;
      MEMORY[0x2276AF6D4](v44, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    v45 = (_QWORD *)swift_allocObject();
    v45[2] = a3;
    v45[3] = a4;
    v45[4] = a5;
    v45[5] = a6;
    v46 = a3;
    v47 = a4;
    swift_retain();
    sub_227259A88(v47, (uint64_t)sub_22726342C, (uint64_t)v45);
    return swift_release();
  }
  else
  {
    v58 = a1;
    v59 = a3;
    v19 = qword_2558CB378;
    v20 = a1;
    if (v19 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v12, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v21, v12);
    v22 = v20;
    v23 = sub_22727D4D0();
    v24 = sub_22727D77C();
    v25 = v24;
    if (os_log_type_enabled(v23, v24))
    {
      v55 = v23;
      v26 = swift_slowAlloc();
      v53 = v25;
      v27 = (uint8_t *)v26;
      v54 = swift_slowAlloc();
      v61 = v54;
      v57 = a4;
      *(_DWORD *)v27 = 136315138;
      v51[1] = v27 + 4;
      v52 = v27;
      v28 = v22;
      v56 = a5;
      v29 = v28;
      v30 = v22;
      v31 = a6;
      v32 = objc_msgSend(v28, sel_description);
      v33 = sub_22727D584();
      v35 = v34;

      a6 = v31;
      v22 = v30;
      v60 = sub_2272403C4(v33, v35, &v61);
      a4 = v57;
      sub_22727D920();

      a5 = v56;
      swift_bridgeObjectRelease();
      v36 = v55;
      v37 = v52;
      _os_log_impl(&dword_22723A000, v55, (os_log_type_t)v53, "INAddMediaIntentHandler#resolveMediaItems resolved item from audioSearch results item %s", v52, 0xCu);
      v38 = v54;
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v38, -1, -1);
      MEMORY[0x2276AF6D4](v37, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    v49 = swift_allocObject();
    *(_QWORD *)(v49 + 16) = a5;
    *(_QWORD *)(v49 + 24) = a6;
    MEMORY[0x24BDAC7A8](v49);
    v51[-4] = v58;
    LOBYTE(v51[-3]) = 0;
    v50 = v59;
    v51[-2] = a4;
    v51[-1] = v50;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBD90);
    sub_22727CBC4();

    return swift_release();
  }
}

uint64_t sub_227256010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a5;
  *(_QWORD *)(v8 + 24) = a6;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBD90);
  sub_22727CBC4();
  return swift_release();
}

void sub_227256100(uint64_t a1, uint64_t a2)
{
  id v3;

  sub_227247C88(0, &qword_2558CBD68);
  v3 = (id)sub_22727D620();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

uint64_t INAddMediaIntentHandler.resolveMediaDestination(for:with:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v20[2];

  v20[0] = a1;
  v5 = sub_22727D4C4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v20 - v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  v13 = qword_2558CB390;
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = (id)logObject;
  sub_22727D4AC();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  v15 = (*(unsigned __int8 *)(v6 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v16 = (v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = "addMediaIntentHandlerResolveMediaDestination";
  *(_QWORD *)(v17 + 24) = 44;
  *(_BYTE *)(v17 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v15, v9, v5);
  v18 = (_QWORD *)(v17 + v16);
  *v18 = sub_227263658;
  v18[1] = v12;
  swift_retain();
  sub_22727D8D8();
  sub_22727D4A0();
  swift_retain();
  sub_227260474(v20[0], (uint64_t)v20[1], (void (*)(_QWORD *))sub_22725D764, v17);
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return swift_release();
}

void sub_227256354(void *a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *ObjCClassFromMetadata;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  void (*v32)(_QWORD);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v33 = a2;
  v9 = sub_22727D524();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (_QWORD *)((char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = sub_22727D4E8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 && (v17 = objc_msgSend(a1, sel_name)) != 0)
  {
    v18 = v17;
    v19 = sub_22727D584();
    v21 = v20;

    sub_227247C88(0, &qword_2558CBD88);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    *v12 = v19;
    v12[1] = v21;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BEE5AA0], v9);
    v23 = (void *)sub_22727D50C();
    (*(void (**)(uint64_t *, uint64_t))(v10 + 8))(v12, v9);
    v24 = objc_msgSend(ObjCClassFromMetadata, sel_successWithResolvedMediaDestination_, v23);

  }
  else
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v13, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v25, v13);
    swift_bridgeObjectRetain_n();
    v26 = sub_22727D4D0();
    v27 = sub_22727D788();
    if (os_log_type_enabled(v26, v27))
    {
      v32 = a4;
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v31[1] = a5;
      v30 = v29;
      v35 = v29;
      *(_DWORD *)v28 = 136315138;
      swift_bridgeObjectRetain();
      v34 = sub_2272403C4(v33, a3, &v35);
      a4 = v32;
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22723A000, v26, v27, "INAddMediaIntentHandler#resolveMediaDestination didn't find playlist in library: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v30, -1, -1);
      MEMORY[0x2276AF6D4](v28, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    v24 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 1);
  }
  a4(v24);

}

uint64_t INAddMediaIntentHandler.handle(intent:completion:)(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  NSObject *v20[2];

  v20[0] = a1;
  v5 = sub_22727D4C4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v20 - v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  v13 = qword_2558CB390;
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = (id)logObject;
  sub_22727D4AC();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  v15 = (*(unsigned __int8 *)(v6 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v16 = (v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = "addMediaIntentHandlerHandle";
  *(_QWORD *)(v17 + 24) = 27;
  *(_BYTE *)(v17 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v15, v9, v5);
  v18 = (_QWORD *)(v17 + v16);
  *v18 = sub_227263658;
  v18[1] = v12;
  swift_retain();
  sub_22727D8D8();
  sub_22727D4A0();
  swift_retain();
  sub_227260EBC(v20[0], (char *)v20[1], (void (*)(NSObject **))sub_22725D764, v17);
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return swift_release();
}

void sub_22725689C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];

  v5 = *a1;
  if (v5)
  {
    v10 = objc_msgSend(v5, sel_subscriptionController);
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a4;
    *(_QWORD *)(v11 + 24) = a5;
    v13[4] = sub_227263334;
    v13[5] = v11;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 1107296256;
    v13[2] = sub_227256F18;
    v13[3] = &block_descriptor_0;
    v12 = _Block_copy(v13);
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_subscribeToStoreId_siriContext_completion_, a2, a3, v12);
    swift_unknownObjectRelease();
    _Block_release(v12);
  }
}

void sub_227256998(uint64_t a1, void (*a2)(void *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  void *v41;
  void *v42;
  uint64_t v43;

  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v43 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v43 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v43 - v15;
  if (a1 == 3)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v25, v4);
    v26 = sub_22727D4D0();
    v27 = sub_22727D788();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_22723A000, v26, v27, "INAddMediaIntentHandler#handle not authorized to subscribe", v28, 2u);
      MEMORY[0x2276AF6D4](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    v29 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    goto LABEL_24;
  }
  if (a1 != 1)
  {
    if (!a1)
    {
      if (qword_2558CB378 != -1)
        swift_once();
      v17 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v16, v17, v4);
      v18 = sub_22727D4D0();
      v19 = sub_22727D77C();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_22723A000, v18, v19, "INAddMediaIntentHandler#handle successfully subscribed to the podcast", v20, 2u);
        MEMORY[0x2276AF6D4](v20, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
      v21 = objc_allocWithZone(MEMORY[0x24BDD1960]);
      v22 = (void *)sub_22727D578();
      v23 = objc_msgSend(v21, sel_initWithActivityType_, v22);

      v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 3, v23);
      goto LABEL_25;
    }
    if (qword_2558CB378 != -1)
      swift_once();
    v37 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v37, v4);
    v38 = sub_22727D4D0();
    v39 = sub_22727D788();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_22723A000, v38, v39, "INAddMediaIntentHandler#handle failed to subscribe to the podcast", v40, 2u);
      MEMORY[0x2276AF6D4](v40, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v29 = objc_allocWithZone(MEMORY[0x24BDD1960]);
LABEL_24:
    v41 = (void *)sub_22727D578();
    v23 = objc_msgSend(v29, sel_initWithActivityType_, v41);

    v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 5, v23);
    goto LABEL_25;
  }
  if (qword_2558CB378 != -1)
    swift_once();
  v30 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v14, v30, v4);
  v31 = sub_22727D4D0();
  v32 = sub_22727D788();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_22723A000, v31, v32, "INAddMediaIntentHandler#handle already subscribed to the podcast", v33, 2u);
    MEMORY[0x2276AF6D4](v33, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
  v34 = *MEMORY[0x24BDDA390];
  v35 = objc_allocWithZone(MEMORY[0x24BDD1960]);
  v36 = (void *)sub_22727D578();
  v23 = objc_msgSend(v35, sel_initWithActivityType_, v36);

  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, v34, v23);
LABEL_25:
  v42 = v24;

  a2(v42);
}

uint64_t sub_227256F18(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_227256F54(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void *), uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  uint8_t *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  unint64_t v41;
  os_log_t v42;
  uint64_t v43;
  char *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  os_log_t v49;
  int v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(void *);
  uint64_t v60;
  uint64_t v61[3];
  uint64_t v62;

  v58 = a7;
  v59 = a6;
  v55 = a5;
  v56 = a3;
  v57 = a4;
  v51 = a2;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBD80);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v48 - v12;
  v14 = sub_22727CC6C();
  v53 = *(_QWORD *)(v14 - 8);
  v54 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v52 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22727D4E8();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v48 - v21;
  v23 = sub_22727D194();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
  if (v25((char *)a1, 1, v23) == 1)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v26 = __swift_project_value_buffer(v16, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v22, v26, v16);
    v27 = sub_22727D4D0();
    v28 = sub_22727D77C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_22723A000, v27, v28, "INAddMediaIntentHandler#handle successfully added item into library", v29, 2u);
      MEMORY[0x2276AF6D4](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
    sub_2272471A0(v57 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider, (uint64_t)v61, (uint64_t *)&unk_2558CBD70);
    if (v62)
    {
      __swift_project_boxed_opaque_existential_1(v61, v62);
      v30 = v52;
      sub_22727CC78();
      sub_22727CC48();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v30, v54);
      sub_22727D08C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v61);
    }
    else
    {
      sub_227246BC0((uint64_t)v61, (uint64_t *)&unk_2558CBD70);
    }
    v37 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v38 = (void *)sub_22727D578();
    v39 = objc_msgSend(v37, sel_initWithActivityType_, v38);

    v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 3, v39);
  }
  else
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v31 = __swift_project_value_buffer(v16, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v31, v16);
    sub_2272471A0(a1, (uint64_t)v13, &qword_2558CBD80);
    swift_bridgeObjectRetain_n();
    v32 = sub_22727D4D0();
    v50 = sub_22727D788();
    if (os_log_type_enabled(v32, (os_log_type_t)v50))
    {
      v49 = v32;
      v33 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v61[0] = v48;
      *(_DWORD *)v33 = 136315138;
      sub_2272471A0((uint64_t)v13, (uint64_t)v11, &qword_2558CBD80);
      if (v25(v11, 1, v23) == 1)
      {
        sub_227246BC0((uint64_t)v11, &qword_2558CBD80);
        v34 = v56;
        swift_bridgeObjectRetain();
        v35 = v34;
        v36 = v51;
      }
      else
      {
        v36 = sub_22727D188();
        v35 = v41;
        (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v23);
      }
      v60 = sub_2272403C4(v36, v35, v61);
      sub_22727D920();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_227246BC0((uint64_t)v13, &qword_2558CBD80);
      swift_bridgeObjectRelease();
      v42 = v49;
      _os_log_impl(&dword_22723A000, v49, (os_log_type_t)v50, "INAddMediaIntentHandler#handle failed to added item into library, %s", v33, 0xCu);
      v43 = v48;
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v43, -1, -1);
      MEMORY[0x2276AF6D4](v33, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease();
      sub_227246BC0((uint64_t)v13, &qword_2558CBD80);

      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
    sub_2272471A0(v57 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider, (uint64_t)v61, (uint64_t *)&unk_2558CBD70);
    if (v62)
    {
      __swift_project_boxed_opaque_existential_1(v61, v62);
      v44 = v52;
      sub_22727CC78();
      sub_22727CC48();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v44, v54);
      sub_22727D08C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v61);
    }
    else
    {
      sub_227246BC0((uint64_t)v61, (uint64_t *)&unk_2558CBD70);
    }
    v45 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v46 = (void *)sub_22727D578();
    v39 = objc_msgSend(v45, sel_initWithActivityType_, v46);

    v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 5, v39);
  }
  v47 = v40;

  v59(v47);
}

void sub_227257604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(void *), uint64_t a11)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  unint64_t v53;
  char *v54;
  os_log_t v55;
  uint64_t v56;
  char *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  os_log_t v63;
  int v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void (*v77)(void *);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81[3];
  uint64_t v82;

  v75 = a7;
  v76 = a8;
  v67 = a4;
  v68 = a5;
  v73 = a1;
  v74 = a2;
  v77 = a10;
  v78 = a11;
  v72 = a9;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBD80);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v61 - v17;
  v19 = sub_22727CC6C();
  v70 = *(_QWORD *)(v19 - 8);
  v71 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v69 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_22727D4E8();
  v79 = *(_QWORD *)(v21 - 8);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v61 - v25;
  v27 = sub_22727D194();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  if (v29((char *)a3, 1, v27) == 1)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v30 = __swift_project_value_buffer(v21, (uint64_t)qword_2558CC248);
    v31 = v79;
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v26, v30, v21);
    v32 = sub_22727D4D0();
    v33 = sub_22727D77C();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_22723A000, v32, v33, "INAddMediaIntentHandler#handle successfully added item into playlist", v34, 2u);
      MEMORY[0x2276AF6D4](v34, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v21);
    sub_2272471A0(v76 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider, (uint64_t)v81, (uint64_t *)&unk_2558CBD70);
    if (v82)
    {
      __swift_project_boxed_opaque_existential_1(v81, v82);
      v35 = v69;
      sub_22727CC78();
      sub_22727CC48();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v35, v71);
      sub_22727D08C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v81);
    }
    else
    {
      sub_227246BC0((uint64_t)v81, (uint64_t *)&unk_2558CBD70);
    }
    v49 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v50 = (void *)sub_22727D578();
    v51 = objc_msgSend(v49, sel_initWithActivityType_, v50);

    v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 3, v51);
  }
  else
  {
    v65 = a6;
    if (qword_2558CB378 != -1)
      swift_once();
    v36 = __swift_project_value_buffer(v21, (uint64_t)qword_2558CC248);
    v37 = v79;
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v24, v36, v21);
    sub_2272471A0(a3, (uint64_t)v18, &qword_2558CBD80);
    v38 = v24;
    v39 = v68;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v40 = sub_22727D4D0();
    v66 = v18;
    v41 = v40;
    v64 = sub_22727D788();
    if (os_log_type_enabled(v41, (os_log_type_t)v64))
    {
      v63 = v41;
      v42 = v38;
      v43 = swift_slowAlloc();
      v62 = swift_slowAlloc();
      v81[0] = v62;
      *(_DWORD *)v43 = 136315394;
      swift_bridgeObjectRetain();
      v80 = sub_2272403C4(v67, v39, v81);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v43 + 12) = 2080;
      v44 = (uint64_t)v66;
      sub_2272471A0((uint64_t)v66, (uint64_t)v16, &qword_2558CBD80);
      v45 = v29(v16, 1, v27);
      v46 = v65;
      if (v45 == 1)
      {
        sub_227246BC0((uint64_t)v16, &qword_2558CBD80);
        v47 = v75;
        swift_bridgeObjectRetain();
        v48 = v47;
      }
      else
      {
        v46 = sub_22727D188();
        v48 = v53;
        (*(void (**)(char *, uint64_t))(v28 + 8))(v16, v27);
      }
      v54 = v42;
      v80 = sub_2272403C4(v46, v48, v81);
      sub_22727D920();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_227246BC0(v44, &qword_2558CBD80);
      swift_bridgeObjectRelease();
      v55 = v63;
      _os_log_impl(&dword_22723A000, v63, (os_log_type_t)v64, "INAddMediaIntentHandler#handle failed to added item into playlist %s, %s", (uint8_t *)v43, 0x16u);
      v56 = v62;
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v56, -1, -1);
      MEMORY[0x2276AF6D4](v43, -1, -1);

      (*(void (**)(char *, uint64_t))(v79 + 8))(v54, v21);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      sub_227246BC0((uint64_t)v66, &qword_2558CBD80);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v21);
    }
    sub_2272471A0(v76 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider, (uint64_t)v81, (uint64_t *)&unk_2558CBD70);
    if (v82)
    {
      __swift_project_boxed_opaque_existential_1(v81, v82);
      v57 = v69;
      sub_22727CC78();
      sub_22727CC48();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v57, v71);
      sub_22727D08C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v81);
    }
    else
    {
      sub_227246BC0((uint64_t)v81, (uint64_t *)&unk_2558CBD70);
    }
    v58 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v59 = (void *)sub_22727D578();
    v51 = objc_msgSend(v58, sel_initWithActivityType_, v59);

    v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 5, v51);
  }
  v60 = v52;

  v77(v60);
}

void sub_227257D6C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, void (*a6)(void *), uint64_t a7, char *a8, uint64_t a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  NSObject *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  os_log_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  os_log_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  uint64_t v59;
  void (*v60)(void *);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v57 = a8;
  v58 = a5;
  v59 = a7;
  v60 = a6;
  v56 = a4;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBD80);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v50 - v16;
  v18 = sub_22727D4E8();
  v61 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v50 - v22;
  v24 = sub_22727D194();
  v55 = *(_QWORD *)(v24 - 8);
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48);
  if (v25((char *)a1, 1, v24) == 1)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v26 = __swift_project_value_buffer(v18, (uint64_t)qword_2558CC248);
    v27 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v23, v26, v18);
    v28 = sub_22727D4D0();
    v29 = sub_22727D77C();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_22723A000, v28, v29, "INAddMediaIntentHandler#handle successfully added item into playlist", v30, 2u);
      MEMORY[0x2276AF6D4](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v23, v18);
    v31 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v32 = (void *)sub_22727D578();
    v33 = objc_msgSend(v31, sel_initWithActivityType_, v32);

    v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 3, v33);
  }
  else
  {
    v57 = v21;
    v53 = a2;
    v54 = a9;
    if (qword_2558CB378 != -1)
      swift_once();
    v35 = __swift_project_value_buffer(v18, (uint64_t)qword_2558CC248);
    v36 = v61;
    v37 = v57;
    (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v57, v35, v18);
    sub_2272471A0(a1, (uint64_t)v17, &qword_2558CBD80);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v38 = sub_22727D4D0();
    v52 = sub_22727D788();
    if (os_log_type_enabled(v38, (os_log_type_t)v52))
    {
      v51 = v38;
      v39 = swift_slowAlloc();
      v50 = swift_slowAlloc();
      v63 = v50;
      *(_DWORD *)v39 = 136315394;
      swift_bridgeObjectRetain();
      v62 = sub_2272403C4(v53, a3, &v63);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v39 + 12) = 2080;
      sub_2272471A0((uint64_t)v17, (uint64_t)v15, &qword_2558CBD80);
      if (v25(v15, 1, v24) == 1)
      {
        sub_227246BC0((uint64_t)v15, &qword_2558CBD80);
        v40 = v58;
        swift_bridgeObjectRetain();
        v41 = v40;
        v43 = v56;
        v42 = v57;
      }
      else
      {
        v43 = sub_22727D188();
        v41 = v44;
        (*(void (**)(char *, uint64_t))(v55 + 8))(v15, v24);
        v42 = v57;
      }
      v62 = sub_2272403C4(v43, v41, &v63);
      sub_22727D920();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_227246BC0((uint64_t)v17, &qword_2558CBD80);
      swift_bridgeObjectRelease();
      v45 = v51;
      _os_log_impl(&dword_22723A000, v51, (os_log_type_t)v52, "INAddMediaIntentHandler#handle failed to added item into playlist %s, %s", (uint8_t *)v39, 0x16u);
      v46 = v50;
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v46, -1, -1);
      MEMORY[0x2276AF6D4](v39, -1, -1);

      (*(void (**)(char *, uint64_t))(v61 + 8))(v42, v18);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      sub_227246BC0((uint64_t)v17, &qword_2558CBD80);

      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v18);
    }
    v47 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v48 = (void *)sub_22727D578();
    v33 = objc_msgSend(v47, sel_initWithActivityType_, v48);

    v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 5, v33);
  }
  v49 = v34;

  v60(v49);
}

uint64_t sub_22725830C(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v11 = _Block_copy(aBlock);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = a3;
  v14 = a1;
  a7(v13, a6, v12);

  return swift_release();
}

void sub_22725839C(void (*a1)(id *), uint64_t a2, _QWORD *a3, char a4, void *a5, char *a6)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  _QWORD *v49;
  NSObject *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  _QWORD *v60;
  NSObject *v61;
  id v62;
  void *v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  void (*v66)(char *, _QWORD, uint64_t);
  char v67;
  void (*v68)(id *);
  uint64_t v69;
  id v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t);
  char *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  id v79;
  void *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  void *v92;
  _QWORD *v93;
  NSObject *v94;
  uint8_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  NSObject *v100;
  NSObject *v101;
  os_log_type_t v102;
  uint8_t *v103;
  uint64_t v104;
  _QWORD *v105;
  NSObject *v106;
  char *v107;
  uint64_t v108;
  _QWORD *v109;
  id v110;
  NSObject *v111;
  id v112;
  char *v113;
  void (*v114)(id *);
  id v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  char *v122;
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  _QWORD *v131;
  char *v132;
  char *v133;
  id v134;
  uint64_t v135;
  void (*v136)(id *);
  uint64_t v137;
  uint64_t v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  uint64_t v144;

  v132 = a6;
  v134 = a5;
  v10 = sub_22727D524();
  v125 = *(_QWORD *)(v10 - 8);
  v126 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v123 = (char *)&v117 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v124 = (char *)&v117 - v13;
  v128 = sub_22727CC90();
  v131 = *(_QWORD **)(v128 - 8);
  v14 = MEMORY[0x24BDAC7A8](v128);
  v121 = (char *)&v117 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v122 = (char *)&v117 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v130 = (char *)&v117 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v117 - v20;
  v129 = sub_22727CC6C();
  v22 = *(_QWORD *)(v129 - 8);
  v23 = MEMORY[0x24BDAC7A8](v129);
  v120 = (char *)&v117 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v117 - v25;
  v27 = sub_22727D4E8();
  v28 = *(_QWORD *)(v27 - 8);
  v137 = v27;
  v138 = v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v117 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = MEMORY[0x24BDAC7A8](v29);
  v133 = (char *)&v117 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v127 = (char *)&v117 - v35;
  MEMORY[0x24BDAC7A8](v34);
  v37 = (char *)&v117 - v36;
  v38 = swift_allocObject();
  v135 = a2;
  v136 = a1;
  *(_QWORD *)(v38 + 16) = a1;
  *(_QWORD *)(v38 + 24) = a2;
  swift_retain();
  if ((a4 & 1) != 0)
  {
    swift_release();
    v51 = qword_2558CB378;
    v131 = a3;
    v52 = a3;
    if (v51 != -1)
      swift_once();
    v53 = v137;
    v54 = __swift_project_value_buffer(v137, (uint64_t)qword_2558CC248);
    v55 = v138;
    (*(void (**)(char *, uint64_t, uint64_t))(v138 + 16))(v37, v54, v53);
    v56 = v52;
    v57 = sub_22727D4D0();
    v58 = sub_22727D788();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      v60 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v59 = 138543362;
      v139 = v56;
      v61 = v56;
      v53 = v137;
      sub_22727D920();
      *v60 = v131;

      v55 = v138;
      _os_log_impl(&dword_22723A000, v57, v58, "INAddMediaIntentHandlerresolveMediaItem received failure result: %{public}@", v59, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v60, -1, -1);
      MEMORY[0x2276AF6D4](v59, -1, -1);
    }
    else
    {

      v57 = v56;
    }
    v68 = v136;

    (*(void (**)(char *, uint64_t))(v55 + 8))(v37, v53);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v69 = swift_allocObject();
    *(_OWORD *)(v69 + 16) = xmmword_22727E830;
    *(_QWORD *)(v69 + 32) = v56;
    v139 = (id)v69;
    sub_22727D650();
    v44 = v56;
    goto LABEL_20;
  }
  v119 = v38;
  v39 = a3;
  v40 = a3;
  if (objc_msgSend(v39, sel_type) == (id)6)
  {
    swift_release();
    v41 = v138;
    if (qword_2558CB378 != -1)
      swift_once();
    v42 = v137;
    v43 = __swift_project_value_buffer(v137, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v31, v43, v42);
    v44 = v39;
    v45 = sub_22727D4D0();
    v46 = sub_22727D794();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v131 = v40;
      v49 = (_QWORD *)v48;
      *(_DWORD *)v47 = 138543362;
      v139 = v44;
      v50 = v44;
      v42 = v137;
      sub_22727D920();
      *v49 = v131;

      v41 = v138;
      _os_log_impl(&dword_22723A000, v45, v46, "INAddMediaIntentHandlerresolveMediaItem successfully resolved podcast show: %{public}@", v47, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v49, -1, -1);
      MEMORY[0x2276AF6D4](v47, -1, -1);
    }
    else
    {

      v45 = v44;
    }
    v68 = v136;

    (*(void (**)(char *, uint64_t))(v41 + 8))(v31, v42);
    v141 = sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
    v142 = MEMORY[0x24BE91730];
    v139 = v134;
    v70 = v134;
    sub_22727D728();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v139);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_22727E830;
    sub_227247C88(0, &qword_2558CBD68);
    *(_QWORD *)(v71 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v44);
    v139 = (id)v71;
    sub_22727D650();
LABEL_20:
    v68(&v139);
    swift_bridgeObjectRelease();

    return;
  }
  v62 = objc_msgSend(v39, sel_identifier);
  if (!v62)
    goto LABEL_36;
  v63 = v62;
  sub_22727D584();

  sub_22727CCCC();
  swift_allocObject();
  v118 = sub_22727CCD8();
  if (!v118)
    goto LABEL_36;
  sub_22727CC78();
  sub_22727CC54();
  v64 = *(void (**)(char *, uint64_t))(v22 + 8);
  v64(v26, v129);
  v65 = v128;
  v66 = (void (*)(char *, _QWORD, uint64_t))v131[13];
  v66(v130, *MEMORY[0x24BE910A0], v128);
  sub_22723CA60((unint64_t *)&unk_2558CBD98, (uint64_t (*)(uint64_t))MEMORY[0x24BE910B8], MEMORY[0x24BE910C0]);
  sub_22727D608();
  sub_22727D608();
  v117 = v39;
  if (v139 == v143 && v140 == v144)
    v67 = 1;
  else
    v67 = sub_22727DA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v72 = (void (*)(char *, uint64_t))v131[1];
  v72(v130, v65);
  v72(v21, v65);
  if ((v67 & 1) == 0)
  {
    v73 = v120;
    sub_22727CC78();
    v74 = v122;
    sub_22727CC54();
    v64(v73, v129);
    v75 = v121;
    v66(v121, *MEMORY[0x24BE910B0], v65);
    sub_22727D608();
    sub_22727D608();
    if (v139 == v143 && v140 == v144)
    {
      swift_bridgeObjectRelease_n();
      v76 = v128;
      v72(v75, v128);
      v72(v74, v76);
    }
    else
    {
      v77 = sub_22727DA10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v78 = v128;
      v72(v75, v128);
      v72(v74, v78);
      if ((v77 & 1) == 0)
      {
LABEL_33:
        swift_release();
LABEL_35:
        v39 = v117;
LABEL_36:
        if (qword_2558CB378 != -1)
          swift_once();
        v96 = v137;
        v97 = __swift_project_value_buffer(v137, (uint64_t)qword_2558CC248);
        v98 = v138;
        v99 = v133;
        (*(void (**)(char *, uint64_t, uint64_t))(v138 + 16))(v133, v97, v96);
        v100 = v39;
        v101 = sub_22727D4D0();
        v102 = sub_22727D794();
        if (os_log_type_enabled(v101, v102))
        {
          v103 = (uint8_t *)swift_slowAlloc();
          v104 = swift_slowAlloc();
          v131 = v40;
          v105 = (_QWORD *)v104;
          *(_DWORD *)v103 = 138543362;
          v139 = v100;
          v106 = v100;
          sub_22727D920();
          *v105 = v131;

          v99 = v133;
          v98 = v138;
          _os_log_impl(&dword_22723A000, v101, v102, "INAddMediaIntentHandler#resolveMediaItem for music item: %{public}@...", v103, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v105, -1, -1);
          MEMORY[0x2276AF6D4](v103, -1, -1);
        }
        else
        {

          v101 = v100;
        }
        v107 = v132;
        v108 = v119;

        (*(void (**)(char *, uint64_t))(v98 + 8))(v99, v96);
        __swift_project_boxed_opaque_existential_1(&v107[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_subscription], *(_QWORD *)&v107[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_subscription + 24]);
        v109 = (_QWORD *)swift_allocObject();
        v109[2] = sub_2272636B0;
        v109[3] = v108;
        v110 = v134;
        v109[4] = v107;
        v109[5] = v110;
        v109[6] = v100;
        v111 = v100;
        v112 = v110;
        v113 = v107;
        sub_22727D0E0();

        goto LABEL_42;
      }
    }
  }
  v79 = objc_msgSend(v134, sel_mediaDestination, v117, v118);
  if (!v79)
    goto LABEL_33;
  v80 = v79;
  v81 = v123;
  sub_22727D518();

  v83 = v125;
  v82 = v126;
  v84 = v124;
  (*(void (**)(char *, char *, uint64_t))(v125 + 32))(v124, v81, v126);
  if ((*(unsigned int (**)(char *, uint64_t))(v83 + 88))(v84, v82) != *MEMORY[0x24BEE5AA0])
  {
    swift_release();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v82);
    goto LABEL_35;
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v83 + 96))(v84, v82);
  swift_bridgeObjectRelease();
  if (qword_2558CB378 != -1)
    swift_once();
  v85 = v137;
  v86 = __swift_project_value_buffer(v137, (uint64_t)qword_2558CC248);
  v87 = v138;
  (*(void (**)(char *, uint64_t, uint64_t))(v138 + 16))(v127, v86, v85);
  v88 = v117;
  v89 = sub_22727D4D0();
  v90 = sub_22727D794();
  if (os_log_type_enabled(v89, v90))
  {
    v91 = (uint8_t *)swift_slowAlloc();
    v92 = v40;
    v93 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v91 = 138543362;
    v139 = v88;
    v94 = v88;
    v85 = v137;
    sub_22727D920();
    *v93 = v92;

    _os_log_impl(&dword_22723A000, v89, v90, "INAddMediaIntentHandler#resolveMediaItem successfully resolved music item: %{public}@ without checking subscription or iCloudLibrarySync status", v91, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v93, -1, -1);
    v95 = v91;
    v87 = v138;
    MEMORY[0x2276AF6D4](v95, -1, -1);
  }
  else
  {

    v89 = v88;
  }
  v114 = v136;

  (*(void (**)(char *, uint64_t))(v87 + 8))(v127, v85);
  v141 = sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
  v142 = MEMORY[0x24BE91730];
  v139 = v134;
  v115 = v134;
  sub_22727D728();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v139);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
  v116 = swift_allocObject();
  *(_OWORD *)(v116 + 16) = xmmword_22727E830;
  sub_227247C88(0, &qword_2558CBD68);
  *(_QWORD *)(v116 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v88);
  v139 = (id)v116;
  sub_22727D650();
  v114(&v139);
  swift_bridgeObjectRelease();

LABEL_42:
  swift_release();
}

uint64_t sub_227259244(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void (*v46)(uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v45 = a6;
  v46 = a2;
  v41 = a4;
  v42 = a5;
  v47 = a3;
  v6 = sub_22727D4E8();
  v43 = *(_QWORD *)(v6 - 8);
  v44 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22727D1A0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22727D14C();
  v14 = (uint64_t (*)(uint64_t))MEMORY[0x24BE915E8];
  v15 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v40 - v19;
  sub_22727D008();
  (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v18, *MEMORY[0x24BE915D0], v13);
  sub_22723CA60(&qword_2558CBDA8, v14, MEMORY[0x24BE91600]);
  sub_22727D608();
  sub_22727D608();
  v22 = v48;
  v21 = v49;
  v23 = *(void (**)(char *, uint64_t))(v15 + 8);
  v23(v18, v13);
  v23(v20, v13);
  if (v21 == v22)
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v41 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library), *(_QWORD *)(v41 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24));
    v24 = v42;
    v49 = (uint64_t)v42;
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BE91650], v9);
    sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
    sub_22727D1B8();
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    if (v26)
    {
      sub_22727D59C();
      swift_bridgeObjectRelease();
    }
    v35 = (_QWORD *)swift_allocObject();
    v36 = v47;
    v35[2] = v46;
    v35[3] = v36;
    v37 = v45;
    v35[4] = v45;
    v35[5] = v24;
    swift_bridgeObjectRetain();
    swift_retain();
    v38 = v37;
    v39 = v24;
    sub_22727CE28();
    swift_bridgeObjectRelease_n();
    return swift_release();
  }
  else
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v27 = v44;
    v28 = __swift_project_value_buffer(v44, (uint64_t)qword_2558CC248);
    v29 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v8, v28, v27);
    v30 = sub_22727D4D0();
    v31 = sub_22727D788();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_22723A000, v30, v31, "INAddMediaIntentHandler#resolveMediaItem the user is not a subscriber", v32, 2u);
      MEMORY[0x2276AF6D4](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v27);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_22727E830;
    *(_QWORD *)(v33 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 2);
    v49 = v33;
    sub_22727D650();
    v46(v49);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_227259674(char a1, void (*a2)(_QWORD), uint64_t a3, void *a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD *v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD *v35;
  uint8_t *v36;
  void *v37;
  void (*v38)(_QWORD);
  uint64_t v39;
  _QWORD v40[5];

  v10 = sub_22727D4E8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v35 - v15;
  if ((a1 & 1) != 0)
  {
    v39 = a3;
    if (qword_2558CB378 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v10, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v17, v10);
    v18 = a4;
    v19 = sub_22727D4D0();
    v20 = sub_22727D794();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v37 = a5;
      v22 = (uint8_t *)v21;
      v35 = (_QWORD *)swift_slowAlloc();
      v36 = v22;
      *(_DWORD *)v22 = 138543362;
      v40[0] = v18;
      v23 = v18;
      v38 = a2;
      v24 = v23;
      sub_22727D920();
      v25 = v35;
      *v35 = v18;

      a2 = v38;
      v26 = v36;
      _os_log_impl(&dword_22723A000, v19, v20, "INAddMediaIntentHandler#resolveMediaItem successfully resolved music item: %{public}@", v36, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v25, -1, -1);
      a5 = v37;
      MEMORY[0x2276AF6D4](v26, -1, -1);
    }
    else
    {

      v19 = v18;
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    v40[3] = sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
    v40[4] = MEMORY[0x24BE91730];
    v40[0] = a5;
    v33 = a5;
    sub_22727D728();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_22727E830;
    sub_227247C88(0, &qword_2558CBD68);
    v32 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedMediaItem_, v18);
  }
  else
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v10, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v27, v10);
    v28 = sub_22727D4D0();
    v29 = sub_22727D788();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_22723A000, v28, v29, "INAddMediaIntentHandler#resolveMediaItem iCloud library sync required", v30, 2u);
      MEMORY[0x2276AF6D4](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_22727E830;
    v32 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, *MEMORY[0x24BDDA3A0]);
  }
  *(_QWORD *)(v31 + 32) = v32;
  v40[0] = v31;
  sub_22727D650();
  a2(v40[0]);
  return swift_bridgeObjectRelease();
}

uint64_t sub_227259A88(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t (**v18)(uint64_t);
  uint64_t v19;
  void *v21[2];

  v21[0] = a1;
  v5 = sub_22727D4C4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  v13 = qword_2558CB390;
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = (id)logObject;
  sub_22727D4AC();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  v15 = (*(unsigned __int8 *)(v6 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v16 = (v7 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = "addMediaIntentHandlerResolveNowPlayingItem";
  *(_QWORD *)(v17 + 24) = 42;
  *(_BYTE *)(v17 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17 + v15, v9, v5);
  v18 = (uint64_t (**)(uint64_t))(v17 + v16);
  *v18 = sub_227262EFC;
  v18[1] = (uint64_t (*)(uint64_t))v12;
  swift_retain();
  sub_22727D8D8();
  sub_22727D4A0();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = sub_227262F04;
  *(_QWORD *)(v19 + 24) = v17;
  swift_retain();
  sub_227259CA0((uint64_t)sub_227262F08, v19, (char *)v21[1], v21[0]);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return swift_release();
}

uint64_t sub_227259CA0(uint64_t a1, uint64_t a2, char *a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  char *v19;
  id v20;
  uint64_t v22;

  v8 = sub_22727D4E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  v13 = qword_2558CB378;
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v8, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  v15 = sub_22727D4D0();
  v16 = sub_22727D77C();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22723A000, v15, v16, "INAddMediaIntentHandler#resolveNowPlayingItem resolving...", v17, 2u);
    MEMORY[0x2276AF6D4](v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_project_boxed_opaque_existential_1(&a3[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying], *(_QWORD *)&a3[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying + 24]);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = sub_227262F44;
  v18[3] = v12;
  v18[4] = a3;
  v18[5] = a4;
  v19 = a3;
  v20 = a4;
  sub_22727CFD8();
  return swift_release();
}

void sub_227259E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void), uint64_t a9, char *a10, void *a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;

  v14 = sub_22727D4E8();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    __swift_project_boxed_opaque_existential_1(&a10[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying], *(_QWORD *)&a10[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying + 24]);
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = a8;
    v18[3] = a9;
    v18[4] = a10;
    v18[5] = a3;
    v18[6] = a4;
    v18[7] = a11;
    swift_bridgeObjectRetain();
    swift_retain();
    v19 = a10;
    v20 = a11;
    sub_22727CFF0();
    swift_release();
  }
  else
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v14, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v21, v14);
    v22 = sub_22727D4D0();
    v23 = sub_22727D788();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_22723A000, v22, v23, "INAddMediaIntentHandler#resolveNowPlayingItem could not resolve currently playing app from device", v24, 2u);
      MEMORY[0x2276AF6D4](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    v25 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 6);
    a8();

  }
}

void sub_22725A09C(int a1, void (*a2)(void), uint64_t a3, char *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void (*v20)(char *, uint64_t);
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void *v36;
  void (*v37)(void);
  uint64_t v38;
  int v39;
  int v40;

  v35 = a4;
  v36 = a7;
  v33 = a5;
  v34 = a6;
  v37 = a2;
  v38 = a3;
  v8 = sub_22727D4E8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v32 - v13;
  if (qword_2558CB378 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v8, (uint64_t)qword_2558CC248);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v16(v14, v15, v8);
  v17 = sub_22727D4D0();
  v18 = sub_22727D770();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v19 = 67240192;
    v39 = a1;
    sub_22727D920();
    _os_log_impl(&dword_22723A000, v17, v18, "INAddMediaIntentHandler#resolveNowPlayingItem playback state: %{public}u", v19, 8u);
    MEMORY[0x2276AF6D4](v19, -1, -1);
  }

  v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v14, v8);
  if (a1 && a1 != 3)
  {
    v25 = v35;
    __swift_project_boxed_opaque_existential_1(&v35[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying], *(_QWORD *)&v35[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying + 24]);
    v26 = (_QWORD *)swift_allocObject();
    v27 = v36;
    v26[2] = v37;
    v28 = v33;
    v29 = v34;
    v26[3] = v38;
    v26[4] = v28;
    v26[5] = v29;
    v26[6] = v25;
    v26[7] = v27;
    swift_retain();
    swift_bridgeObjectRetain();
    v30 = v25;
    v31 = v27;
    sub_22727CFE4();
    swift_release();
  }
  else
  {
    v16(v12, v15, v8);
    v21 = sub_22727D4D0();
    v22 = sub_22727D788();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v23 = 67240192;
      v40 = a1;
      sub_22727D920();
      _os_log_impl(&dword_22723A000, v21, v22, "INAddMediaIntentHandler#resolveNowPlayingItem nothing playing - state: %{public}u", v23, 8u);
      MEMORY[0x2276AF6D4](v23, -1, -1);
    }

    v20(v12, v8);
    v24 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 6);
    v37();

  }
}

void sub_22725A3B8(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, char *a6, void *a7)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  int v63;
  char v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t, uint64_t);
  void (*v70)(char *, char *, uint64_t);
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  NSObject *v75;
  os_log_type_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  char v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  char v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  os_log_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *, uint64_t);
  uint64_t v103;
  uint64_t v104;
  void (*v105)(char *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char v109;
  char *v110;
  uint64_t v111;
  void (*v112)(char *, uint64_t, uint64_t);
  NSObject *v113;
  os_log_type_t v114;
  uint8_t *v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void (*v121)(char *, uint64_t, uint64_t);
  char *v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  char *v128;
  NSObject *v129;
  os_log_type_t v130;
  uint8_t *v131;
  uint8_t *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  char v136;
  NSObject *v137;
  os_log_type_t v138;
  _BOOL4 v139;
  uint8_t *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  _QWORD *v149;
  char *v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  _QWORD *v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  void *v167;
  id v168;
  id v169;
  uint64_t v170;
  os_log_t v171;
  int v172;
  uint64_t v173;
  void (*v174)(char *, char *, uint64_t);
  uint64_t v175;
  uint64_t v176;
  void (*v177)(char *, char *, uint64_t);
  int v178;
  uint64_t v179;
  void (*v180)(char *, uint64_t, uint64_t);
  uint64_t v181;
  uint64_t v182;
  char *v183;
  uint64_t v184;
  char *v185;
  char *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  char *v190;
  char *v191;
  uint64_t v192;
  uint64_t v193;
  char *v194;
  uint64_t v195;
  uint64_t v196;
  char *v197;
  char *v198;
  char *v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  char *v203;
  uint64_t v204;
  char *v205;
  char *v206;
  void (*v207)(void);
  uint64_t v208;
  uint64_t v209;
  char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;

  v189 = a7;
  v190 = a6;
  v201 = a4;
  v202 = a5;
  v207 = a2;
  v208 = a3;
  v8 = sub_22727CC90();
  v195 = *(_QWORD *)(v8 - 8);
  v196 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v194 = (char *)&v170 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v193 = sub_22727CCC0();
  v192 = *(_QWORD *)(v193 - 8);
  MEMORY[0x24BDAC7A8](v193);
  v191 = (char *)&v170 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v188 = sub_22727D1A0();
  v187 = *(_QWORD *)(v188 - 8);
  MEMORY[0x24BDAC7A8](v188);
  v186 = (char *)&v170 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v209 = sub_22727D4E8();
  v211 = *(_QWORD *)(v209 - 8);
  v12 = MEMORY[0x24BDAC7A8](v209);
  v197 = (char *)&v170 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v198 = (char *)&v170 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v203 = (char *)&v170 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v206 = (char *)&v170 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v170 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB760);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v170 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_22727CD68();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v185 = (char *)&v170 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v205 = (char *)&v170 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)&v170 - v32;
  v34 = MEMORY[0x24BDAC7A8](v31);
  v200 = (char *)&v170 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v199 = (char *)&v170 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&v170 - v39;
  v184 = v41;
  MEMORY[0x24BDAC7A8](v38);
  v43 = (char *)&v170 - v42;
  sub_2272471A0(a1, (uint64_t)v24, &qword_2558CB760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_227246BC0((uint64_t)v24, &qword_2558CB760);
    if (qword_2558CB378 != -1)
      swift_once();
    v44 = v209;
    v45 = __swift_project_value_buffer(v209, (uint64_t)qword_2558CC248);
    v46 = v211;
    (*(void (**)(char *, uint64_t, uint64_t))(v211 + 16))(v21, v45, v44);
    v47 = sub_22727D4D0();
    v48 = sub_22727D788();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_22723A000, v47, v48, "INAddMediaIntentHandler#resolveNowPlayingItem nowPlaying item error", v49, 2u);
      MEMORY[0x2276AF6D4](v49, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v46 + 8))(v21, v44);
    v50 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 6);
    v207();

    return;
  }
  v177 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  v177(v43, v24, v25);
  v176 = sub_22727CD38();
  v181 = v51;
  v175 = sub_22727CD14();
  v182 = v52;
  sub_22727CD2C();
  swift_bridgeObjectRelease();
  v53 = sub_22727CD44();
  v55 = v54;
  sub_22727CD50();
  v56 = sub_22727CD20();
  v57 = v25;
  v204 = v26;
  v210 = v43;
  if ((v58 & 1) != 0)
  {
    v59 = v209;
    v60 = v211;
    v61 = v33;
    if ((v55 & 1) != 0)
    {
LABEL_10:
      v62 = 0;
      v63 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    v59 = v209;
    v60 = v211;
    v61 = v33;
    if ((v55 & 1) == 0 && v56 == v53)
      goto LABEL_10;
  }
  v62 = sub_22727CD20();
  v63 = v64 & 1;
LABEL_13:
  v178 = v63;
  v65 = v206;
  v66 = v200;
  v200 = (char *)v62;
  v67 = v204;
  if (qword_2558CB378 != -1)
    swift_once();
  v68 = __swift_project_value_buffer(v59, (uint64_t)qword_2558CC248);
  v69 = *(void (**)(char *, uint64_t, uint64_t))(v60 + 16);
  v179 = v68;
  v180 = v69;
  ((void (*)(char *))v69)(v65);
  v70 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  v71 = (uint64_t)v210;
  v70(v40, v210, v57);
  v72 = v199;
  v70(v199, (char *)v71, v57);
  v70(v66, (char *)v71, v57);
  v70(v61, (char *)v71, v57);
  v183 = v61;
  v73 = v205;
  v174 = v70;
  v70(v205, (char *)v71, v57);
  v74 = v65;
  v75 = sub_22727D4D0();
  v76 = sub_22727D794();
  v77 = v76;
  if (os_log_type_enabled(v75, v76))
  {
    v78 = swift_slowAlloc();
    v173 = swift_slowAlloc();
    v214 = v173;
    *(_DWORD *)v78 = 136447234;
    v172 = v77;
    v171 = v75;
    v212 = sub_22727CD38();
    v213 = v79;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB9F0);
    v80 = v57;
    v81 = sub_22727D590();
    v212 = sub_2272403C4(v81, v82, &v214);
    sub_22727D920();
    swift_bridgeObjectRelease();
    v83 = *(void (**)(char *, uint64_t))(v204 + 8);
    v83(v40, v80);
    *(_WORD *)(v78 + 12) = 2082;
    v212 = sub_22727CD14();
    v213 = v84;
    v85 = sub_22727D590();
    v212 = sub_2272403C4(v85, v86, &v214);
    sub_22727D920();
    swift_bridgeObjectRelease();
    v83(v72, v80);
    *(_WORD *)(v78 + 22) = 2082;
    v212 = sub_22727CD2C();
    v213 = v87;
    v88 = sub_22727D590();
    v212 = sub_2272403C4(v88, v89, &v214);
    sub_22727D920();
    swift_bridgeObjectRelease();
    v83(v66, v80);
    *(_WORD *)(v78 + 32) = 2082;
    v90 = v183;
    v212 = sub_22727CD44();
    LOBYTE(v213) = v91 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBD60);
    v92 = sub_22727D590();
    v212 = sub_2272403C4(v92, v93, &v214);
    sub_22727D920();
    swift_bridgeObjectRelease();
    v83(v90, v80);
    *(_WORD *)(v78 + 42) = 2082;
    v94 = v205;
    v212 = sub_22727CD50();
    LOBYTE(v213) = v95 & 1;
    v96 = sub_22727D590();
    v212 = sub_2272403C4(v96, v97, &v214);
    sub_22727D920();
    swift_bridgeObjectRelease();
    v83(v94, v80);
    v57 = v80;
    v98 = (uint64_t)v200;
    v99 = v171;
    _os_log_impl(&dword_22723A000, v171, (os_log_type_t)v172, "INAddMediaIntentHandler#resolveNowPlayingItem now playing: title:%{public}s trackArtist:%{public}s album:%{public}s songId:%{public}s albumId:%{public}s", (uint8_t *)v78, 0x34u);
    v100 = v173;
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v100, -1, -1);
    v101 = v78;
    v59 = v209;
    MEMORY[0x2276AF6D4](v101, -1, -1);

    v102 = *(void (**)(char *, uint64_t))(v211 + 8);
    v102(v206, v59);
    v104 = v201;
    v103 = v202;
  }
  else
  {
    v105 = *(void (**)(char *, uint64_t))(v67 + 8);
    v105(v40, v57);
    v105(v72, v57);
    v105(v66, v57);
    v105(v183, v57);
    v105(v73, v57);

    v102 = *(void (**)(char *, uint64_t))(v211 + 8);
    v102(v74, v59);
    v104 = v201;
    v103 = v202;
    v98 = (uint64_t)v200;
  }
  v106 = sub_22727CEF4();
  v108 = v203;
  if (v106 == v104 && v107 == v103)
  {
    swift_bridgeObjectRelease();
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v110 = v198;
    v111 = v179;
    v112 = v180;
    v180(v198, v179, v59);
    v113 = sub_22727D4D0();
    v114 = sub_22727D77C();
    if (os_log_type_enabled(v113, v114))
    {
      v115 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v115 = 0;
      _os_log_impl(&dword_22723A000, v113, v114, "INAddMediaIntentHandler#resolveNowPlayingItem choosing podcast type", v115, 2u);
      MEMORY[0x2276AF6D4](v115, -1, -1);
    }

    v102(v110, v59);
    v116 = sub_22727CD50();
    if ((v117 & 1) != 0)
    {
      v128 = v197;
      v112(v197, v111, v59);
      v129 = sub_22727D4D0();
      v130 = sub_22727D788();
      if (os_log_type_enabled(v129, v130))
      {
        v131 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v131 = 0;
        _os_log_impl(&dword_22723A000, v129, v130, "INAddMediaIntentHandler#resolveNowPlayingItem Unexpected nil album identifier.", v131, 2u);
        v132 = v131;
        v128 = v197;
        MEMORY[0x2276AF6D4](v132, -1, -1);
      }

      v102(v128, v59);
      v133 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 6);
      v207();

      (*(void (**)(char *, uint64_t))(v204 + 8))(v210, v57);
    }
    else
    {
      v118 = v116;
      v211 = sub_227247C88(0, (unint64_t *)&qword_2558CB810);
      v212 = v118;
      v209 = sub_22727DA04();
      sub_22727CD14();
      v119 = *MEMORY[0x24BE910E8];
      v120 = v192;
      v121 = *(void (**)(char *, uint64_t, uint64_t))(v192 + 104);
      v122 = v191;
      v170 = v57;
      v123 = v193;
      v121(v191, v119, v193);
      v124 = v194;
      v125 = v195;
      v126 = v196;
      (*(void (**)(char *, _QWORD, uint64_t))(v195 + 104))(v194, *MEMORY[0x24BE91098], v196);
      v127 = (void *)sub_22727D6EC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v125 + 8))(v124, v126);
      (*(void (**)(char *, uint64_t))(v120 + 8))(v122, v123);
      ((void (*)(void *, _QWORD))v207)(v127, 0);

      (*(void (**)(char *, uint64_t))(v204 + 8))(v210, v170);
    }
    return;
  }
  v109 = sub_22727DA10();
  swift_bridgeObjectRelease();
  if ((v109 & 1) != 0)
    goto LABEL_22;
  if ((v178 & 1) != 0)
  {
LABEL_30:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v134 = (uint64_t)v210;
    sub_22725BCA8(v189, (uint64_t)v210, v207, v208);
    (*(void (**)(uint64_t, uint64_t))(v204 + 8))(v134, v57);
    return;
  }
  if (sub_22727CEE8() == v104 && v135 == v103)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v136 = sub_22727DA10();
    swift_bridgeObjectRelease();
    if ((v136 & 1) == 0)
      goto LABEL_30;
  }
  v180(v108, v179, v59);
  v137 = sub_22727D4D0();
  v138 = sub_22727D77C();
  v139 = os_log_type_enabled(v137, v138);
  v170 = v57;
  if (v139)
  {
    v140 = (uint8_t *)swift_slowAlloc();
    v141 = v59;
    v142 = swift_slowAlloc();
    *(_DWORD *)v140 = 136315138;
    v211 = (uint64_t)(v140 + 4);
    v212 = v142;
    v214 = v98;
    v143 = sub_22727DA04();
    v214 = sub_2272403C4(v143, v144, &v212);
    sub_22727D920();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v137, v138, "INAddMediaIntentHandler#resolveNowPlayingItem has persistentId, resolving to song using persistentId %s", v140, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v142, -1, -1);
    MEMORY[0x2276AF6D4](v140, -1, -1);

    v145 = v203;
    v146 = v141;
  }
  else
  {

    v145 = v108;
    v146 = v59;
  }
  v102(v145, v146);
  v147 = *(_QWORD *)&v190[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24];
  v148 = *(char **)&v190[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 32];
  v149 = __swift_project_boxed_opaque_existential_1(&v190[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], v147);
  v212 = v98;
  v203 = (char *)sub_22727DA04();
  v205 = v150;
  v212 = (uint64_t)v189;
  v151 = v187;
  v152 = v186;
  v153 = v188;
  (*(void (**)(char *, _QWORD, uint64_t))(v187 + 104))(v186, *MEMORY[0x24BE91650], v188);
  sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
  sub_22727D1B8();
  v155 = v154;
  (*(void (**)(char *, uint64_t))(v151 + 8))(v152, v153);
  v211 = (uint64_t)v149;
  v209 = v147;
  v206 = v148;
  v156 = v98;
  if (v155)
  {
    sub_22727D59C();
    swift_bridgeObjectRelease();
  }
  v157 = v185;
  v158 = v170;
  v174(v185, v210, v170);
  v159 = v204;
  v160 = (*(unsigned __int8 *)(v204 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v204 + 80);
  v161 = (_QWORD *)swift_allocObject();
  v162 = v189;
  v161[2] = v189;
  v161[3] = v156;
  v163 = v208;
  v161[4] = v207;
  v161[5] = v163;
  v164 = v181;
  v161[6] = v176;
  v161[7] = v164;
  v165 = v182;
  v161[8] = v175;
  v161[9] = v165;
  v166 = (char *)v161 + v160;
  v167 = v190;
  v161[10] = v190;
  v177(v166, v157, v158);
  swift_bridgeObjectRetain();
  v168 = v162;
  swift_retain();
  v169 = v167;
  sub_22727CE34();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_release();
  (*(void (**)(char *, uint64_t))(v159 + 8))(v210, v158);
}

void sub_22725B4B0(char a1, void *a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  id v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  _BOOL4 v61;
  uint64_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  id v73;
  void (*v74)(void);
  _QWORD v75[3];
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(void);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89[2];

  v82 = a7;
  v83 = a8;
  v75[2] = a6;
  v85 = a5;
  v86 = a4;
  v84 = a3;
  v76 = sub_22727CCC0();
  v81 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v80 = (char *)v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_22727CC90();
  v78 = *(_QWORD *)(v14 - 8);
  v79 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v77 = (char *)v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22727D4E8();
  v87 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)v75 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v75 - v23;
  v25 = sub_22727D524();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v75 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)v75 - v30;
  if ((a1 & 1) != 0)
  {
    v32 = objc_msgSend(a2, sel_mediaDestination);
    if (v32
      && (v33 = v32,
          sub_22727D518(),
          v33,
          (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v31, v29, v25),
          LODWORD(v33) = (*(uint64_t (**)(char *, uint64_t))(v26 + 88))(v31, v25),
          v34 = *MEMORY[0x24BEE5A98],
          (*(void (**)(char *, uint64_t))(v26 + 8))(v31, v25),
          (_DWORD)v33 == v34))
    {
      v35 = v16;
      if (qword_2558CB378 != -1)
        swift_once();
      v36 = __swift_project_value_buffer(v16, (uint64_t)qword_2558CC248);
      v37 = v87;
      (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v24, v36, v16);
      v38 = sub_22727D4D0();
      v39 = sub_22727D77C();
      v40 = os_log_type_enabled(v38, v39);
      v41 = v84;
      if (v40)
      {
        v42 = (uint8_t *)swift_slowAlloc();
        v43 = swift_slowAlloc();
        v88 = v41;
        v89[0] = v43;
        *(_DWORD *)v42 = 136446210;
        v44 = sub_22727DA04();
        v88 = sub_2272403C4(v44, v45, v89);
        sub_22727D920();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22723A000, v38, v39, "INAddMediaIntentHandler#resolveNowPlayingItem The item %{public}s asked to add to library and exists in library, returning error dialog.", v42, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v43, -1, -1);
        MEMORY[0x2276AF6D4](v42, -1, -1);

        (*(void (**)(char *, uint64_t))(v87 + 8))(v24, v35);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v16);
      }
      v74 = v86;
      v73 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, *MEMORY[0x24BDDA398]);
      v74();
    }
    else
    {
      v56 = v16;
      if (qword_2558CB378 != -1)
        swift_once();
      v75[1] = a9;
      v57 = __swift_project_value_buffer(v16, (uint64_t)qword_2558CC248);
      v58 = v87;
      (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v22, v57, v56);
      v59 = sub_22727D4D0();
      v60 = sub_22727D77C();
      v61 = os_log_type_enabled(v59, v60);
      v62 = v84;
      if (v61)
      {
        v63 = (uint8_t *)swift_slowAlloc();
        v64 = swift_slowAlloc();
        v88 = v62;
        v89[0] = v64;
        *(_DWORD *)v63 = 136446210;
        v75[0] = v63 + 4;
        v65 = sub_22727DA04();
        v88 = sub_2272403C4(v65, v66, v89);
        v62 = v84;
        sub_22727D920();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22723A000, v59, v60, "INAddMediaIntentHandler#resolveNowPlayingItem The item %{public}s exists in library and target is not library.", v63, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v64, -1, -1);
        MEMORY[0x2276AF6D4](v63, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v58 + 8))(v22, v56);
      v67 = v76;
      sub_227247C88(0, (unint64_t *)&qword_2558CB810);
      v89[0] = v62;
      sub_22727DA04();
      v69 = v77;
      v68 = v78;
      v70 = v79;
      (*(void (**)(char *, _QWORD, uint64_t))(v78 + 104))(v77, *MEMORY[0x24BE910A0], v79);
      v71 = v80;
      v72 = v81;
      (*(void (**)(char *, _QWORD, uint64_t))(v81 + 104))(v80, *MEMORY[0x24BE910E8], v67);
      v73 = (id)sub_22727D6EC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v67);
      (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v70);
      ((void (*)(id, _QWORD))v86)(v73, 0);
    }

  }
  else
  {
    v83 = a2;
    v46 = a11;
    if (qword_2558CB378 != -1)
      swift_once();
    v47 = v16;
    v48 = __swift_project_value_buffer(v16, (uint64_t)qword_2558CC248);
    v49 = v87;
    (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v19, v48, v47);
    v50 = sub_22727D4D0();
    v51 = sub_22727D77C();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      v53 = swift_slowAlloc();
      v82 = a11;
      *(_DWORD *)v52 = 136446210;
      v88 = v84;
      v89[0] = v53;
      v54 = sub_22727DA04();
      v88 = sub_2272403C4(v54, v55, v89);
      v46 = v82;
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v50, v51, "INAddMediaIntentHandler#resolveNowPlayingItem The item %{public}s doesn't exist in the library and target is library or playlist. This can happen if the persistentID is present due to cached content", v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v53, -1, -1);
      MEMORY[0x2276AF6D4](v52, -1, -1);

      (*(void (**)(char *, uint64_t))(v87 + 8))(v19, v47);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v49 + 8))(v19, v47);
    }
    sub_22725BCA8(v83, v46, v86, v85);
  }
}

void sub_22725BCA8(void *a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  id v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  _QWORD *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  id v71;
  _QWORD *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(void);
  uint64_t v100;
  unint64_t v101;

  v99 = a3;
  v100 = a4;
  v5 = sub_22727D1A0();
  v91 = *(_QWORD *)(v5 - 8);
  v92 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v90 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22727D4E8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v85 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v83 = (char *)&v79 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v82 = (char *)&v79 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v87 = (char *)&v79 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v86 = (char *)&v79 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v79 - v19;
  v88 = sub_22727CD38();
  v97 = v21;
  v93 = sub_22727CD14();
  v23 = v22;
  v80 = sub_22727CD2C();
  v98 = v24;
  v95 = sub_22727CD44();
  LODWORD(v94) = v25;
  v84 = sub_22727CD50();
  v81 = v26;
  v96 = a1;
  v27 = objc_msgSend(a1, sel_mediaSearch);
  if (v27)
  {
    v28 = v27;
    v29 = (unint64_t)objc_msgSend(v27, sel_mediaType);

  }
  else
  {
    v29 = 0;
  }
  if (qword_2558CB378 != -1)
    swift_once();
  v30 = __swift_project_value_buffer(v7, (uint64_t)qword_2558CC248);
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v31(v20, v30, v7);
  v32 = sub_22727D4D0();
  v33 = sub_22727D77C();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v34 = 134349056;
    v101 = v29;
    sub_22727D920();
    _os_log_impl(&dword_22723A000, v32, v33, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId choosing music type for search type: %{public}ld", v34, 0xCu);
    MEMORY[0x2276AF6D4](v34, -1, -1);
  }

  v35 = *(void (**)(char *, uint64_t))(v8 + 8);
  v35(v20, v7);
  if (v29 > 0x12)
    goto LABEL_24;
  if (((1 << v29) & 0x40023) == 0)
  {
    if (v29 == 2)
    {
      swift_bridgeObjectRelease();
      if ((v81 & 1) == 0)
      {
        v94 = v23;
        v31(v82, v30, v7);
        v50 = sub_22727D4D0();
        v51 = sub_22727D77C();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v52 = 0;
          _os_log_impl(&dword_22723A000, v50, v51, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId building album item from now playing...", v52, 2u);
          MEMORY[0x2276AF6D4](v52, -1, -1);
        }

        v35(v82, v7);
        __swift_project_boxed_opaque_existential_1((_QWORD *)(v89 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library), *(_QWORD *)(v89 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24));
        v101 = v84;
        sub_22727DA04();
        v101 = (unint64_t)v96;
        v54 = v90;
        v53 = v91;
        v55 = v92;
        (*(void (**)(char *, _QWORD, uint64_t))(v91 + 104))(v90, *MEMORY[0x24BE91650], v92);
        sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
        sub_22727D1B8();
        v57 = v56;
        (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v55);
        if (v57)
        {
          sub_22727D59C();
          swift_bridgeObjectRelease();
        }
        v72 = (_QWORD *)swift_allocObject();
        v73 = v96;
        v74 = v84;
        v72[2] = v96;
        v72[3] = v74;
        v75 = v100;
        v72[4] = v99;
        v72[5] = v75;
        v76 = v98;
        v72[6] = v80;
        v72[7] = v76;
        v77 = v94;
        v72[8] = v93;
        v72[9] = v77;
        swift_bridgeObjectRetain();
        v78 = v73;
        swift_retain();
        goto LABEL_33;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v31(v83, v30, v7);
      v68 = sub_22727D4D0();
      v69 = sub_22727D788();
      if (os_log_type_enabled(v68, v69))
      {
        v70 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v70 = 0;
        _os_log_impl(&dword_22723A000, v68, v69, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId Unexpected nil album identifier for album request", v70, 2u);
        MEMORY[0x2276AF6D4](v70, -1, -1);
      }

      v35(v83, v7);
      v49 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 6);
LABEL_31:
      v71 = v49;
      v99();

      return;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v31(v85, v30, v7);
    v58 = sub_22727D4D0();
    v59 = sub_22727D788();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v60 = 134349056;
      v101 = v29;
      sub_22727D920();
      _os_log_impl(&dword_22723A000, v58, v59, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId unexpected media type to add: %{public}ld", v60, 0xCu);
      MEMORY[0x2276AF6D4](v60, -1, -1);
    }

    v35(v85, v7);
    v49 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 3);
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  if ((v94 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v45 = v87;
    v31(v87, v30, v7);
    v46 = sub_22727D4D0();
    v47 = sub_22727D788();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_22723A000, v46, v47, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId Unexpected nil song identifier for song request", v48, 2u);
      MEMORY[0x2276AF6D4](v48, -1, -1);
    }

    v35(v45, v7);
    v49 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 6);
    goto LABEL_31;
  }
  v94 = v23;
  v36 = v86;
  v31(v86, v30, v7);
  v37 = sub_22727D4D0();
  v38 = sub_22727D77C();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl(&dword_22723A000, v37, v38, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId building song item from now playing...", v39, 2u);
    MEMORY[0x2276AF6D4](v39, -1, -1);
  }

  v35(v36, v7);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v89 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library), *(_QWORD *)(v89 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24));
  v101 = v95;
  sub_22727DA04();
  v101 = (unint64_t)v96;
  v41 = v90;
  v40 = v91;
  v42 = v92;
  (*(void (**)(char *, _QWORD, uint64_t))(v91 + 104))(v90, *MEMORY[0x24BE91650], v92);
  sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
  sub_22727D1B8();
  v44 = v43;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v41, v42);
  if (v44)
  {
    sub_22727D59C();
    swift_bridgeObjectRelease();
  }
  v61 = (_QWORD *)swift_allocObject();
  v62 = v95;
  v63 = v96;
  v61[2] = v96;
  v61[3] = v62;
  v64 = v100;
  v61[4] = v99;
  v61[5] = v64;
  v65 = v97;
  v61[6] = v88;
  v61[7] = v65;
  v66 = v94;
  v61[8] = v93;
  v61[9] = v66;
  swift_bridgeObjectRetain();
  v67 = v63;
  swift_retain();
LABEL_33:
  sub_22727CE34();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_release();
}

void sub_22725C64C(char a1, void *a2, uint64_t a3, void (*a4)(id, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  id v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(id, uint64_t);
  uint64_t v54;
  uint64_t v55;

  v50 = a8;
  v51 = a3;
  v47 = a6;
  v48 = a7;
  v52 = a5;
  v53 = a4;
  v49 = sub_22727CC90();
  v46 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22727CCC0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22727D4E8();
  v43 = *(_QWORD *)(v16 - 8);
  v44 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v45 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_22727D524();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v42 - v23;
  if ((a1 & 1) == 0)
    goto LABEL_8;
  v25 = objc_msgSend(a2, sel_mediaDestination);
  if (!v25)
    goto LABEL_8;
  v26 = v25;
  sub_22727D518();

  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v22, v18);
  LODWORD(v26) = (*(uint64_t (**)(char *, uint64_t))(v19 + 88))(v24, v18);
  v27 = *MEMORY[0x24BEE5A98];
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v18);
  if ((_DWORD)v26 == v27)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v28 = v44;
    v29 = __swift_project_value_buffer(v44, (uint64_t)qword_2558CC248);
    v30 = v43;
    v31 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v45, v29, v28);
    v32 = sub_22727D4D0();
    v33 = sub_22727D77C();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      *(_DWORD *)v34 = 136446210;
      v54 = v51;
      v55 = v35;
      v36 = sub_22727DA04();
      v54 = sub_2272403C4(v36, v37, &v55);
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v32, v33, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId The item %{public}s asked to add to library and exists in library, returning error dialog.", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v35, -1, -1);
      MEMORY[0x2276AF6D4](v34, -1, -1);

      (*(void (**)(char *, uint64_t))(v30 + 8))(v45, v28);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v28);
    }
    v40 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, *MEMORY[0x24BDDA398]);
    v41 = 1;
  }
  else
  {
LABEL_8:
    sub_227247C88(0, (unint64_t *)&qword_2558CB810);
    v55 = v51;
    sub_22727DA04();
    (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BE910E8], v12);
    v38 = v46;
    v39 = v49;
    (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v11, *MEMORY[0x24BE91098], v49);
    v40 = (id)sub_22727D6EC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v39);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    v41 = 0;
  }
  v53(v40, v41);

}

void sub_22725CAD0(char a1, void *a2, uint64_t a3, void (*a4)(id, uint64_t), uint64_t a5, uint64_t a6, char *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  id v28;
  void *v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void (*v63)(id, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(id, uint64_t);
  uint64_t v80;
  uint64_t v81;

  v75 = a7;
  v76 = a3;
  v68 = a6;
  v78 = a5;
  v79 = a4;
  v69 = sub_22727CC90();
  v74 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v73 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22727CCC0();
  v71 = *(_QWORD *)(v13 - 8);
  v72 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v70 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_22727D4E8();
  v77 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v64 - v19;
  v21 = sub_22727D524();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v64 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v64 - v26;
  if ((a1 & 1) == 0)
    goto LABEL_9;
  v28 = objc_msgSend(a2, sel_mediaDestination);
  if (!v28)
    goto LABEL_9;
  v29 = v28;
  sub_22727D518();

  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v27, v25, v21);
  LODWORD(v29) = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v27, v21);
  v30 = v15;
  v31 = *MEMORY[0x24BEE5A98];
  (*(void (**)(char *, uint64_t))(v22 + 8))(v27, v21);
  v32 = (_DWORD)v29 == v31;
  v15 = v30;
  if (v32)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v33 = __swift_project_value_buffer(v30, (uint64_t)qword_2558CC248);
    v34 = v77;
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v20, v33, v30);
    v35 = sub_22727D4D0();
    v36 = sub_22727D77C();
    v37 = os_log_type_enabled(v35, v36);
    v38 = v76;
    if (v37)
    {
      v39 = swift_slowAlloc();
      v75 = v20;
      v40 = (uint8_t *)v39;
      v41 = swift_slowAlloc();
      v80 = v38;
      v81 = v41;
      *(_DWORD *)v40 = 136446210;
      v42 = sub_22727DA04();
      v80 = sub_2272403C4(v42, v43, &v81);
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v35, v36, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId The item %{public}s asked to add to library and exists in library, returning error dialog.", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v41, -1, -1);
      MEMORY[0x2276AF6D4](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v34 + 8))(v75, v30);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v34 + 8))(v20, v30);
    }
    v63 = v79;
    v61 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, *MEMORY[0x24BDDA398]);
    v62 = 1;
  }
  else
  {
LABEL_9:
    if (qword_2558CB378 != -1)
      swift_once();
    v67 = a8;
    v44 = __swift_project_value_buffer(v15, (uint64_t)qword_2558CC248);
    v45 = v77;
    (*(void (**)(char *, uint64_t, uint64_t))(v77 + 16))(v18, v44, v15);
    v46 = sub_22727D4D0();
    v47 = sub_22727D77C();
    v48 = os_log_type_enabled(v46, v47);
    v66 = a9;
    if (v48)
    {
      v49 = (uint8_t *)swift_slowAlloc();
      v50 = v45;
      v51 = swift_slowAlloc();
      *(_DWORD *)v49 = 136446210;
      v65 = v15;
      v52 = v76;
      v80 = v76;
      v81 = v51;
      v53 = sub_22727DA04();
      v80 = sub_2272403C4(v53, v54, &v81);
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v46, v47, "INAddMediaIntentHandler#resolveNowPlayingItemFromStoreId The item %{public}s does not exists in library.", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v51, -1, -1);
      MEMORY[0x2276AF6D4](v49, -1, -1);

      (*(void (**)(char *, uint64_t))(v50 + 8))(v18, v65);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v45 + 8))(v18, v15);
      v52 = v76;
    }
    v55 = v69;
    sub_227247C88(0, (unint64_t *)&qword_2558CB810);
    v81 = v52;
    sub_22727DA04();
    v57 = v70;
    v56 = v71;
    v58 = v72;
    (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v70, *MEMORY[0x24BE910E8], v72);
    v59 = v73;
    v60 = v74;
    (*(void (**)(char *, _QWORD, uint64_t))(v74 + 104))(v73, *MEMORY[0x24BE91098], v55);
    v61 = (id)sub_22727D6EC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v59, v55);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v58);
    v62 = 0;
    v63 = v79;
  }
  v63(v61, v62);

}

id INAddMediaIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INAddMediaIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22725D1F8()
{
  return objc_msgSend((id)objc_opt_self(), sel_playlistsQuery);
}

id sub_22725D224()
{
  return objc_msgSend((id)objc_opt_self(), sel_songsQuery);
}

id sub_22725D250()
{
  return objc_msgSend((id)objc_opt_self(), sel_albumsQuery);
}

uint64_t type metadata accessor for INAddMediaIntentHandler()
{
  return objc_opt_self();
}

id sub_22725D29C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v12;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char *v19;
  id v20;
  objc_super v22;
  __int128 v23[2];
  _BYTE v24[24];
  ValueMetadata *v25;
  _UNKNOWN **v26;
  uint64_t v27[5];
  uint64_t v28[5];
  uint64_t v29[5];

  v12 = sub_22727CDBC();
  v29[3] = v12;
  v29[4] = MEMORY[0x24BE91210];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v29);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(boxed_opaque_existential_1, a1, v12);
  v14 = sub_22727CF3C();
  v28[3] = v14;
  v28[4] = MEMORY[0x24BE91368];
  v15 = __swift_allocate_boxed_opaque_existential_1(v28);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v15, a2, v14);
  v16 = sub_22727D074();
  v27[3] = v16;
  v27[4] = MEMORY[0x24BE91490];
  v17 = __swift_allocate_boxed_opaque_existential_1(v27);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v17, a3, v16);
  v25 = &type metadata for PodcastLibraryProvider;
  v26 = &protocol witness table for PodcastLibraryProvider;
  sub_227240AC4((uint64_t)v29, (uint64_t)a6 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library);
  sub_227240AC4((uint64_t)v28, (uint64_t)a6 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_nowPlaying);
  sub_227240AC4((uint64_t)v27, (uint64_t)a6 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_subscription);
  sub_227240AC4(a4, (uint64_t)a6 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_aceServiceInvoker);
  sub_227240AC4((uint64_t)v24, (uint64_t)a6 + OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_provider);
  sub_227240AC4((uint64_t)v24, (uint64_t)v23);
  v18 = swift_allocObject();
  sub_22723D600(v23, v18 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBDB8);
  swift_allocObject();
  v19 = a6;
  *(_QWORD *)&v19[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_instanceReference] = sub_22727CBB8();
  sub_2272471A0(a5, (uint64_t)&v19[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_notificationProvider], (uint64_t *)&unk_2558CBD70);

  v22.receiver = v19;
  v22.super_class = (Class)type metadata accessor for INAddMediaIntentHandler();
  v20 = objc_msgSendSuper2(&v22, sel_init);
  sub_227246BC0(a5, (uint64_t *)&unk_2558CBD70);
  __swift_destroy_boxed_opaque_existential_1Tm(a4);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
  return v20;
}

uint64_t sub_22725D504()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22725D528(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_22725D54C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *))
{
  uint64_t v8;

  v8 = *a1;
  sub_22727D8CC();
  if (qword_2558CB390 != -1)
    swift_once();
  sub_22727D4A0();
  return a6(&v8);
}

uint64_t sub_22725D60C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_22727D4C4() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_22725D54C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), v1 + v4, *(uint64_t (**)(uint64_t *))(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_22725D668(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = *a1;
  return v2(&v4);
}

uint64_t sub_22725D69C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *))
{
  char v7;
  uint64_t v9;
  char v10;

  v7 = *((_BYTE *)a1 + 8);
  v9 = *a1;
  v10 = v7;
  sub_22727D8CC();
  if (qword_2558CB390 != -1)
    swift_once();
  sub_22727D4A0();
  return a6(&v9);
}

uint64_t sub_22725D768(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_22727D4C4() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_22725D54C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), v1 + v4, *(uint64_t (**)(uint64_t *))(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_22725D7C8(NSObject *a1, void *a2, void (*a3)(NSObject **), uint64_t a4)
{
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
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
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  id v97;
  void *v98;
  id v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  void (*v103)(char *);
  char *v104;
  NSObject *v105;
  uint64_t v106;
  os_log_type_t v107;
  _BOOL4 v108;
  uint64_t v109;
  uint8_t *v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint8_t *v114;
  void (*v115)(char *, uint64_t);
  char *v116;
  NSObject *v117;
  id v118;
  void *v119;
  NSObject *v120;
  unint64_t v121;
  unint64_t v122;
  uint64_t v123;
  NSObject *v124;
  os_log_type_t v125;
  uint64_t v126;
  void (*v127)(char *, uint64_t);
  uint8_t *v128;
  uint64_t v129;
  uint8_t *v130;
  char *v131;
  char *v132;
  id v133;
  void *v134;
  void *v135;
  id v136;
  void (*v137)(NSObject **);
  uint64_t v138;
  void *v139;
  id v140;
  unint64_t v141;
  id v142;
  void *v143;
  uint64_t v144;
  id v145;
  void *v146;
  uint64_t v147;
  NSObject *v148;
  os_log_type_t v149;
  uint8_t *v150;
  id v151;
  char *v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  char *v156;
  NSObject *v157;
  os_log_type_t v158;
  BOOL v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  NSObject *v167;
  os_log_type_t v168;
  uint8_t *v169;
  NSObject *v170;
  uint64_t v171;
  NSObject *v172;
  os_log_type_t v173;
  BOOL v174;
  void (*v175)(NSObject **);
  uint8_t *v176;
  id v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  void (*v182)(char *, uint64_t);
  void (*v183)(char *, _QWORD, uint64_t);
  char v184;
  char *v185;
  id v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  NSObject *v190;
  os_log_type_t v191;
  uint8_t *v192;
  NSObject *v193;
  void *v194;
  void *v195;
  void *v196;
  NSObject *v197;
  uint64_t v198;
  void (*v199)(char *, uint64_t);
  char *v200;
  char *v201;
  char *v202;
  uint64_t v203;
  char v204;
  uint64_t v205;
  char *v206;
  NSObject *v207;
  os_log_type_t v208;
  uint8_t *v209;
  NSObject *v210;
  id v211;
  void *v212;
  uint64_t v213;
  uint64_t v214;
  unsigned int v215;
  uint64_t v216;
  char *v217;
  void (*v218)(char *, uint64_t);
  void (*v219)(char *, _QWORD, uint64_t);
  char v220;
  id v221;
  void *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  NSObject *v226;
  void *v227;
  void *v228;
  NSObject *v229;
  void (*v230)(char *, uint64_t);
  char *v231;
  char *v232;
  char v233;
  char *v234;
  NSObject *v235;
  os_log_type_t v236;
  uint8_t *v237;
  NSObject *v238;
  char *v239;
  char *v240;
  char v241;
  char *v242;
  void (*v243)(char *, _QWORD, uint64_t);
  char *v244;
  char v245;
  void (*v246)(char *, uint64_t);
  char *v247;
  char *v248;
  char v249;
  char *v250;
  char *v251;
  void (*v252)(char *, uint64_t, uint64_t);
  NSObject *v253;
  os_log_type_t v254;
  uint8_t *v255;
  _QWORD *v256;
  NSObject *v257;
  NSObject *v258;
  _QWORD *v259;
  char *v260;
  void (*v261)(char *, uint64_t);
  char *v262;
  char *v263;
  char *v264;
  uint64_t v265;
  int v266;
  id v267;
  void *v268;
  uint64_t v269;
  uint64_t v270;
  id v271;
  void *v272;
  uint64_t v273;
  uint64_t v274;
  char *v275;
  NSObject *v276;
  os_log_type_t v277;
  uint8_t *v278;
  NSObject *v279;
  id v280;
  void *v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  void *v285;
  void *v286;
  NSObject *v287;
  uint64_t v288;
  NSObject *v289;
  os_log_type_t v290;
  uint8_t *v291;
  uint64_t v292;
  char *v293;
  char *v294;
  uint64_t v295;
  NSObject *v296;
  unint64_t v297;
  unint64_t v298;
  char *v299;
  uint64_t v300;
  uint8_t *v301;
  id v302;
  void *v303;
  uint64_t v304;
  uint64_t v305;
  NSObject *v306;
  char v307;
  char *v308;
  NSObject *v309;
  os_log_type_t v310;
  uint8_t *v311;
  NSObject *v312;
  NSObject *v313;
  uint64_t v314;
  uint64_t v315;
  NSObject *v316;
  os_log_type_t v317;
  uint8_t *v318;
  NSObject *v319;
  uint64_t v320;
  NSObject *v321;
  os_log_type_t v322;
  uint8_t *v323;
  NSObject *v324;
  void (*v325)(char *, uint64_t);
  uint64_t v326;
  uint64_t v327;
  void (*v328)(char *);
  uint64_t v329;
  void (*v330)(NSObject **);
  uint64_t v331;
  uint64_t v332;
  char *v333;
  char *v334;
  char *v335;
  char *v336;
  char *v337;
  char *v338;
  char *v339;
  char *v340;
  char *v341;
  char *v342;
  char *v343;
  char *v344;
  char *v345;
  char *v346;
  char *v347;
  char *v348;
  char *v349;
  char *v350;
  char *v351;
  char *v352;
  char *v353;
  char *v354;
  char *v355;
  char *v356;
  char *v357;
  char *v358;
  char *v359;
  char *v360;
  char *v361;
  char *v362;
  char *v363;
  char *v364;
  char *v365;
  char *v366;
  uint64_t v367;
  char *v368;
  id v369;
  char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  char *v374;
  char *v375;
  char *v376;
  NSObject *v377;
  char *v378;
  char *v379;
  uint64_t v380;
  uint64_t v381;
  NSObject *v382;
  uint64_t v383;

  v369 = a2;
  v7 = sub_22727CCC0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v335 = (char *)&v325 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v356 = (char *)&v325 - v11;
  v12 = sub_22727CC90();
  v13 = *(_QWORD *)(v12 - 8);
  v372 = v12;
  v373 = v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v340 = (char *)&v325 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v342 = (char *)&v325 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v358 = (char *)&v325 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v346 = (char *)&v325 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v354 = (char *)&v325 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v364 = (char *)&v325 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v337 = (char *)&v325 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v341 = (char *)&v325 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v357 = (char *)&v325 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v344 = (char *)&v325 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v363 = (char *)&v325 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v362 = (char *)&v325 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v348 = (char *)&v325 - v39;
  v40 = MEMORY[0x24BDAC7A8](v38);
  v349 = (char *)&v325 - v41;
  v42 = MEMORY[0x24BDAC7A8](v40);
  v366 = (char *)&v325 - v43;
  MEMORY[0x24BDAC7A8](v42);
  v365 = (char *)&v325 - v44;
  v371 = sub_22727CC6C();
  v367 = *(_QWORD *)(v371 - 8);
  v45 = MEMORY[0x24BDAC7A8](v371);
  v339 = (char *)&v325 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = MEMORY[0x24BDAC7A8](v45);
  v334 = (char *)&v325 - v48;
  v49 = MEMORY[0x24BDAC7A8](v47);
  v351 = (char *)&v325 - v50;
  v51 = MEMORY[0x24BDAC7A8](v49);
  v345 = (char *)&v325 - v52;
  v53 = MEMORY[0x24BDAC7A8](v51);
  v353 = (char *)&v325 - v54;
  v55 = MEMORY[0x24BDAC7A8](v53);
  v336 = (char *)&v325 - v56;
  v57 = MEMORY[0x24BDAC7A8](v55);
  v343 = (char *)&v325 - v58;
  v59 = MEMORY[0x24BDAC7A8](v57);
  v352 = (char *)&v325 - v60;
  v61 = MEMORY[0x24BDAC7A8](v59);
  v347 = (char *)&v325 - v62;
  MEMORY[0x24BDAC7A8](v61);
  v360 = (char *)&v325 - v63;
  v64 = sub_22727D4E8();
  v65 = *(_QWORD *)(v64 - 8);
  v66 = MEMORY[0x24BDAC7A8](v64);
  v378 = (char *)&v325 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = MEMORY[0x24BDAC7A8](v66);
  v333 = (char *)&v325 - v69;
  v70 = MEMORY[0x24BDAC7A8](v68);
  v355 = (char *)&v325 - v71;
  v72 = MEMORY[0x24BDAC7A8](v70);
  v338 = (char *)&v325 - v73;
  v74 = MEMORY[0x24BDAC7A8](v72);
  v361 = (char *)&v325 - v75;
  v76 = MEMORY[0x24BDAC7A8](v74);
  v350 = (char *)&v325 - v77;
  v78 = MEMORY[0x24BDAC7A8](v76);
  v359 = (char *)&v325 - v79;
  v80 = MEMORY[0x24BDAC7A8](v78);
  v368 = (char *)&v325 - v81;
  v82 = MEMORY[0x24BDAC7A8](v80);
  v374 = (char *)&v325 - v83;
  v84 = MEMORY[0x24BDAC7A8](v82);
  v370 = (char *)&v325 - v85;
  v86 = MEMORY[0x24BDAC7A8](v84);
  v376 = (char *)&v325 - v87;
  v88 = MEMORY[0x24BDAC7A8](v86);
  v375 = (char *)&v325 - v89;
  v90 = MEMORY[0x24BDAC7A8](v88);
  v379 = (char *)&v325 - v91;
  v92 = MEMORY[0x24BDAC7A8](v90);
  v94 = (char *)&v325 - v93;
  MEMORY[0x24BDAC7A8](v92);
  v96 = (char *)&v325 - v95;
  v377 = a1;
  v97 = -[NSObject privateAddMediaIntentData](a1, sel_privateAddMediaIntentData);
  if (!v97)
    goto LABEL_163;
  v98 = v97;
  v99 = objc_msgSend(v97, sel_audioSearchResults);

  if (!v99)
    goto LABEL_163;
  sub_227247C88(0, (unint64_t *)&qword_2558CB810);
  v100 = sub_22727D638();

  if (!(v100 >> 62))
  {
    if (*(_QWORD *)((v100 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
    goto LABEL_162;
  }
  swift_bridgeObjectRetain();
  v314 = sub_22727D9BC();
  swift_bridgeObjectRelease();
  if (!v314)
  {
LABEL_162:
    swift_bridgeObjectRelease();
LABEL_163:
    if (qword_2558CB378 != -1)
      swift_once();
    v315 = __swift_project_value_buffer(v64, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v96, v315, v64);
    v316 = sub_22727D4D0();
    v317 = sub_22727D788();
    if (os_log_type_enabled(v316, v317))
    {
      v318 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v318 = 0;
      _os_log_impl(&dword_22723A000, v316, v317, "INAddMediaIntentHandler#resolveSearchItem empty media item in privateAddMediaIntent data", v318, 2u);
      MEMORY[0x2276AF6D4](v318, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v65 + 8))(v96, v64);
    sub_227247C88(0, &qword_2558CBD68);
    v319 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v382 = v319;
    LOBYTE(v383) = 1;
    a3(&v382);

    return;
  }
LABEL_5:
  if ((v100 & 0xC000000000000001) != 0)
  {
    v101 = (char *)MEMORY[0x2276AF200](0, v100);
LABEL_8:
    v96 = v101;
    v326 = v8;
    v327 = v7;
    v329 = a4;
    v330 = a3;
    swift_bridgeObjectRelease();
    if (qword_2558CB378 == -1)
      goto LABEL_9;
    goto LABEL_170;
  }
  if (*(_QWORD *)((v100 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v101 = (char *)*(id *)(v100 + 32);
    goto LABEL_8;
  }
  __break(1u);
LABEL_170:
  swift_once();
LABEL_9:
  v102 = __swift_project_value_buffer(v64, (uint64_t)qword_2558CC248);
  v103 = *(void (**)(char *))(v65 + 16);
  v331 = v102;
  v103(v94);
  v104 = v96;
  v105 = sub_22727D4D0();
  v106 = v64;
  v107 = sub_22727D77C();
  v108 = os_log_type_enabled(v105, v107);
  v332 = v106;
  if (v108)
  {
    v109 = swift_slowAlloc();
    v328 = v103;
    v110 = (uint8_t *)v109;
    v111 = swift_slowAlloc();
    v382 = v111;
    *(_DWORD *)v110 = 136446210;
    v112 = sub_22727D71C();
    v380 = sub_2272403C4(v112, v113, (uint64_t *)&v382);
    sub_22727D920();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v105, v107, "INAddMediaIntentHandler#resolveSearchItem resolving from item: %{public}s", v110, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v111, -1, -1);
    v114 = v110;
    v103 = v328;
    MEMORY[0x2276AF6D4](v114, -1, -1);

    v115 = *(void (**)(char *, uint64_t))(v65 + 8);
    v115(v94, v332);
  }
  else
  {

    v115 = *(void (**)(char *, uint64_t))(v65 + 8);
    v115(v94, v106);
  }
  v116 = v379;
  v117 = objc_msgSend(v104, sel_type);
  if ((sub_22723E300((uint64_t)v117, (uint64_t)&unk_24EF89580) & 1) == 0)
  {
    v132 = v104;
    v133 = -[NSObject backingStore](v377, sel_backingStore);
    objc_opt_self();
    v134 = (void *)swift_dynamicCastObjCClass();
    if (v134)
    {
      v135 = v134;
      v136 = objc_msgSend(v134, sel_privateAddMediaIntentData);
      v137 = v330;
      v138 = v332;
      if (v136)
      {
        v139 = v136;
        v325 = v115;
        v140 = objc_msgSend(v136, sel_audioSearchResults);

        if (v140)
        {
          v328 = v103;
          sub_227247C88(0, &qword_2558CBDB0);
          v141 = sub_22727D638();

          if (v141 >> 62)
          {
            swift_bridgeObjectRetain();
            v320 = sub_22727D9BC();
            swift_bridgeObjectRelease();
            if (v320)
              goto LABEL_21;
          }
          else if (*(_QWORD *)((v141 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
LABEL_21:
            if ((v141 & 0xC000000000000001) != 0)
            {
              v142 = (id)MEMORY[0x2276AF200](0, v141);
            }
            else
            {
              if (!*(_QWORD *)((v141 & 0xFFFFFFFFFFFFF8) + 0x10))
              {
                __break(1u);
                return;
              }
              v142 = *(id *)(v141 + 32);
            }
            v143 = v142;
            swift_bridgeObjectRelease();
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
            v144 = swift_allocObject();
            *(_OWORD *)(v144 + 16) = xmmword_22727E830;
            *(_QWORD *)(v144 + 32) = v143;
            v382 = v144;
            sub_22727D650();
            v145 = v143;
            v146 = (void *)sub_22727D620();
            swift_bridgeObjectRelease();
            objc_msgSend(v135, sel_setMediaItems_, v146);

            goto LABEL_173;
          }

          swift_bridgeObjectRelease();
LABEL_173:
          v115 = v325;
          v103 = v328;
          goto LABEL_174;
        }

        v115 = v325;
      }
      else
      {

      }
    }
    else
    {

      v137 = v330;
      v138 = v332;
    }
LABEL_174:
    ((void (*)(char *, uint64_t, uint64_t))v103)(v378, v331, v138);
    v321 = sub_22727D4D0();
    v322 = sub_22727D788();
    if (os_log_type_enabled(v321, v322))
    {
      v323 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v323 = 134349056;
      v382 = v117;
      sub_22727D920();
      _os_log_impl(&dword_22723A000, v321, v322, "INAddMediaIntentHandler#resolveSearchItem is of unsupported media type=%{public}ld", v323, 0xCu);
      MEMORY[0x2276AF6D4](v323, -1, -1);
    }

    v115(v378, v138);
    v324 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 3);
    v382 = v324;
    LOBYTE(v383) = 1;
    v137(&v382);

    return;
  }
  v118 = objc_msgSend(v104, sel_identifier);
  if (!v118)
  {
    v147 = v332;
    ((void (*)(char *, uint64_t, uint64_t))v103)(v375, v331, v332);
    v148 = sub_22727D4D0();
    v149 = sub_22727D788();
    if (os_log_type_enabled(v148, v149))
    {
      v150 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v150 = 0;
      _os_log_impl(&dword_22723A000, v148, v149, "INAddMediaIntentHandler#resolveSearchItem could not find item identifier", v150, 2u);
      MEMORY[0x2276AF6D4](v150, -1, -1);
    }

    v115(v375, v147);
    sub_227247C88(0, &qword_2558CBD68);
    v151 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    goto LABEL_37;
  }
  v119 = v118;
  v378 = v104;
  v120 = sub_22727D584();
  v122 = v121;

  v123 = v332;
  ((void (*)(char *, uint64_t, uint64_t))v103)(v116, v331, v332);
  swift_bridgeObjectRetain_n();
  v124 = sub_22727D4D0();
  v125 = sub_22727D77C();
  if (os_log_type_enabled(v124, v125))
  {
    v126 = swift_slowAlloc();
    v328 = v103;
    v127 = v115;
    v128 = (uint8_t *)v126;
    v129 = swift_slowAlloc();
    v382 = v129;
    *(_DWORD *)v128 = 136446210;
    swift_bridgeObjectRetain();
    v380 = sub_2272403C4((uint64_t)v120, v122, (uint64_t *)&v382);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22723A000, v124, v125, "INAddMediaIntentHandler#media item identifier: %{public}s", v128, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v129, -1, -1);
    v130 = v128;
    v115 = v127;
    v103 = v328;
    MEMORY[0x2276AF6D4](v130, -1, -1);

    v131 = v379;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v131 = v116;
  }
  v115(v131, v123);
  v152 = v376;
  sub_22727CCCC();
  swift_allocObject();
  swift_bridgeObjectRetain();
  v153 = sub_22727CCD8();
  v104 = v378;
  if (!v153)
  {
    swift_bridgeObjectRelease();
    v165 = v370;
    v166 = v332;
    ((void (*)(char *, uint64_t, uint64_t))v103)(v370, v331, v332);
    v167 = sub_22727D4D0();
    v168 = sub_22727D788();
    if (os_log_type_enabled(v167, v168))
    {
      v169 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v169 = 0;
      _os_log_impl(&dword_22723A000, v167, v168, "INAddMediaIntentHandler#resolveSearchItem could not parse remote item identifier", v169, 2u);
      MEMORY[0x2276AF6D4](v169, -1, -1);
    }

    v115(v165, v166);
    v151 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 3);
LABEL_37:
    v170 = v151;
    v382 = v170;
    LOBYTE(v383) = 1;
    v330(&v382);

    return;
  }
  v154 = (char *)v153;
  v377 = v120;
  v155 = v332;
  ((void (*)(char *, uint64_t, uint64_t))v103)(v152, v331, v332);
  v156 = v104;
  swift_bridgeObjectRetain();
  v157 = sub_22727D4D0();
  v158 = sub_22727D794();
  v159 = os_log_type_enabled(v157, v158);
  v379 = v154;
  if (v159)
  {
    v160 = swift_slowAlloc();
    v161 = swift_slowAlloc();
    v325 = v115;
    v162 = v161;
    v382 = v161;
    *(_DWORD *)v160 = 134349314;
    v163 = objc_msgSend(v156, sel_type);

    v380 = (uint64_t)v163;
    sub_22727D920();

    *(_WORD *)(v160 + 12) = 2082;
    swift_bridgeObjectRetain();
    v380 = sub_2272403C4((uint64_t)v377, v122, (uint64_t *)&v382);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22723A000, v157, v158, "INAddMediaIntentHandler#resolveSearchItem for item with type: %{public}ld identifier: %{public}s", (uint8_t *)v160, 0x16u);
    swift_arrayDestroy();
    v164 = v162;
    v115 = v325;
    MEMORY[0x2276AF6D4](v164, -1, -1);
    MEMORY[0x2276AF6D4](v160, -1, -1);

    v115(v376, v332);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v115(v152, v155);
  }
  if (objc_msgSend(v156, sel_type) == (id)6)
  {
    v171 = v332;
    ((void (*)(char *, uint64_t, uint64_t))v103)(v374, v331, v332);
    v172 = sub_22727D4D0();
    v173 = sub_22727D794();
    v174 = os_log_type_enabled(v172, v173);
    v175 = v330;
    if (v174)
    {
      v176 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v176 = 0;
      _os_log_impl(&dword_22723A000, v172, v173, "INAddMediaIntentHandler#resolveSearchItem empty media item in privateAddMediaIntent data", v176, 2u);
      MEMORY[0x2276AF6D4](v176, -1, -1);
    }

    v115(v374, v171);
    sub_22727CC9C();
    v177 = objc_msgSend(v156, sel_title);
    if (v177)
    {
      v178 = v177;
      sub_22727D584();
      v180 = v179;

    }
    else
    {
      v180 = 0;
    }
    v185 = v156;
    v186 = objc_msgSend(v156, sel_artist);
    if (v186)
    {
      v187 = v186;
      sub_22727D584();
      v189 = v188;

    }
    else
    {
      v189 = 0;
    }
    v194 = (void *)sub_22727D578();
    swift_bridgeObjectRelease();
    if (v180)
    {
      v195 = (void *)sub_22727D578();
      swift_bridgeObjectRelease();
    }
    else
    {
      v195 = 0;
    }
    if (v189)
    {
      v196 = (void *)sub_22727D578();
      swift_bridgeObjectRelease();
    }
    else
    {
      v196 = 0;
    }
    v197 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9E50]), sel_initWithIdentifier_title_type_artwork_artist_, v194, v195, 6, 0, v196);

    v382 = v197;
    LOBYTE(v383) = 0;
    v175(&v382);

    swift_release();
    return;
  }
  if (v369)
  {
    v377 = v156;
    v328 = v103;
    v325 = v115;
    v378 = (char *)v369;
    if (objc_msgSend(v378, sel_mediaDestinationType) == 2)
    {
      v181 = v360;
      sub_22727CC78();
      sub_22727CC54();
      v182 = *(void (**)(char *, uint64_t))(v367 + 8);
      v182(v181, v371);
      v183 = *(void (**)(char *, _QWORD, uint64_t))(v373 + 104);
      v183(v366, *MEMORY[0x24BE91090], v372);
      sub_22723CA60((unint64_t *)&unk_2558CBD98, (uint64_t (*)(uint64_t))MEMORY[0x24BE910B8], MEMORY[0x24BE910C0]);
      sub_22727D608();
      sub_22727D608();
      if (v382 == v380 && v383 == v381)
        v184 = 1;
      else
        v184 = sub_22727DA10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v198 = v372;
      v199 = *(void (**)(char *, uint64_t))(v373 + 8);
      v199(v366, v372);
      v199(v365, v198);
      if ((v184 & 1) != 0)
        goto LABEL_70;
      v200 = v347;
      sub_22727CC78();
      v201 = v349;
      sub_22727CC54();
      v182(v200, v371);
      v202 = v348;
      v183(v348, *MEMORY[0x24BE910A0], v372);
      sub_22727D608();
      sub_22727D608();
      if (v382 == v380 && v383 == v381)
      {
        swift_bridgeObjectRelease_n();
        v203 = v372;
        v199(v202, v372);
        v199(v201, v203);
LABEL_70:
        v206 = v359;
        ((void (*)(char *, uint64_t, uint64_t))v328)(v359, v331, v332);
        v207 = sub_22727D4D0();
        v208 = sub_22727D794();
        if (os_log_type_enabled(v207, v208))
        {
          v209 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v209 = 0;
          _os_log_impl(&dword_22723A000, v207, v208, "INAddMediaIntentHandler#resolveSearchItem adding local item with ulid to playlist.", v209, 2u);
          MEMORY[0x2276AF6D4](v209, -1, -1);
        }

        v325(v206, v332);
        sub_22727CC9C();
        v210 = v377;
        v211 = -[NSObject title](v377, sel_title);
        if (v211)
        {
          v212 = v211;
          sub_22727D584();
          v214 = v213;

        }
        else
        {
          v214 = 0;
        }
        v221 = -[NSObject artist](v210, sel_artist);
        if (v221)
        {
          v222 = v221;
          sub_22727D584();
          v224 = v223;

        }
        else
        {
          v224 = 0;
        }
        v225 = (void *)sub_22727D578();
        swift_bridgeObjectRelease();
        v226 = v377;
        if (v214)
        {
          v227 = (void *)sub_22727D578();
          swift_bridgeObjectRelease();
        }
        else
        {
          v227 = 0;
        }
        if (v224)
        {
          v228 = (void *)sub_22727D578();
          swift_bridgeObjectRelease();
        }
        else
        {
          v228 = 0;
        }
        v229 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9E50]), sel_initWithIdentifier_title_type_artwork_artist_, v225, v227, 1, 0, v228);

        v382 = v229;
        LOBYTE(v383) = 0;
        v330(&v382);

        goto LABEL_154;
      }
      v204 = sub_22727DA10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v205 = v372;
      v199(v202, v372);
      v199(v201, v205);
      if ((v204 & 1) != 0)
        goto LABEL_70;
    }
    v215 = objc_msgSend(v378, sel_mediaDestinationType);
    v216 = v372;
    if (v215 == 1)
    {
      v217 = v352;
      sub_22727CC78();
      sub_22727CC54();
      v218 = *(void (**)(char *, uint64_t))(v367 + 8);
      v218(v217, v371);
      v219 = *(void (**)(char *, _QWORD, uint64_t))(v373 + 104);
      v219(v363, *MEMORY[0x24BE910A0], v216);
      sub_22723CA60((unint64_t *)&unk_2558CBD98, (uint64_t (*)(uint64_t))MEMORY[0x24BE910B8], MEMORY[0x24BE910C0]);
      sub_22727D608();
      sub_22727D608();
      if (v382 == v380 && v383 == v381)
        v220 = 1;
      else
        v220 = sub_22727DA10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v230 = *(void (**)(char *, uint64_t))(v373 + 8);
      v230(v363, v216);
      v230(v362, v216);
      if ((v220 & 1) != 0)
        goto LABEL_96;
      v231 = v343;
      sub_22727CC78();
      v232 = v344;
      sub_22727CC54();
      v218(v231, v371);
      v219(v357, *MEMORY[0x24BE91090], v216);
      sub_22727D608();
      sub_22727D608();
      if (v382 == v380 && v383 == v381)
      {
        swift_bridgeObjectRelease_n();
LABEL_94:
        v230(v357, v216);
        v230(v232, v216);
LABEL_96:
        v234 = v350;
        ((void (*)(char *, uint64_t, uint64_t))v328)(v350, v331, v332);
        v235 = sub_22727D4D0();
        v236 = sub_22727D788();
        if (os_log_type_enabled(v235, v236))
        {
          v237 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v237 = 0;
          _os_log_impl(&dword_22723A000, v235, v236, "INAddMediaIntentHandler#resolveSearchItem content source is .store or .ulid, the item is already in library.", v237, 2u);
          MEMORY[0x2276AF6D4](v237, -1, -1);
        }

        v325(v234, v332);
        v238 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, *MEMORY[0x24BDDA398]);
        v382 = v238;
        LOBYTE(v383) = 1;
        v330(&v382);

        swift_release();
        return;
      }
      v233 = sub_22727DA10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v230(v357, v216);
      v230(v232, v216);
      if ((v233 & 1) != 0)
        goto LABEL_96;
      v239 = v336;
      sub_22727CC78();
      sub_22727CC54();
      v218(v239, v371);
      v240 = v337;
      v219(v337, *MEMORY[0x24BE910B0], v216);
      sub_22727D608();
      sub_22727D608();
      if (v382 == v380 && v383 == v381)
      {
        swift_bridgeObjectRelease_n();
        v357 = v240;
        v232 = v341;
        goto LABEL_94;
      }
      v241 = sub_22727DA10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v230(v240, v216);
      v230(v341, v216);
      if ((v241 & 1) != 0)
        goto LABEL_96;
    }
    v242 = v353;
    sub_22727CC78();
    sub_22727CC54();
    v376 = *(char **)(v367 + 8);
    ((void (*)(char *, uint64_t))v376)(v242, v371);
    v243 = *(void (**)(char *, _QWORD, uint64_t))(v373 + 104);
    v244 = v354;
    v243(v354, *MEMORY[0x24BE91098], v216);
    sub_22723CA60((unint64_t *)&unk_2558CBD98, (uint64_t (*)(uint64_t))MEMORY[0x24BE910B8], MEMORY[0x24BE910C0]);
    sub_22727D608();
    sub_22727D608();
    if (v382 == v380 && v383 == v381)
      v245 = 1;
    else
      v245 = sub_22727DA10();
    v226 = v377;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v246 = *(void (**)(char *, uint64_t))(v373 + 8);
    v246(v244, v216);
    v246(v364, v216);
    if ((v245 & 1) == 0)
    {
      v247 = v345;
      sub_22727CC78();
      v248 = v346;
      sub_22727CC54();
      ((void (*)(char *, uint64_t))v376)(v247, v371);
      v243(v358, *MEMORY[0x24BE910B0], v216);
      sub_22727D608();
      sub_22727D608();
      if (v382 == v380 && v383 == v381)
      {
        swift_bridgeObjectRelease_n();
LABEL_115:
        v246(v358, v216);
        v246(v248, v216);
        goto LABEL_116;
      }
      v249 = sub_22727DA10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v246(v358, v216);
      v246(v248, v216);
      if ((v249 & 1) != 0)
        goto LABEL_116;
      v250 = v339;
      sub_22727CC78();
      sub_22727CC54();
      ((void (*)(char *, uint64_t))v376)(v250, v371);
      v251 = v340;
      v243(v340, *MEMORY[0x24BE910A0], v216);
      sub_22727D608();
      sub_22727D608();
      if (v382 == v380 && v383 == v381)
      {
        swift_bridgeObjectRelease_n();
        v358 = v251;
        v248 = v342;
        goto LABEL_115;
      }
      v307 = sub_22727DA10();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v246(v251, v216);
      v246(v342, v216);
      if ((v307 & 1) == 0)
      {
        v308 = v333;
        ((void (*)(char *, uint64_t, uint64_t))v328)(v333, v331, v332);
        v309 = sub_22727D4D0();
        v310 = sub_22727D788();
        if (os_log_type_enabled(v309, v310))
        {
          v311 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v311 = 0;
          _os_log_impl(&dword_22723A000, v309, v310, "INAddMediaIntentHandler#resolveSearchItem unexpected content source is not from store.", v311, 2u);
          MEMORY[0x2276AF6D4](v311, -1, -1);
        }

        v325(v308, v332);
        v312 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 6);
        v382 = v312;
        LOBYTE(v383) = 1;
        v330(&v382);

        goto LABEL_154;
      }
    }
LABEL_116:
    v252 = (void (*)(char *, uint64_t, uint64_t))v328;
    ((void (*)(char *, uint64_t, uint64_t))v328)(v361, v331, v332);
    v226 = v226;
    v253 = sub_22727D4D0();
    v254 = sub_22727D77C();
    if (os_log_type_enabled(v253, v254))
    {
      v255 = (uint8_t *)swift_slowAlloc();
      v256 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v255 = 138543362;
      v382 = v226;
      v257 = v226;
      v258 = v226;
      sub_22727D920();
      *v256 = v257;

      v226 = v257;
      _os_log_impl(&dword_22723A000, v253, v254, "INAddMediaIntentHandler#resolveSearchItem Constructing media item to add from item: %{public}@", v255, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
      swift_arrayDestroy();
      v259 = v256;
      v252 = (void (*)(char *, uint64_t, uint64_t))v328;
      MEMORY[0x2276AF6D4](v259, -1, -1);
      MEMORY[0x2276AF6D4](v255, -1, -1);
    }
    else
    {

      v253 = v226;
    }
    v260 = v355;

    v261 = v325;
    v325(v361, v332);
    v262 = v351;
    sub_22727CC78();
    v263 = v356;
    sub_22727CC60();
    ((void (*)(char *, uint64_t))v376)(v262, v371);
    v264 = v263;
    v265 = v327;
    v266 = (*(uint64_t (**)(char *, uint64_t))(v326 + 88))(v264, v327);
    if (v266 == *MEMORY[0x24BE910F0])
    {
      sub_22727CC9C();
      v267 = -[NSObject title](v226, sel_title);
      if (v267)
      {
        v268 = v267;
        sub_22727D584();
        v270 = v269;

      }
      else
      {
        v270 = 0;
      }
      v280 = -[NSObject artist](v226, sel_artist);
      if (v280)
      {
        v281 = v280;
        sub_22727D584();
        v283 = v282;

      }
      else
      {
        v283 = 0;
      }
      v284 = (void *)sub_22727D578();
      swift_bridgeObjectRelease();
      if (v270)
      {
        v285 = (void *)sub_22727D578();
        swift_bridgeObjectRelease();
      }
      else
      {
        v285 = 0;
      }
      if (v283)
      {
        v286 = (void *)sub_22727D578();
        swift_bridgeObjectRelease();
      }
      else
      {
        v286 = 0;
      }
      v287 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9E50]), sel_initWithIdentifier_title_type_artwork_artist_, v284, v285, 2, 0, v286);
    }
    else
    {
      if (v266 != *MEMORY[0x24BE910E8])
      {
        if (v266 != *MEMORY[0x24BE910F8])
        {
          v288 = v332;
          v252(v260, v331, v332);
          swift_retain_n();
          v289 = sub_22727D4D0();
          v290 = sub_22727D770();
          if (os_log_type_enabled(v289, v290))
          {
            v291 = (uint8_t *)swift_slowAlloc();
            v292 = swift_slowAlloc();
            v382 = v292;
            *(_DWORD *)v291 = 136315138;
            v377 = (v291 + 4);
            v293 = v334;
            sub_22727CC78();
            v294 = v335;
            sub_22727CC60();
            ((void (*)(char *, uint64_t))v376)(v293, v371);
            v295 = sub_22727CCB4();
            v296 = v226;
            v298 = v297;
            v299 = v294;
            v300 = v326;
            (*(void (**)(char *, uint64_t))(v326 + 8))(v299, v327);
            v380 = sub_2272403C4(v295, v298, (uint64_t *)&v382);
            sub_22727D920();
            swift_release_n();
            v226 = v296;
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_22723A000, v289, v290, "INAddMediaIntentHandler#resolveSearchItem unsupported scheme: %s", v291, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2276AF6D4](v292, -1, -1);
            v301 = v291;
            v265 = v327;
            MEMORY[0x2276AF6D4](v301, -1, -1);

            v325(v355, v332);
          }
          else
          {

            swift_release_n();
            v261(v260, v288);
            v300 = v326;
          }
          sub_227247C88(0, &qword_2558CBD68);
          v313 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
          v382 = v313;
          LOBYTE(v383) = 1;
          v330(&v382);

          swift_release();
          (*(void (**)(char *, uint64_t))(v300 + 8))(v356, v265);
          return;
        }
        v275 = v338;
        v252(v338, v331, v332);
        v276 = sub_22727D4D0();
        v277 = sub_22727D770();
        if (os_log_type_enabled(v276, v277))
        {
          v278 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v278 = 0;
          _os_log_impl(&dword_22723A000, v276, v277, "INAddMediaIntentHandler#resolveSearchItem the item is already in library with library scheme result", v278, 2u);
          MEMORY[0x2276AF6D4](v278, -1, -1);
        }

        v261(v275, v332);
        v279 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 6);
        v382 = v279;
        LOBYTE(v383) = 1;
        v330(&v382);

LABEL_154:
        swift_release();

        return;
      }
      sub_22727CC9C();
      v271 = -[NSObject title](v226, sel_title);
      if (v271)
      {
        v272 = v271;
        sub_22727D584();
        v274 = v273;

      }
      else
      {
        v274 = 0;
      }
      v302 = -[NSObject artist](v226, sel_artist);
      if (v302)
      {
        v303 = v302;
        sub_22727D584();
        v305 = v304;

      }
      else
      {
        v305 = 0;
      }
      v284 = (void *)sub_22727D578();
      swift_bridgeObjectRelease();
      if (v274)
      {
        v285 = (void *)sub_22727D578();
        swift_bridgeObjectRelease();
      }
      else
      {
        v285 = 0;
      }
      if (v305)
      {
        v286 = (void *)sub_22727D578();
        swift_bridgeObjectRelease();
      }
      else
      {
        v286 = 0;
      }
      v287 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9E50]), sel_initWithIdentifier_title_type_artwork_artist_, v284, v285, 1, 0, v286);
    }
    v306 = v287;

    v382 = v306;
    LOBYTE(v383) = 0;
    v330(&v382);

    goto LABEL_154;
  }
  ((void (*)(char *, uint64_t, uint64_t))v103)(v368, v331, v332);
  v190 = sub_22727D4D0();
  v191 = sub_22727D788();
  if (os_log_type_enabled(v190, v191))
  {
    v192 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v192 = 0;
    _os_log_impl(&dword_22723A000, v190, v191, "INAddMediaIntentHandler#resolveSearchItem Unexpected empty destination", v192, 2u);
    MEMORY[0x2276AF6D4](v192, -1, -1);
  }

  v115(v368, v332);
  v193 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 6);
  v382 = v193;
  LOBYTE(v383) = 1;
  v330(&v382);

  swift_release();
}

uint64_t sub_227260284(NSObject *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t (**v19)(uint64_t);
  NSObject *v21;
  void *v22;

  v21 = a1;
  v22 = a2;
  v6 = sub_22727D4C4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  v14 = qword_2558CB390;
  swift_retain();
  if (v14 != -1)
    swift_once();
  v15 = (id)logObject;
  sub_22727D4AC();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v16 = (*(unsigned __int8 *)(v7 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v17 = (v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = "addMediaIntentHandlerResolveSearchItem";
  *(_QWORD *)(v18 + 24) = 38;
  *(_BYTE *)(v18 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v16, v10, v6);
  v19 = (uint64_t (**)(uint64_t))(v18 + v17);
  *v19 = sub_227262EFC;
  v19[1] = (uint64_t (*)(uint64_t))v13;
  swift_retain();
  sub_22727D8D8();
  sub_22727D4A0();
  swift_retain();
  sub_22725D7C8(v21, v22, (void (*)(NSObject **))sub_227262F04, v18);
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  return swift_release();
}

void sub_227260474(void *a1, uint64_t a2, void (*a3)(_QWORD *), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  void (*v39)(char *, uint64_t);
  id v40;
  void *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint8_t *v48;
  char *v49;
  int v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  BOOL v61;
  uint64_t v62;
  uint8_t *v63;
  void *ObjCClassFromMetadata;
  uint64_t v65;
  char *v66;
  void *v67;
  id v68;
  int v69;
  uint64_t v70;
  char *v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  void *v75;
  void *v76;
  char *v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint8_t *v81;
  void *v82;
  char *v83;
  void *v84;
  void (*v85)(char *, uint64_t);
  id v86;
  char *v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  _QWORD *v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  uint64_t v102;
  void (*v103)(_QWORD *);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  id v109;
  void (*v110)(char *, uint64_t, uint64_t);
  _QWORD v111[2];

  v95 = a2;
  v109 = a1;
  v6 = sub_22727D1A0();
  v97 = *(_QWORD *)(v6 - 8);
  v98 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v96 = (char *)&v93 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = sub_22727D524();
  v108 = *(_QWORD *)(v106 - 8);
  v8 = MEMORY[0x24BDAC7A8](v106);
  v100 = (char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v101 = (char *)&v93 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v93 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v107 = (char *)&v93 - v15;
  v16 = sub_22727D4E8();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v93 = (char *)&v93 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v99 = (char *)&v93 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v94 = (char *)&v93 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v93 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v93 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v93 - v30;
  v32 = swift_allocObject();
  v103 = a3;
  *(_QWORD *)(v32 + 16) = a3;
  *(_QWORD *)(v32 + 24) = a4;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = sub_227263168;
  *(_QWORD *)(v33 + 24) = v32;
  v104 = v33;
  v34 = qword_2558CB378;
  v102 = a4;
  swift_retain();
  v105 = v32;
  swift_retain();
  if (v34 != -1)
    swift_once();
  v35 = __swift_project_value_buffer(v16, (uint64_t)qword_2558CC248);
  v110 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v110(v31, v35, v16);
  v36 = sub_22727D4D0();
  v37 = sub_22727D77C();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_22723A000, v36, v37, "INAddMediaIntentHandler#resolveMediaDestination", v38, 2u);
    MEMORY[0x2276AF6D4](v38, -1, -1);
  }

  v39 = *(void (**)(char *, uint64_t))(v17 + 8);
  v39(v31, v16);
  v40 = objc_msgSend(v109, sel_mediaDestination);
  if (!v40)
  {
    swift_release();
    v110(v26, v35, v16);
    v59 = sub_22727D4D0();
    v60 = sub_22727D794();
    v61 = os_log_type_enabled(v59, v60);
    v62 = v106;
    if (v61)
    {
      v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_22723A000, v59, v60, "INAddMediaIntentHandler#resolveMediaDestination missing destination, defaulting to library", v63, 2u);
      MEMORY[0x2276AF6D4](v63, -1, -1);
    }

    v39(v26, v16);
    sub_227247C88(0, &qword_2558CBD88);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    v65 = v108;
    v66 = v100;
    (*(void (**)(char *, _QWORD, uint64_t))(v108 + 104))(v100, *MEMORY[0x24BEE5A98], v62);
    v67 = (void *)sub_22727D50C();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v62);
    v68 = objc_msgSend(ObjCClassFromMetadata, sel_successWithResolvedMediaDestination_, v67);

    v111[0] = v68;
    v103(v111);
    goto LABEL_28;
  }
  v41 = v40;
  sub_22727D518();

  v43 = v107;
  v42 = v108;
  v44 = v106;
  (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v107, v14, v106);
  v110(v29, v35, v16);
  v45 = sub_22727D4D0();
  v46 = sub_22727D77C();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v47 = 0;
    _os_log_impl(&dword_22723A000, v45, v46, "INAddMediaIntentHandler#resolveMediaDestination resolving present destination...", v47, 2u);
    v48 = v47;
    v43 = v107;
    MEMORY[0x2276AF6D4](v48, -1, -1);
  }

  v39(v29, v16);
  v49 = v101;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v101, v43, v44);
  v50 = (*(uint64_t (**)(char *, uint64_t))(v42 + 88))(v49, v44);
  if (v50 != *MEMORY[0x24BEE5AA0])
  {
    v69 = v50;
    v70 = *MEMORY[0x24BEE5A98];
    swift_release();
    if (v69 != (_DWORD)v70)
    {
      v77 = v99;
      ((void (*)(void))v110)();
      v78 = sub_22727D4D0();
      v79 = sub_22727D794();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v80 = 0;
        _os_log_impl(&dword_22723A000, v78, v79, "INAddMediaIntentHandler#resolveMediaDestination defaulting to library, unsupported destination", v80, 2u);
        v81 = v80;
        v77 = v99;
        MEMORY[0x2276AF6D4](v81, -1, -1);
      }

      v39(v77, v16);
      sub_227247C88(0, &qword_2558CBD88);
      v82 = (void *)swift_getObjCClassFromMetadata();
      v83 = v100;
      (*(void (**)(char *, uint64_t, uint64_t))(v42 + 104))(v100, v70, v44);
      v84 = (void *)sub_22727D50C();
      v85 = *(void (**)(char *, uint64_t))(v42 + 8);
      v85(v83, v44);
      v86 = objc_msgSend(v82, sel_successWithResolvedMediaDestination_, v84);

      v111[0] = v86;
      v103(v111);
      v85(v43, v44);

      v85(v49, v44);
      goto LABEL_30;
    }
    v71 = v94;
    v110(v94, v35, v16);
    v72 = sub_22727D4D0();
    v73 = sub_22727D794();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_22723A000, v72, v73, "INAddMediaIntentHandler#resolveMediaDestination success with library", v74, 2u);
      MEMORY[0x2276AF6D4](v74, -1, -1);
    }

    v39(v71, v16);
    sub_227247C88(0, &qword_2558CBD88);
    v75 = (void *)swift_getObjCClassFromMetadata();
    v76 = (void *)sub_22727D50C();
    v68 = objc_msgSend(v75, sel_successWithResolvedMediaDestination_, v76);

    v111[0] = v68;
    goto LABEL_27;
  }
  (*(void (**)(char *, uint64_t))(v42 + 96))(v49, v44);
  v52 = *(_QWORD *)v49;
  v51 = *((_QWORD *)v49 + 1);
  v53 = HIBYTE(v51) & 0xF;
  if ((v51 & 0x2000000000000000) == 0)
    v53 = *(_QWORD *)v49 & 0xFFFFFFFFFFFFLL;
  if (!v53)
  {
    swift_bridgeObjectRelease();
    swift_release();
    v87 = v93;
    v110(v93, v35, v16);
    v88 = sub_22727D4D0();
    v89 = sub_22727D794();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v90 = 0;
      _os_log_impl(&dword_22723A000, v88, v89, "INAddMediaIntentHandler#resolveMediaDestination asking for playlist title", v90, 2u);
      MEMORY[0x2276AF6D4](v90, -1, -1);
    }

    v39(v87, v16);
    sub_227247C88(0, &qword_2558CBD88);
    v68 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
    v111[0] = v68;
LABEL_27:
    v103(v111);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
LABEL_28:
    swift_release();

    return;
  }
  v110 = (void (*)(char *, uint64_t, uint64_t))__swift_project_boxed_opaque_existential_1((_QWORD *)(v95+ OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library), *(_QWORD *)(v95+ OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library+ 24));
  v111[0] = v109;
  v54 = v96;
  v55 = v97;
  v56 = v98;
  (*(void (**)(char *, _QWORD, uint64_t))(v97 + 104))(v96, *MEMORY[0x24BE91650], v98);
  sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
  sub_22727D1B8();
  v58 = v57;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
  if (v58)
  {
    sub_22727D59C();
    swift_bridgeObjectRelease();
  }
  v91 = (_QWORD *)swift_allocObject();
  v91[2] = v52;
  v91[3] = v51;
  v92 = v104;
  v91[4] = sub_227263354;
  v91[5] = v92;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22727CE70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_release();
  (*(void (**)(char *, uint64_t))(v108 + 8))(v107, v44);
LABEL_30:
  swift_release();
}

void sub_227260EBC(NSObject *a1, char *a2, void (*a3)(NSObject **), unint64_t a4)
{
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(_QWORD);
  NSObject *v60;
  os_log_type_t v61;
  _QWORD *v62;
  uint8_t *v63;
  uint8_t *v64;
  void (*v65)(char *, _QWORD *);
  id v66;
  void *v67;
  unint64_t v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  id v74;
  void *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  NSObject *v81;
  uint64_t v82;
  os_log_type_t v83;
  _BOOL4 v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  unint64_t v93;
  void (*v94)(char *, uint64_t);
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  _QWORD *v102;
  NSObject *v103;
  void (*v104)(NSObject **);
  void (*v105)(char *, _QWORD *);
  id v106;
  void *v107;
  id v108;
  NSObject *v109;
  void (*v110)(char *, _QWORD *);
  uint64_t v111;
  NSObject *v112;
  os_log_type_t v113;
  uint8_t *v114;
  uint8_t *v115;
  char *v116;
  id v117;
  uint64_t v118;
  void *v119;
  void (*v120)(char *, uint64_t);
  uint64_t v121;
  uint64_t v122;
  char *v123;
  id v124;
  void *v125;
  id v126;
  id v127;
  NSObject *v128;
  os_log_type_t v129;
  uint8_t *v130;
  uint8_t *v131;
  uint64_t *v132;
  uint64_t v133;
  int v134;
  NSObject *v135;
  char *v136;
  char *v137;
  void (*v138)(char *, uint64_t);
  char *v139;
  uint64_t v140;
  int v141;
  int v142;
  char *v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  NSObject *v156;
  os_log_type_t v157;
  uint8_t *v158;
  uint8_t *v159;
  id v160;
  void *v161;
  id v162;
  NSObject *v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  unint64_t v168;
  char *v169;
  NSObject *v170;
  os_log_type_t v171;
  BOOL v172;
  uint8_t *v173;
  uint64_t v174;
  char *v175;
  _QWORD *v176;
  NSObject *v177;
  os_log_type_t v178;
  uint8_t *v179;
  uint8_t *v180;
  id v181;
  void *v182;
  id v183;
  NSObject *v184;
  id v185;
  void *v186;
  _QWORD *v187;
  uint64_t v188;
  id v189;
  id v190;
  void (*v191)(NSObject *, uint64_t, _QWORD *);
  char *v192;
  uint64_t v193;
  uint64_t v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  _QWORD *v198;
  uint64_t v199;
  _QWORD *v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  id v204;
  char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  char *v210;
  uint64_t v211;
  uint64_t v212;
  char *v213;
  uint64_t v214;
  char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  _QWORD *v219;
  NSObject *v220;
  uint64_t v221;
  char *v222;
  NSObject *v223;
  os_log_type_t v224;
  uint8_t *v225;
  uint8_t *v226;
  id v227;
  void *v228;
  id v229;
  NSObject *v230;
  _QWORD *v231;
  void *v232;
  uint64_t v233;
  uint64_t v234;
  id v235;
  _QWORD *v236;
  uint64_t v237;
  uint64_t v238;
  NSObject *v239;
  NSObject *v240;
  NSObject *v241;
  os_log_type_t v242;
  uint8_t *v243;
  _QWORD *v244;
  NSObject *v245;
  void (*v246)(NSObject **);
  id v247;
  void *v248;
  id v249;
  uint64_t v250;
  os_log_t v251;
  uint64_t v252;
  void (*v253)(char *, char *, uint64_t);
  uint64_t v254;
  id v255;
  void (*v256)(char *, _QWORD *);
  char *v257;
  char *v258;
  char *v259;
  char *v260;
  char *v261;
  char *v262;
  char *v263;
  NSObject *v264;
  char *v265;
  char *v266;
  uint64_t v267;
  uint64_t v268;
  char *v269;
  char *v270;
  uint64_t v271;
  char *v272;
  uint64_t v273;
  char *v274;
  uint64_t v275;
  uint64_t v276;
  NSObject *v277;
  NSObject *v278;
  char *v279;
  uint64_t v280;
  uint64_t v281;
  char *v282;
  void (*v283)(NSObject **);
  unint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void (*v288)(NSObject *, uint64_t, _QWORD *);
  NSObject *v289;
  _QWORD *v290;
  uint64_t v291;
  NSObject *v292;

  v274 = a2;
  v268 = sub_22727CC90();
  v267 = *(_QWORD *)(v268 - 8);
  MEMORY[0x24BDAC7A8](v268);
  v266 = (char *)&v250 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v273 = sub_22727D1A0();
  v271 = *(_QWORD *)(v273 - 8);
  MEMORY[0x24BDAC7A8](v273);
  v272 = (char *)&v250 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22727CC6C();
  v275 = *(_QWORD *)(v9 - 8);
  v276 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v262 = (char *)&v250 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v258 = (char *)&v250 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v259 = (char *)&v250 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v265 = (char *)&v250 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v261 = (char *)&v250 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v269 = (char *)&v250 - v20;
  v21 = sub_22727D524();
  v22 = *(_QWORD *)(v21 - 8);
  v280 = v21;
  v281 = v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v270 = (char *)&v250 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v279 = (char *)&v250 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v250 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v282 = (char *)&v250 - v30;
  v31 = sub_22727D4E8();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v35 = ((char *)&v250 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  v36 = MEMORY[0x24BDAC7A8](v33);
  v257 = (char *)&v250 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v260 = (char *)&v250 - v39;
  v40 = MEMORY[0x24BDAC7A8](v38);
  v264 = ((char *)&v250 - v41);
  v42 = MEMORY[0x24BDAC7A8](v40);
  v263 = (char *)&v250 - v43;
  v44 = MEMORY[0x24BDAC7A8](v42);
  v278 = ((char *)&v250 - v45);
  v46 = MEMORY[0x24BDAC7A8](v44);
  v277 = ((char *)&v250 - v47);
  v48 = MEMORY[0x24BDAC7A8](v46);
  v50 = ((char *)&v250 - v49);
  v51 = MEMORY[0x24BDAC7A8](v48);
  v289 = ((char *)&v250 - v52);
  MEMORY[0x24BDAC7A8](v51);
  v54 = (char *)&v250 - v53;
  v55 = swift_allocObject();
  v283 = a3;
  *(_QWORD *)(v55 + 16) = a3;
  *(_QWORD *)(v55 + 24) = a4;
  v56 = swift_allocObject();
  *(_QWORD *)(v56 + 16) = sub_227263168;
  *(_QWORD *)(v56 + 24) = v55;
  v284 = a4;
  v285 = v56;
  v57 = qword_2558CB378;
  swift_retain();
  v286 = v55;
  swift_retain();
  if (v57 != -1)
    swift_once();
  v58 = __swift_project_value_buffer(v31, (uint64_t)qword_2558CC248);
  v59 = *(void (**)(_QWORD))(v32 + 16);
  v287 = v58;
  v288 = (void (*)(NSObject *, uint64_t, _QWORD *))v59;
  v59(v54);
  v60 = sub_22727D4D0();
  v61 = sub_22727D77C();
  v62 = (_QWORD *)v31;
  if (os_log_type_enabled(v60, v61))
  {
    v63 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v63 = 0;
    _os_log_impl(&dword_22723A000, v60, v61, "INAddMediaIntentHandler#handle", v63, 2u);
    v64 = v63;
    v62 = (_QWORD *)v31;
    MEMORY[0x2276AF6D4](v64, -1, -1);
  }

  v65 = *(void (**)(char *, _QWORD *))(v32 + 8);
  v65(v54, v62);
  v66 = -[NSObject mediaItems](a1, sel_mediaItems);
  v290 = v62;
  if (!v66)
  {
    swift_release();
LABEL_75:
    v239 = v289;
    v288(v289, v287, v62);
    v240 = a1;
    v241 = sub_22727D4D0();
    v242 = sub_22727D788();
    if (os_log_type_enabled(v241, v242))
    {
      v243 = (uint8_t *)swift_slowAlloc();
      v244 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v243 = 138543362;
      v292 = v240;
      v245 = v240;
      sub_22727D920();
      *v244 = v240;

      _os_log_impl(&dword_22723A000, v241, v242, "INAddMediaIntentHandler#handle missing expected mediaItem or destination in intent: %{public}@", v243, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
      swift_arrayDestroy();
      v239 = v289;
      MEMORY[0x2276AF6D4](v244, -1, -1);
      MEMORY[0x2276AF6D4](v243, -1, -1);
    }
    else
    {

      v241 = v240;
    }
    v246 = v283;

    v65((char *)v239, v290);
    v247 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v248 = (void *)sub_22727D578();
    v249 = objc_msgSend(v247, sel_initWithActivityType_, v248);

    v163 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 5, v249);
    v292 = v163;
    v246(&v292);
LABEL_79:
    swift_release();

    return;
  }
  v67 = v66;
  sub_227247C88(0, (unint64_t *)&qword_2558CB810);
  v68 = sub_22727D638();

  if (!(v68 >> 62))
  {
    if (*(_QWORD *)((v68 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
LABEL_74:
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_75;
  }
  swift_bridgeObjectRetain();
  v238 = sub_22727D9BC();
  swift_bridgeObjectRelease();
  if (!v238)
    goto LABEL_74;
LABEL_8:
  v256 = v65;
  if ((v68 & 0xC000000000000001) != 0)
  {
    v69 = (id)MEMORY[0x2276AF200](0, v68);
  }
  else
  {
    if (!*(_QWORD *)((v68 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v69 = *(id *)(v68 + 32);
  }
  v70 = v69;
  swift_bridgeObjectRelease();
  v71 = -[NSObject mediaDestination](a1, sel_mediaDestination);
  if (!v71)
  {

    swift_release();
    v65 = v256;
    goto LABEL_75;
  }
  v72 = v71;
  v289 = a1;
  sub_22727D518();

  v73 = v280;
  (*(void (**)(char *, char *, uint64_t))(v281 + 32))(v282, v29, v280);
  v74 = objc_msgSend(v70, sel_identifier);
  if (v74)
  {
    v75 = v74;
    sub_22727D584();

    sub_22727CCCC();
    swift_allocObject();
    v62 = v290;
    v76 = v279;
    v77 = sub_22727CCD8();
    if (v77)
    {
      v78 = v77;
      v288(v50, v287, v62);
      v79 = v281;
      v253 = *(void (**)(char *, char *, uint64_t))(v281 + 16);
      v253(v76, v282, v73);
      v80 = v70;
      v81 = sub_22727D4D0();
      v82 = v73;
      v83 = sub_22727D794();
      v84 = os_log_type_enabled(v81, v83);
      v254 = v78;
      v85 = v76;
      if (v84)
      {
        v86 = swift_slowAlloc();
        v255 = v80;
        v87 = v86;
        v88 = swift_slowAlloc();
        v251 = v81;
        v89 = (_QWORD *)v88;
        v250 = v88;
        v90 = swift_slowAlloc();
        v252 = v90;
        *(_DWORD *)v87 = 138543618;
        v291 = (uint64_t)v255;
        v292 = v90;
        v91 = v255;
        sub_22727D920();
        *v89 = v255;

        *(_WORD *)(v87 + 12) = 2080;
        v92 = sub_22727D500();
        v291 = sub_2272403C4(v92, v93, (uint64_t *)&v292);
        v62 = v290;
        sub_22727D920();
        swift_bridgeObjectRelease();
        v94 = *(void (**)(char *, uint64_t))(v79 + 8);
        v82 = v280;
        v94(v85, v280);
        v81 = v251;
        _os_log_impl(&dword_22723A000, v251, v83, "INAddMediaIntentHandler#handle item: %{public}@ and destination: %s", (uint8_t *)v87, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
        v95 = v250;
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v95, -1, -1);
        v96 = v252;
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v96, -1, -1);
        v97 = v87;
        v80 = v255;
        MEMORY[0x2276AF6D4](v97, -1, -1);
      }
      else
      {

        v94 = *(void (**)(char *, uint64_t))(v79 + 8);
        v94(v85, v82);
      }

      v110 = v256;
      v256((char *)v50, v62);
      v111 = v82;
      if (objc_msgSend(v80, sel_type) == (id)6)
      {
        v288(v277, v287, v62);
        v112 = sub_22727D4D0();
        v113 = sub_22727D77C();
        if (os_log_type_enabled(v112, v113))
        {
          v114 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v114 = 0;
          _os_log_impl(&dword_22723A000, v112, v113, "INAddMediaIntentHandler#handle subscribing to podcast...", v114, 2u);
          v115 = v114;
          v62 = v290;
          MEMORY[0x2276AF6D4](v115, -1, -1);
        }

        v110((char *)v277, v62);
        v116 = v269;
        sub_22727CC78();
        sub_22727CC48();
        (*(void (**)(char *, uint64_t))(v275 + 8))(v116, v276);
        v117 = objc_allocWithZone((Class)sub_22727CA80());
        v118 = sub_22727CA74();
        if (v118)
        {
          v119 = (void *)v118;
          v120 = v94;
          v292 = v289;
          v121 = v271;
          v123 = v272;
          v122 = v273;
          (*(void (**)(char *, _QWORD, uint64_t))(v271 + 104))(v272, *MEMORY[0x24BE91650], v273);
          sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
          sub_22727D1B8();
          (*(void (**)(char *, uint64_t))(v121 + 8))(v123, v122);
          v124 = objc_msgSend(v80, sel_privateMediaItemValueData);
          v125 = v124;
          if (v124)
          {
            v126 = v80;
            v127 = objc_msgSend(v124, sel_sharedUserIdFromPlayableMusicAccount);

            if (v127)
            {
              sub_22727D584();

            }
            v80 = v126;
          }
          v185 = objc_allocWithZone((Class)sub_22727CA98());
          v186 = (void *)sub_22727CA8C();
          v187 = (_QWORD *)swift_allocObject();
          v187[2] = v119;
          v187[3] = v186;
          v188 = v285;
          v187[4] = sub_2272636B0;
          v187[5] = v188;
          v189 = v119;
          v190 = v186;
          sub_22727CBAC();

          swift_release();
          swift_release();
          v120(v282, v111);
          goto LABEL_67;
        }
        swift_release();
        v155 = v263;
        v288(v263, v287, v62);
        v156 = sub_22727D4D0();
        v157 = sub_22727D788();
        if (os_log_type_enabled(v156, v157))
        {
          v158 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v158 = 0;
          _os_log_impl(&dword_22723A000, v156, v157, "Failed to get store id", v158, 2u);
          v159 = v158;
          v62 = v290;
          MEMORY[0x2276AF6D4](v159, -1, -1);
        }

        v110(v155, v62);
        v160 = objc_allocWithZone(MEMORY[0x24BDD1960]);
        v161 = (void *)sub_22727D578();
        v162 = objc_msgSend(v160, sel_initWithActivityType_, v161);

        v163 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 5, v162);
        v292 = v163;
        v283(&v292);

        swift_release();
        v94(v282, v111);
        goto LABEL_79;
      }
      v288(v278, v287, v62);
      v128 = sub_22727D4D0();
      v129 = sub_22727D77C();
      if (os_log_type_enabled(v128, v129))
      {
        v130 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v130 = 0;
        _os_log_impl(&dword_22723A000, v128, v129, "INAddMediaIntentHandler#handle adding for music...", v130, 2u);
        v131 = v130;
        v62 = v290;
        MEMORY[0x2276AF6D4](v131, -1, -1);
      }

      v110((char *)v278, v62);
      v132 = (uint64_t *)v270;
      v253(v270, v282, v111);
      v133 = v281;
      v134 = (*(uint64_t (**)(uint64_t *, uint64_t))(v281 + 88))(v132, v111);
      if (v134 != *MEMORY[0x24BEE5AA0])
      {
        if (v134 != *MEMORY[0x24BEE5A98])
        {
          swift_release();
          v288(v264, v287, v62);
          v177 = sub_22727D4D0();
          v178 = sub_22727D77C();
          if (os_log_type_enabled(v177, v178))
          {
            v179 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v179 = 0;
            _os_log_impl(&dword_22723A000, v177, v178, "INAddMediaIntentHandler#handle unexpected destination for add intent", v179, 2u);
            v180 = v179;
            v62 = v290;
            MEMORY[0x2276AF6D4](v180, -1, -1);
          }

          v110((char *)v264, v62);
          v181 = objc_allocWithZone(MEMORY[0x24BDD1960]);
          v182 = (void *)sub_22727D578();
          v183 = objc_msgSend(v181, sel_initWithActivityType_, v182);

          v184 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 5, v183);
          v292 = v184;
          v283(&v292);

          swift_release();
          v94(v282, v111);

          v94(v270, v111);
          goto LABEL_67;
        }
        v255 = v80;
        v279 = (char *)v94;
        v290 = __swift_project_boxed_opaque_existential_1(&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], *(_QWORD *)&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24]);
        v149 = v261;
        sub_22727CC78();
        sub_22727CC48();
        (*(void (**)(char *, uint64_t))(v275 + 8))(v149, v276);
        v292 = v289;
        v150 = v271;
        v152 = v272;
        v151 = v273;
        (*(void (**)(char *, _QWORD, uint64_t))(v271 + 104))(v272, *MEMORY[0x24BE91650], v273);
        sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
        sub_22727D1B8();
        v154 = v153;
        (*(void (**)(char *, uint64_t))(v150 + 8))(v152, v151);
        if (v154)
        {
          sub_22727D59C();
          swift_bridgeObjectRelease();
        }
        v200 = (_QWORD *)swift_allocObject();
        v200[2] = 0xD00000000000002ALL;
        v200[3] = 0x800000022727FDF0;
        v201 = v274;
        v202 = v254;
        v200[4] = v274;
        v200[5] = v202;
        v203 = v285;
        v200[6] = sub_2272636B0;
        v200[7] = v203;
        swift_bridgeObjectRetain();
        v204 = v201;
        swift_retain();
        sub_22727CE1C();

        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_release();
        v205 = v282;
        v206 = v111;
        goto LABEL_66;
      }
      (*(void (**)(uint64_t *, uint64_t))(v133 + 96))(v132, v111);
      v135 = v132[1];
      v281 = *v132;
      v136 = v265;
      sub_22727CC78();
      v137 = v266;
      sub_22727CC54();
      v138 = *(void (**)(char *, uint64_t))(v275 + 8);
      v139 = v136;
      v140 = v276;
      v138(v139, v276);
      v141 = (*(uint64_t (**)(char *, uint64_t))(v267 + 88))(v137, v268);
      v142 = *MEMORY[0x24BE910A0];
      v279 = (char *)v94;
      if (v141 == v142)
      {
        v255 = v80;
        v290 = __swift_project_boxed_opaque_existential_1(&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], *(_QWORD *)&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24]);
        v143 = v262;
        sub_22727CC78();
        sub_22727CC48();
        v138(v143, v140);
        v292 = v289;
        v144 = v271;
        v145 = v272;
        v146 = v273;
        (*(void (**)(char *, _QWORD, uint64_t))(v271 + 104))(v272, *MEMORY[0x24BE91650], v273);
        sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
        sub_22727D1B8();
        v148 = v147;
        (*(void (**)(char *, uint64_t))(v144 + 8))(v145, v146);
        if (v148)
        {
          sub_22727D59C();
          swift_bridgeObjectRelease();
        }
        v198 = (_QWORD *)swift_allocObject();
        v198[2] = v281;
        v198[3] = v135;
        v198[4] = 0xD00000000000002ALL;
        v198[5] = 0x800000022727FDF0;
        v199 = v285;
        v198[6] = sub_2272636B0;
        v198[7] = v199;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_22727CE64();

        swift_bridgeObjectRelease();
      }
      else
      {
        if (v141 == *MEMORY[0x24BE910B0])
        {
          v164 = v269;
          v165 = v140;
          sub_22727CC78();
          v166 = sub_22727CC3C();
          v168 = v167;
          v138(v164, v165);
          v169 = v260;
          v288(v260, v287, v62);
          swift_bridgeObjectRetain_n();
          v170 = sub_22727D4D0();
          v171 = sub_22727D794();
          v172 = os_log_type_enabled(v170, v171);
          v278 = v135;
          v283 = (void (*)(NSObject **))v166;
          v284 = v168;
          if (v172)
          {
            v173 = (uint8_t *)swift_slowAlloc();
            v174 = swift_slowAlloc();
            v292 = v174;
            *(_DWORD *)v173 = 136315138;
            swift_bridgeObjectRetain();
            v291 = sub_2272403C4(v166, v168, (uint64_t *)&v292);
            sub_22727D920();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_22723A000, v170, v171, "INAddMediaIntentHandler#handle trying to add item with siriSyncID: %s", v173, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x2276AF6D4](v174, -1, -1);
            MEMORY[0x2276AF6D4](v173, -1, -1);

            v175 = v260;
            v176 = v290;
          }
          else
          {

            swift_bridgeObjectRelease_n();
            v175 = v169;
            v176 = v62;
          }
          v110(v175, v176);
          v207 = (uint64_t)v289;
          __swift_project_boxed_opaque_existential_1(&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], *(_QWORD *)&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24]);
          v292 = v207;
          v208 = v271;
          v210 = v272;
          v209 = v273;
          (*(void (**)(char *, _QWORD, uint64_t))(v271 + 104))(v272, *MEMORY[0x24BE91650], v273);
          sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
          sub_22727D1B8();
          v212 = v211;
          (*(void (**)(char *, uint64_t))(v208 + 8))(v210, v209);
          if (v212)
          {
            sub_22727D59C();
            swift_bridgeObjectRelease();
          }
          v219 = (_QWORD *)swift_allocObject();
          v220 = v278;
          v219[2] = v281;
          v219[3] = v220;
          v219[4] = 0xD00000000000002ALL;
          v219[5] = 0x800000022727FDF0;
          v221 = v285;
          v219[6] = sub_2272636B0;
          v219[7] = v221;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_22727CE40();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          goto LABEL_65;
        }
        if (v141 == *MEMORY[0x24BE91098])
        {
          v191 = *(void (**)(NSObject *, uint64_t, _QWORD *))&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library
                                                                           + 32];
          v287 = *(_QWORD *)&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24];
          v288 = v191;
          v290 = __swift_project_boxed_opaque_existential_1(&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], v287);
          v192 = v259;
          sub_22727CC78();
          sub_22727CC48();
          v138(v192, v140);
          v292 = v289;
          v193 = v271;
          v195 = v272;
          v194 = v273;
          (*(void (**)(char *, _QWORD, uint64_t))(v271 + 104))(v272, *MEMORY[0x24BE91650], v273);
          sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
          sub_22727D1B8();
          v197 = v196;
          (*(void (**)(char *, uint64_t))(v193 + 8))(v195, v194);
          if (v197)
          {
            sub_22727D59C();
            swift_bridgeObjectRelease();
          }
          v231 = (_QWORD *)swift_allocObject();
          v231[2] = v281;
          v231[3] = v135;
          v231[4] = 0xD00000000000002ALL;
          v231[5] = 0x800000022727FDF0;
          v232 = v274;
          v233 = v254;
          v231[6] = v274;
          v231[7] = v233;
          v234 = v285;
          v231[8] = sub_2272636B0;
          v231[9] = v234;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v235 = v232;
          swift_retain();
          sub_22727CE58();

          swift_bridgeObjectRelease();
          swift_release();
          goto LABEL_56;
        }
        if (v141 != *MEMORY[0x24BE91090])
        {
          swift_bridgeObjectRelease();
          swift_release();
          v222 = v257;
          v288(v257, v287, v62);
          v223 = sub_22727D4D0();
          v224 = sub_22727D77C();
          if (os_log_type_enabled(v223, v224))
          {
            v225 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v225 = 0;
            _os_log_impl(&dword_22723A000, v223, v224, "INAddMediaIntentHandler#handle unexpected content origin for add intent", v225, 2u);
            v226 = v225;
            v62 = v290;
            MEMORY[0x2276AF6D4](v226, -1, -1);
          }

          v110(v222, v62);
          v227 = objc_allocWithZone(MEMORY[0x24BDD1960]);
          v228 = (void *)sub_22727D578();
          v229 = objc_msgSend(v227, sel_initWithActivityType_, v228);

          v230 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 5, v229);
          v292 = v230;
          v283(&v292);

          swift_release();
          v94(v282, v280);

          (*(void (**)(char *, uint64_t))(v267 + 8))(v266, v268);
          goto LABEL_67;
        }
        v255 = v80;
        v290 = __swift_project_boxed_opaque_existential_1(&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library], *(_QWORD *)&v274[OBJC_IVAR____TtC17SiriAudioInternal23INAddMediaIntentHandler_library + 24]);
        v213 = v258;
        sub_22727CC78();
        sub_22727CC48();
        v138(v213, v140);
        v292 = v289;
        v214 = v271;
        v215 = v272;
        v216 = v273;
        (*(void (**)(char *, _QWORD, uint64_t))(v271 + 104))(v272, *MEMORY[0x24BE91650], v273);
        sub_227247C88(0, (unint64_t *)&unk_2558CBD50);
        sub_22727D1B8();
        v218 = v217;
        (*(void (**)(char *, uint64_t))(v214 + 8))(v215, v216);
        if (v218)
        {
          sub_22727D59C();
          swift_bridgeObjectRelease();
        }
        v236 = (_QWORD *)swift_allocObject();
        v236[2] = v281;
        v236[3] = v135;
        v236[4] = 0xD00000000000002ALL;
        v236[5] = 0x800000022727FDF0;
        v237 = v285;
        v236[6] = sub_2272636B0;
        v236[7] = v237;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_22727CE4C();

        swift_bridgeObjectRelease();
      }
      swift_release();
LABEL_56:
      swift_bridgeObjectRelease();
LABEL_65:
      swift_bridgeObjectRelease_n();
      swift_release();
      v205 = v282;
      v206 = v280;
LABEL_66:
      ((void (*)(char *, uint64_t))v279)(v205, v206);
LABEL_67:
      swift_release();
      return;
    }
  }
  swift_release();
  v288(v35, v287, v62);
  v98 = v70;
  v99 = sub_22727D4D0();
  v100 = sub_22727D788();
  if (os_log_type_enabled(v99, v100))
  {
    v101 = (uint8_t *)swift_slowAlloc();
    v102 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v101 = 138543362;
    v292 = v98;
    v103 = v98;
    v73 = v280;
    sub_22727D920();
    *v102 = v98;

    _os_log_impl(&dword_22723A000, v99, v100, "INAddMediaIntentHandler#handle item missing identifier: %{public}@, or create PlaybackItem failed.", v101, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v102, -1, -1);
    MEMORY[0x2276AF6D4](v101, -1, -1);
  }
  else
  {

    v99 = v98;
  }
  v104 = v283;
  v105 = v256;

  v105((char *)v35, v290);
  v106 = objc_allocWithZone(MEMORY[0x24BDD1960]);
  v107 = (void *)sub_22727D578();
  v108 = objc_msgSend(v106, sel_initWithActivityType_, v107);

  v109 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9B90]), sel_initWithCode_userActivity_, 5, v108);
  v292 = v109;
  v104(&v292);

  (*(void (**)(char *, uint64_t))(v281 + 8))(v282, v73);
  swift_release();

}

uint64_t sub_227262E70(uint64_t a1)
{
  return sub_227262EC8(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22725C64C);
}

uint64_t objectdestroy_21Tm()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_227262EBC(uint64_t a1)
{
  return sub_227262EC8(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22725CAD0);
}

uint64_t sub_227262EC8(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8], v2[9]);
}

uint64_t sub_227262F08(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  char v3;
  uint64_t v5;
  char v6;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v3 = *((_BYTE *)a1 + 8);
  v5 = *a1;
  v6 = v3;
  return v2(&v5);
}

uint64_t sub_227262F44(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

void sub_227262F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  sub_227259E7C(a1, a2, a3, a4, a5, a6, a7, *(void (**)(void))(v7 + 16), *(_QWORD *)(v7 + 24), *(char **)(v7 + 32), *(void **)(v7 + 40));
}

uint64_t sub_227262FB0()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_227262FEC(int a1)
{
  uint64_t v1;

  sub_22725A09C(a1, *(void (**)(void))(v1 + 16), *(_QWORD *)(v1 + 24), *(char **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(void **)(v1 + 56));
}

uint64_t sub_227262FFC()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_227263038(uint64_t a1)
{
  return sub_227263310(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22725A3B8);
}

uint64_t sub_227263044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_22727CD68();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_2272630D8(char a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_22727CD68() - 8) + 80);
  sub_22725B4B0(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(void))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(void **)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), v1 + ((v3 + 88) & ~v3));
}

uint64_t sub_22726313C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_227263160(uint64_t a1)
{
  uint64_t v1;

  sub_227256100(a1, *(_QWORD *)(v1 + 16));
}

void sub_227263170(uint64_t a1)
{
  sub_227263218(a1, (char *)0x3731325452494DLL, 0x3631325452494DLL);
}

void sub_227263198(uint64_t a1)
{
  sub_227263218(a1, (char *)0x3531325452494DLL, 0x3431325452494DLL);
}

uint64_t objectdestroy_66Tm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_2272631F4(uint64_t a1)
{
  sub_227263218(a1, (char *)0x3331325452494DLL, 0x3231325452494DLL);
}

void sub_227263218(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3;

  sub_227257D6C(a1, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(void (**)(void *))(v3 + 48), *(_QWORD *)(v3 + 56), a2, a3);
}

uint64_t sub_22726324C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_227263290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_227257604(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), *(void (**)(void *))(v3 + 64), *(_QWORD *)(v3 + 72));
}

uint64_t sub_2272632C8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_227263304(uint64_t a1)
{
  return sub_227263310(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_227256F54);
}

uint64_t sub_227263310(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

void sub_227263328(void **a1)
{
  uint64_t *v1;

  sub_22725689C(a1, v1[2], v1[3], v1[4], v1[5]);
}

void sub_227263334(uint64_t a1)
{
  uint64_t v1;

  sub_227256998(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_227263354(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_227263384()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_2272633B0(void *a1)
{
  uint64_t v1;

  sub_227256354(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(_QWORD))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_2272633C0(uint64_t a1, char a2)
{
  return sub_227263448(a1, a2);
}

uint64_t sub_2272633E0(void *a1, char a2)
{
  uint64_t v2;

  return sub_227255BA0(a1, a2 & 1, *(void **)(v2 + 16), *(void **)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t objectdestroy_81Tm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22726342C(uint64_t a1, char a2)
{
  return sub_227263448(a1, a2);
}

uint64_t sub_227263448(uint64_t a1, char a2)
{
  uint64_t *v2;

  return sub_227256010(a1, a2 & 1, v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_227263480()
{
  id *v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2272634BC(uint64_t a1)
{
  uint64_t v1;

  return sub_227259244(a1, *(void (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t objectdestroy_39Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_227263504(char a1)
{
  uint64_t v1;

  return sub_227259674(a1, *(void (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_227263510(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_22727D4C4();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2272635B8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(sub_22727D4C4() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_22725D69C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), v1 + v4, *(uint64_t (**)(uint64_t *))(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_227263614(void (*a1)(id *), uint64_t a2)
{
  uint64_t v2;

  sub_22725839C(a1, a2, *(_QWORD **)(v2 + 16), *(_BYTE *)(v2 + 24), *(void **)(v2 + 32), *(char **)(v2 + 40));
}

uint64_t sub_227263624()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_227263648(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2272550DC(a1, a2, (_QWORD *)(v2 + 16));
}

uint64_t sub_227263650(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_227255190(a1, a2, *(uint64_t (**)(_QWORD))(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t INMediaItem.isInternalSignalPresent(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  SEL *v5;
  SEL *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  uint64_t result;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = a1 + 32;
    swift_bridgeObjectRetain();
    v4 = 0;
    v5 = (SEL *)&unk_24EF8C000;
    v6 = (SEL *)&unk_24EF8C000;
    v24 = v2;
    while (1)
    {
      v7 = (uint64_t *)(v3 + 16 * v4);
      v9 = *v7;
      v8 = v7[1];
      swift_bridgeObjectRetain();
      v10 = objc_msgSend(v1, v5[464]);
      if (!v10)
        goto LABEL_21;
      v11 = v10;
      v12 = objc_msgSend(v10, v6[510]);

      if (!v12)
        goto LABEL_21;
      v13 = (_QWORD *)sub_22727D638();

      v14 = v13[2];
      if (!v14)
        break;
      v15 = v13[4] == v9 && v13[5] == v8;
      if (v15 || (v16 = v1, v17 = v3, result = sub_22727DA10(), (result & 1) != 0))
      {
LABEL_25:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v23 = 1;
        goto LABEL_27;
      }
      if (v14 != 1)
      {
        v19 = v13 + 7;
        v20 = 1;
        while (1)
        {
          v21 = v20 + 1;
          if (__OFADD__(v20, 1))
            break;
          if (*(v19 - 1) == v9 && *v19 == v8)
            goto LABEL_25;
          result = sub_22727DA10();
          if ((result & 1) != 0)
            goto LABEL_25;
          v19 += 2;
          ++v20;
          if (v21 == v14)
            goto LABEL_20;
        }
        __break(1u);
        return result;
      }
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v3 = v17;
      v1 = v16;
      v2 = v24;
      v5 = (SEL *)&unk_24EF8C000;
      v6 = (SEL *)&unk_24EF8C000;
LABEL_22:
      if (++v4 == v2)
      {
        v23 = 0;
LABEL_27:
        swift_bridgeObjectRelease();
        return v23;
      }
    }
    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  return 0;
}

uint64_t sub_227263880()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for InternalSignalsManager();
  v0 = swift_allocObject();
  sub_22727CB34();
  sub_22727CB28();
  sub_22727CC18();
  swift_allocObject();
  result = sub_22727CC00();
  *(_QWORD *)(v0 + 16) = result;
  off_2558CBDC0 = (_UNKNOWN *)v0;
  return result;
}

uint64_t static InternalSignalsManager.doesIntent(_:haveInternalSignalWith:)(void *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, unint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t *v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  char *v32;
  uint8_t *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v38;
  char *v39;
  char *v40;
  void (*v41)(char *, unint64_t);
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v42 = a1;
  v43 = a2;
  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v38 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v38 - v12;
  if (qword_2558CB388 != -1)
    goto LABEL_22;
  while (1)
  {
    v39 = v11;
    swift_retain();
    sub_22727CBF4();
    swift_release();
    if (qword_2558CB378 != -1)
      swift_once();
    v40 = v8;
    v14 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
    v15 = *(void (**)(char *, uint64_t, unint64_t))(v5 + 16);
    v15(v13, v14, v4);
    v16 = sub_22727D4D0();
    v17 = sub_22727D794();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_22723A000, v16, v17, "InternalSignalsManager#doesIntent#haveInternalSignalWith (lock aquired)", v18, 2u);
      MEMORY[0x2276AF6D4](v18, -1, -1);
    }

    v19 = v4;
    v41 = *(void (**)(char *, unint64_t))(v5 + 8);
    v41(v13, v4);
    v20 = (char *)_s17SiriAudioInternal0C14SignalsManagerC08internalD03forSaySSGSo8INIntentC_tFZ_0(v42);
    v11 = v20;
    v8 = (char *)*((_QWORD *)v20 + 2);
    if (!v8)
      break;
    v13 = (char *)*((_QWORD *)v20 + 4);
    v5 = *((_QWORD *)v20 + 5);
    swift_bridgeObjectRetain();
    if ((sub_22727D5F0() & 1) != 0)
    {
LABEL_8:
      swift_bridgeObjectRelease();
      v21 = v39;
      v15(v39, v14, v19);
      swift_bridgeObjectRetain();
      v22 = sub_22727D4D0();
      v23 = sub_22727D794();
      if (os_log_type_enabled(v22, v23))
      {
        v43 = v19;
        v24 = (uint8_t *)swift_slowAlloc();
        v25 = swift_slowAlloc();
        v45 = v25;
        *(_DWORD *)v24 = 136315138;
        swift_bridgeObjectRetain();
        v44 = sub_2272403C4((uint64_t)v13, v5, &v45);
        sub_22727D920();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22723A000, v22, v23, "InternalSignalsManager#doesIntent#haveInternalSignalWith %s is present. (unlock)", v24, 0xCu);
        v26 = 1;
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v25, -1, -1);
        MEMORY[0x2276AF6D4](v24, -1, -1);

        v41(v21, v43);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v41(v21, v19);
        v26 = 1;
      }
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
    if (v8 == (char *)1)
      break;
    v27 = (unint64_t *)(v11 + 56);
    v4 = 1;
    while (v4 < *((_QWORD *)v11 + 2))
    {
      v13 = (char *)*(v27 - 1);
      v5 = *v27;
      swift_bridgeObjectRetain();
      if ((sub_22727D5F0() & 1) != 0)
        goto LABEL_8;
      swift_bridgeObjectRelease();
      ++v4;
      v27 += 2;
      if (v8 == (char *)v4)
        goto LABEL_15;
    }
    __break(1u);
LABEL_22:
    swift_once();
  }
LABEL_15:
  swift_bridgeObjectRelease();
  v28 = v40;
  v15(v40, v14, v19);
  swift_bridgeObjectRetain_n();
  v29 = sub_22727D4D0();
  v30 = sub_22727D794();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = v19;
    v32 = v28;
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    v45 = v34;
    *(_DWORD *)v33 = 136315138;
    swift_bridgeObjectRetain();
    v44 = sub_2272403C4(v43, a3, &v45);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22723A000, v29, v30, "InternalSignalsManager#doesIntenthaveInternalSignalWith prefix: %s is not present in intent. (unlock)", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v34, -1, -1);
    MEMORY[0x2276AF6D4](v33, -1, -1);

    v35 = v32;
    v36 = v31;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v35 = v28;
    v36 = v19;
  }
  v41(v35, v36);
  v26 = 0;
LABEL_20:
  swift_retain();
  sub_22727CC0C();
  swift_release();
  return v26;
}

uint64_t static InternalSignalsManager.getSignal(with:from:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  void **v25;
  unint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v42 = a1;
  v43 = a2;
  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v40 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v40 - v11;
  if (qword_2558CB388 != -1)
    goto LABEL_22;
  while (1)
  {
    swift_retain();
    sub_22727CBF4();
    swift_release();
    if (qword_2558CB378 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v14(v12, v13, v4);
    v15 = sub_22727D4D0();
    v16 = sub_22727D794();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_22723A000, v15, v16, "InternalSignalsManager#getSignal (lock aquired)", v17, 2u);
      MEMORY[0x2276AF6D4](v17, -1, -1);
    }

    v41 = *(void (**)(char *, uint64_t))(v5 + 8);
    v41(v12, v4);
    v18 = (_QWORD *)_s17SiriAudioInternal0C14SignalsManagerC08internalD03forSaySSGSo8INIntentC_tFZ_0(a3);
    v19 = v18;
    v5 = v18[2];
    if (!v5)
      break;
    v12 = (char *)v18[4];
    a3 = (void *)v18[5];
    swift_bridgeObjectRetain();
    if ((sub_22727D5F0() & 1) != 0)
    {
LABEL_8:
      swift_bridgeObjectRelease();
      v20 = v40;
      v14(v40, v13, v4);
      swift_bridgeObjectRetain_n();
      v21 = sub_22727D4D0();
      v22 = sub_22727D794();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        v24 = swift_slowAlloc();
        v45 = v24;
        *(_DWORD *)v23 = 136315138;
        swift_bridgeObjectRetain();
        v44 = sub_2272403C4((uint64_t)v12, (unint64_t)a3, &v45);
        sub_22727D920();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22723A000, v21, v22, "InternalSignalsManager#getSignal returning signal: %s. (unlock)", v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v24, -1, -1);
        MEMORY[0x2276AF6D4](v23, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v41(v20, v4);
      swift_retain();
      sub_22727CC0C();
      swift_release();
      v31 = sub_22727D5C0();
      v32 = sub_227265A8C(v31, (uint64_t)v12, (unint64_t)a3);
      v34 = v33;
      v36 = v35;
      v38 = v37;
      swift_bridgeObjectRelease();
      v30 = MEMORY[0x2276AEE10](v32, v34, v36, v38);
      swift_bridgeObjectRelease();
      return v30;
    }
    swift_bridgeObjectRelease();
    if (v5 == 1)
      break;
    v25 = (void **)(v19 + 7);
    v26 = 1;
    while (v26 < v19[2])
    {
      v12 = (char *)*(v25 - 1);
      a3 = *v25;
      swift_bridgeObjectRetain();
      if ((sub_22727D5F0() & 1) != 0)
        goto LABEL_8;
      swift_bridgeObjectRelease();
      ++v26;
      v25 += 2;
      if (v5 == v26)
        goto LABEL_15;
    }
    __break(1u);
LABEL_22:
    swift_once();
  }
LABEL_15:
  swift_bridgeObjectRelease();
  v14(v8, v13, v4);
  v27 = sub_22727D4D0();
  v28 = sub_22727D794();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_22723A000, v27, v28, "InternalSignalsManager#getSignal could not find signal. (unlock)", v29, 2u);
    MEMORY[0x2276AF6D4](v29, -1, -1);
  }

  v41(v8, v4);
  swift_retain();
  sub_22727CC0C();
  swift_release();
  return 0;
}

void static InternalSignalsManager.add(_:to:)(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v6 = sub_22727D4E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v46 - v11;
  if (qword_2558CB378 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v6, (uint64_t)qword_2558CC248);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v51 = v13;
  v52 = v14;
  ((void (*)(char *))v14)(v12);
  swift_bridgeObjectRetain_n();
  v15 = a3;
  v16 = sub_22727D4D0();
  v17 = sub_22727D794();
  v18 = os_log_type_enabled(v16, v17);
  v53 = a1;
  if (v18)
  {
    v19 = swift_slowAlloc();
    v49 = v10;
    v20 = v19;
    v46 = (_QWORD *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v55 = v48;
    *(_DWORD *)v20 = 136315394;
    v50 = v6;
    swift_bridgeObjectRetain();
    v54 = sub_2272403C4(a1, a2, &v55);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v20 + 12) = 2112;
    v47 = v7;
    v54 = (uint64_t)v15;
    v21 = a2;
    v22 = v15;
    v6 = v50;
    sub_22727D920();
    v23 = v46;
    *v46 = v15;

    a2 = v21;
    _os_log_impl(&dword_22723A000, v16, v17, "InternalSignalsManager#add signal: %s, to intent: %@...", (uint8_t *)v20, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v23, -1, -1);
    v24 = v48;
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v24, -1, -1);
    v25 = v20;
    v10 = v49;
    MEMORY[0x2276AF6D4](v25, -1, -1);

    v26 = *(void (**)(char *, uint64_t))(v47 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v26 = *(void (**)(char *, uint64_t))(v7 + 8);
  }
  v26(v12, v6);
  objc_opt_self();
  v27 = swift_dynamicCastObjCClass();
  if (v27)
  {
    v28 = (void *)v27;
    v29 = qword_2558CB388;
    v30 = v15;
    if (v29 != -1)
      swift_once();
    sub_227264888(v53, a2, v28);

  }
  else
  {
    objc_opt_self();
    v31 = swift_dynamicCastObjCClass();
    if (v31)
    {
      v32 = (void *)v31;
      v33 = qword_2558CB388;
      v34 = v15;
      if (v33 != -1)
        swift_once();
      sub_227265B28(v53, a2, v32);

    }
    else
    {
      objc_opt_self();
      v35 = swift_dynamicCastObjCClass();
      if (v35)
      {
        v36 = (void *)v35;
        v37 = qword_2558CB388;
        v38 = v15;
        if (v37 != -1)
          swift_once();
        sub_227265FF8(v53, a2, v36);

      }
      else
      {
        objc_opt_self();
        v39 = swift_dynamicCastObjCClass();
        if (v39)
        {
          v40 = (void *)v39;
          v41 = qword_2558CB388;
          v42 = v15;
          if (v41 != -1)
            swift_once();
          sub_2272664C8(v53, a2, v40);

        }
        else
        {
          v52(v10, v51, v6);
          v43 = sub_22727D4D0();
          v44 = sub_22727D788();
          if (os_log_type_enabled(v43, v44))
          {
            v45 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v45 = 0;
            _os_log_impl(&dword_22723A000, v43, v44, "InternalSignalsManager#add Unexpected intent type when adding internal signal", v45, 2u);
            MEMORY[0x2276AF6D4](v45, -1, -1);
          }

          v26(v10, v6);
        }
      }
    }
  }
}

uint64_t sub_227264888(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  char *v21;
  void *v22;
  char *v23;
  uint8_t *v24;
  uint8_t *v25;
  void (*v26)(char *, uint64_t);
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  os_log_type_t v37;
  char *v38;
  uint8_t *v39;
  uint64_t v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v48 = a2;
  v49 = a1;
  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v46 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v46 - v12;
  if (qword_2558CB388 != -1)
    swift_once();
  swift_retain();
  sub_22727CBF4();
  swift_release();
  if (qword_2558CB378 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v15(v13, v14, v4);
  v16 = sub_22727D4D0();
  v17 = sub_22727D794();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v46 = v4;
    v19 = v14;
    v20 = v15;
    v21 = v8;
    v22 = a3;
    v23 = v11;
    v24 = v18;
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_22723A000, v16, v17, "InternalSignalsManager#add#fromPlayMediaIntent (lock aquired)", v18, 2u);
    v25 = v24;
    v11 = v23;
    a3 = v22;
    v8 = v21;
    v15 = v20;
    v14 = v19;
    v4 = v46;
    MEMORY[0x2276AF6D4](v25, -1, -1);
  }

  v26 = *(void (**)(char *, uint64_t))(v5 + 8);
  v26(v13, v4);
  v27 = objc_msgSend(a3, sel_backingStore);
  objc_opt_self();
  v28 = (void *)swift_dynamicCastObjCClass();
  if (v28)
  {
    v29 = v28;
    v47 = v26;
    v30 = objc_msgSend(v28, sel_privatePlayMediaIntentData);

    if (!v30)
    {
      v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA330]), sel_init);
      objc_msgSend(v29, sel_setPrivatePlayMediaIntentData_, v31);

    }
    v32 = objc_msgSend(v29, sel_privatePlayMediaIntentData);
    v33 = v48;
    if (v32)
    {
      v34 = v32;
      v35 = (void *)sub_22727D578();
      objc_msgSend(v34, sel_addInternalSignal_, v35);

    }
    v15(v11, v14, v4);
    swift_bridgeObjectRetain_n();
    v36 = sub_22727D4D0();
    v37 = sub_22727D794();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = v11;
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v51 = v40;
      *(_DWORD *)v39 = 136315138;
      swift_bridgeObjectRetain();
      v50 = sub_2272403C4(v49, v33, &v51);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22723A000, v36, v37, "InternalSignalsManager#add#fromPlayMediaIntent added %s to playMediaIntent. (unlock)", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v40, -1, -1);
      MEMORY[0x2276AF6D4](v39, -1, -1);

      v41 = v38;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v41 = v11;
    }
    v47(v41, v4);
    swift_retain();
    sub_22727CC0C();

    return swift_release();
  }
  else
  {

    v15(v8, v14, v4);
    v42 = sub_22727D4D0();
    v43 = sub_22727D788();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_22723A000, v42, v43, "InternalSignalsManager#add#fromPlayMediaIntent Unexpected backing store error adding internal signal. (unlock)", v44, 2u);
      MEMORY[0x2276AF6D4](v44, -1, -1);
    }

    v26(v8, v4);
    return sub_22727CC0C();
  }
}

void static InternalSignalsManager.remove(_:from:)(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *);
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *);
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v6 = sub_22727D4E8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v42 - v11;
  if (qword_2558CB378 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v6, (uint64_t)qword_2558CC248);
  v14 = *(void (**)(char *))(v7 + 16);
  v47 = v13;
  v14(v12);
  swift_bridgeObjectRetain_n();
  v15 = sub_22727D4D0();
  v16 = sub_22727D794();
  if (os_log_type_enabled(v15, v16))
  {
    v46 = v6;
    v17 = swift_slowAlloc();
    v44 = v14;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v43 = v7;
    v20 = v19;
    v49 = v19;
    v45 = a3;
    *(_DWORD *)v18 = 136315138;
    swift_bridgeObjectRetain();
    v48 = sub_2272403C4(a1, a2, &v49);
    a3 = v45;
    v6 = v46;
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22723A000, v15, v16, "InternalSignalsManager#remove %s...", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v20, -1, -1);
    v21 = v18;
    v14 = v44;
    MEMORY[0x2276AF6D4](v21, -1, -1);

    v22 = *(void (**)(char *, uint64_t))(v43 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v22 = *(void (**)(char *, uint64_t))(v7 + 8);
  }
  v22(v12, v6);
  objc_opt_self();
  v23 = swift_dynamicCastObjCClass();
  if (v23)
  {
    v24 = (void *)v23;
    v25 = qword_2558CB388;
    v26 = a3;
    if (v25 != -1)
      swift_once();
    sub_227266998(a1, a2, v24);

  }
  else
  {
    objc_opt_self();
    v27 = swift_dynamicCastObjCClass();
    if (v27)
    {
      v28 = (void *)v27;
      v29 = qword_2558CB388;
      v30 = a3;
      if (v29 != -1)
        swift_once();
      sub_227266F28(a1, a2, v28);

    }
    else
    {
      objc_opt_self();
      v31 = swift_dynamicCastObjCClass();
      if (v31)
      {
        v32 = (void *)v31;
        v33 = qword_2558CB388;
        v34 = a3;
        if (v33 != -1)
          swift_once();
        sub_2272674B8(a1, a2, v32);

      }
      else
      {
        objc_opt_self();
        v35 = swift_dynamicCastObjCClass();
        if (v35)
        {
          v36 = (void *)v35;
          v37 = qword_2558CB388;
          v38 = a3;
          if (v37 != -1)
            swift_once();
          sub_227267A48(a1, a2, v36);

        }
        else
        {
          ((void (*)(char *, uint64_t, uint64_t))v14)(v10, v47, v6);
          v39 = sub_22727D4D0();
          v40 = sub_22727D788();
          if (os_log_type_enabled(v39, v40))
          {
            v41 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v41 = 0;
            _os_log_impl(&dword_22723A000, v39, v40, "InternalSignalsManager#remove Unexpected intent type when removing internal signal", v41, 2u);
            MEMORY[0x2276AF6D4](v41, -1, -1);
          }

          v22(v10, v6);
        }
      }
    }
  }
}

uint64_t sub_2272651F0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  BOOL v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v13;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_22727DA10() & 1) != 0)
    return 0;
  v9 = 0;
  v10 = a3 + 7;
  v11 = 1;
  while (1)
  {
    if (v3 == v11)
      return 0;
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2)
      break;
    v13 = sub_22727DA10();
    result = v11++;
    v10 += 2;
    if ((v13 & 1) != 0)
      return result;
  }
  return v9;
}

uint64_t sub_2272652D4(unint64_t a1)
{
  _QWORD **v1;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;

  v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_227265404(v3);
  v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    v5 = v4 - 1;
    v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      v7 = &v3[2 * a1];
      v8 = v7[4];
      memmove(v7 + 4, v7 + 6, 16 * v6);
      v3[2] = v5;
      *v1 = v3;
      return v8;
    }
  }
  result = sub_22727D9E0();
  __break(1u);
  return result;
}

uint64_t InternalSignalsManager.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t InternalSignalsManager.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2272653F0(unint64_t a1)
{
  return sub_227278A3C(0, *(_QWORD *)(a1 + 16), 0, a1);
}

_QWORD *sub_227265404(_QWORD *a1)
{
  return sub_227278930(0, a1[2], 0, a1);
}

uint64_t _s17SiriAudioInternal0C14SignalsManagerC08internalD03forSaySSGSo8INIntentC_tFZ_0(void *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;

  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = a1;
    v5 = objc_msgSend(v3, sel_privatePlayMediaIntentData);
    if (v5)
      goto LABEL_12;
LABEL_14:
    v14 = MEMORY[0x24BEE4AF8];
    goto LABEL_15;
  }
  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    v7 = (void *)v6;
    v4 = a1;
    v5 = objc_msgSend(v7, sel_privateAddMediaIntentData);
    if (!v5)
      goto LABEL_14;
  }
  else
  {
    objc_opt_self();
    v8 = swift_dynamicCastObjCClass();
    if (v8)
    {
      v9 = (void *)v8;
      v4 = a1;
      v5 = objc_msgSend(v9, sel_privateUpdateMediaAffinityIntentData);
      if (!v5)
        goto LABEL_14;
    }
    else
    {
      objc_opt_self();
      v10 = swift_dynamicCastObjCClass();
      if (!v10)
        return MEMORY[0x24BEE4AF8];
      v11 = (void *)v10;
      v4 = a1;
      v5 = objc_msgSend(v11, sel_privateSearchForMediaIntentData);
      if (!v5)
        goto LABEL_14;
    }
  }
LABEL_12:
  v12 = v5;
  v13 = objc_msgSend(v5, sel_internalSignals);

  if (!v13)
    goto LABEL_14;
  v14 = sub_22727D638();

  v4 = v13;
LABEL_15:

  return v14;
}

uint64_t _s17SiriAudioInternal0C14SignalsManagerC10doesIntent_4haveSbSo8INIntentC_SaySSGtFZ_0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  char *v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  char *v46;

  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v43 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v37 - v8;
  if (qword_2558CB388 != -1)
    goto LABEL_40;
  while (1)
  {
    swift_retain();
    sub_22727CBF4();
    swift_release();
    if (qword_2558CB378 != -1)
      swift_once();
    v10 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v11(v9, v10, v4);
    v12 = sub_22727D4D0();
    v13 = sub_22727D794();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_22723A000, v12, v13, "InternalSignalsManager#doesIntent#have (lock aquired)", v14, 2u);
      MEMORY[0x2276AF6D4](v14, -1, -1);
    }

    v44 = *(void (**)(char *, uint64_t))(v5 + 8);
    v44(v9, v4);
    v15 = _s17SiriAudioInternal0C14SignalsManagerC08internalD03forSaySSGSo8INIntentC_tFZ_0(a1);
    v16 = v15;
    v5 = *(_QWORD *)(a2 + 16);
    if (!v5)
      break;
    v38 = v10;
    v39 = v11;
    v40 = a2;
    v41 = v4;
    v17 = 0;
    v18 = a2 + 32;
    v19 = *(_QWORD *)(v15 + 16);
    v42 = (_QWORD *)(v15 + 56);
    while (1)
    {
      if (v19)
      {
        v20 = v18 + 16 * v17;
        a1 = *(void **)v20;
        v9 = *(char **)(v20 + 8);
        v21 = *(_QWORD *)(v16 + 32) == *(_QWORD *)v20 && *(_QWORD *)(v16 + 40) == (_QWORD)v9;
        if (v21 || (sub_22727DA10() & 1) != 0)
        {
LABEL_25:
          swift_bridgeObjectRelease();
          v24 = 1;
LABEL_26:
          v4 = v41;
          v25 = v43;
          v39(v43, v38, v41);
          goto LABEL_28;
        }
        if (v19 != 1)
          break;
      }
LABEL_8:
      if (++v17 == v5)
      {
        swift_bridgeObjectRelease();
        v24 = 0;
        goto LABEL_26;
      }
    }
    v22 = v42;
    v4 = 1;
    while (1)
    {
      a2 = v4 + 1;
      if (__OFADD__(v4, 1))
        break;
      v23 = (void *)*(v22 - 1) == a1 && *v22 == (_QWORD)v9;
      if (v23 || (sub_22727DA10() & 1) != 0)
        goto LABEL_25;
      v22 += 2;
      ++v4;
      if (a2 == v19)
        goto LABEL_8;
    }
    __break(1u);
LABEL_40:
    swift_once();
  }
  swift_bridgeObjectRelease();
  v24 = 0;
  v25 = v43;
  v11(v43, v10, v4);
LABEL_28:
  swift_bridgeObjectRetain_n();
  v26 = sub_22727D4D0();
  v27 = sub_22727D794();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = swift_slowAlloc();
    v43 = (char *)swift_slowAlloc();
    v46 = v43;
    *(_DWORD *)v28 = 136315394;
    v29 = swift_bridgeObjectRetain();
    v30 = MEMORY[0x2276AEEAC](v29, MEMORY[0x24BEE0D00]);
    v32 = v31;
    swift_bridgeObjectRelease();
    v45 = sub_2272403C4(v30, v32, (uint64_t *)&v46);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    if ((_DWORD)v24)
      v33 = 0;
    else
      v33 = 7630702;
    if ((_DWORD)v24)
      v34 = 0xE000000000000000;
    else
      v34 = 0xE300000000000000;
    v45 = sub_2272403C4(v33, v34, (uint64_t *)&v46);
    sub_22727D920();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v26, v27, "InternalSignalsManager#doesIntent signals: %s %s present in intent. (unlock)", (uint8_t *)v28, 0x16u);
    v35 = v43;
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v35, -1, -1);
    MEMORY[0x2276AF6D4](v28, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v44(v25, v4);
  swift_retain();
  sub_22727CC0C();
  swift_release();
  return v24;
}

unint64_t sub_227265A8C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_22727D5CC();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_22727D5FC();
  }
  __break(1u);
  return result;
}

uint64_t sub_227265B28(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void (*v18)(char *, uint64_t);
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  void *v26;
  void *v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;

  v38 = a2;
  v39 = a1;
  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v37 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v37 - v11;
  if (qword_2558CB388 != -1)
    swift_once();
  swift_retain();
  sub_22727CBF4();
  swift_release();
  if (qword_2558CB378 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v12, v13, v4);
  v15 = sub_22727D4D0();
  v16 = sub_22727D794();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22723A000, v15, v16, "InternalSignalsManager#add#fromAddMediaIntent (lock aquired)", v17, 2u);
    MEMORY[0x2276AF6D4](v17, -1, -1);
  }

  v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v12, v4);
  v19 = objc_msgSend(a3, sel_backingStore);
  objc_opt_self();
  v20 = (void *)swift_dynamicCastObjCClass();
  if (v20)
  {
    v21 = v20;
    v22 = objc_msgSend(v20, sel_privateAddMediaIntentData);

    if (!v22)
    {
      v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA318]), sel_init);
      objc_msgSend(v21, sel_setPrivateAddMediaIntentData_, v23);

    }
    v24 = objc_msgSend(v21, sel_privateAddMediaIntentData);
    v25 = v38;
    if (v24)
    {
      v26 = v24;
      v27 = (void *)sub_22727D578();
      objc_msgSend(v26, sel_addInternalSignal_, v27);

    }
    v28 = v40;
    v14(v40, v13, v4);
    swift_bridgeObjectRetain_n();
    v29 = sub_22727D4D0();
    v30 = sub_22727D794();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v42 = v32;
      *(_DWORD *)v31 = 136315138;
      swift_bridgeObjectRetain();
      v41 = sub_2272403C4(v39, v25, &v42);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22723A000, v29, v30, "InternalSignalsManager#add#fromAddMediaIntent added %s to addMediaIntent. (unlock)", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v32, -1, -1);
      MEMORY[0x2276AF6D4](v31, -1, -1);

      v18(v40, v4);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v18(v28, v4);
    }
    swift_retain();
    sub_22727CC0C();

  }
  else
  {

    v14(v8, v13, v4);
    v33 = sub_22727D4D0();
    v34 = sub_22727D788();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_22723A000, v33, v34, "InternalSignalsManager#add#fromAddMediaIntent Unexpected backing store error while adding internal signal. (unlock)", v35, 2u);
      MEMORY[0x2276AF6D4](v35, -1, -1);
    }

    v18(v8, v4);
    swift_retain();
    sub_22727CC0C();
  }
  return swift_release();
}

uint64_t sub_227265FF8(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void (*v18)(char *, uint64_t);
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  void *v26;
  void *v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;

  v38 = a2;
  v39 = a1;
  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v37 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v37 - v11;
  if (qword_2558CB388 != -1)
    swift_once();
  swift_retain();
  sub_22727CBF4();
  swift_release();
  if (qword_2558CB378 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v12, v13, v4);
  v15 = sub_22727D4D0();
  v16 = sub_22727D794();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22723A000, v15, v16, "InternalSignalsManager#add#fromUpdateMediaAffinityIntent (lock aquired)", v17, 2u);
    MEMORY[0x2276AF6D4](v17, -1, -1);
  }

  v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v12, v4);
  v19 = objc_msgSend(a3, sel_backingStore);
  objc_opt_self();
  v20 = (void *)swift_dynamicCastObjCClass();
  if (v20)
  {
    v21 = v20;
    v22 = objc_msgSend(v20, sel_privateUpdateMediaAffinityIntentData);

    if (!v22)
    {
      v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA340]), sel_init);
      objc_msgSend(v21, sel_setPrivateUpdateMediaAffinityIntentData_, v23);

    }
    v24 = objc_msgSend(v21, sel_privateUpdateMediaAffinityIntentData);
    v25 = v38;
    if (v24)
    {
      v26 = v24;
      v27 = (void *)sub_22727D578();
      objc_msgSend(v26, sel_addInternalSignal_, v27);

    }
    v28 = v40;
    v14(v40, v13, v4);
    swift_bridgeObjectRetain_n();
    v29 = sub_22727D4D0();
    v30 = sub_22727D794();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v42 = v32;
      *(_DWORD *)v31 = 136315138;
      swift_bridgeObjectRetain();
      v41 = sub_2272403C4(v39, v25, &v42);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22723A000, v29, v30, "InternalSignalsManager#add#fromUpdateMediaAffinityIntent added %s to updateMediaIntent. (unlock)", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v32, -1, -1);
      MEMORY[0x2276AF6D4](v31, -1, -1);

      v18(v40, v4);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v18(v28, v4);
    }
    swift_retain();
    sub_22727CC0C();

  }
  else
  {

    v14(v8, v13, v4);
    v33 = sub_22727D4D0();
    v34 = sub_22727D788();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_22723A000, v33, v34, "InternalSignalsManager#add#fromUpdateMediaAffinityIntent Unexpected backing store error while adding internal signal. (unlock)", v35, 2u);
      MEMORY[0x2276AF6D4](v35, -1, -1);
    }

    v18(v8, v4);
    swift_retain();
    sub_22727CC0C();
  }
  return swift_release();
}

uint64_t sub_2272664C8(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void (*v18)(char *, uint64_t);
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  void *v26;
  void *v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;

  v38 = a2;
  v39 = a1;
  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v37 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v37 - v11;
  if (qword_2558CB388 != -1)
    swift_once();
  swift_retain();
  sub_22727CBF4();
  swift_release();
  if (qword_2558CB378 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14(v12, v13, v4);
  v15 = sub_22727D4D0();
  v16 = sub_22727D794();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22723A000, v15, v16, "InternalSignalsManager#add#fromSearchMediaIntent (lock aquired)", v17, 2u);
    MEMORY[0x2276AF6D4](v17, -1, -1);
  }

  v18 = *(void (**)(char *, uint64_t))(v5 + 8);
  v18(v12, v4);
  v19 = objc_msgSend(a3, sel_backingStore);
  objc_opt_self();
  v20 = (void *)swift_dynamicCastObjCClass();
  if (v20)
  {
    v21 = v20;
    v22 = objc_msgSend(v20, sel_privateSearchForMediaIntentData);

    if (!v22)
    {
      v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA338]), sel_init);
      objc_msgSend(v21, sel_setPrivateSearchForMediaIntentData_, v23);

    }
    v24 = objc_msgSend(v21, sel_privateSearchForMediaIntentData);
    v25 = v38;
    if (v24)
    {
      v26 = v24;
      v27 = (void *)sub_22727D578();
      objc_msgSend(v26, sel_addInternalSignal_, v27);

    }
    v28 = v40;
    v14(v40, v13, v4);
    swift_bridgeObjectRetain_n();
    v29 = sub_22727D4D0();
    v30 = sub_22727D794();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v42 = v32;
      *(_DWORD *)v31 = 136315138;
      swift_bridgeObjectRetain();
      v41 = sub_2272403C4(v39, v25, &v42);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22723A000, v29, v30, "InternalSignalsManager#add#fromSearchMediaIntent added %s to searchMediaIntent. (unlock)", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v32, -1, -1);
      MEMORY[0x2276AF6D4](v31, -1, -1);

      v18(v40, v4);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v18(v28, v4);
    }
    swift_retain();
    sub_22727CC0C();

  }
  else
  {

    v14(v8, v13, v4);
    v33 = sub_22727D4D0();
    v34 = sub_22727D788();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_22723A000, v33, v34, "InternalSignalsManager#add#fromSearchMediaIntent Unexpected backing store error while adding internal signal. (unlock)", v35, 2u);
      MEMORY[0x2276AF6D4](v35, -1, -1);
    }

    v18(v8, v4);
    swift_retain();
    sub_22727CC0C();
  }
  return swift_release();
}

uint64_t sub_227266998(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  unint64_t v19;
  char *v20;
  uint8_t *v21;
  uint8_t *v22;
  void (*v23)(char *, uint64_t);
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  char v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;

  v52 = a1;
  v5 = sub_22727D4E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v51 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v51 - v13;
  if (qword_2558CB388 != -1)
    swift_once();
  swift_retain();
  sub_22727CBF4();
  swift_release();
  if (qword_2558CB378 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v5, (uint64_t)qword_2558CC248);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v53 = v15;
  v54 = v16;
  ((void (*)(char *))v16)(v14);
  v17 = sub_22727D4D0();
  v18 = sub_22727D794();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = a2;
    v20 = v12;
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_22723A000, v17, v18, "InternalSignalsManager#remove#fromPlayMediaIntent (lock aquired)", v21, 2u);
    v22 = v21;
    v12 = v20;
    a2 = v19;
    MEMORY[0x2276AF6D4](v22, -1, -1);
  }

  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v14, v5);
  v24 = objc_msgSend(a3, sel_backingStore);
  objc_opt_self();
  v25 = (void *)swift_dynamicCastObjCClass();
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, sel_privatePlayMediaIntentData);
    if (v27)
    {
      v28 = v27;
      v29 = objc_msgSend(v27, sel_internalSignals);

      if (v29)
      {
        v30 = sub_22727D638();
        v51 = v12;
        v31 = (_QWORD *)v30;

        v32 = sub_2272651F0(v52, a2, v31);
        v34 = v33;
        v12 = v51;
        swift_bridgeObjectRelease();
        if ((v34 & 1) == 0)
        {
          v35 = objc_msgSend(v26, sel_privatePlayMediaIntentData);
          if (v35)
          {
            v36 = v35;
            v37 = objc_msgSend(v35, sel_internalSignals);
            if (v37)
            {
              v38 = v37;
              v39 = sub_22727D638();

              v56 = v39;
              sub_2272652D4(v32);
              if (v56)
              {
                v40 = (void *)sub_22727D620();
                swift_bridgeObjectRelease();
              }
              else
              {
                v40 = 0;
              }
              v12 = v51;
              objc_msgSend(v36, sel_setInternalSignals_, v40);
              swift_bridgeObjectRelease();

            }
            else
            {
              objc_msgSend(v36, sel_setInternalSignals_, 0);

            }
          }
        }
      }
    }
    v54(v12, v53, v5);
    swift_bridgeObjectRetain_n();
    v44 = sub_22727D4D0();
    v45 = sub_22727D794();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = swift_slowAlloc();
      v54 = (void (*)(char *, uint64_t, uint64_t))v23;
      v47 = (uint8_t *)v46;
      v48 = swift_slowAlloc();
      v51 = v12;
      v49 = v48;
      v56 = v48;
      *(_DWORD *)v47 = 136315138;
      swift_bridgeObjectRetain();
      v55 = sub_2272403C4(v52, a2, &v56);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22723A000, v44, v45, "InternalSignalsManager#remove#fromPlayMediaIntent removed %s from playMediaIntent. (unlock)", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v49, -1, -1);
      MEMORY[0x2276AF6D4](v47, -1, -1);

      ((void (*)(char *, uint64_t))v54)(v51, v5);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v23(v12, v5);
    }
    swift_retain();
    sub_22727CC0C();

  }
  else
  {

    v54(v9, v53, v5);
    v41 = sub_22727D4D0();
    v42 = sub_22727D788();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_22723A000, v41, v42, "InternalSignalsManager#remove#fromPlayMediaIntent Unexpected backing store error adding internal signal. (unlock)", v43, 2u);
      MEMORY[0x2276AF6D4](v43, -1, -1);
    }

    v23(v9, v5);
    swift_retain();
    sub_22727CC0C();
  }
  return swift_release();
}

uint64_t sub_227266F28(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  unint64_t v19;
  char *v20;
  uint8_t *v21;
  uint8_t *v22;
  void (*v23)(char *, uint64_t);
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  char v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;

  v52 = a1;
  v5 = sub_22727D4E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v51 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v51 - v13;
  if (qword_2558CB388 != -1)
    swift_once();
  swift_retain();
  sub_22727CBF4();
  swift_release();
  if (qword_2558CB378 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v5, (uint64_t)qword_2558CC248);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v53 = v15;
  v54 = v16;
  ((void (*)(char *))v16)(v14);
  v17 = sub_22727D4D0();
  v18 = sub_22727D794();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = a2;
    v20 = v12;
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_22723A000, v17, v18, "InternalSignalsManager#remove#fromAddMediaIntent (lock aquired)", v21, 2u);
    v22 = v21;
    v12 = v20;
    a2 = v19;
    MEMORY[0x2276AF6D4](v22, -1, -1);
  }

  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v14, v5);
  v24 = objc_msgSend(a3, sel_backingStore);
  objc_opt_self();
  v25 = (void *)swift_dynamicCastObjCClass();
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, sel_privateAddMediaIntentData);
    if (v27)
    {
      v28 = v27;
      v29 = objc_msgSend(v27, sel_internalSignals);

      if (v29)
      {
        v30 = sub_22727D638();
        v51 = v12;
        v31 = (_QWORD *)v30;

        v32 = sub_2272651F0(v52, a2, v31);
        v34 = v33;
        v12 = v51;
        swift_bridgeObjectRelease();
        if ((v34 & 1) == 0)
        {
          v35 = objc_msgSend(v26, sel_privateAddMediaIntentData);
          if (v35)
          {
            v36 = v35;
            v37 = objc_msgSend(v35, sel_internalSignals);
            if (v37)
            {
              v38 = v37;
              v39 = sub_22727D638();

              v56 = v39;
              sub_2272652D4(v32);
              if (v56)
              {
                v40 = (void *)sub_22727D620();
                swift_bridgeObjectRelease();
              }
              else
              {
                v40 = 0;
              }
              v12 = v51;
              objc_msgSend(v36, sel_setInternalSignals_, v40);
              swift_bridgeObjectRelease();

            }
            else
            {
              objc_msgSend(v36, sel_setInternalSignals_, 0);

            }
          }
        }
      }
    }
    v54(v12, v53, v5);
    swift_bridgeObjectRetain_n();
    v44 = sub_22727D4D0();
    v45 = sub_22727D794();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = swift_slowAlloc();
      v54 = (void (*)(char *, uint64_t, uint64_t))v23;
      v47 = (uint8_t *)v46;
      v48 = swift_slowAlloc();
      v51 = v12;
      v49 = v48;
      v56 = v48;
      *(_DWORD *)v47 = 136315138;
      swift_bridgeObjectRetain();
      v55 = sub_2272403C4(v52, a2, &v56);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22723A000, v44, v45, "InternalSignalsManager#remove#fromAddMediaIntent removed %s from addMediaIntent. (unlock)", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v49, -1, -1);
      MEMORY[0x2276AF6D4](v47, -1, -1);

      ((void (*)(char *, uint64_t))v54)(v51, v5);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v23(v12, v5);
    }
    swift_retain();
    sub_22727CC0C();

  }
  else
  {

    v54(v9, v53, v5);
    v41 = sub_22727D4D0();
    v42 = sub_22727D788();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_22723A000, v41, v42, "InternalSignalsManager#remove#fromAddMediaIntent Unexpected backing store error adding internal signal. (unlock)", v43, 2u);
      MEMORY[0x2276AF6D4](v43, -1, -1);
    }

    v23(v9, v5);
    swift_retain();
    sub_22727CC0C();
  }
  return swift_release();
}

uint64_t sub_2272674B8(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  unint64_t v19;
  char *v20;
  uint8_t *v21;
  uint8_t *v22;
  void (*v23)(char *, uint64_t);
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  char v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;

  v52 = a1;
  v5 = sub_22727D4E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v51 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v51 - v13;
  if (qword_2558CB388 != -1)
    swift_once();
  swift_retain();
  sub_22727CBF4();
  swift_release();
  if (qword_2558CB378 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v5, (uint64_t)qword_2558CC248);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v53 = v15;
  v54 = v16;
  ((void (*)(char *))v16)(v14);
  v17 = sub_22727D4D0();
  v18 = sub_22727D794();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = a2;
    v20 = v12;
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_22723A000, v17, v18, "InternalSignalsManager#remove#fromUpdateMediaIntent (lock aquired)", v21, 2u);
    v22 = v21;
    v12 = v20;
    a2 = v19;
    MEMORY[0x2276AF6D4](v22, -1, -1);
  }

  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v14, v5);
  v24 = objc_msgSend(a3, sel_backingStore);
  objc_opt_self();
  v25 = (void *)swift_dynamicCastObjCClass();
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, sel_privateUpdateMediaAffinityIntentData);
    if (v27)
    {
      v28 = v27;
      v29 = objc_msgSend(v27, sel_internalSignals);

      if (v29)
      {
        v30 = sub_22727D638();
        v51 = v12;
        v31 = (_QWORD *)v30;

        v32 = sub_2272651F0(v52, a2, v31);
        v34 = v33;
        v12 = v51;
        swift_bridgeObjectRelease();
        if ((v34 & 1) == 0)
        {
          v35 = objc_msgSend(v26, sel_privateUpdateMediaAffinityIntentData);
          if (v35)
          {
            v36 = v35;
            v37 = objc_msgSend(v35, sel_internalSignals);
            if (v37)
            {
              v38 = v37;
              v39 = sub_22727D638();

              v56 = v39;
              sub_2272652D4(v32);
              if (v56)
              {
                v40 = (void *)sub_22727D620();
                swift_bridgeObjectRelease();
              }
              else
              {
                v40 = 0;
              }
              v12 = v51;
              objc_msgSend(v36, sel_setInternalSignals_, v40);
              swift_bridgeObjectRelease();

            }
            else
            {
              objc_msgSend(v36, sel_setInternalSignals_, 0);

            }
          }
        }
      }
    }
    v54(v12, v53, v5);
    swift_bridgeObjectRetain_n();
    v44 = sub_22727D4D0();
    v45 = sub_22727D794();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = swift_slowAlloc();
      v54 = (void (*)(char *, uint64_t, uint64_t))v23;
      v47 = (uint8_t *)v46;
      v48 = swift_slowAlloc();
      v51 = v12;
      v49 = v48;
      v56 = v48;
      *(_DWORD *)v47 = 136315138;
      swift_bridgeObjectRetain();
      v55 = sub_2272403C4(v52, a2, &v56);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22723A000, v44, v45, "InternalSignalsManager#remove#fromUpdateMediaIntent removed %s from updateMediaIntent. (unlock)", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v49, -1, -1);
      MEMORY[0x2276AF6D4](v47, -1, -1);

      ((void (*)(char *, uint64_t))v54)(v51, v5);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v23(v12, v5);
    }
    swift_retain();
    sub_22727CC0C();

  }
  else
  {

    v54(v9, v53, v5);
    v41 = sub_22727D4D0();
    v42 = sub_22727D788();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_22723A000, v41, v42, "InternalSignalsManager#remove#fromUpdateMediaIntent Unexpected backing store error adding internal signal. (unlock)", v43, 2u);
      MEMORY[0x2276AF6D4](v43, -1, -1);
    }

    v23(v9, v5);
    swift_retain();
    sub_22727CC0C();
  }
  return swift_release();
}

uint64_t sub_227267A48(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  unint64_t v19;
  char *v20;
  uint8_t *v21;
  uint8_t *v22;
  void (*v23)(char *, uint64_t);
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  char v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;

  v52 = a1;
  v5 = sub_22727D4E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v51 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v51 - v13;
  if (qword_2558CB388 != -1)
    swift_once();
  swift_retain();
  sub_22727CBF4();
  swift_release();
  if (qword_2558CB378 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v5, (uint64_t)qword_2558CC248);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v53 = v15;
  v54 = v16;
  ((void (*)(char *))v16)(v14);
  v17 = sub_22727D4D0();
  v18 = sub_22727D794();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = a2;
    v20 = v12;
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_22723A000, v17, v18, "InternalSignalsManager#remove#fromSearchMediaIntent (lock aquired)", v21, 2u);
    v22 = v21;
    v12 = v20;
    a2 = v19;
    MEMORY[0x2276AF6D4](v22, -1, -1);
  }

  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v14, v5);
  v24 = objc_msgSend(a3, sel_backingStore);
  objc_opt_self();
  v25 = (void *)swift_dynamicCastObjCClass();
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, sel_privateSearchForMediaIntentData);
    if (v27)
    {
      v28 = v27;
      v29 = objc_msgSend(v27, sel_internalSignals);

      if (v29)
      {
        v30 = sub_22727D638();
        v51 = v12;
        v31 = (_QWORD *)v30;

        v32 = sub_2272651F0(v52, a2, v31);
        v34 = v33;
        v12 = v51;
        swift_bridgeObjectRelease();
        if ((v34 & 1) == 0)
        {
          v35 = objc_msgSend(v26, sel_privateSearchForMediaIntentData);
          if (v35)
          {
            v36 = v35;
            v37 = objc_msgSend(v35, sel_internalSignals);
            if (v37)
            {
              v38 = v37;
              v39 = sub_22727D638();

              v56 = v39;
              sub_2272652D4(v32);
              if (v56)
              {
                v40 = (void *)sub_22727D620();
                swift_bridgeObjectRelease();
              }
              else
              {
                v40 = 0;
              }
              v12 = v51;
              objc_msgSend(v36, sel_setInternalSignals_, v40);
              swift_bridgeObjectRelease();

            }
            else
            {
              objc_msgSend(v36, sel_setInternalSignals_, 0);

            }
          }
        }
      }
    }
    v54(v12, v53, v5);
    swift_bridgeObjectRetain_n();
    v44 = sub_22727D4D0();
    v45 = sub_22727D794();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = swift_slowAlloc();
      v54 = (void (*)(char *, uint64_t, uint64_t))v23;
      v47 = (uint8_t *)v46;
      v48 = swift_slowAlloc();
      v51 = v12;
      v49 = v48;
      v56 = v48;
      *(_DWORD *)v47 = 136315138;
      swift_bridgeObjectRetain();
      v55 = sub_2272403C4(v52, a2, &v56);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22723A000, v44, v45, "InternalSignalsManager#remove#fromSearchMediaIntent removed %s from searchMediaIntent. (unlock)", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v49, -1, -1);
      MEMORY[0x2276AF6D4](v47, -1, -1);

      ((void (*)(char *, uint64_t))v54)(v51, v5);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v23(v12, v5);
    }
    swift_retain();
    sub_22727CC0C();

  }
  else
  {

    v54(v9, v53, v5);
    v41 = sub_22727D4D0();
    v42 = sub_22727D788();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_22723A000, v41, v42, "InternalSignalsManager#remove#fromSearchMediaIntent Unexpected backing store error adding internal signal. (unlock)", v43, 2u);
      MEMORY[0x2276AF6D4](v43, -1, -1);
    }

    v23(v9, v5);
    swift_retain();
    sub_22727CC0C();
  }
  return swift_release();
}

uint64_t type metadata accessor for InternalSignalsManager()
{
  return objc_opt_self();
}

uint64_t *logObject.unsafeMutableAddressor()
{
  if (qword_2558CB390 != -1)
    swift_once();
  return &logObject;
}

uint64_t sub_227268038()
{
  uint64_t result;

  sub_22726809C();
  result = sub_22727D914();
  logObject = result;
  return result;
}

unint64_t sub_22726809C()
{
  unint64_t result;

  result = qword_2558CBEA8;
  if (!qword_2558CBEA8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558CBEA8);
  }
  return result;
}

uint64_t sub_2272680D8(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aSongnameartist[8 * a1] == *(_QWORD *)&aSongnameartist[8 * a2]
    && *(_QWORD *)&aSongnameartist[8 * a1 + 40] == *(_QWORD *)&aSongnameartist[8 * a2 + 40])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_22727DA10();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22726815C()
{
  sub_22727DA70();
  sub_22727D5B4();
  swift_bridgeObjectRelease();
  return sub_22727DA88();
}

uint64_t sub_2272681C4()
{
  sub_22727D5B4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_227268204()
{
  sub_22727DA70();
  sub_22727D5B4();
  swift_bridgeObjectRelease();
  return sub_22727DA88();
}

uint64_t sub_227268268(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2272682A0 + 4 * byte_22727EC40[a1]))(0xD000000000000010, 0x800000022727F120);
}

uint64_t sub_2272682A0()
{
  return 0x7974696E69666661;
}

uint64_t sub_2272682B8()
{
  return 0x6E69666661736964;
}

uint64_t sub_2272682D8()
{
  return 2036427888;
}

uint64_t sub_2272682E8()
{
  return 0x646F504179616C70;
}

uint64_t sub_227268308()
{
  return 0x6973754D79616C70;
}

uint64_t sub_227268324()
{
  return 0x5979425879616C70;
}

uint64_t sub_22726833C()
{
  return 0x6974724179616C70;
}

uint64_t sub_227268358()
{
  return 0x6964615279616C70;
}

uint64_t sub_227268378()
{
  return 0x79616C5079616C70;
}

uint64_t sub_22726839C()
{
  return 0x4E65685479616C70;
}

uint64_t sub_2272683BC()
{
  return 0x6572616873;
}

uint64_t sub_2272683D0()
{
  return 0x656C6666756873;
}

uint64_t sub_2272683E8()
{
  return 0x676E6F5374616877;
}

uint64_t sub_22726840C(char a1)
{
  return *(_QWORD *)&aSongnameartist[8 * a1];
}

uint64_t sub_22726842C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_22727DA70();
  sub_227268268(v1);
  sub_22727D5B4();
  swift_bridgeObjectRelease();
  return sub_22727DA88();
}

uint64_t sub_22726848C()
{
  unsigned __int8 *v0;

  sub_227268268(*v0);
  sub_22727D5B4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2272684CC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_22727DA70();
  sub_227268268(v1);
  sub_22727D5B4();
  swift_bridgeObjectRelease();
  return sub_22727DA88();
}

uint64_t sub_227268528@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22726A634();
  *a1 = result;
  return result;
}

uint64_t sub_227268554@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_227268268(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22726857C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_227268268(*a1);
  v5 = v4;
  if (v3 == sub_227268268(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_22727DA10();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_227268604()
{
  return sub_22726815C();
}

uint64_t sub_22726860C()
{
  return sub_2272681C4();
}

uint64_t sub_227268614()
{
  return sub_227268204();
}

uint64_t sub_22726861C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22726A67C();
  *a1 = result;
  return result;
}

uint64_t sub_227268648@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22726840C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_227268670(char *a1, char *a2)
{
  return sub_2272680D8(*a1, *a2);
}

uint64_t sub_22726867C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  if (qword_2558CB348 != -1)
    swift_once();
  v0 = qword_2558CC208;
  v1 = qword_2558CB350;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  v2 = qword_2558CC210;
  v3 = qword_2558CB3C0;
  swift_bridgeObjectRetain();
  if (v3 != -1)
    swift_once();
  v4 = off_2558CBEB0;
  v5 = MEMORY[0x24BEE4AF8];
  if (*((_QWORD *)off_2558CBEB0 + 2))
  {
    v6 = sub_22724B3EC(0);
    if ((v7 & 1) != 0)
    {
      v8 = *(_QWORD *)(v4[7] + 8 * v6);
      swift_bridgeObjectRetain();
    }
    else
    {
      v8 = MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    v8 = MEMORY[0x24BEE4AF8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBF88);
  sub_22727D3D4();
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_22727E530;
  sub_22727D3E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBF90);
  v10 = sub_22727D3C8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_22727E530;
  v14 = v13 + v12;
  v15 = *MEMORY[0x24BEA6CD0];
  v16 = sub_22727D38C();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  result = (*(uint64_t (**)(unint64_t, _QWORD, uint64_t))(v11 + 104))(v14, *MEMORY[0x24BEA7240], v10);
  qword_2558CC278 = 0xD000000000000019;
  unk_2558CC280 = 0x800000022727FF50;
  qword_2558CC288 = 0xD000000000000056;
  unk_2558CC290 = 0x800000022727FF70;
  qword_2558CC298 = v0;
  unk_2558CC2A0 = v2;
  qword_2558CC2A8 = v8;
  unk_2558CC2B0 = 0x7974696E69666661;
  qword_2558CC2B8 = 0xE800000000000000;
  unk_2558CC2C0 = 0xD000000000000010;
  qword_2558CC2C8 = 0x800000022727FFD0;
  word_2558CC2D0 = 256;
  qword_2558CC2D8 = 0;
  unk_2558CC2E0 = 0;
  qword_2558CC2E8 = (uint64_t)&unk_24EF89468;
  unk_2558CC2F0 = v9;
  qword_2558CC2F8 = v13;
  unk_2558CC300 = sub_22726893C;
  qword_2558CC308 = 0;
  unk_2558CC310 = 0;
  qword_2558CC318 = 0xE000000000000000;
  unk_2558CC320 = v5;
  qword_2558CC328 = v5;
  return result;
}

uint64_t sub_22726893C(uint64_t a1)
{
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;

  sub_22726A6C4(a1 + 1, (uint64_t)&v6);
  sub_22726A6C4((uint64_t)&v6, (uint64_t)&v7);
  if ((v7 == 2 || (sub_22726A6C4((uint64_t)&v6, (uint64_t)&v3), (v3 & 1) == 0))
    && ((sub_22726A6C4(a1, (uint64_t)&v5), sub_22726A6C4((uint64_t)&v5, (uint64_t)&v8), v8 == 2)
     || (sub_22726A6C4((uint64_t)&v5, (uint64_t)&v4), (v4 & 1) == 0)))
  {
    return *(unsigned __int8 *)(a1 + 33);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_2272689DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  if (qword_2558CB348 != -1)
    swift_once();
  v0 = qword_2558CC208;
  v1 = qword_2558CB350;
  swift_bridgeObjectRetain();
  if (v1 != -1)
    swift_once();
  v2 = qword_2558CC210;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBF88);
  sub_22727D3D4();
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22727E530;
  swift_bridgeObjectRetain();
  sub_22727D3E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBF90);
  v4 = sub_22727D3C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_22727E530;
  v8 = v7 + v6;
  v9 = *MEMORY[0x24BEA6CD0];
  v10 = sub_22727D38C();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v8, v9, v10);
  result = (*(uint64_t (**)(unint64_t, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BEA7240], v4);
  qword_2558CC330 = 0xD00000000000001CLL;
  *(_QWORD *)algn_2558CC338 = 0x800000022727FFF0;
  qword_2558CC340 = 0xD000000000000056;
  unk_2558CC348 = 0x800000022727FF70;
  qword_2558CC350 = v0;
  unk_2558CC358 = v2;
  qword_2558CC360 = MEMORY[0x24BEE4AF8];
  unk_2558CC368 = 0x6E69666661736964;
  qword_2558CC370 = 0xEB00000000797469;
  unk_2558CC378 = 0xD000000000000010;
  qword_2558CC380 = 0x800000022727FFD0;
  word_2558CC388 = 257;
  qword_2558CC390 = 0;
  unk_2558CC398 = 0;
  qword_2558CC3A0 = (uint64_t)&unk_24EF894C0;
  unk_2558CC3A8 = v3;
  qword_2558CC3B0 = v7;
  unk_2558CC3B8 = sub_227246334;
  qword_2558CC3C0 = 0;
  unk_2558CC3C8 = 0;
  qword_2558CC3D0 = 0xE000000000000000;
  unk_2558CC3D8 = MEMORY[0x24BEE4AF8];
  qword_2558CC3E0 = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t sub_227268C34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t PartyMusicSubscriber;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  int v23;
  __int16 v24;

  v0 = sub_22727D074();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2558CB348 != -1)
    swift_once();
  v4 = qword_2558CB350;
  v21 = qword_2558CC208;
  swift_bridgeObjectRetain();
  if (v4 != -1)
    swift_once();
  v5 = qword_2558CC210;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBF88);
  sub_22727D3D4();
  v6 = swift_allocObject();
  v22 = xmmword_22727E530;
  *(_OWORD *)(v6 + 16) = xmmword_22727E530;
  swift_bridgeObjectRetain();
  sub_22727D3E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBF90);
  v7 = sub_22727D3C8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = v22;
  v11 = v10 + v9;
  v12 = *MEMORY[0x24BEA6CD0];
  v13 = sub_22727D38C();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v11, v12, v13);
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BEA7240], v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBFA8);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = v22;
  sub_22727D05C();
  PartyMusicSubscriber = type metadata accessor for FirstPartyMusicSubscriber();
  v16 = (uint64_t *)swift_allocObject();
  v17 = MEMORY[0x24BE91490];
  v16[5] = v0;
  v16[6] = v17;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16 + 2);
  (*(void (**)(uint64_t *, char *, uint64_t))(v1 + 32))(boxed_opaque_existential_1, v3, v0);
  *(_QWORD *)(v14 + 56) = PartyMusicSubscriber;
  result = sub_22723CA60(&qword_2558CBFB0, (uint64_t (*)(uint64_t))type metadata accessor for FirstPartyMusicSubscriber, (uint64_t)&protocol conformance descriptor for FirstPartyMusicSubscriber);
  *(_QWORD *)(v14 + 64) = result;
  *(_QWORD *)(v14 + 32) = v16;
  qword_2558CC3E8 = 0xD000000000000021;
  unk_2558CC3F0 = 0x8000000227280010;
  qword_2558CC3F8 = 0xD000000000000056;
  unk_2558CC400 = 0x800000022727FF70;
  qword_2558CC408 = v21;
  unk_2558CC410 = v5;
  qword_2558CC418 = MEMORY[0x24BEE4AF8];
  unk_2558CC420 = 0xD000000000000010;
  qword_2558CC428 = 0x800000022727F120;
  unk_2558CC430 = 0xD000000000000010;
  qword_2558CC438 = 0x800000022727FFD0;
  word_2558CC440 = 260;
  unk_2558CC442 = v23;
  word_2558CC446 = v24;
  qword_2558CC448 = 0;
  unk_2558CC450 = 0;
  qword_2558CC458 = (uint64_t)&unk_24EF894F8;
  unk_2558CC460 = v6;
  qword_2558CC468 = v10;
  unk_2558CC470 = sub_227245F1C;
  qword_2558CC478 = 0;
  unk_2558CC480 = 0xD000000000000024;
  qword_2558CC488 = 0x8000000227280040;
  unk_2558CC490 = MEMORY[0x24BEE4AF8];
  qword_2558CC498 = v14;
  return result;
}

uint64_t sub_227268F7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t PartyMusicSubscriber;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  _BYTE v18[14];
  __int16 v19;

  v0 = sub_22727D074();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2558CB340 != -1)
    swift_once();
  v4 = qword_2558CC200;
  v5 = qword_2558CB350;
  swift_bridgeObjectRetain();
  if (v5 != -1)
    swift_once();
  v6 = qword_2558CC210;
  v7 = qword_2558CB3C0;
  swift_bridgeObjectRetain();
  if (v7 != -1)
    swift_once();
  v8 = off_2558CBEB0;
  v9 = MEMORY[0x24BEE4AF8];
  if (*((_QWORD *)off_2558CBEB0 + 2))
  {
    v10 = sub_22724B3EC(5);
    if ((v11 & 1) != 0)
    {
      v9 = *(_QWORD *)(v8[7] + 8 * v10);
      swift_bridgeObjectRetain();
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBFA8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_22727E530;
  sub_22727D05C();
  PartyMusicSubscriber = type metadata accessor for FirstPartyMusicSubscriber();
  v14 = (uint64_t *)swift_allocObject();
  v15 = MEMORY[0x24BE91490];
  v14[5] = v0;
  v14[6] = v15;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14 + 2);
  (*(void (**)(uint64_t *, _BYTE *, uint64_t))(v1 + 32))(boxed_opaque_existential_1, v3, v0);
  *(_QWORD *)(v12 + 56) = PartyMusicSubscriber;
  result = sub_22723CA60(&qword_2558CBFB0, (uint64_t (*)(uint64_t))type metadata accessor for FirstPartyMusicSubscriber, (uint64_t)&protocol conformance descriptor for FirstPartyMusicSubscriber);
  *(_QWORD *)(v12 + 64) = result;
  *(_QWORD *)(v12 + 32) = v14;
  qword_2558CC4A0 = 0xD00000000000001ALL;
  *(_QWORD *)algn_2558CC4A8 = 0x8000000227280090;
  qword_2558CC4B0 = 0xD000000000000056;
  unk_2558CC4B8 = 0x800000022727FF70;
  qword_2558CC4C0 = v4;
  unk_2558CC4C8 = v6;
  qword_2558CC4D0 = v9;
  unk_2558CC4D8 = 0x6973754D79616C70;
  qword_2558CC4E0 = 0xE900000000000063;
  unk_2558CC4E8 = 0xD000000000000010;
  qword_2558CC4F0 = 0x800000022727FFD0;
  word_2558CC4F8 = 261;
  unk_2558CC4FA = *(_DWORD *)&v18[10];
  word_2558CC4FE = v19;
  qword_2558CC500 = 0xD000000000000011;
  unk_2558CC508 = 0x80000002272800B0;
  qword_2558CC510 = 0;
  unk_2558CC518 = 0;
  qword_2558CC520 = 0;
  unk_2558CC528 = sub_227245F1C;
  qword_2558CC530 = 0;
  unk_2558CC538 = 0xD000000000000024;
  qword_2558CC540 = 0x8000000227280040;
  qword_2558CC548 = MEMORY[0x24BEE4AF8];
  unk_2558CC550 = v12;
  return result;
}

double sub_227269244()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t PartyMusicSubscriber;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *boxed_opaque_existential_1;
  double result;
  _BYTE v18[14];
  __int16 v19;

  v0 = sub_22727D074();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2558CB340 != -1)
    swift_once();
  v4 = qword_2558CC200;
  v5 = qword_2558CB350;
  swift_bridgeObjectRetain();
  if (v5 != -1)
    swift_once();
  v6 = qword_2558CC210;
  v7 = qword_2558CB3C0;
  swift_bridgeObjectRetain();
  if (v7 != -1)
    swift_once();
  v8 = off_2558CBEB0;
  if (*((_QWORD *)off_2558CBEB0 + 2))
  {
    v9 = sub_22724B3EC(10);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(v8[7] + 8 * v9);
      swift_bridgeObjectRetain();
    }
    else
    {
      v11 = MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBFA8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_22727E530;
  sub_22727D05C();
  PartyMusicSubscriber = type metadata accessor for FirstPartyMusicSubscriber();
  v14 = (uint64_t *)swift_allocObject();
  v15 = MEMORY[0x24BE91490];
  v14[5] = v0;
  v14[6] = v15;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14 + 2);
  (*(void (**)(uint64_t *, _BYTE *, uint64_t))(v1 + 32))(boxed_opaque_existential_1, v3, v0);
  *(_QWORD *)(v12 + 56) = PartyMusicSubscriber;
  *(_QWORD *)(v12 + 64) = sub_22723CA60(&qword_2558CBFB0, (uint64_t (*)(uint64_t))type metadata accessor for FirstPartyMusicSubscriber, (uint64_t)&protocol conformance descriptor for FirstPartyMusicSubscriber);
  *(_QWORD *)(v12 + 32) = v14;
  qword_2558CC558 = 0xD00000000000001CLL;
  unk_2558CC560 = 0x8000000227280070;
  qword_2558CC568 = 0xD000000000000056;
  unk_2558CC570 = 0x800000022727FF70;
  qword_2558CC578 = v4;
  unk_2558CC580 = v6;
  qword_2558CC588 = v11;
  unk_2558CC590 = 0x4E65685479616C70;
  qword_2558CC598 = 0xEB00000000737765;
  unk_2558CC5A0 = 0xD000000000000010;
  qword_2558CC5A8 = 0x800000022727FFD0;
  word_2558CC5B0 = 266;
  unk_2558CC5B2 = *(_DWORD *)&v18[10];
  word_2558CC5B6 = v19;
  result = 0.0;
  xmmword_2558CC5B8 = 0u;
  unk_2558CC5C8 = 0u;
  qword_2558CC5D8 = 0;
  unk_2558CC5E0 = sub_227245F1C;
  qword_2558CC5E8 = 0;
  unk_2558CC5F0 = 0xD000000000000024;
  qword_2558CC5F8 = 0x8000000227280040;
  qword_2558CC600 = MEMORY[0x24BEE4AF8];
  unk_2558CC608 = v12;
  return result;
}

uint64_t type metadata accessor for AudioSuggestions()
{
  return objc_opt_self();
}

uint64_t destroy for AudioSuggestion()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AudioSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_WORD *)(a1 + 88) = *(_WORD *)(a2 + 88);
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  v9 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v9;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  v10 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v10;
  v12 = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = v12;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AudioSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v4;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy184_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  v5 = a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  result = (__n128)a2[8];
  v9 = a2[9];
  v10 = a2[10];
  *(_QWORD *)(a1 + 176) = *((_QWORD *)a2 + 22);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for AudioSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 89) = *(_BYTE *)(a2 + 89);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_release();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioSuggestion(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 184))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSuggestion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 184) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 184) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion()
{
  return &type metadata for AudioSuggestion;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioSuggestion.ParameterName(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSuggestion.ParameterName(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_227269BC4 + 4 * byte_22727EC53[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_227269BF8 + 4 * byte_22727EC4E[v4]))();
}

uint64_t sub_227269BF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_227269C00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x227269C08);
  return result;
}

uint64_t sub_227269C14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x227269C1CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_227269C20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_227269C28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion.ParameterName()
{
  return &type metadata for AudioSuggestion.ParameterName;
}

unint64_t sub_227269C48()
{
  unint64_t result;

  result = qword_2558CBF80;
  if (!qword_2558CBF80)
  {
    result = MEMORY[0x2276AF644](&unk_22727ECC0, &type metadata for AudioSuggestion.ParameterName);
    atomic_store(result, (unint64_t *)&qword_2558CBF80);
  }
  return result;
}

void *sub_227269C8C()
{
  uint64_t inited;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBF98);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22727EE70;
  *(_BYTE *)(inited + 32) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_22727E830;
  if (qword_2558CB3C8 != -1)
    swift_once();
  *(_QWORD *)(v1 + 32) = qword_2558CBEB8;
  sub_22727D650();
  *(_QWORD *)(inited + 40) = v1;
  *(_BYTE *)(inited + 48) = 2;
  v2 = qword_2558CB3F0;
  swift_retain();
  if (v2 != -1)
    swift_once();
  v16 = qword_2558CBEE0;
  swift_retain_n();
  v3 = swift_bridgeObjectRetain();
  MEMORY[0x2276AEE7C](v3);
  if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22727D65C();
  sub_22727D674();
  sub_22727D650();
  swift_release();
  *(_QWORD *)(inited + 56) = v16;
  *(_BYTE *)(inited + 64) = 3;
  v4 = qword_2558CBEE0;
  if (qword_2558CB3D0 != -1)
    swift_once();
  swift_retain_n();
  v5 = swift_bridgeObjectRetain();
  MEMORY[0x2276AEE7C](v5);
  if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22727D65C();
  sub_22727D674();
  sub_22727D650();
  swift_release();
  *(_QWORD *)(inited + 72) = v4;
  *(_BYTE *)(inited + 80) = 5;
  v17 = qword_2558CBEE0;
  swift_retain_n();
  v6 = swift_bridgeObjectRetain();
  MEMORY[0x2276AEE7C](v6);
  if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22727D65C();
  sub_22727D674();
  sub_22727D650();
  swift_release();
  *(_QWORD *)(inited + 88) = v17;
  *(_BYTE *)(inited + 96) = 4;
  v18 = qword_2558CBEE0;
  swift_retain_n();
  v7 = swift_bridgeObjectRetain();
  MEMORY[0x2276AEE7C](v7);
  if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22727D65C();
  sub_22727D674();
  sub_22727D650();
  swift_release();
  *(_QWORD *)(inited + 104) = v18;
  *(_BYTE *)(inited + 112) = 6;
  v19 = qword_2558CBEE0;
  swift_retain_n();
  v8 = swift_bridgeObjectRetain();
  MEMORY[0x2276AEE7C](v8);
  if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22727D65C();
  sub_22727D674();
  sub_22727D650();
  swift_release();
  *(_QWORD *)(inited + 120) = v19;
  *(_BYTE *)(inited + 128) = 7;
  v20 = qword_2558CBEE0;
  swift_retain_n();
  v9 = swift_bridgeObjectRetain();
  MEMORY[0x2276AEE7C](v9);
  if (*(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22727D65C();
  sub_22727D674();
  sub_22727D650();
  swift_release();
  *(_QWORD *)(inited + 136) = v20;
  *(_BYTE *)(inited + 144) = 8;
  v21 = qword_2558CBEE0;
  swift_retain_n();
  v10 = swift_bridgeObjectRetain();
  MEMORY[0x2276AEE7C](v10);
  if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22727D65C();
  sub_22727D674();
  sub_22727D650();
  swift_release();
  *(_QWORD *)(inited + 152) = v21;
  *(_BYTE *)(inited + 160) = 9;
  v22 = qword_2558CBEE0;
  swift_retain_n();
  v11 = swift_bridgeObjectRetain();
  MEMORY[0x2276AEE7C](v11);
  if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22727D65C();
  sub_22727D674();
  sub_22727D650();
  swift_release();
  *(_QWORD *)(inited + 168) = v22;
  *(_BYTE *)(inited + 176) = 10;
  v12 = qword_2558CBEE0;
  *(_QWORD *)(inited + 184) = qword_2558CBEE0;
  *(_BYTE *)(inited + 192) = 13;
  swift_retain_n();
  v13 = swift_bridgeObjectRetain_n();
  MEMORY[0x2276AEE7C](v13);
  if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22727D65C();
  sub_22727D674();
  sub_22727D650();
  swift_release();
  *(_QWORD *)(inited + 200) = v12;
  *(_BYTE *)(inited + 208) = 12;
  v23 = qword_2558CBEE0;
  swift_retain_n();
  v14 = swift_bridgeObjectRetain();
  MEMORY[0x2276AEE7C](v14);
  if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22727D65C();
  sub_22727D674();
  sub_22727D650();
  swift_release();
  *(_QWORD *)(inited + 216) = v23;
  result = (void *)sub_2272484A4(inited);
  off_2558CBEB0 = result;
  return result;
}

uint64_t sub_22726A32C()
{
  uint64_t v0;
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v3[5];

  v0 = sub_22727D3BC();
  v3[3] = v0;
  v3[4] = sub_22723CA60(&qword_2558CBFA0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA71D8], MEMORY[0x24BEA71D0]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v3);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x24BEA71B8], v0);
  sub_22727D434();
  result = sub_22727D410();
  qword_2558CBEB8 = result;
  return result;
}

uint64_t sub_22726A3E4()
{
  uint64_t v0;
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v3[5];

  sub_22727D434();
  v0 = sub_22727D3BC();
  v3[3] = v0;
  v3[4] = sub_22723CA60(&qword_2558CBFA0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA71D8], MEMORY[0x24BEA71D0]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v3);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(boxed_opaque_existential_1, *MEMORY[0x24BEA71B8], v0);
  result = sub_22727D410();
  qword_2558CBEC0 = result;
  return result;
}

uint64_t sub_22726A494()
{
  uint64_t result;

  sub_22727D434();
  result = sub_22727D41C();
  qword_2558CBEC8 = result;
  return result;
}

uint64_t sub_22726A4C4()
{
  uint64_t result;

  sub_22727D434();
  result = sub_22727D428();
  qword_2558CBED0 = result;
  return result;
}

uint64_t sub_22726A4F4()
{
  uint64_t result;

  sub_22727D434();
  result = sub_22727D404();
  qword_2558CBED8 = result;
  return result;
}

uint64_t sub_22726A524()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22727EE80;
  if (qword_2558CB3D8 != -1)
    swift_once();
  *(_QWORD *)(v0 + 32) = qword_2558CBEC8;
  v1 = qword_2558CB3E0;
  swift_retain();
  if (v1 != -1)
    swift_once();
  *(_QWORD *)(v0 + 40) = qword_2558CBED0;
  v2 = qword_2558CB3E8;
  swift_retain();
  if (v2 != -1)
    swift_once();
  *(_QWORD *)(v0 + 48) = qword_2558CBED8;
  sub_22727D650();
  qword_2558CBEE0 = v0;
  return swift_retain();
}

uint64_t sub_22726A634()
{
  unint64_t v0;

  v0 = sub_22727D9EC();
  swift_bridgeObjectRelease();
  if (v0 >= 0xE)
    return 14;
  else
    return v0;
}

uint64_t sub_22726A67C()
{
  unint64_t v0;

  v0 = sub_22727D9EC();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_22726A6C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBC60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for AudioSuggestion.SuggestionType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF3)
    goto LABEL_17;
  if (a2 + 13 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 13) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 13;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 13;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v8 = v6 - 14;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSuggestion.SuggestionType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_22726A7E8 + 4 * byte_22727EC5D[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_22726A81C + 4 * byte_22727EC58[v4]))();
}

uint64_t sub_22726A81C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22726A824(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22726A82CLL);
  return result;
}

uint64_t sub_22726A838(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22726A840);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_22726A844(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22726A84C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22726A858(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22726A860(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion.SuggestionType()
{
  return &type metadata for AudioSuggestion.SuggestionType;
}

unint64_t sub_22726A87C()
{
  unint64_t result;

  result = qword_2558CBFB8;
  if (!qword_2558CBFB8)
  {
    result = MEMORY[0x2276AF644](&unk_22727ED70, &type metadata for AudioSuggestion.SuggestionType);
    atomic_store(result, (unint64_t *)&qword_2558CBFB8);
  }
  return result;
}

uint64_t PodcastLibraryProvider.createLibraryController(completion:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v6;

  v0 = sub_22727D4C4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2558CB390 != -1)
    swift_once();
  v4 = (id)logObject;
  sub_22727D4AC();
  sub_22727D8D8();
  sub_22727D4A0();
  sub_22727CAB0();
  sub_22727CAA4();
  sub_22727D8CC();
  sub_22727D4A0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_22726AA00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v6;

  v0 = sub_22727D4C4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2558CB390 != -1)
    swift_once();
  v4 = (id)logObject;
  sub_22727D4AC();
  sub_22727D8D8();
  sub_22727D4A0();
  sub_22727CAB0();
  sub_22727CAA4();
  sub_22727D8CC();
  sub_22727D4A0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

ValueMetadata *type metadata accessor for PodcastLibraryProvider()
{
  return &type metadata for PodcastLibraryProvider;
}

uint64_t sub_22726AB44(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22726AB80 + 4 * byte_22727EED8[a1]))(0xD000000000000033, 0x80000002272801F0);
}

uint64_t sub_22726AB80()
{
  uint64_t v0;

  return v0 + 3;
}

unint64_t sub_22726ABC8()
{
  return 0xD000000000000029;
}

uint64_t sub_22726ABE4(unint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v9 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_22727D9BC())
  {
    for (i = 4; ; ++i)
    {
      v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2276AF200](i - 4, a1) : *(id *)(a1 + 8 * i);
      v5 = v4;
      v6 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v7 = sub_22727686C(v4);

      if (v7)
      {
        MEMORY[0x2276AEE7C]();
        if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_22727D65C();
        sub_22727D674();
        sub_22727D650();
      }
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_22726AD40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_22727D6BC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22727D6B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_227246BC0(a1, &qword_2558CB750);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22727D680();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_22726AE8C()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC1A8);
  swift_allocObject();
  result = sub_22727CE04();
  qword_2558CBFC0 = result;
  return result;
}

uint64_t sub_22726AEE4()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC1B0);
  swift_allocObject();
  result = sub_22727CBB8();
  qword_2558CBFC8 = result;
  return result;
}

uint64_t sub_22726AF48(void (*a1)(char *))
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBD80);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22727D194();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  a1(v4);
  return sub_227246BC0((uint64_t)v4, &qword_2558CBD80);
}

uint64_t sub_22726AFE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = sub_22727D554();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22727D548();
  v4 = sub_22727CCFC();
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_2558CBFD0 = v4;
  return result;
}

id INPlayMediaIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id INPlayMediaIntentHandler.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[3];
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[5];

  v53 = sub_22727D110();
  v52 = *(_QWORD *)(v53 - 8);
  v0 = MEMORY[0x24BDAC7A8](v53);
  v51 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v37 - v2;
  v4 = sub_22727CFB4();
  v50 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - v7;
  v9 = sub_22727CF3C();
  v56 = *(_QWORD *)(v9 - 8);
  v57 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v48 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v37 - v12;
  v14 = sub_22727CCF0();
  v54 = *(_QWORD *)(v14 - 8);
  v55 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v46 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v37 - v17;
  sub_22727CDEC();
  v47 = sub_22727CDE0();
  v19 = sub_22727D0BC();
  v20 = sub_22727D0B0();
  v64[3] = v19;
  v64[4] = MEMORY[0x24BE91508];
  v64[0] = v20;
  v44 = v18;
  sub_22727CCE4();
  v43 = v13;
  sub_22727CF30();
  sub_22727CEAC();
  v45 = sub_22727CEA0();
  v42 = v8;
  sub_22727CFA8();
  v62 = v4;
  v63 = MEMORY[0x24BE913D0];
  v41 = v4;
  __swift_allocate_boxed_opaque_existential_1(v61);
  sub_22727CFA8();
  v21 = sub_22727CB34();
  v22 = sub_22727CB28();
  v59 = v21;
  v60 = MEMORY[0x24BE90F48];
  v58 = v22;
  sub_22727D170();
  swift_allocObject();
  v23 = sub_22727D164();
  sub_22727CF24();
  v24 = sub_22727CF18();
  v25 = sub_22727D458();
  v26 = sub_22727D44C();
  v62 = v25;
  v63 = MEMORY[0x24BEA54A0];
  v61[0] = v26;
  v38 = v3;
  sub_22727D104();
  sub_22727CD98();
  v40 = sub_22727CD8C();
  v39 = sub_22727CB28();
  sub_22726B790((uint64_t)v64, (uint64_t)v61);
  v27 = (uint64_t)v46;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v46, v18, v55);
  v28 = (uint64_t)v48;
  (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v48, v13, v57);
  v29 = v50;
  v30 = v49;
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v49, v8, v4);
  v31 = v52;
  v32 = (uint64_t)v51;
  v33 = v53;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v51, v3, v53);
  v34 = v45;
  swift_retain();
  swift_retain();
  swift_retain();
  v35 = sub_227279C1C(v47, (uint64_t)v61, v27, v28, v34, v40, v30, v23, v24, v39, v32);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v38, v33);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v42, v41);
  swift_release();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v43, v57);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v44, v55);
  sub_227279FD0((uint64_t)v64);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v35;
}

id INPlayMediaIntentHandler.__allocating_init(playbackService:localSearch:deviceProvider:nowPlaying:seDeviceProvider:accountProvider:featureFlagProvider:appleMediaServicesProvider:nearDeviceProvider:siriKitTaskLoggingProvider:onscreenEntityProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;

  v42 = *(_QWORD *)(a2 + 32);
  v43 = *(_QWORD *)(a2 + 24);
  v46 = __swift_mutable_project_boxed_opaque_existential_1(a2, v43);
  v52 = a3;
  v41 = *(_QWORD *)(a3 + 24);
  v39 = *(_QWORD *)(a3 + 32);
  v44 = __swift_mutable_project_boxed_opaque_existential_1(a3, v41);
  v50 = a4;
  v36 = *(_QWORD *)(a4 + 24);
  v34 = *(_QWORD *)(a4 + 32);
  v40 = __swift_mutable_project_boxed_opaque_existential_1(a4, v36);
  v47 = a5;
  v16 = *(_QWORD *)(a5 + 24);
  v33 = *(_QWORD *)(a5 + 32);
  v37 = __swift_mutable_project_boxed_opaque_existential_1(a5, v16);
  v45 = a7;
  v17 = *(_QWORD *)(a7 + 24);
  v31 = *(_QWORD *)(a7 + 32);
  v35 = __swift_mutable_project_boxed_opaque_existential_1(a7, v17);
  v38 = a8;
  v18 = *(_QWORD *)(a8 + 24);
  v30 = *(_QWORD *)(a8 + 32);
  v32 = __swift_mutable_project_boxed_opaque_existential_1(a8, v18);
  v19 = *(_QWORD *)(a9 + 24);
  v20 = *(_QWORD *)(a9 + 32);
  v21 = __swift_mutable_project_boxed_opaque_existential_1(a9, v19);
  v23 = *(_QWORD *)(a11 + 24);
  v22 = *(_QWORD *)(a11 + 32);
  v24 = __swift_mutable_project_boxed_opaque_existential_1(a11, v23);
  *((_QWORD *)&v29 + 1) = v20;
  *((_QWORD *)&v28 + 1) = v31;
  *(_QWORD *)&v29 = v42;
  *(_QWORD *)&v28 = v33;
  *(_QWORD *)&v27 = v30;
  *((_QWORD *)&v27 + 1) = v39;
  v25 = sub_22727A004(a1, v46, v44, v40, v37, a6, v35, v32, v21, a10, v24, v49, v18, v41, v16, v17, v43, v19, v36,
          v23,
          v27,
          v28,
          v29,
          v34,
          v22);
  __swift_destroy_boxed_opaque_existential_1Tm(a11);
  __swift_destroy_boxed_opaque_existential_1Tm(a9);
  __swift_destroy_boxed_opaque_existential_1Tm(v38);
  __swift_destroy_boxed_opaque_existential_1Tm(v45);
  __swift_destroy_boxed_opaque_existential_1Tm(v47);
  __swift_destroy_boxed_opaque_existential_1Tm(v50);
  __swift_destroy_boxed_opaque_existential_1Tm(v52);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v25;
}

uint64_t sub_22726B790(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for INLocalSearchProvider(a2, a1);
  return a2;
}

id INPlayMediaIntentHandler.init(playbackService:localSearch:deviceProvider:nowPlaying:seDeviceProvider:accountProvider:featureFlagProvider:appleMediaServicesProvider:nearDeviceProvider:siriKitTaskLoggingProvider:onscreenEntityProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  id v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v80 = a6;
  v81 = a2;
  v82 = a11;
  v76 = a10;
  v77 = a1;
  v16 = *(_QWORD *)(a2 + 24);
  v75 = *(_QWORD *)(a2 + 32);
  v17 = __swift_mutable_project_boxed_opaque_existential_1(a2, v16);
  v72 = v16;
  MEMORY[0x24BDAC7A8](v17);
  v74 = (uint64_t)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v19 + 16))();
  v20 = a3;
  v78 = a3;
  v21 = *(_QWORD *)(a3 + 24);
  v71 = *(_QWORD *)(v20 + 32);
  v22 = __swift_mutable_project_boxed_opaque_existential_1(v20, v21);
  v68 = v21;
  MEMORY[0x24BDAC7A8](v22);
  v70 = (uint64_t)&v56 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v24 + 16))();
  v73 = a4;
  v25 = *(_QWORD *)(a4 + 24);
  v66 = *(_QWORD *)(a4 + 32);
  v26 = __swift_mutable_project_boxed_opaque_existential_1(a4, v25);
  v64 = v25;
  MEMORY[0x24BDAC7A8](v26);
  v67 = (uint64_t)&v56 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v28 + 16))();
  v69 = a5;
  v29 = *(_QWORD *)(a5 + 24);
  v63 = *(_QWORD *)(a5 + 32);
  v30 = __swift_mutable_project_boxed_opaque_existential_1(a5, v29);
  MEMORY[0x24BDAC7A8](v30);
  v62 = (uint64_t)&v56 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v32 + 16))();
  v65 = a7;
  v33 = *(_QWORD *)(a7 + 24);
  v60 = *(_QWORD *)(a7 + 32);
  v34 = __swift_mutable_project_boxed_opaque_existential_1(a7, v33);
  MEMORY[0x24BDAC7A8](v34);
  v36 = (char *)&v56 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v37 + 16))(v36);
  v61 = a8;
  v38 = *(_QWORD *)(a8 + 24);
  v58 = *(_QWORD *)(a8 + 32);
  v39 = __swift_mutable_project_boxed_opaque_existential_1(a8, v38);
  MEMORY[0x24BDAC7A8](v39);
  v41 = (char *)&v56 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v42 + 16))(v41);
  v59 = a9;
  v43 = *(_QWORD *)(a9 + 24);
  v57 = *(_QWORD *)(a9 + 32);
  v44 = __swift_mutable_project_boxed_opaque_existential_1(a9, v43);
  MEMORY[0x24BDAC7A8](v44);
  v46 = (char *)&v56 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v47 + 16))(v46);
  v48 = *(_QWORD *)(v82 + 24);
  v49 = *(_QWORD *)(v82 + 32);
  v50 = __swift_mutable_project_boxed_opaque_existential_1(v82, v48);
  MEMORY[0x24BDAC7A8](v50);
  v52 = (char *)&v56 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v53 + 16))(v52);
  v54 = sub_2272793B0(v77, v74, v70, v67, v62, v80, (uint64_t)v36, (uint64_t)v41, (uint64_t)v46, v76, (uint64_t)v52, v79, v38, v68, v29, v33, v72, v43, v64,
          v48,
          v58,
          v71,
          v63,
          v60,
          v75,
          v57,
          v66,
          v49);
  __swift_destroy_boxed_opaque_existential_1Tm(v82);
  __swift_destroy_boxed_opaque_existential_1Tm(v59);
  __swift_destroy_boxed_opaque_existential_1Tm(v61);
  __swift_destroy_boxed_opaque_existential_1Tm(v65);
  __swift_destroy_boxed_opaque_existential_1Tm(v69);
  __swift_destroy_boxed_opaque_existential_1Tm(v73);
  __swift_destroy_boxed_opaque_existential_1Tm(v78);
  __swift_destroy_boxed_opaque_existential_1Tm(v81);
  return v54;
}

uint64_t static INPlayMediaIntentHandler.removeContinuation(for:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34[2];

  v4 = sub_22727D4E8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v31 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v31 - v12;
  if (a2)
  {
    v14 = qword_2558CB3F8;
    swift_bridgeObjectRetain();
    if (v14 != -1)
      swift_once();
    v34[0] = a1;
    v34[1] = a2;
    v15 = sub_22727CDF8();
    if (v15)
    {
      v16 = v15;
      if (qword_2558CB378 != -1)
        swift_once();
      v17 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v17, v4);
      swift_bridgeObjectRetain();
      v18 = sub_22727D4D0();
      v19 = sub_22727D77C();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        v32 = swift_slowAlloc();
        v34[0] = v32;
        *(_DWORD *)v20 = 136315138;
        v31[1] = v20 + 4;
        swift_bridgeObjectRetain();
        v33 = sub_2272403C4(a1, a2, v34);
        sub_22727D920();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22723A000, v18, v19, "INPlayMediaIntentHandler#removeContinuation retrieved continuation for identifier: %s", v20, 0xCu);
        v21 = v32;
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v21, -1, -1);
        MEMORY[0x2276AF6D4](v20, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      return v16;
    }
    swift_bridgeObjectRelease();
    if (qword_2558CB378 != -1)
      swift_once();
    v26 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v26, v4);
    v27 = sub_22727D4D0();
    v28 = sub_22727D77C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_22723A000, v27, v28, "INPlayMediaIntentHandler#removeContinuation no continuation for identifier, returning no-op continuation", v29, 2u);
      MEMORY[0x2276AF6D4](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
  }
  else
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v4, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v22, v4);
    v23 = sub_22727D4D0();
    v24 = sub_22727D77C();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_22723A000, v23, v24, "INPlayMediaIntentHandler#removeContinuation no identifier, returning no-op continuation", v25, 2u);
      MEMORY[0x2276AF6D4](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  if (qword_2558CB400 != -1)
    swift_once();
  v16 = qword_2558CBFC8;
  swift_retain();
  return v16;
}

uint64_t INPlayMediaIntentHandler.resolveMediaItems(for:with:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint8_t *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  char *v32;
  char *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t aBlock[6];

  v39 = a2;
  v40 = a3;
  v4 = sub_22727D530();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22727D554();
  v42 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v41 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22727D4E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2558CB378 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v10, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  v15 = a1;
  v16 = sub_22727D4D0();
  v17 = sub_22727D788();
  v18 = os_log_type_enabled(v16, v17);
  v43 = v8;
  v44 = v7;
  if (v18)
  {
    v37 = v5;
    v38 = v4;
    v19 = (uint8_t *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    aBlock[0] = v36;
    *(_DWORD *)v19 = 136315138;
    v20 = objc_msgSend(v15, sel_privatePlayMediaIntentData);
    v21 = v20;
    if (v20)
    {
      v22 = objc_msgSend(v20, sel_audioSearchResults);

      if (v22)
      {
        sub_227247C88(0, (unint64_t *)&qword_2558CB810);
        v21 = (void *)sub_22727D638();

      }
      else
      {
        v21 = 0;
      }
    }
    v45 = (uint64_t)v21;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CBFF0);
    v23 = sub_22727D590();
    v45 = sub_2272403C4(v23, v24, aBlock);
    sub_22727D920();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v16, v17, "INPlayMediaIntentHandler#resolveMediaItems looking at search results: %s", v19, 0xCu);
    v25 = v36;
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v25, -1, -1);
    MEMORY[0x2276AF6D4](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v5 = v37;
    v4 = v38;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  if (qword_2558CB408 != -1)
    swift_once();
  v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v27 = (_QWORD *)swift_allocObject();
  v28 = v39;
  v29 = v40;
  v27[2] = v26;
  v27[3] = v28;
  v27[4] = v29;
  v27[5] = v15;
  aBlock[4] = (uint64_t)sub_22727A4A4;
  aBlock[5] = (uint64_t)v27;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2272721AC;
  aBlock[3] = (uint64_t)&block_descriptor_1;
  v30 = _Block_copy(aBlock);
  v31 = v15;
  swift_retain();
  swift_retain();
  v32 = v41;
  sub_22727D53C();
  v45 = MEMORY[0x24BEE4AF8];
  sub_22723CA60(&qword_2558CBFD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CBFE0);
  sub_22727A4C8();
  v33 = v44;
  sub_22727D938();
  MEMORY[0x2276AF128](0, v32, v33, v30);
  _Block_release(v30);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v33, v4);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v32, v43);
  swift_release();
  return swift_release();
}

uint64_t sub_22726C504(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t a3, uint64_t a4)
{
  uint64_t v5;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  void *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(_QWORD);
  uint64_t v47;

  v45 = a4;
  v46 = a2;
  v47 = a3;
  v5 = sub_22727D4C4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v41 - v10;
  v12 = sub_22727D4E8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v41 - v17;
  swift_beginAccess();
  v19 = MEMORY[0x2276AF764](a1 + 16);
  if (v19)
  {
    v42 = (void *)v19;
    v43 = v11;
    v44 = v6;
    if (qword_2558CB378 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v12, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v20, v12);
    v21 = sub_22727D4D0();
    v22 = sub_22727D794();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = v5;
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_22723A000, v21, v22, "INPlayMediaIntentHandler#resolveMediaItems...", v24, 2u);
      v25 = v24;
      v5 = v23;
      MEMORY[0x2276AF6D4](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v46;
    *(_QWORD *)(v26 + 24) = v47;
    v27 = qword_2558CB390;
    swift_retain();
    if (v27 != -1)
      swift_once();
    v28 = (id)logObject;
    v29 = v43;
    sub_22727D4AC();
    v30 = v44;
    (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v9, v29, v5);
    v31 = (*(unsigned __int8 *)(v30 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
    v32 = swift_allocObject();
    v41 = v5;
    *(_QWORD *)(v32 + 16) = "playMediaIntentHandlerResolveMediaItems";
    *(_QWORD *)(v32 + 24) = 39;
    *(_BYTE *)(v32 + 32) = 2;
    (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v32 + v31, v9, v5);
    v33 = (_QWORD *)(v32 + ((v7 + v31 + 7) & 0xFFFFFFFFFFFFFFF8));
    *v33 = sub_22725D528;
    v33[1] = v26;
    swift_retain();
    sub_22727D8D8();
    sub_22727D494();
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = sub_22727A518;
    *(_QWORD *)(v34 + 24) = v32;
    MEMORY[0x24BDAC7A8](v34);
    v35 = v42;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC180);
    sub_22727CBC4();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v41);

    return swift_release();
  }
  else
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v37 = __swift_project_value_buffer(v12, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v37, v12);
    v38 = sub_22727D4D0();
    v39 = sub_22727D788();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_22723A000, v38, v39, "INPlayMediaIntentHandler#resolveMediaItems self deallocated", v40, 2u);
      MEMORY[0x2276AF6D4](v40, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    return v46(MEMORY[0x24BEE4AF8]);
  }
}

void sub_22726C9E4(void (*a1)(uint64_t *), uint64_t a2, void *a3, char *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  NSObject *v52;
  os_log_type_t v53;
  void (*v54)(char *, uint64_t);
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  void **v64;
  id v65;
  uint64_t v66;
  void *v67;
  char *v68;
  NSObject *v69;
  os_log_type_t v70;
  void *v71;
  uint8_t *v72;
  uint8_t *v73;
  id v74;
  void *v75;
  id v76;
  unint64_t v77;
  id v78;
  uint64_t v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  char *v84;
  NSObject *v85;
  os_log_type_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  NSObject *v105;
  os_log_type_t v106;
  uint8_t *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  _QWORD *v111;
  uint64_t v112;
  id v113;
  id v114;
  uint64_t v115;
  void *v116;
  uint8_t *v117;
  char *v118;
  char *v119;
  char *v120;
  char *v121;
  char *v122;
  char *v123;
  void (*v124)(uint64_t *);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void (*v128)(char *, uint64_t, uint64_t);
  uint64_t v129;
  _QWORD v130[2];
  uint64_t v131[3];
  uint64_t v132[2];

  v123 = a4;
  v129 = sub_22727D4E8();
  v7 = *(_QWORD *)(v129 - 8);
  v8 = MEMORY[0x24BDAC7A8](v129);
  v10 = (char *)&v115 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v115 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v115 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v121 = (char *)&v115 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v115 - v19;
  v21 = swift_allocObject();
  v124 = a1;
  *(_QWORD *)(v21 + 16) = a1;
  *(_QWORD *)(v21 + 24) = a2;
  v126 = v21;
  v131[0] = (uint64_t)a3;
  sub_227247C88(0, &qword_2558CB888);
  v125 = a2;
  swift_retain();
  if ((sub_22727CF78() & 1) != 0)
  {
    sub_22727D1DC();
    sub_22727D1D0();
    sub_22727D1C4();
    swift_release();
  }
  objc_opt_self();
  v22 = swift_dynamicCastObjCClass();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = a3;
    v25 = objc_msgSend(v23, sel_privatePlayMediaIntentData);
    if (!v25)
      goto LABEL_16;
    goto LABEL_14;
  }
  objc_opt_self();
  v26 = swift_dynamicCastObjCClass();
  if (v26)
  {
    v27 = (void *)v26;
    v24 = a3;
    v25 = objc_msgSend(v27, sel_privateAddMediaIntentData);
    if (!v25)
      goto LABEL_16;
    goto LABEL_14;
  }
  objc_opt_self();
  v28 = swift_dynamicCastObjCClass();
  if (v28)
  {
    v29 = (void *)v28;
    v24 = a3;
    v25 = objc_msgSend(v29, sel_privateUpdateMediaAffinityIntentData);
    if (!v25)
      goto LABEL_16;
    goto LABEL_14;
  }
  objc_opt_self();
  v30 = swift_dynamicCastObjCClass();
  if (v30)
  {
    v31 = (void *)v30;
    v24 = a3;
    v25 = objc_msgSend(v31, sel_privateSearchForMediaIntentData);
    if (!v25)
      goto LABEL_16;
LABEL_14:
    v32 = v25;
    v33 = objc_msgSend(v25, sel_internalSignals);

    if (v33)
    {
      v34 = sub_22727D638();

      v24 = v33;
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    v34 = MEMORY[0x24BEE4AF8];
    goto LABEL_17;
  }
  v34 = MEMORY[0x24BEE4AF8];
LABEL_18:
  v120 = v16;
  if (qword_2558CB378 != -1)
    swift_once();
  v35 = __swift_project_value_buffer(v129, (uint64_t)qword_2558CC248);
  v36 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v127 = v35;
  v128 = v36;
  ((void (*)(char *))v36)(v20);
  swift_bridgeObjectRetain_n();
  v37 = sub_22727D4D0();
  v38 = sub_22727D794();
  v39 = os_log_type_enabled(v37, v38);
  v122 = v13;
  if (v39)
  {
    v40 = (uint8_t *)swift_slowAlloc();
    v41 = swift_slowAlloc();
    v119 = v10;
    v42 = v41;
    v131[0] = v41;
    *(_DWORD *)v40 = 136315138;
    v117 = v40 + 4;
    v43 = swift_bridgeObjectRetain();
    v44 = a3;
    v45 = MEMORY[0x2276AEEAC](v43, MEMORY[0x24BEE0D00]);
    v118 = v20;
    v46 = v7;
    v48 = v47;
    swift_bridgeObjectRelease();
    v49 = v45;
    a3 = v44;
    v130[0] = sub_2272403C4(v49, v48, v131);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v37, v38, "INPlayMediaIntentHandler#resolveMediaItems sees private intent signals: %s", v40, 0xCu);
    swift_arrayDestroy();
    v50 = v42;
    v10 = v119;
    MEMORY[0x2276AF6D4](v50, -1, -1);
    MEMORY[0x2276AF6D4](v40, -1, -1);

    v51 = *(void (**)(char *, uint64_t))(v46 + 8);
    v51(v118, v129);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v51 = *(void (**)(char *, uint64_t))(v7 + 8);
    v51(v20, v129);
  }
  if ((sub_22727D7E8() & 1) != 0)
  {
    swift_release();
    v128(v10, v127, v129);
    swift_bridgeObjectRetain();
    v52 = sub_22727D4D0();
    v53 = sub_22727D788();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = v51;
      v55 = (uint8_t *)swift_slowAlloc();
      v56 = swift_slowAlloc();
      v131[0] = v56;
      *(_DWORD *)v55 = 136315138;
      v128 = (void (*)(char *, uint64_t, uint64_t))(v55 + 4);
      v57 = swift_bridgeObjectRetain();
      v58 = MEMORY[0x2276AEEAC](v57, MEMORY[0x24BEE0D00]);
      v60 = v59;
      swift_bridgeObjectRelease();
      v130[0] = sub_2272403C4(v58, v60, v131);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v52, v53, "INPlayMediaIntentHandler#resolveMediaItems got signal to immediately error as this is a follow up request that did not succeed, internal signals: %s", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v56, -1, -1);
      MEMORY[0x2276AF6D4](v55, -1, -1);

      v54(v10, v129);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v51(v10, v129);
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v79 = swift_allocObject();
    *(_OWORD *)(v79 + 16) = xmmword_22727E830;
    sub_227247C88(0, &qword_2558CC140);
    *(_QWORD *)(v79 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v131[0] = v79;
    sub_22727D650();
    v124(v131);
LABEL_67:
    swift_bridgeObjectRelease();
    return;
  }
  if ((sub_22727D818() & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1(&v123[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_siriKitTaskLoggingProvider], *(_QWORD *)&v123[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_siriKitTaskLoggingProvider + 24]);
    v61 = a3;
    v62 = objc_msgSend(a3, sel_typeName);
    sub_22727D584();

    a3 = v61;
    sub_22727CB40();
    swift_bridgeObjectRelease();
  }
  v63 = swift_allocObject();
  *(_QWORD *)(v63 + 16) = 0;
  v64 = (void **)(v63 + 16);
  if ((sub_22727D86C() & 1) == 0)
    goto LABEL_63;
  v65 = objc_msgSend(a3, sel_backingStore);
  objc_opt_self();
  v66 = swift_dynamicCastObjCClass();
  if (v66)
  {
    v67 = (void *)v66;
    v119 = (char *)v34;
    v68 = v121;
    v128(v121, v127, v129);
    v69 = sub_22727D4D0();
    v70 = sub_22727D794();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = a3;
      v72 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v72 = 0;
      _os_log_impl(&dword_22723A000, v69, v70, "INPlayMediaIntentHandler#resolveMediaItems fallback: implicit recommendation signal detected", v72, 2u);
      v73 = v72;
      a3 = v71;
      v68 = v121;
      MEMORY[0x2276AF6D4](v73, -1, -1);
    }

    v51(v68, v129);
    v74 = objc_msgSend(v67, sel_privatePlayMediaIntentData);
    if (!v74)
    {
      v76 = 0;
LABEL_45:
      v80 = *v64;
      *v64 = v76;

      v81 = objc_msgSend(v67, sel_privatePlayMediaIntentData);
      if (v81)
      {
        v82 = v81;
        sub_227247C88(0, &qword_2558CBDB0);
        v83 = (void *)sub_22727D620();
        objc_msgSend(v82, sel_setAudioSearchResults_, v83);

      }
      v84 = v120;
      v128(v120, v127, v129);
      swift_retain_n();
      v85 = sub_22727D4D0();
      v86 = sub_22727D794();
      if (!os_log_type_enabled(v85, v86))
      {

        swift_release_n();
        v51(v84, v129);
LABEL_62:
        v34 = (uint64_t)v119;
        goto LABEL_63;
      }
      v87 = swift_slowAlloc();
      v88 = swift_slowAlloc();
      v132[0] = v88;
      *(_DWORD *)v87 = 136446466;
      swift_beginAccess();
      v89 = *v64;
      v116 = a3;
      v121 = (char *)v88;
      if (v89)
      {
        v90 = objc_msgSend(v89, sel_identifier);
        if (v90)
        {
          v91 = v90;
          v92 = sub_22727D584();
          v94 = v93;

        }
        else
        {
          v92 = 0;
          v94 = 0;
        }
        v84 = v120;
      }
      else
      {
        v92 = 0;
        v94 = 0;
      }
      v130[0] = v92;
      v130[1] = v94;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB9F0);
      v95 = sub_22727D590();
      v130[0] = sub_2272403C4(v95, v96, v132);
      sub_22727D920();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v87 + 12) = 2080;
      v97 = *(void **)(v63 + 16);
      if (v97)
      {
        v98 = objc_msgSend(v97, sel_privateMediaItemValueData);
        v99 = v98;
        if (!v98)
        {
LABEL_61:
          v130[0] = v99;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC188);
          v101 = sub_22727D590();
          v130[0] = sub_2272403C4(v101, v102, v132);
          sub_22727D920();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22723A000, v85, v86, "INPlayMediaIntentHandler#resolveMediaItems fallback: found fallback media item: %{public}s with internal signals: %s", (uint8_t *)v87, 0x16u);
          v103 = v121;
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v103, -1, -1);
          MEMORY[0x2276AF6D4](v87, -1, -1);

          v51(v84, v129);
          a3 = v116;
          goto LABEL_62;
        }
        v100 = objc_msgSend(v98, sel_internalSignals);

        if (v100)
        {
          v99 = (void *)sub_22727D638();

          goto LABEL_61;
        }
      }
      v99 = 0;
      goto LABEL_61;
    }
    v75 = v74;
    v76 = objc_msgSend(v74, sel_audioSearchResults);

    if (!v76)
      goto LABEL_45;
    sub_227247C88(0, &qword_2558CBDB0);
    v77 = sub_22727D638();

    if (v77 >> 62)
    {
      swift_bridgeObjectRetain();
      v76 = (id)sub_22727D9BC();
      swift_bridgeObjectRelease();
      if (v76)
        goto LABEL_36;
    }
    else
    {
      v76 = *(id *)((v77 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v76)
      {
LABEL_36:
        if ((v77 & 0xC000000000000001) != 0)
        {
          v78 = (id)MEMORY[0x2276AF200](0, v77);
        }
        else
        {
          if (!*(_QWORD *)((v77 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return;
          }
          v78 = *(id *)(v77 + 32);
        }
        v76 = v78;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }

LABEL_63:
  if ((_s17SiriAudioInternal0C14SignalsManagerC10doesIntent_4haveSbSo8INIntentC_SaySSGtFZ_0(a3, (uint64_t)&unk_24EF897C0) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    v104 = v122;
    v128(v122, v127, v129);
    v105 = sub_22727D4D0();
    v106 = sub_22727D77C();
    if (os_log_type_enabled(v105, v106))
    {
      v107 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v107 = 0;
      _os_log_impl(&dword_22723A000, v105, v106, "INPlayMediaIntentHandler#resolveMediaItems received audio search direct action intent requiring prompt for value", v107, 2u);
      MEMORY[0x2276AF6D4](v107, -1, -1);
    }

    v51(v104, v129);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v108 = swift_allocObject();
    *(_OWORD *)(v108 + 16) = xmmword_22727E830;
    sub_227247C88(0, &qword_2558CC140);
    *(_QWORD *)(v108 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
    v130[0] = v108;
    sub_22727D650();
    v124(v130);
    swift_release();
    goto LABEL_67;
  }
  v109 = v34;
  v110 = v123;
  __swift_project_boxed_opaque_existential_1(&v123[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_appleMediaServicesProvider], *(_QWORD *)&v123[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_appleMediaServicesProvider + 24]);
  v111 = (_QWORD *)swift_allocObject();
  v111[2] = v110;
  v111[3] = a3;
  v112 = v126;
  v111[4] = sub_227263354;
  v111[5] = v112;
  v111[6] = v109;
  v111[7] = v63;
  v113 = a3;
  swift_retain();
  v114 = v110;
  sub_22727D1AC();
  swift_release();
  swift_release();
}

uint64_t sub_22726D878(int a1, void *a2, void *a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v13;
  id v14;

  v13 = a3;
  swift_retain();
  v14 = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22727BD10(v13, v14, v13, a4, a5, a1, v14, a6, a7);

  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_22726D934(unint64_t a1, id a2, void (*a3)(uint64_t), uint64_t a4, int a5, char *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  NSObject *v51;
  int v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  id v62;
  void *v63;
  id v64;
  unint64_t v65;
  NSObject *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  id v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  NSObject *v88;
  os_log_type_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  _QWORD *v105;
  void *v106;
  char *v107;
  uint64_t v108;
  NSObject *v109;
  os_log_type_t v110;
  uint8_t *v111;
  uint8_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  NSObject *v117;
  os_log_type_t v118;
  uint8_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  id v129;
  uint64_t v130;
  char *v131;
  char *v132;
  uint64_t v133;
  _QWORD *v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  char *v138;
  uint64_t v140;
  NSObject *v141;
  os_log_type_t v142;
  uint64_t v143;
  uint8_t *v144;
  uint8_t *v145;
  uint64_t v146;
  id v147;
  uint64_t v148;
  NSObject *v149;
  os_log_type_t v150;
  uint8_t *v151;
  uint64_t v152;
  NSObject *v153;
  os_log_type_t v154;
  uint8_t *v155;
  uint64_t v156;
  NSObject *v157;
  os_log_type_t v158;
  uint64_t v159;
  uint8_t *v160;
  uint8_t *v161;
  id v162;
  id v163;
  void (*v164)(char *, uint64_t, uint64_t);
  void (*v165)(char *, uint64_t);
  char *v166;
  char *v167;
  char *v168;
  unint64_t v169;
  uint64_t v170;
  _QWORD *v171;
  uint64_t v172;
  uint64_t v173;
  _QWORD *v174;
  uint64_t v175;
  char *v176;
  NSObject *v177;
  uint64_t v178;
  void (*v179)(uint64_t);
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;

  v170 = a8;
  v175 = a7;
  v176 = a6;
  LODWORD(v177) = a5;
  v179 = a3;
  v180 = a4;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC148);
  MEMORY[0x24BDAC7A8](v10);
  v174 = (id *)((char *)&v162 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC100);
  v172 = *(_QWORD *)(v12 - 8);
  v173 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v171 = (id *)((char *)&v162 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = sub_22727D4E8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v162 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v162 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v162 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v162 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v162 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v33 = MEMORY[0x24BDAC7A8](v32);
  MEMORY[0x24BDAC7A8](v33);
  if (!a1)
  {
LABEL_62:
    if ((sub_22727D7AC() & 1) == 0)
    {
      if ((sub_22727D7B8() & 1) != 0)
      {
        if (qword_2558CB378 != -1)
          swift_once();
        v148 = __swift_project_value_buffer(v14, (uint64_t)qword_2558CC248);
        (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v21, v148, v14);
        v149 = sub_22727D4D0();
        v150 = sub_22727D794();
        if (os_log_type_enabled(v149, v150))
        {
          v151 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v151 = 0;
          _os_log_impl(&dword_22723A000, v149, v150, "INPlayMediaIntentHandler#resolveMediaItems No search results from remote or local, have AmpError", v151, 2u);
          MEMORY[0x2276AF6D4](v151, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v15 + 8))(v21, v14);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v146 = swift_allocObject();
        *(_OWORD *)(v146 + 16) = xmmword_22727E830;
        v147 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 7);
      }
      else if ((sub_22727D800() & 1) != 0)
      {
        if (qword_2558CB378 != -1)
          swift_once();
        v152 = __swift_project_value_buffer(v14, (uint64_t)qword_2558CC248);
        (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v24, v152, v14);
        v153 = sub_22727D4D0();
        v154 = sub_22727D788();
        if (os_log_type_enabled(v153, v154))
        {
          v155 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v155 = 0;
          _os_log_impl(&dword_22723A000, v153, v154, "INPlayMediaIntentHandler#resolveMediaItems No search results from remote or local, have invalid AMP token", v155, 2u);
          MEMORY[0x2276AF6D4](v155, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v15 + 8))(v24, v14);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v146 = swift_allocObject();
        *(_OWORD *)(v146 + 16) = xmmword_22727E830;
        v147 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 1);
      }
      else
      {
        if (qword_2558CB378 != -1)
          swift_once();
        v156 = __swift_project_value_buffer(v14, (uint64_t)qword_2558CC248);
        (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v27, v156, v14);
        v157 = sub_22727D4D0();
        v158 = sub_22727D788();
        if (os_log_type_enabled(v157, v158))
        {
          v159 = v14;
          v160 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v160 = 0;
          _os_log_impl(&dword_22723A000, v157, v158, "INPlayMediaIntentHandler#resolveMediaItems No search results from remote or local, returning unsupported", v160, 2u);
          v161 = v160;
          v14 = v159;
          MEMORY[0x2276AF6D4](v161, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v15 + 8))(v27, v14);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v146 = swift_allocObject();
        *(_OWORD *)(v146 + 16) = xmmword_22727E830;
        sub_227247C88(0, &qword_2558CC140);
        v147 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      }
      goto LABEL_84;
    }
    if (qword_2558CB378 == -1)
    {
LABEL_64:
      v140 = __swift_project_value_buffer(v14, (uint64_t)qword_2558CC248);
      (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v140, v14);
      v141 = sub_22727D4D0();
      v142 = sub_22727D77C();
      if (os_log_type_enabled(v141, v142))
      {
        v143 = v14;
        v144 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v144 = 0;
        _os_log_impl(&dword_22723A000, v141, v142, "INPlayMediaIntentHandler#resolveMediaItems No search results from remote or local and meets criteria for prompting for value", v144, 2u);
        v145 = v144;
        v14 = v143;
        MEMORY[0x2276AF6D4](v145, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
      v146 = swift_allocObject();
      *(_OWORD *)(v146 + 16) = xmmword_22727E830;
      sub_227247C88(0, &qword_2558CC140);
      v147 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
LABEL_84:
      *(_QWORD *)(v146 + 32) = v147;
      v182 = v146;
      sub_22727D650();
      v179(v182);
      return swift_bridgeObjectRelease();
    }
LABEL_88:
    swift_once();
    goto LABEL_64;
  }
  v38 = (char *)&v162 - v34;
  v166 = v37;
  v167 = v35;
  v178 = v14;
  v168 = v36;
  v169 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v14 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v14)
      goto LABEL_4;
    goto LABEL_61;
  }
  swift_bridgeObjectRetain();
  v14 = sub_22727D9BC();
  if (!v14)
  {
LABEL_61:
    swift_bridgeObjectRelease();
    v14 = v178;
    goto LABEL_62;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v39 = v15;
      v40 = *(id *)(a1 + 32);
      v41 = v178;
      goto LABEL_7;
    }
    __break(1u);
    goto LABEL_88;
  }
  v40 = (id)MEMORY[0x2276AF200](0, a1);
  v41 = v178;
  v39 = v15;
LABEL_7:
  v184 = sub_227247C88(0, &qword_2558CB888);
  v185 = MEMORY[0x24BE91740];
  v182 = (uint64_t)a2;
  v42 = a2;
  sub_22727D728();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v182);
  if ((v177 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_2558CB378 != -1)
      swift_once();
    v43 = __swift_project_value_buffer(v41, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v30, v43, v41);
    v44 = sub_22727D4D0();
    v45 = sub_22727D77C();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_22723A000, v44, v45, "INPlayMediaIntentHandler#resolveMediaItems User needs to sign GDPR returning unsupported to allow for the GDPR dialog", v46, 2u);
      MEMORY[0x2276AF6D4](v46, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v39 + 8))(v30, v41);
    sub_22727D7D0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = xmmword_22727E830;
    sub_227247C88(0, &qword_2558CC140);
    *(_QWORD *)(v47 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v182 = v47;
    sub_22727D650();
    v179(v182);

    return swift_bridgeObjectRelease();
  }
  if (qword_2558CB378 != -1)
    swift_once();
  v48 = __swift_project_value_buffer(v41, (uint64_t)qword_2558CC248);
  v49 = v38;
  v164 = *(void (**)(char *, uint64_t, uint64_t))(v39 + 16);
  v164(v38, v48, v41);
  v50 = (char *)v40;
  v51 = sub_22727D4D0();
  v52 = sub_22727D794();
  if (os_log_type_enabled(v51, (os_log_type_t)v52))
  {
    LODWORD(v165) = v52;
    v177 = v51;
    v53 = v42;
    v54 = swift_slowAlloc();
    v163 = (id)swift_slowAlloc();
    v181 = (uint64_t)v163;
    *(_DWORD *)v54 = 136446466;
    v55 = objc_msgSend(v50, sel_identifier);
    if (v55)
    {
      v56 = v55;
      v57 = sub_22727D584();
      v59 = v58;

    }
    else
    {
      v57 = 0;
      v59 = 0;
    }
    v182 = v57;
    v183 = v59;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB9F0);
    v60 = sub_22727D590();
    v182 = sub_2272403C4(v60, v61, &v181);
    sub_22727D920();

    swift_bridgeObjectRelease();
    *(_WORD *)(v54 + 12) = 2050;
    v62 = objc_msgSend(v50, sel_privateMediaItemValueData);
    if (v62)
    {
      v63 = v62;
      v64 = objc_msgSend(v62, sel_mediaSubItems);

      v41 = v178;
      if (v64)
      {
        sub_227247C88(0, &qword_2558CC118);
        v65 = sub_22727D638();

        if (v65 >> 62)
        {
          swift_bridgeObjectRetain();
          v64 = (id)sub_22727D9BC();

          swift_bridgeObjectRelease_n();
        }
        else
        {
          v64 = *(id *)((v65 & 0xFFFFFFFFFFFFF8) + 0x10);

          swift_bridgeObjectRelease();
        }
      }
      else
      {

      }
    }
    else
    {

      v64 = 0;
      v41 = v178;
    }
    v182 = (uint64_t)v64;
    sub_22727D920();

    v66 = v177;
    _os_log_impl(&dword_22723A000, v177, (os_log_type_t)v165, "INPlayMediaIntentHandler#resolveMediaItems resolved item with identifier: %{public}s and sub items: %{public}ld", (uint8_t *)v54, 0x16u);
    v67 = v163;
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v67, -1, -1);
    MEMORY[0x2276AF6D4](v54, -1, -1);

  }
  else
  {
    v53 = v42;

  }
  v165 = *(void (**)(char *, uint64_t))(v39 + 8);
  v165(v49, v41);
  v68 = objc_msgSend(v53, sel_privatePlayMediaIntentData);
  v177 = objc_msgSend(v68, sel_entityConfidenceSignalsEnabled);

  v69 = objc_msgSend(v53, sel_privatePlayMediaIntentData);
  v70 = objc_msgSend(v69, sel_entityConfidenceSignalsFrequencyDenominatorProd);

  v71 = v53;
  v72 = objc_msgSend(v53, sel_privatePlayMediaIntentData);
  v73 = objc_msgSend(v72, sel_entityConfidenceSignalsFrequencyDenominatorInternal);

  if (v169)
  {
    swift_bridgeObjectRetain();
    v74 = sub_22727D9BC();
    swift_bridgeObjectRelease();
    if (v74 == 1)
      goto LABEL_38;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10) == 1)
  {
    goto LABEL_38;
  }
  if (sub_227277594(v177, v73, v70))
  {
    v75 = objc_msgSend(v71, sel_privatePlayMediaIntentData);
    v162 = v70;
    v163 = v73;
    if (v75
      && (v76 = v75,
          v77 = objc_msgSend(v75, sel_entityConfidenceSignalsMaxItemsToDisambiguate, v162, v163),
          v76,
          v77)
      && (v182 = 0, LOBYTE(v183) = 1, sub_22727D6D4(), v77, v183 != 1))
    {
      v78 = v182;
    }
    else
    {
      v78 = 5;
    }
    v79 = sub_22727A5DC(v78, a1);
    v81 = v80;
    v83 = v82;
    v85 = v84;
    swift_bridgeObjectRelease();
    if ((v85 & 1) != 0)
    {
      sub_22727DA1C();
      swift_unknownObjectRetain_n();
      v114 = swift_dynamicCastClass();
      if (!v114)
      {
        swift_unknownObjectRelease();
        v114 = MEMORY[0x24BEE4AF8];
      }
      v115 = *(_QWORD *)(v114 + 16);
      swift_release();
      if (__OFSUB__(v85 >> 1, v83))
      {
        __break(1u);
      }
      else if (v115 == (v85 >> 1) - v83)
      {
        v86 = swift_dynamicCastClass();
        v41 = v178;
        if (!v86)
        {
          swift_unknownObjectRelease();
          v86 = MEMORY[0x24BEE4AF8];
        }
        goto LABEL_54;
      }
      swift_unknownObjectRelease();
      v41 = v178;
    }
    v86 = sub_227278C90(v79, v81, v83, v85);
LABEL_54:
    swift_unknownObjectRelease();
    v116 = v167;
    v164(v167, v48, v41);
    v117 = sub_22727D4D0();
    v118 = sub_22727D77C();
    if (os_log_type_enabled(v117, v118))
    {
      v119 = (uint8_t *)swift_slowAlloc();
      v120 = swift_slowAlloc();
      v121 = v78;
      v122 = v120;
      v181 = v121;
      v182 = v120;
      *(_DWORD *)v119 = 136446210;
      v123 = sub_22727DA04();
      v181 = sub_2272403C4(v123, v124, &v182);
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v117, v118, "INPlayMediaIntentHandler#resolveMediaItems Disambiguating with %{public}s results", v119, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v122, -1, -1);
      MEMORY[0x2276AF6D4](v119, -1, -1);

      v125 = v116;
      v126 = v178;
    }
    else
    {

      v125 = v116;
      v126 = v41;
    }
    v165(v125, v126);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v127 = swift_allocObject();
    *(_OWORD *)(v127 + 16) = xmmword_22727E830;
    sub_22726EEB8(v86);
    swift_release();
    v128 = (void *)sub_22727D620();
    swift_bridgeObjectRelease();
    v129 = objc_msgSend((id)objc_opt_self(), sel_resolutionResultDisambiguationWithItemsToDisambiguate_, v128);

    *(_QWORD *)(v127 + 32) = v129;
    v182 = v127;
    sub_22727D650();
    v179(v182);

    return swift_bridgeObjectRelease();
  }
LABEL_38:
  if ((sub_22727D848() & 1) != 0 || (sub_22727D860() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v87 = v168;
    v164(v168, v48, v41);
    swift_bridgeObjectRetain_n();
    v88 = sub_22727D4D0();
    v89 = sub_22727D788();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = swift_slowAlloc();
      v91 = swift_slowAlloc();
      v163 = v73;
      v92 = v91;
      v182 = v91;
      v176 = v50;
      *(_DWORD *)v90 = 136315138;
      v174 = (_QWORD *)(v90 + 4);
      v93 = swift_bridgeObjectRetain();
      v94 = v70;
      v95 = MEMORY[0x2276AEEAC](v93, MEMORY[0x24BEE0D00]);
      v97 = v96;
      swift_bridgeObjectRelease();
      v98 = v95;
      v70 = v94;
      v181 = sub_2272403C4(v98, v97, &v182);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v88, v89, "INPlayMediaIntentHandler#resolveMediaItems got signal to immediately error as UnsupportedNonSubscriber or AcousticIdFollowUpSubscriptionNotActive present, internal signals: %s", (uint8_t *)v90, 0xCu);
      swift_arrayDestroy();
      v99 = v92;
      v73 = v163;
      MEMORY[0x2276AF6D4](v99, -1, -1);
      MEMORY[0x2276AF6D4](v90, -1, -1);

      v100 = v87;
      v101 = v178;
      v50 = v176;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v100 = v87;
      v101 = v41;
    }
    v165(v100, v101);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v102 = swift_allocObject();
    *(_OWORD *)(v102 + 16) = xmmword_22727E830;
    *(_QWORD *)(v102 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 2);
    v182 = v102;
    sub_22727D650();
    v179(v182);

  }
  else
  {
    v103 = v48;
    v104 = v50;
    v105 = v174;
    v106 = v50;
    v107 = v176;
    sub_227275A00(v106, v71, v174);

    v108 = v173;
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v172 + 48))(v105, 1, v173) != 1)
    {
      v130 = *(int *)(v108 + 48);
      v163 = v73;
      v131 = (char *)v171 + v130;
      v132 = (char *)v105 + v130;
      *v171 = *v105;
      v133 = sub_22727CF60();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v133 - 8) + 32))(v131, v132, v133);
      v178 = *(_QWORD *)&v107[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_playbackService];
      v134 = (_QWORD *)swift_allocObject();
      v134[2] = v71;
      v134[3] = a1;
      v135 = v180;
      v134[4] = v179;
      v134[5] = v135;
      v136 = v170;
      v134[6] = v175;
      v134[7] = v136;
      v134[8] = v107;
      v137 = v71;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      v138 = v107;
      sub_22727CDD4();

      swift_release();
      swift_release();

      return sub_227246BC0((uint64_t)v171, &qword_2558CC100);
    }
    swift_bridgeObjectRelease();
    sub_227246BC0((uint64_t)v105, (uint64_t *)&unk_2558CC148);
    v164(v166, v103, v41);
    v109 = sub_22727D4D0();
    v110 = sub_22727D770();
    if (os_log_type_enabled(v109, v110))
    {
      v111 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v111 = 0;
      _os_log_impl(&dword_22723A000, v109, v110, "INPlayMediaIntentHandler#resolveMediaItems Problem converting intent to Playback objects", v111, 2u);
      v112 = v111;
      v41 = v178;
      MEMORY[0x2276AF6D4](v112, -1, -1);
    }

    v165(v166, v41);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v113 = swift_allocObject();
    *(_OWORD *)(v113 + 16) = xmmword_22727E830;
    sub_227247C88(0, &qword_2558CC140);
    *(_QWORD *)(v113 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    v182 = v113;
    sub_22727D650();
    v179(v182);

  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_22726EEB8(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_22727D9BC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_227278E3C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x2276AF200](i, a1);
        sub_227247C88(0, (unint64_t *)&qword_2558CB810);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_227278E3C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_227278E3C(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_22724D5E8(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_227247C88(0, (unint64_t *)&qword_2558CB810);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_227278E3C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_227278E3C(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_22724D5E8(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_22726F118(void (*a1)(char *, uint64_t), void *a2, void (*a3)(char *, uint64_t), void (*a4)(_QWORD), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char **v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  _BOOL4 v85;
  uint64_t v86;
  void (*v87)(_QWORD);
  uint8_t *v88;
  uint8_t *v89;
  void (*v90)(char *, uint64_t);
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  int v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint8_t *v103;
  char *v104;
  NSObject *v105;
  os_log_type_t v106;
  uint8_t *v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  void (*v114)(char *, uint64_t);
  char *v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  NSObject *v122;
  uint64_t v123;
  uint64_t v124;
  NSObject *v125;
  os_log_type_t v126;
  uint8_t *v127;
  unint64_t v128;
  char *v129;
  uint64_t v130;
  uint8_t *v131;
  void (*v132)(char *, uint64_t, uint64_t);
  char *v133;
  char *v134;
  NSObject *v135;
  os_log_type_t v136;
  uint8_t *v137;
  uint64_t v138;
  char *v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  unint64_t v144;
  void (*v145)(char *, uint64_t);
  char *v146;
  uint64_t v147;
  char *v148;
  NSObject *v149;
  os_log_type_t v150;
  BOOL v151;
  uint8_t *v152;
  uint8_t *v153;
  uint8_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char *v165;
  char *v166;
  NSObject *v167;
  os_log_type_t v168;
  uint8_t *v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  unint64_t v175;
  char *v176;
  uint64_t v177;
  uint64_t v178;
  id v179;
  char *v180;
  char *v181;
  NSObject *v182;
  os_log_type_t v183;
  uint8_t *v184;
  char *v185;
  char *v186;
  uint64_t v187;
  void (*v188)(_QWORD);
  uint64_t v189;
  unint64_t v190;
  unint64_t v191;
  uint64_t v192;
  char *v193;
  uint64_t v194;
  id *v195;
  id v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  unint64_t v200;
  unint64_t v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  unint64_t v205;
  void (*v206)(char *);
  void *v207;
  void *v208;
  id v209;
  uint64_t v210;
  NSObject *v211;
  os_log_type_t v212;
  uint8_t *v213;
  uint64_t v214;
  char *v215;
  uint64_t v216;
  unint64_t v217;
  unint64_t v218;
  uint8_t *v219;
  char *v220;
  char *v221;
  NSObject *v222;
  os_log_type_t v223;
  uint8_t *v224;
  char *v225;
  uint64_t v226;
  unint64_t v227;
  unint64_t v228;
  uint64_t v229;
  uint8_t *v230;
  char *v231;
  char *v232;
  NSObject *v233;
  uint64_t v234;
  os_log_type_t v235;
  uint8_t *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  unint64_t v241;
  unint64_t v242;
  uint64_t v243;
  char *v244;
  uint64_t v245;
  char *v246;
  char *v247;
  NSObject *v248;
  os_log_type_t v249;
  uint8_t *v250;
  char *v251;
  char *v252;
  uint64_t v253;
  void (*v254)(_QWORD);
  uint64_t v255;
  unint64_t v256;
  unint64_t v257;
  uint64_t v258;
  char *v259;
  uint64_t v260;
  NSObject *v261;
  uint64_t v262;
  os_log_type_t v263;
  uint8_t *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  unint64_t v269;
  unint64_t v270;
  uint64_t v271;
  char *v272;
  uint64_t v273;
  id v274;
  char *v275;
  NSObject *v276;
  uint64_t v277;
  os_log_type_t v278;
  uint8_t *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  unint64_t v284;
  unint64_t v285;
  char *v286;
  uint64_t v287;
  char *v288;
  char *v289;
  NSObject *v290;
  os_log_type_t v291;
  uint8_t *v292;
  char *v293;
  char *v294;
  uint64_t v295;
  void (*v296)(_QWORD);
  uint64_t v297;
  unint64_t v298;
  unint64_t v299;
  uint64_t v300;
  char *v301;
  uint64_t v302;
  char *v303;
  NSObject *v304;
  uint64_t v305;
  os_log_type_t v306;
  uint8_t *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  unint64_t v312;
  unint64_t v313;
  char *v314;
  uint64_t v315;
  uint64_t (*v316)(char *, uint64_t);
  uint64_t v317;
  id v318;
  char *v319;
  char *v320;
  NSObject *v321;
  os_log_type_t v322;
  uint8_t *v323;
  char *v324;
  uint64_t v325;
  uint64_t v326;
  unint64_t v327;
  unint64_t v328;
  uint64_t v329;
  void (*v330)(char *);
  void **v331;
  void *v332;
  char *v333;
  id v334;
  NSObject *v335;
  os_log_type_t v336;
  BOOL v337;
  uint8_t *v338;
  uint64_t v339;
  id v340;
  char *v341;
  void *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  void (*v348)(char *, uint64_t);
  char *v349;
  uint64_t v350;
  char *v351;
  NSObject *v352;
  os_log_type_t v353;
  uint8_t *v354;
  uint8_t *v355;
  uint64_t v356;
  char *v357;
  uint64_t v358;
  unint64_t v359;
  id v360;
  uint64_t v361;
  void *v362;
  uint64_t v363;
  id v364;
  uint64_t v365;
  uint64_t v366;
  id v367;
  NSObject *v368;
  os_log_type_t v369;
  uint8_t *v370;
  uint64_t v371;
  uint64_t v372;
  unint64_t v373;
  char *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  char *v378;
  uint64_t v379;
  char *v380;
  char *v381;
  char *v382;
  char *v383;
  uint64_t v384;
  char *v385;
  char *v386;
  char *v387;
  char *v388;
  char *v389;
  char *v390;
  char *v391;
  char *v392;
  char *v393;
  char *v394;
  uint64_t v395;
  char *v396;
  char *v397;
  char *v398;
  char *v399;
  char *v400;
  char *v401;
  char *v402;
  char *v403;
  char *v404;
  char *v405;
  char *v406;
  uint64_t v407;
  char *v408;
  char *v409;
  id v410;
  char *v411;
  char *v412;
  char *v413;
  uint64_t v414;
  uint64_t v415;
  uint8_t *v416;
  uint64_t v417;
  void (*v418)(char *, uint64_t);
  void (*v419)(char *);
  uint64_t v420;
  uint8_t *v421;
  uint64_t v422;
  char *v423;
  void (*v424)(char *, uint64_t);
  uint64_t v425[2];
  uint64_t v426;
  void (*v427)(_QWORD);
  unint64_t v428;

  v379 = a8;
  v384 = a7;
  v395 = a6;
  v415 = a5;
  v424 = a3;
  v410 = a2;
  v418 = a1;
  v414 = sub_22727CC30();
  v407 = *(_QWORD *)(v414 - 8);
  v9 = MEMORY[0x24BDAC7A8](v414);
  v385 = (char *)&v376 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v409 = (char *)&v376 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v413 = (char *)&v376 - v13;
  v14 = sub_22727D194();
  v421 = *(uint8_t **)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v383 = (char *)&v376 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v382 = (char *)&v376 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v389 = (char *)&v376 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v398 = (char *)&v376 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v405 = (char *)&v376 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v402 = (char *)&v376 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v400 = (char *)&v376 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v393 = (char *)&v376 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v408 = (char *)&v376 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v423 = (char *)&v376 - v33;
  v34 = sub_22727D4C4();
  v416 = *(uint8_t **)(v34 - 8);
  v417 = v34;
  MEMORY[0x24BDAC7A8](v34);
  v36 = (char *)&v376 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC138);
  MEMORY[0x24BDAC7A8](v37);
  v39 = (char **)((char *)&v376 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  v40 = sub_22727D4E8();
  v41 = *(_QWORD *)(v40 - 8);
  v42 = MEMORY[0x24BDAC7A8](v40);
  v387 = (char *)&v376 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = MEMORY[0x24BDAC7A8](v42);
  v386 = (char *)&v376 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v390 = (char *)&v376 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v399 = (char *)&v376 - v49;
  v50 = MEMORY[0x24BDAC7A8](v48);
  v406 = (char *)&v376 - v51;
  v52 = MEMORY[0x24BDAC7A8](v50);
  v403 = (char *)&v376 - v53;
  v54 = MEMORY[0x24BDAC7A8](v52);
  v401 = (char *)&v376 - v55;
  v56 = MEMORY[0x24BDAC7A8](v54);
  v381 = (char *)&v376 - v57;
  v58 = MEMORY[0x24BDAC7A8](v56);
  v380 = (char *)&v376 - v59;
  v60 = MEMORY[0x24BDAC7A8](v58);
  v378 = (char *)&v376 - v61;
  v62 = MEMORY[0x24BDAC7A8](v60);
  v388 = (char *)&v376 - v63;
  v64 = MEMORY[0x24BDAC7A8](v62);
  v391 = (char *)&v376 - v65;
  v66 = MEMORY[0x24BDAC7A8](v64);
  v392 = (char *)&v376 - v67;
  v68 = MEMORY[0x24BDAC7A8](v66);
  v396 = (char *)&v376 - v69;
  v70 = MEMORY[0x24BDAC7A8](v68);
  v394 = (char *)&v376 - v71;
  v72 = MEMORY[0x24BDAC7A8](v70);
  v397 = (char *)&v376 - v73;
  v74 = MEMORY[0x24BDAC7A8](v72);
  v412 = (char *)&v376 - v75;
  v76 = MEMORY[0x24BDAC7A8](v74);
  v411 = (char *)&v376 - v77;
  v78 = MEMORY[0x24BDAC7A8](v76);
  v404 = (char *)&v376 - v79;
  MEMORY[0x24BDAC7A8](v78);
  v81 = (char *)&v376 - v80;
  if (qword_2558CB378 != -1)
    swift_once();
  v82 = __swift_project_value_buffer(v40, (uint64_t)qword_2558CC248);
  v419 = *(void (**)(char *))(v41 + 16);
  v420 = v82;
  v419(v81);
  v83 = sub_22727D4D0();
  v84 = sub_22727D770();
  v85 = os_log_type_enabled(v83, v84);
  v422 = v40;
  if (v85)
  {
    v86 = v14;
    v87 = a4;
    v88 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v88 = 0;
    _os_log_impl(&dword_22723A000, v83, v84, "INPlayMediaIntentHandler#resolveMediaItems completed for INPlayMediaIntent (possibly success or failure)", v88, 2u);
    v89 = v88;
    a4 = v87;
    v14 = v86;
    v40 = v422;
    MEMORY[0x2276AF6D4](v89, -1, -1);
  }

  v90 = *(void (**)(char *, uint64_t))(v41 + 8);
  v90(v81, v40);
  sub_2272471A0((uint64_t)v418, (uint64_t)v39, &qword_2558CC138);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v418 = v90;
    (*((void (**)(char *, char **, uint64_t))v421 + 4))(v423, v39, v14);
    v91 = v413;
    sub_22727D17C();
    v92 = sub_22727CC24();
    v94 = v93;
    v95 = v407;
    v96 = v414;
    v424 = *(void (**)(char *, uint64_t))(v407 + 8);
    v424(v91, v414);
    sub_22727D8E4();
    if (qword_2558CB390 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC190);
    v97 = swift_allocObject();
    *(_OWORD *)(v97 + 16) = xmmword_22727E530;
    *(_QWORD *)(v97 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v97 + 64) = sub_22727C8EC();
    *(_QWORD *)(v97 + 32) = v92;
    *(_QWORD *)(v97 + 40) = v94;
    swift_bridgeObjectRetain();
    sub_22727D4B8();
    sub_22727D494();
    swift_bridgeObjectRelease();
    (*((void (**)(char *, uint64_t))v416 + 1))(v36, v417);
    swift_bridgeObjectRelease();
    v98 = v409;
    sub_22727D17C();
    v99 = (*(uint64_t (**)(char *, uint64_t))(v95 + 88))(v98, v96);
    v100 = v408;
    if (v99 == *MEMORY[0x24BE91010])
    {
      v101 = v406;
      v102 = v422;
      ((void (*)(char *, uint64_t, uint64_t))v419)(v406, v420, v422);
      v103 = v421;
      v104 = v405;
      (*((void (**)(char *, char *, uint64_t))v421 + 2))(v405, v423, v14);
      v105 = sub_22727D4D0();
      v106 = sub_22727D788();
      if (os_log_type_enabled(v105, v106))
      {
        v107 = (uint8_t *)swift_slowAlloc();
        v108 = swift_slowAlloc();
        v427 = (void (*)(_QWORD))v108;
        *(_DWORD *)v107 = 136446210;
        v419 = (void (*)(char *))(v107 + 4);
        v109 = v413;
        sub_22727D17C();
        v110 = sub_22727CC24();
        v420 = (uint64_t)a4;
        v111 = v14;
        v113 = v112;
        v424(v109, v414);
        v425[0] = sub_2272403C4(v110, v113, (uint64_t *)&v427);
        sub_22727D920();
        v14 = v111;
        a4 = (void (*)(_QWORD))v420;
        swift_bridgeObjectRelease();
        v114 = (void (*)(char *, uint64_t))*((_QWORD *)v421 + 1);
        v114(v104, v14);
        _os_log_impl(&dword_22723A000, v105, v106, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, unsupported playback queue location", v107, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v108, -1, -1);
        MEMORY[0x2276AF6D4](v107, -1, -1);

        v115 = v406;
        v116 = v422;
      }
      else
      {
        v114 = (void (*)(char *, uint64_t))*((_QWORD *)v103 + 1);
        v114(v104, v14);

        v115 = v101;
        v116 = v102;
      }
      v418(v115, v116);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
      v163 = swift_allocObject();
      *(_OWORD *)(v163 + 16) = xmmword_22727E830;
      *(_QWORD *)(v163 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, *MEMORY[0x24BDDA470]);
      v427 = (void (*)(_QWORD))v163;
      sub_22727D650();
      a4(v427);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, uint64_t))v114)(v423, v14);
    }
    v131 = v421;
    v130 = v422;
    v132 = (void (*)(char *, uint64_t, uint64_t))v419;
    if (v99 == *MEMORY[0x24BE91030])
    {
      v133 = v403;
      ((void (*)(char *, uint64_t, uint64_t))v419)(v403, v420, v422);
      v134 = v402;
      (*((void (**)(char *, char *, uint64_t))v131 + 2))(v402, v423, v14);
      v135 = sub_22727D4D0();
      v136 = sub_22727D788();
      if (os_log_type_enabled(v135, v136))
      {
        v137 = (uint8_t *)swift_slowAlloc();
        v138 = swift_slowAlloc();
        v427 = (void (*)(_QWORD))v138;
        *(_DWORD *)v137 = 136446210;
        v419 = (void (*)(char *))(v137 + 4);
        v139 = v134;
        v140 = v413;
        sub_22727D17C();
        v141 = sub_22727CC24();
        v420 = (uint64_t)a4;
        v142 = v14;
        v144 = v143;
        v424(v140, v414);
        v425[0] = sub_2272403C4(v141, v144, (uint64_t *)&v427);
        sub_22727D920();
        v14 = v142;
        a4 = (void (*)(_QWORD))v420;
        swift_bridgeObjectRelease();
        v145 = (void (*)(char *, uint64_t))*((_QWORD *)v421 + 1);
        v145(v139, v14);
        _os_log_impl(&dword_22723A000, v135, v136, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, create radio failed", v137, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v138, -1, -1);
        MEMORY[0x2276AF6D4](v137, -1, -1);

        v146 = v403;
        v147 = v422;
      }
      else
      {
        v145 = (void (*)(char *, uint64_t))*((_QWORD *)v131 + 1);
        v145(v134, v14);

        v146 = v133;
        v147 = v130;
      }
      v418(v146, v147);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
      v178 = swift_allocObject();
      *(_OWORD *)(v178 + 16) = xmmword_22727E830;
      v179 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, *MEMORY[0x24BDDA458]);
LABEL_104:
      *(_QWORD *)(v178 + 32) = v179;
      v427 = (void (*)(_QWORD))v178;
      sub_22727D650();
      a4(v427);
      swift_bridgeObjectRelease();
      return ((uint64_t (*)(char *, uint64_t))v145)(v423, v14);
    }
    if (v99 == *MEMORY[0x24BE91038])
    {
      v165 = v401;
      ((void (*)(char *, uint64_t, uint64_t))v419)(v401, v420, v422);
      v166 = v400;
      (*((void (**)(char *, char *, uint64_t))v131 + 2))(v400, v423, v14);
      v167 = sub_22727D4D0();
      v168 = sub_22727D788();
      if (os_log_type_enabled(v167, v168))
      {
        v169 = (uint8_t *)swift_slowAlloc();
        v170 = swift_slowAlloc();
        v427 = (void (*)(_QWORD))v170;
        *(_DWORD *)v169 = 136446210;
        v419 = (void (*)(char *))(v169 + 4);
        v171 = v413;
        sub_22727D17C();
        v172 = sub_22727CC24();
        v420 = (uint64_t)a4;
        v173 = v14;
        v175 = v174;
        v424(v171, v414);
        v425[0] = sub_2272403C4(v172, v175, (uint64_t *)&v427);
        sub_22727D920();
        v14 = v173;
        a4 = (void (*)(_QWORD))v420;
        swift_bridgeObjectRelease();
        v145 = (void (*)(char *, uint64_t))*((_QWORD *)v421 + 1);
        v145(v166, v14);
        _os_log_impl(&dword_22723A000, v167, v168, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, playback device not found", v169, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v170, -1, -1);
        MEMORY[0x2276AF6D4](v169, -1, -1);

        v176 = v401;
        v177 = v422;
      }
      else
      {
        v145 = (void (*)(char *, uint64_t))*((_QWORD *)v131 + 1);
        v145(v166, v14);

        v176 = v165;
        v177 = v130;
      }
      v418(v176, v177);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
      v178 = swift_allocObject();
      *(_OWORD *)(v178 + 16) = xmmword_22727E830;
      v179 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, *MEMORY[0x24BDDA468]);
      goto LABEL_104;
    }
    if (v99 == *MEMORY[0x24BE91040])
    {
      v180 = v399;
      ((void (*)(char *, uint64_t, uint64_t))v419)(v399, v420, v422);
      v181 = v398;
      (*((void (**)(char *, char *, uint64_t))v131 + 2))(v398, v423, v14);
      v182 = sub_22727D4D0();
      v183 = sub_22727D788();
      if (os_log_type_enabled(v182, v183))
      {
        v184 = (uint8_t *)swift_slowAlloc();
        v420 = swift_slowAlloc();
        v427 = (void (*)(_QWORD))v420;
        *(_DWORD *)v184 = 136446210;
        v419 = (void (*)(char *))(v184 + 4);
        v185 = v181;
        v186 = v413;
        sub_22727D17C();
        v187 = sub_22727CC24();
        v188 = a4;
        v189 = v14;
        v191 = v190;
        v424(v186, v414);
        v425[0] = sub_2272403C4(v187, v191, (uint64_t *)&v427);
        sub_22727D920();
        v14 = v189;
        a4 = v188;
        swift_bridgeObjectRelease();
        v145 = (void (*)(char *, uint64_t))*((_QWORD *)v421 + 1);
        v145(v185, v14);
        _os_log_impl(&dword_22723A000, v182, v183, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, explicit content disabled", v184, 0xCu);
        v192 = v420;
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v192, -1, -1);
        MEMORY[0x2276AF6D4](v184, -1, -1);

        v193 = v399;
        v194 = v422;
      }
      else
      {
        v145 = (void (*)(char *, uint64_t))*((_QWORD *)v131 + 1);
        v145(v181, v14);

        v193 = v180;
        v194 = v130;
      }
      v418(v193, v194);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
      v178 = swift_allocObject();
      *(_OWORD *)(v178 + 16) = xmmword_22727E830;
      v179 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 4);
      goto LABEL_104;
    }
    if (v99 == *MEMORY[0x24BE91048])
    {
      ((void (*)(char *, uint64_t, uint64_t))v419)(v397, v420, v422);
      (*((void (**)(char *, char *, uint64_t))v131 + 2))(v100, v423, v14);
      v211 = sub_22727D4D0();
      v212 = sub_22727D788();
      if (os_log_type_enabled(v211, v212))
      {
        v213 = (uint8_t *)swift_slowAlloc();
        v214 = swift_slowAlloc();
        v427 = (void (*)(_QWORD))v214;
        *(_DWORD *)v213 = 136446210;
        v417 = (uint64_t)(v213 + 4);
        v215 = v413;
        sub_22727D17C();
        v216 = sub_22727CC24();
        v377 = v14;
        v218 = v217;
        v424(v215, v414);
        v425[0] = sub_2272403C4(v216, v218, (uint64_t *)&v427);
        sub_22727D920();
        v14 = v377;
        v132 = (void (*)(char *, uint64_t, uint64_t))v419;
        swift_bridgeObjectRelease();
        v145 = (void (*)(char *, uint64_t))*((_QWORD *)v421 + 1);
        v145(v100, v14);
        _os_log_impl(&dword_22723A000, v211, v212, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, requested content not found", v213, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v214, -1, -1);
        v219 = v213;
        v130 = v422;
        MEMORY[0x2276AF6D4](v219, -1, -1);
      }
      else
      {
        v145 = (void (*)(char *, uint64_t))*((_QWORD *)v131 + 1);
        v145(v100, v14);
      }

      v418(v397, v130);
      v231 = v396;
      if ((sub_22727D800() & 1) != 0)
      {
        v232 = v394;
        v132(v394, v420, v130);
        swift_bridgeObjectRetain_n();
        v233 = sub_22727D4D0();
        v234 = v130;
        v235 = sub_22727D788();
        if (os_log_type_enabled(v233, v235))
        {
          v424 = v145;
          v236 = (uint8_t *)swift_slowAlloc();
          v237 = swift_slowAlloc();
          v427 = (void (*)(_QWORD))v237;
          *(_DWORD *)v236 = 136315138;
          v421 = v236 + 4;
          v238 = swift_bridgeObjectRetain();
          v239 = MEMORY[0x2276AEEAC](v238, MEMORY[0x24BEE0D00]);
          v240 = v14;
          v242 = v241;
          swift_bridgeObjectRelease();
          v243 = v239;
          v145 = v424;
          v425[0] = sub_2272403C4(v243, v242, (uint64_t *)&v427);
          sub_22727D920();
          swift_bridgeObjectRelease_n();
          v14 = v240;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22723A000, v233, v235, "INPlayMediaIntentHandler#resolveMediaItems (notFound) got signal indicating invalid AMP token for user(s) - %s", v236, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v237, -1, -1);
          MEMORY[0x2276AF6D4](v236, -1, -1);

          v244 = v394;
          v245 = v422;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v244 = v232;
          v245 = v234;
        }
        v418(v244, v245);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v178 = swift_allocObject();
        *(_OWORD *)(v178 + 16) = xmmword_22727E830;
        v179 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 1);
      }
      else if ((sub_22727D7B8() & 1) != 0)
      {
        v132(v231, v420, v130);
        swift_bridgeObjectRetain_n();
        v261 = sub_22727D4D0();
        v262 = v130;
        v263 = sub_22727D788();
        if (os_log_type_enabled(v261, v263))
        {
          v424 = v145;
          v264 = (uint8_t *)swift_slowAlloc();
          v265 = swift_slowAlloc();
          v427 = (void (*)(_QWORD))v265;
          *(_DWORD *)v264 = 136315138;
          v421 = v264 + 4;
          v266 = swift_bridgeObjectRetain();
          v267 = MEMORY[0x2276AEEAC](v266, MEMORY[0x24BEE0D00]);
          v268 = v14;
          v270 = v269;
          swift_bridgeObjectRelease();
          v271 = v267;
          v145 = v424;
          v425[0] = sub_2272403C4(v271, v270, (uint64_t *)&v427);
          sub_22727D920();
          swift_bridgeObjectRelease_n();
          v14 = v268;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22723A000, v261, v263, "INPlayMediaIntentHandler#resolveMediaItems (notFound) got signal indicating have AmpError for user(s) - %s", v264, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v265, -1, -1);
          MEMORY[0x2276AF6D4](v264, -1, -1);

          v272 = v396;
          v273 = v422;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v272 = v231;
          v273 = v262;
        }
        v418(v272, v273);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v178 = swift_allocObject();
        *(_OWORD *)(v178 + 16) = xmmword_22727E830;
        v179 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 7);
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v178 = swift_allocObject();
        *(_OWORD *)(v178 + 16) = xmmword_22727E830;
        sub_227247C88(0, &qword_2558CC140);
        v179 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      }
      goto LABEL_104;
    }
    if (v99 == *MEMORY[0x24BE91018])
    {
      v220 = v392;
      ((void (*)(char *, uint64_t, uint64_t))v419)(v392, v420, v422);
      v221 = v393;
      (*((void (**)(char *, char *, uint64_t))v131 + 2))(v393, v423, v14);
      v222 = sub_22727D4D0();
      v223 = sub_22727D788();
      if (os_log_type_enabled(v222, v223))
      {
        v224 = (uint8_t *)swift_slowAlloc();
        v417 = swift_slowAlloc();
        v427 = (void (*)(_QWORD))v417;
        *(_DWORD *)v224 = 136446210;
        v416 = v224 + 4;
        v225 = v413;
        sub_22727D17C();
        v226 = sub_22727CC24();
        v377 = v14;
        v228 = v227;
        v424(v225, v414);
        v425[0] = sub_2272403C4(v226, v228, (uint64_t *)&v427);
        sub_22727D920();
        v14 = v377;
        v132 = (void (*)(char *, uint64_t, uint64_t))v419;
        swift_bridgeObjectRelease();
        v424 = (void (*)(char *, uint64_t))*((_QWORD *)v421 + 1);
        v424(v221, v14);
        _os_log_impl(&dword_22723A000, v222, v223, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, empty library", v224, 0xCu);
        v229 = v417;
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v229, -1, -1);
        v230 = v224;
        v130 = v422;
        MEMORY[0x2276AF6D4](v230, -1, -1);
      }
      else
      {
        v424 = (void (*)(char *, uint64_t))*((_QWORD *)v131 + 1);
        v424(v221, v14);
      }

      v418(v220, v130);
      v274 = v410;
      if ((sub_22727D800() & 1) != 0)
      {
        v275 = v391;
        v132(v391, v420, v130);
        swift_bridgeObjectRetain_n();
        v276 = sub_22727D4D0();
        v277 = v130;
        v278 = sub_22727D788();
        if (os_log_type_enabled(v276, v278))
        {
          v279 = (uint8_t *)swift_slowAlloc();
          v280 = swift_slowAlloc();
          v427 = (void (*)(_QWORD))v280;
          *(_DWORD *)v279 = 136315138;
          v421 = v279 + 4;
          v281 = swift_bridgeObjectRetain();
          v282 = MEMORY[0x2276AEEAC](v281, MEMORY[0x24BEE0D00]);
          v283 = v14;
          v285 = v284;
          swift_bridgeObjectRelease();
          v425[0] = sub_2272403C4(v282, v285, (uint64_t *)&v427);
          sub_22727D920();
          swift_bridgeObjectRelease_n();
          v14 = v283;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22723A000, v276, v278, "INPlayMediaIntentHandler#resolveMediaItems (emptyLibrary) got signal indicating invalid AMP token for user(s) - %s", v279, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v280, -1, -1);
          MEMORY[0x2276AF6D4](v279, -1, -1);

          v286 = v391;
          v287 = v422;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v286 = v275;
          v287 = v277;
        }
        v418(v286, v287);
        v316 = (uint64_t (*)(char *, uint64_t))v424;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v317 = swift_allocObject();
        *(_OWORD *)(v317 + 16) = xmmword_22727E830;
        v318 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 1);
LABEL_107:
        *(_QWORD *)(v317 + 32) = v318;
        v427 = (void (*)(_QWORD))v317;
        sub_22727D650();
        a4(v427);
        swift_bridgeObjectRelease();
        return v316(v423, v14);
      }
      if ((sub_22727D7B8() & 1) != 0)
      {
        v303 = v388;
        v132(v388, v420, v130);
        swift_bridgeObjectRetain_n();
        v304 = sub_22727D4D0();
        v305 = v130;
        v306 = sub_22727D788();
        if (os_log_type_enabled(v304, v306))
        {
          v307 = (uint8_t *)swift_slowAlloc();
          v308 = swift_slowAlloc();
          v427 = (void (*)(_QWORD))v308;
          *(_DWORD *)v307 = 136315138;
          v421 = v307 + 4;
          v309 = swift_bridgeObjectRetain();
          v310 = MEMORY[0x2276AEEAC](v309, MEMORY[0x24BEE0D00]);
          v311 = v14;
          v313 = v312;
          swift_bridgeObjectRelease();
          v425[0] = sub_2272403C4(v310, v313, (uint64_t *)&v427);
          sub_22727D920();
          swift_bridgeObjectRelease_n();
          v14 = v311;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22723A000, v304, v306, "INPlayMediaIntentHandler#resolveMediaItems (emptyLibrary) got signal indicating have AmpError for user(s) - %s", v307, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v308, -1, -1);
          MEMORY[0x2276AF6D4](v307, -1, -1);

          v314 = v388;
          v315 = v422;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          v314 = v303;
          v315 = v305;
        }
        v418(v314, v315);
        v316 = (uint64_t (*)(char *, uint64_t))v424;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v317 = swift_allocObject();
        *(_OWORD *)(v317 + 16) = xmmword_22727E830;
        v318 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 7);
        goto LABEL_107;
      }
      v331 = (void **)(v384 + 16);
      swift_beginAccess();
      v332 = *v331;
      if (v332)
      {
        v333 = v380;
        v132(v380, v420, v130);
        v334 = v332;
        v335 = sub_22727D4D0();
        v336 = sub_22727D794();
        v337 = os_log_type_enabled(v335, v336);
        v377 = v14;
        if (v337)
        {
          v338 = (uint8_t *)swift_slowAlloc();
          v339 = swift_slowAlloc();
          v426 = v339;
          *(_DWORD *)v338 = 136446210;
          v340 = objc_msgSend(v334, sel_identifier);
          v341 = v381;
          if (v340)
          {
            v342 = v340;
            v343 = sub_22727D584();
            v345 = v344;

          }
          else
          {
            v343 = 0;
            v345 = 0;
          }
          v425[0] = v343;
          v425[1] = v345;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB9F0);
          v358 = sub_22727D590();
          v425[0] = sub_2272403C4(v358, v359, &v426);
          sub_22727D920();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22723A000, v335, v336, "INPlayMediaIntentHandler#resolveMediaItems fallback item available for implicit recommendation: %{public}s", v338, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v339, -1, -1);
          MEMORY[0x2276AF6D4](v338, -1, -1);

          v418(v380, v422);
          v14 = v377;
          v274 = v410;
          v132 = (void (*)(char *, uint64_t, uint64_t))v419;
          v357 = v341;
        }
        else
        {

          v418(v333, v130);
          v357 = v381;
        }
        v360 = objc_msgSend(v274, sel_backingStore);
        objc_opt_self();
        v361 = swift_dynamicCastObjCClass();
        if (v361)
        {
          v362 = (void *)v361;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
          v363 = swift_allocObject();
          *(_OWORD *)(v363 + 16) = xmmword_22727E830;
          *(_QWORD *)(v363 + 32) = v334;
          v425[0] = v363;
          sub_22727D650();
          sub_227247C88(0, &qword_2558CBDB0);
          v364 = v334;
          v365 = sub_22727D620();
          swift_bridgeObjectRelease();
          objc_msgSend(v362, sel_setMediaItems_, v365);

          v360 = (id)v365;
        }

        sub_22727D878();
        v366 = v422;
        v132(v357, v420, v422);
        v367 = v274;
        v368 = sub_22727D4D0();
        v369 = sub_22727D794();
        if (os_log_type_enabled(v368, v369))
        {
          v370 = (uint8_t *)swift_slowAlloc();
          v371 = swift_slowAlloc();
          v425[0] = v371;
          *(_DWORD *)v370 = 136446210;
          v372 = sub_22727D7DC();
          v426 = sub_2272403C4(v372, v373, v425);
          v14 = v377;
          sub_22727D920();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22723A000, v368, v369, "INPlayMediaIntentHandler#resolveMediaItems restarting resolveMediaItems with intent: %{public}s", v370, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v371, -1, -1);
          MEMORY[0x2276AF6D4](v370, -1, -1);

          v374 = v381;
          v375 = v422;
        }
        else
        {

          v374 = v357;
          v375 = v366;
        }
        v418(v374, v375);
        INPlayMediaIntentHandler.resolveMediaItems(for:with:)(v367, a4, v415);

      }
      else
      {
        v351 = v378;
        v132(v378, v420, v130);
        v352 = sub_22727D4D0();
        v353 = sub_22727D788();
        if (os_log_type_enabled(v352, v353))
        {
          v354 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v354 = 0;
          _os_log_impl(&dword_22723A000, v352, v353, "INPlayMediaIntentHandler#resolveMediaItems no fallback search item available for empty library result", v354, 2u);
          v355 = v354;
          v130 = v422;
          MEMORY[0x2276AF6D4](v355, -1, -1);
        }

        v418(v351, v130);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v356 = swift_allocObject();
        *(_OWORD *)(v356 + 16) = xmmword_22727E830;
        *(_QWORD *)(v356 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, *MEMORY[0x24BDDA460]);
        v425[0] = v356;
        sub_22727D650();
        a4(v425[0]);
        swift_bridgeObjectRelease();
      }
      return ((uint64_t (*)(char *, uint64_t))v424)(v423, v14);
    }
    else
    {
      if (v99 == *MEMORY[0x24BE91020])
      {
        v246 = v390;
        ((void (*)(char *, uint64_t, uint64_t))v419)(v390, v420, v422);
        v247 = v389;
        (*((void (**)(char *, char *, uint64_t))v131 + 2))(v389, v423, v14);
        v248 = sub_22727D4D0();
        v249 = sub_22727D788();
        if (os_log_type_enabled(v248, v249))
        {
          v250 = (uint8_t *)swift_slowAlloc();
          v420 = swift_slowAlloc();
          v427 = (void (*)(_QWORD))v420;
          *(_DWORD *)v250 = 136446210;
          v419 = (void (*)(char *))(v250 + 4);
          v251 = v247;
          v252 = v413;
          sub_22727D17C();
          v253 = sub_22727CC24();
          v254 = a4;
          v255 = v14;
          v257 = v256;
          v424(v252, v414);
          v425[0] = sub_2272403C4(v253, v257, (uint64_t *)&v427);
          sub_22727D920();
          v14 = v255;
          a4 = v254;
          swift_bridgeObjectRelease();
          v145 = (void (*)(char *, uint64_t))*((_QWORD *)v421 + 1);
          v145(v251, v14);
          _os_log_impl(&dword_22723A000, v248, v249, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, need network to play content", v250, 0xCu);
          v258 = v420;
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v258, -1, -1);
          MEMORY[0x2276AF6D4](v250, -1, -1);

          v259 = v390;
          v260 = v422;
        }
        else
        {
          v145 = (void (*)(char *, uint64_t))*((_QWORD *)v131 + 1);
          v145(v247, v14);

          v259 = v246;
          v260 = v130;
        }
        v418(v259, v260);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v178 = swift_allocObject();
        *(_OWORD *)(v178 + 16) = xmmword_22727E830;
        v179 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 5);
        goto LABEL_104;
      }
      if (v99 == *MEMORY[0x24BE91028])
      {
        v288 = v386;
        ((void (*)(char *, uint64_t, uint64_t))v419)(v386, v420, v422);
        v289 = v382;
        (*((void (**)(char *, char *, uint64_t))v131 + 2))(v382, v423, v14);
        v290 = sub_22727D4D0();
        v291 = sub_22727D788();
        if (os_log_type_enabled(v290, v291))
        {
          v292 = (uint8_t *)swift_slowAlloc();
          v420 = swift_slowAlloc();
          v427 = (void (*)(_QWORD))v420;
          *(_DWORD *)v292 = 136446210;
          v419 = (void (*)(char *))(v292 + 4);
          v293 = v289;
          v294 = v413;
          sub_22727D17C();
          v295 = sub_22727CC24();
          v296 = a4;
          v297 = v14;
          v299 = v298;
          v424(v294, v414);
          v425[0] = sub_2272403C4(v295, v299, (uint64_t *)&v427);
          sub_22727D920();
          v14 = v297;
          a4 = v296;
          swift_bridgeObjectRelease();
          v145 = (void (*)(char *, uint64_t))*((_QWORD *)v421 + 1);
          v145(v293, v14);
          _os_log_impl(&dword_22723A000, v290, v291, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, need subscription to play podcast content", v292, 0xCu);
          v300 = v420;
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v300, -1, -1);
          MEMORY[0x2276AF6D4](v292, -1, -1);

          v301 = v386;
          v302 = v422;
        }
        else
        {
          v145 = (void (*)(char *, uint64_t))*((_QWORD *)v131 + 1);
          v145(v289, v14);

          v301 = v288;
          v302 = v130;
        }
        v418(v301, v302);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
        v178 = swift_allocObject();
        *(_OWORD *)(v178 + 16) = xmmword_22727E830;
        v179 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 2);
        goto LABEL_104;
      }
      v319 = v387;
      ((void (*)(char *, uint64_t, uint64_t))v419)(v387, v420, v422);
      v320 = v383;
      (*((void (**)(char *, char *, uint64_t))v131 + 2))(v383, v423, v14);
      v321 = sub_22727D4D0();
      v322 = sub_22727D788();
      if (os_log_type_enabled(v321, v322))
      {
        v323 = (uint8_t *)swift_slowAlloc();
        v419 = (void (*)(char *))swift_slowAlloc();
        v427 = (void (*)(_QWORD))v419;
        *(_DWORD *)v323 = 136446210;
        v417 = (uint64_t)(v323 + 4);
        v324 = v413;
        sub_22727D17C();
        v325 = sub_22727CC24();
        v420 = (uint64_t)a4;
        v326 = v14;
        v328 = v327;
        v329 = v414;
        v424(v324, v414);
        v425[0] = sub_2272403C4(v325, v328, (uint64_t *)&v427);
        sub_22727D920();
        v14 = v326;
        a4 = (void (*)(_QWORD))v420;
        swift_bridgeObjectRelease();
        v421 = (uint8_t *)*((_QWORD *)v421 + 1);
        ((void (*)(char *, uint64_t))v421)(v320, v14);
        _os_log_impl(&dword_22723A000, v321, v322, "INPlayMediaIntentHandler#resolveMediaItems Error warming content with code: %{public}s, returning temporary failure type: restrictedContent", v323, 0xCu);
        v330 = v419;
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v330, -1, -1);
        MEMORY[0x2276AF6D4](v323, -1, -1);

        v418(v387, v422);
      }
      else
      {
        v421 = (uint8_t *)*((_QWORD *)v131 + 1);
        ((void (*)(char *, uint64_t))v421)(v320, v14);

        v418(v319, v130);
        v324 = v413;
        v329 = v414;
      }
      v422 = sub_22727CF90();
      sub_22727D17C();
      sub_22727CC24();
      v346 = v329;
      v347 = v329;
      v348 = v424;
      v424(v324, v347);
      v427 = 0;
      v428 = 0xE000000000000000;
      sub_22727D974();
      sub_22727D5D8();
      v349 = v385;
      sub_22727D17C();
      sub_22727CC24();
      v348(v349, v346);
      sub_22727D5D8();
      swift_bridgeObjectRelease();
      sub_22727CF84();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
      v350 = swift_allocObject();
      *(_OWORD *)(v350 + 16) = xmmword_22727E830;
      *(_QWORD *)(v350 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 6);
      v427 = (void (*)(_QWORD))v350;
      sub_22727D650();
      a4(v427);
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v421)(v423, v14);
      return ((uint64_t (*)(char *, uint64_t))v348)(v409, v346);
    }
  }
  else
  {
    v423 = *v39;
    sub_22727D8E4();
    if (qword_2558CB390 != -1)
      swift_once();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC190);
    v117 = swift_allocObject();
    *(_OWORD *)(v117 + 16) = xmmword_22727E530;
    *(_QWORD *)(v117 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v117 + 64) = sub_22727C8EC();
    *(_QWORD *)(v117 + 32) = 0x73736563637573;
    *(_QWORD *)(v117 + 40) = 0xE700000000000000;
    sub_22727D4B8();
    sub_22727D494();
    swift_bridgeObjectRelease();
    (*((void (**)(char *, uint64_t))v416 + 1))(v36, v417);
    v118 = objc_msgSend(v410, sel_intentId);
    v119 = (uint64_t)v419;
    v120 = v420;
    if (!v118)
    {
      v148 = v404;
      ((void (*)(char *, uint64_t, uint64_t))v419)(v404, v420, v40);
      v149 = sub_22727D4D0();
      v150 = sub_22727D788();
      v151 = os_log_type_enabled(v149, v150);
      v128 = (unint64_t)v424;
      if (v151)
      {
        v152 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v152 = 0;
        _os_log_impl(&dword_22723A000, v149, v150, "INPlayMediaIntentHandler#resolveMediaItems NO intentId for intent - not tracking continuation", v152, 2u);
        v153 = v152;
        v40 = v422;
        MEMORY[0x2276AF6D4](v153, -1, -1);
      }

      v90(v148, v40);
      v129 = v412;
      goto LABEL_28;
    }
    v121 = v118;
    v122 = sub_22727D584();
    v124 = v123;

    ((void (*)(char *, uint64_t, uint64_t))v119)(v411, v120, v40);
    v125 = sub_22727D4D0();
    v126 = sub_22727D770();
    if (os_log_type_enabled(v125, v126))
    {
      v127 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v127 = 0;
      _os_log_impl(&dword_22723A000, v125, v126, "INPlayMediaIntentHandler#resolveMediaItems FOUND intentId for intent - tracking continuation", v127, 2u);
      MEMORY[0x2276AF6D4](v127, -1, -1);
    }

    v90(v411, v40);
    v128 = (unint64_t)v424;
    if (qword_2558CB3F8 != -1)
      swift_once();
    if (v423)
      goto LABEL_21;
    if (qword_2558CB400 != -1)
      goto LABEL_125;
    while (1)
    {
      swift_retain();
LABEL_21:
      v427 = (void (*)(_QWORD))v122;
      v428 = v124;
      swift_retain();
      sub_22727CE10();
      v40 = v422;
      v129 = v412;
LABEL_28:
      ((void (*)(char *, uint64_t, uint64_t))v119)(v129, v120, v40);
      swift_bridgeObjectRetain_n();
      v122 = sub_22727D4D0();
      v124 = sub_22727D794();
      if (!os_log_type_enabled(v122, (os_log_type_t)v124))
      {

        swift_bridgeObjectRelease_n();
        v90(v129, v40);
        goto LABEL_56;
      }
      v154 = (uint8_t *)swift_slowAlloc();
      v155 = swift_slowAlloc();
      v427 = (void (*)(_QWORD))v155;
      *(_DWORD *)v154 = 136446210;
      if (v128 >> 62)
      {
        swift_bridgeObjectRetain();
        v119 = sub_22727D9BC();
        swift_bridgeObjectRelease();
      }
      else
      {
        v119 = *(_QWORD *)((v128 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v120 = MEMORY[0x24BEE4AF8];
      LODWORD(v421) = v124;
      v419 = (void (*)(char *))v155;
      if (!v119)
        break;
      v425[0] = MEMORY[0x24BEE4AF8];
      sub_227278E58(0, v119 & ~(v119 >> 63), 0);
      if ((v119 & 0x8000000000000000) == 0)
      {
        v418 = v90;
        v420 = (uint64_t)a4;
        v120 = v425[0];
        if ((v128 & 0xC000000000000001) != 0)
        {
          v156 = 0;
          do
          {
            MEMORY[0x2276AF200](v156, v424);
            v157 = sub_22727D71C();
            v159 = v158;
            swift_unknownObjectRelease();
            v425[0] = v120;
            v161 = *(_QWORD *)(v120 + 16);
            v160 = *(_QWORD *)(v120 + 24);
            if (v161 >= v160 >> 1)
            {
              sub_227278E58(v160 > 1, v161 + 1, 1);
              v120 = v425[0];
            }
            ++v156;
            *(_QWORD *)(v120 + 16) = v161 + 1;
            v162 = v120 + 16 * v161;
            *(_QWORD *)(v162 + 32) = v157;
            *(_QWORD *)(v162 + 40) = v159;
          }
          while (v119 != v156);
        }
        else
        {
          v195 = (id *)(v128 + 32);
          do
          {
            v196 = *v195;
            v197 = sub_22727D71C();
            v199 = v198;

            v425[0] = v120;
            v201 = *(_QWORD *)(v120 + 16);
            v200 = *(_QWORD *)(v120 + 24);
            if (v201 >= v200 >> 1)
            {
              sub_227278E58(v200 > 1, v201 + 1, 1);
              v120 = v425[0];
            }
            *(_QWORD *)(v120 + 16) = v201 + 1;
            v202 = v120 + 16 * v201;
            *(_QWORD *)(v202 + 32) = v197;
            *(_QWORD *)(v202 + 40) = v199;
            ++v195;
            --v119;
          }
          while (v119);
        }
        a4 = (void (*)(_QWORD))v420;
        v90 = v418;
        break;
      }
      __break(1u);
LABEL_125:
      swift_once();
    }
    v203 = MEMORY[0x2276AEEAC](v120, MEMORY[0x24BEE0D00]);
    v205 = v204;
    swift_bridgeObjectRelease();
    v425[0] = sub_2272403C4(v203, v205, (uint64_t *)&v427);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v122, (os_log_type_t)v421, "INPlayMediaIntentHandler#resolveMediaItems completed successfully with items: %{public}s", v154, 0xCu);
    v206 = v419;
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v206, -1, -1);
    MEMORY[0x2276AF6D4](v154, -1, -1);

    v90(v412, v422);
LABEL_56:
    v207 = (void *)objc_opt_self();
    sub_227247C88(0, (unint64_t *)&qword_2558CB810);
    v208 = (void *)sub_22727D620();
    v209 = objc_msgSend(v207, sel_successesWithResolvedMediaItems_, v208);

    sub_227247C88(0, &qword_2558CC140);
    v210 = sub_22727D638();

    a4(v210);
    swift_bridgeObjectRelease();
    return swift_release();
  }
}

uint64_t sub_2272721AC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_2272721F4(uint64_t a1, uint64_t a2)
{
  id v3;

  sub_227247C88(0, &qword_2558CC140);
  v3 = (id)sub_22727D620();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

uint64_t sub_227272258(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  void (*v64)(uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v63 = a3;
  v64 = a2;
  v4 = sub_22727CD68();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v60 = (char *)&v57 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v57 - v10;
  v12 = sub_22727D4E8();
  v13 = *(_QWORD *)(v12 - 8);
  v65 = v12;
  v66 = v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v62 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v61 = (char *)&v57 - v16;
  v17 = sub_22727CFCC();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v59 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v57 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB760);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2272471A0(a1, (uint64_t)v25, &qword_2558CB760);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v22, v25, v17);
    v26 = v22;
    if (qword_2558CB378 != -1)
      swift_once();
    v27 = v65;
    v28 = __swift_project_value_buffer(v65, (uint64_t)qword_2558CC248);
    v29 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v61, v28, v27);
    v30 = v59;
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v59, v26, v17);
    v31 = sub_22727D4D0();
    v32 = sub_22727D788();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v62 = v26;
      v60 = (char *)v34;
      v68 = v34;
      *(_DWORD *)v33 = 136446210;
      sub_22723CA60(&qword_2558CB780, (uint64_t (*)(uint64_t))MEMORY[0x24BE91400], MEMORY[0x24BE91418]);
      v35 = sub_22727DA34();
      v67 = sub_2272403C4(v35, v36, &v68);
      sub_22727D920();
      swift_bridgeObjectRelease();
      v37 = *(void (**)(char *, uint64_t))(v18 + 8);
      v37(v30, v17);
      _os_log_impl(&dword_22723A000, v31, v32, "INPlayMediaIntentHandler: resolveNowPlayingMediaItem nowPlaying item error: %{public}s", v33, 0xCu);
      v38 = v60;
      swift_arrayDestroy();
      v26 = v62;
      MEMORY[0x2276AF6D4](v38, -1, -1);
      MEMORY[0x2276AF6D4](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v66 + 8))(v29, v65);
    }
    else
    {
      v37 = *(void (**)(char *, uint64_t))(v18 + 8);
      v37(v30, v17);

      (*(void (**)(char *, uint64_t))(v66 + 8))(v29, v27);
    }
    v64(0);
    v51 = v26;
    v52 = v17;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v11, v25, v4);
    if (qword_2558CB378 != -1)
      swift_once();
    v39 = v65;
    v40 = __swift_project_value_buffer(v65, (uint64_t)qword_2558CC248);
    v41 = v66;
    v42 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v62, v40, v39);
    v43 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v44 = v60;
    v61 = v11;
    v43(v60, v11, v4);
    v45 = sub_22727D4D0();
    v46 = sub_22727D794();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v68 = v48;
      *(_DWORD *)v47 = 136446210;
      v59 = (char *)(v47 + 4);
      v43(v58, v44, v4);
      v49 = sub_22727D590();
      v67 = sub_2272403C4(v49, v50, &v68);
      sub_22727D920();
      swift_bridgeObjectRelease();
      v37 = *(void (**)(char *, uint64_t))(v5 + 8);
      v37(v44, v4);
      _os_log_impl(&dword_22723A000, v45, v46, "INPlayMediaIntentHandler: resolveNowPlayingMediaItem now playing: %{public}s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v48, -1, -1);
      MEMORY[0x2276AF6D4](v47, -1, -1);

      (*(void (**)(char *, uint64_t))(v66 + 8))(v62, v65);
    }
    else
    {
      v37 = *(void (**)(char *, uint64_t))(v5 + 8);
      v37(v44, v4);

      (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v39);
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v53 = swift_allocObject();
    *(_OWORD *)(v53 + 16) = xmmword_22727E830;
    sub_227247C88(0, (unint64_t *)&qword_2558CB810);
    v54 = v61;
    sub_22727CD38();
    sub_22727CD14();
    v55 = sub_22727D704();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v53 + 32) = v55;
    v68 = v53;
    sub_22727D650();
    v64(v68);
    swift_bridgeObjectRelease();
    v51 = v54;
    v52 = v4;
  }
  return ((uint64_t (*)(char *, uint64_t))v37)(v51, v52);
}

uint64_t INPlayMediaIntentHandler.handle(intent:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v19;
  uint8_t *v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v38 = a1;
  v39 = sub_22727D4C4();
  v37 = *(_QWORD *)(v39 - 8);
  v5 = *(_QWORD *)(v37 + 64);
  v6 = MEMORY[0x24BDAC7A8](v39);
  v7 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v35 - v8;
  v10 = sub_22727D4E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2558CB378 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v10, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  v15 = sub_22727D4D0();
  v16 = sub_22727D794();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v36 = v5;
    v18 = a2;
    v19 = a3;
    v20 = v17;
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_22723A000, v15, v16, "INPlayMediaIntentHandler#handle...", v17, 2u);
    v21 = v20;
    a3 = v19;
    a2 = v18;
    v7 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    v5 = v36;
    MEMORY[0x2276AF6D4](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = a2;
  *(_QWORD *)(v22 + 24) = a3;
  v23 = qword_2558CB390;
  swift_retain();
  if (v23 != -1)
    swift_once();
  v24 = (id)logObject;
  sub_22727D4AC();
  v25 = v37;
  v26 = v9;
  v27 = v9;
  v28 = v39;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v7, v26, v39);
  v29 = (*(unsigned __int8 *)(v25 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v30 = (v5 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = "playMediaIntentHandlerHandle";
  *(_QWORD *)(v31 + 24) = 28;
  *(_BYTE *)(v31 + 32) = 2;
  (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v31 + v29, v7, v28);
  v32 = (_QWORD *)(v31 + v30);
  *v32 = sub_227263658;
  v32[1] = v22;
  swift_retain();
  sub_22727D8D8();
  sub_22727D494();
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = sub_22727A518;
  *(_QWORD *)(v33 + 24) = v31;
  MEMORY[0x24BDAC7A8](v33);
  sub_227247C88(0, &qword_2558CC000);
  swift_retain();
  sub_22727CBC4();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v28);
  return swift_release();
}

void sub_227272CD0(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  void (*v34)(id *);
  uint8_t *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  unint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  void *v78;
  id v79;
  id v80;
  void (*v81)(id *);
  char *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;

  v89 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC148);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (uint64_t *)((char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC100);
  v88 = *(_QWORD *)(v10 - 8);
  v11 = *(_QWORD *)(v88 + 64);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v83 = (uint64_t *)((char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v12);
  v84 = (uint64_t *)((char *)&v81 - v13);
  v14 = sub_22727D4E8();
  v86 = *(_QWORD *)(v14 - 8);
  v87 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (void (*)(id *))((char *)&v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = MEMORY[0x24BDAC7A8](v15);
  v82 = (char *)&v81 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v81 - v20;
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = a1;
  *(_QWORD *)(v22 + 24) = a2;
  v85 = a2;
  swift_retain();
  v23 = objc_msgSend(a3, sel_mediaItems);
  if (!v23)
  {
    swift_release();
    if (qword_2558CB378 == -1)
    {
LABEL_15:
      v40 = v87;
      v41 = __swift_project_value_buffer(v87, (uint64_t)qword_2558CC248);
      v42 = v86;
      (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v21, v41, v40);
      v43 = sub_22727D4D0();
      v44 = sub_22727D788();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_22723A000, v43, v44, "INPlayMediaIntentHandler#handle Unexpected nil or empty items in handle", v45, 2u);
        MEMORY[0x2276AF6D4](v45, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v42 + 8))(v21, v40);
      v46 = objc_allocWithZone(MEMORY[0x24BDD1960]);
      v47 = (void *)sub_22727D578();
      v48 = objc_msgSend(v46, sel_initWithActivityType_, v47);

      v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F68]), sel_initWithCode_userActivity_, 6, v48);
      v90 = v39;
      ((void (*)(id *))a1)(&v90);
      goto LABEL_29;
    }
LABEL_36:
    swift_once();
    goto LABEL_15;
  }
  v24 = v23;
  v81 = (void (*)(id *))a1;
  sub_227247C88(0, (unint64_t *)&qword_2558CB810);
  a1 = sub_22727D638();

  if (!(a1 >> 62))
  {
    v21 = *(char **)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v21)
      goto LABEL_4;
LABEL_23:
    swift_bridgeObjectRelease_n();
    v50 = 0;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  v21 = (char *)sub_22727D9BC();
  if (!v21)
    goto LABEL_23;
LABEL_4:
  if ((a1 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v25 = *(id *)(a1 + 32);
      goto LABEL_7;
    }
    __break(1u);
    goto LABEL_36;
  }
  v25 = (id)MEMORY[0x2276AF200](0, a1);
LABEL_7:
  v26 = v25;
  swift_bridgeObjectRelease();
  v27 = objc_msgSend(v26, sel_type);

  if (v27 == (id)18 && (sub_22727D824() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_release();
    if (qword_2558CB378 != -1)
      swift_once();
    v28 = v87;
    v29 = __swift_project_value_buffer(v87, (uint64_t)qword_2558CC248);
    v30 = v86;
    (*(void (**)(void (*)(id *), uint64_t, uint64_t))(v86 + 16))(v17, v29, v28);
    v31 = sub_22727D4D0();
    v32 = sub_22727D788();
    v33 = os_log_type_enabled(v31, v32);
    v34 = v81;
    if (v33)
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_22723A000, v31, v32, "INPlayMediaIntentHandler#convert Unexpected music result for news podcast request", v35, 2u);
      MEMORY[0x2276AF6D4](v35, -1, -1);
    }

    (*(void (**)(void (*)(id *), uint64_t))(v30 + 8))(v17, v28);
    v36 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v37 = (void *)sub_22727D578();
    v38 = objc_msgSend(v36, sel_initWithActivityType_, v37);

    v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F68]), sel_initWithCode_userActivity_, 6, v38);
    v90 = v39;
    v34(&v90);
LABEL_29:

    return;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    v49 = (id)MEMORY[0x2276AF200](0, a1);
  }
  else
  {
    if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_39;
    }
    v49 = *(id *)(a1 + 32);
  }
  v50 = v49;
  swift_bridgeObjectRelease();
LABEL_24:
  sub_227275A00(v50, a3, v9);

  v51 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v88 + 48))(v9, 1, v10);
  v17 = v81;
  if (v51 == 1)
  {
    swift_release();
    sub_227246BC0((uint64_t)v9, (uint64_t *)&unk_2558CC148);
    if (qword_2558CB378 == -1)
    {
LABEL_26:
      v52 = v87;
      v53 = __swift_project_value_buffer(v87, (uint64_t)qword_2558CC248);
      v54 = v86;
      v55 = v82;
      (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v82, v53, v52);
      v56 = sub_22727D4D0();
      v57 = sub_22727D770();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v58 = 0;
        _os_log_impl(&dword_22723A000, v56, v57, "INPlayMediaIntentHandler#handle Problem converting intent to Playback objects", v58, 2u);
        MEMORY[0x2276AF6D4](v58, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v52);
      v59 = objc_allocWithZone(MEMORY[0x24BDD1960]);
      v60 = (void *)sub_22727D578();
      v61 = objc_msgSend(v59, sel_initWithActivityType_, v60);

      v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F68]), sel_initWithCode_userActivity_, 6, v61);
      v90 = v39;
      v17(&v90);
      goto LABEL_29;
    }
LABEL_39:
    swift_once();
    goto LABEL_26;
  }
  v62 = *(int *)(v10 + 48);
  v63 = (uint64_t)v84 + v62;
  v64 = (char *)v9 + v62;
  v65 = *v9;
  *v84 = *v9;
  v66 = sub_22727CF60();
  v67 = *(_QWORD *)(v66 - 8);
  (*(void (**)(uint64_t, char *, uint64_t))(v67 + 32))(v63, v64, v66);
  swift_retain();
  v68 = objc_msgSend(a3, sel_intentId);
  if (v68)
  {
    v69 = v68;
    v87 = sub_22727D584();
    v71 = v70;

  }
  else
  {
    v87 = 0;
    v71 = 0;
  }
  v72 = *(int *)(v10 + 48);
  v73 = (uint64_t)v83;
  v74 = (char *)v83 + v72;
  *v83 = v65;
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v74, v63, v66);
  v75 = (*(unsigned __int8 *)(v88 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80);
  v76 = (v11 + v75 + 7) & 0xFFFFFFFFFFFFFFF8;
  v77 = (_QWORD *)swift_allocObject();
  v77[2] = sub_227263354;
  v77[3] = v22;
  v77[4] = a3;
  sub_22727AC20(v73, (uint64_t)v77 + v75);
  v78 = v89;
  *(_QWORD *)((char *)v77 + v76) = v89;
  swift_retain();
  v79 = a3;
  v80 = v78;
  sub_2272755FC(v87, v71, v65, v63, (void (*)(uint64_t *))sub_22727AC68, (uint64_t)v77);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_227246BC0((uint64_t)v84, &qword_2558CC100);
}

void sub_227273570(uint64_t a1, void (*a2)(id), uint64_t a3, void *a4, _QWORD *a5, void *a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void (*v54)(id);
  id v55;
  void *v56;
  id v57;
  id v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t);
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  void *v79;
  _QWORD *v80;
  uint64_t v81;
  id v82;
  id v83;
  void (*v84)(char *, uint64_t);
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  NSObject *v91;
  os_log_type_t v92;
  uint8_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  id v99;
  char *v100;
  char *v101;
  void *v102;
  char *v103;
  char *v104;
  _QWORD *v105;
  void *v106;
  void (*v107)(id);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111[3];

  v102 = a6;
  v105 = a5;
  v106 = a4;
  v107 = a2;
  v108 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB750);
  MEMORY[0x24BDAC7A8](v7);
  v103 = (char *)&v100 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC100);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char **)((char *)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = sub_22727D4E8();
  v109 = *(_QWORD *)(v12 - 8);
  v110 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v100 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v100 = (char *)&v100 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v104 = (char *)&v100 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v101 = (char *)&v100 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v100 - v22;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC138);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v100 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v100 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (uint64_t *)((char *)&v100 - v31);
  sub_2272471A0(a1, (uint64_t)&v100 - v31, &qword_2558CC138);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_227246BC0((uint64_t)v32, &qword_2558CC138);
    if (qword_2558CB378 != -1)
      swift_once();
    v33 = v110;
    v34 = __swift_project_value_buffer(v110, (uint64_t)qword_2558CC248);
    v35 = v109;
    (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v23, v34, v33);
    sub_2272471A0(a1, (uint64_t)v30, &qword_2558CC138);
    v36 = sub_22727D4D0();
    v37 = sub_22727D788();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v111[0] = v39;
      *(_DWORD *)v38 = 136315138;
      sub_2272471A0((uint64_t)v30, (uint64_t)v27, &qword_2558CC138);
      v40 = sub_22727D590();
      v111[2] = sub_2272403C4(v40, v41, v111);
      sub_22727D920();
      swift_bridgeObjectRelease();
      sub_227246BC0((uint64_t)v30, &qword_2558CC138);
      _os_log_impl(&dword_22723A000, v36, v37, "INPlayMediaIntentHandler#handle Error ensureWarm for content, returning temporary failure type: restrictedContent: %s", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v39, -1, -1);
      MEMORY[0x2276AF6D4](v38, -1, -1);

      (*(void (**)(char *, uint64_t))(v109 + 8))(v23, v110);
    }
    else
    {
      sub_227246BC0((uint64_t)v30, &qword_2558CC138);

      (*(void (**)(char *, uint64_t))(v35 + 8))(v23, v33);
    }
    v54 = v107;
    v55 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v56 = (void *)sub_22727D578();
    v57 = objc_msgSend(v55, sel_initWithActivityType_, v56);

    v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F68]), sel_initWithCode_userActivity_, 10, v57);
    v54(v58);

  }
  else
  {
    v42 = *v32;
    v43 = v106;
    if ((sub_22727D7C4() & 1) != 0)
    {
      if (qword_2558CB378 != -1)
        swift_once();
      v44 = v110;
      v45 = __swift_project_value_buffer(v110, (uint64_t)qword_2558CC248);
      v46 = v109;
      (*(void (**)(char *, uint64_t, uint64_t))(v109 + 16))(v15, v45, v44);
      v47 = sub_22727D4D0();
      v48 = sub_22727D770();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v49 = 0;
        _os_log_impl(&dword_22723A000, v47, v48, "INPlayMediaIntentHandler#resolveMediaItems GDPR needed, not immediately starting playback", v49, 2u);
        MEMORY[0x2276AF6D4](v49, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v44);
      v50 = objc_allocWithZone(MEMORY[0x24BDD1960]);
      v51 = (void *)sub_22727D578();
      v52 = objc_msgSend(v50, sel_initWithActivityType_, v51);

      v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F68]), sel_initWithCode_userActivity_, 2, v52);
      v107(v53);

    }
    else
    {
      v59 = *(int *)(v9 + 48);
      v60 = (char *)v11 + v59;
      v61 = (char *)v105 + v59;
      *v11 = *v105;
      v62 = sub_22727CF60();
      v63 = *(_QWORD *)(v62 - 8);
      (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v60, v61, v62);
      v64 = sub_22727CF48();
      (*(void (**)(char *, uint64_t))(v63 + 8))(v60, v62);
      if ((v64 & 1) != 0)
      {
        v66 = v109;
        v65 = v110;
        if (qword_2558CB378 != -1)
          swift_once();
        v67 = __swift_project_value_buffer(v65, (uint64_t)qword_2558CC248);
        v68 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
        v68(v104, v67, v65);
        swift_retain();
        v69 = sub_22727D4D0();
        v70 = sub_22727D770();
        if (os_log_type_enabled(v69, v70))
        {
          v71 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v71 = 67109120;
          LODWORD(v111[0]) = v42 != 0;
          sub_22727D920();
          swift_release();
          _os_log_impl(&dword_22723A000, v69, v70, "INPlayMediaIntentHandler#handle Playback was started during 'warm' phase, skipping specific-play, continuation? %{BOOL}d", v71, 8u);
          MEMORY[0x2276AF6D4](v71, -1, -1);

        }
        else
        {

          swift_release();
        }
        v84 = *(void (**)(char *, uint64_t))(v66 + 8);
        v84(v104, v65);
        v85 = objc_msgSend(v43, sel_intentId);
        if (v85)
        {
          v86 = v85;
          v87 = sub_22727D584();
          v89 = v88;

          v90 = v100;
          v68(v100, v67, v65);
          v91 = sub_22727D4D0();
          v92 = sub_22727D770();
          if (os_log_type_enabled(v91, v92))
          {
            v93 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v93 = 0;
            _os_log_impl(&dword_22723A000, v91, v92, "INPlayMediaIntentHandler#handle FOUND identifier for intent - tracking continuation for wrapper flow frame", v93, 2u);
            MEMORY[0x2276AF6D4](v93, -1, -1);
          }

          v84(v90, v65);
          if (qword_2558CB3F8 != -1)
            swift_once();
          if (!v42)
          {
            if (qword_2558CB400 != -1)
              swift_once();
            swift_retain();
          }
          v111[0] = v87;
          v111[1] = v89;
          swift_retain();
          sub_22727CE10();
        }
        v94 = swift_allocObject();
        v95 = v108;
        *(_QWORD *)(v94 + 16) = v107;
        *(_QWORD *)(v94 + 24) = v95;
        v96 = sub_22727D6BC();
        v97 = (uint64_t)v103;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v96 - 8) + 56))(v103, 1, 1, v96);
        v98 = (_QWORD *)swift_allocObject();
        v98[2] = 0;
        v98[3] = 0;
        v98[4] = v43;
        v98[5] = sub_22727C954;
        v98[6] = v94;
        v99 = v43;
        swift_retain();
        swift_retain();
        sub_22726AD40(v97, (uint64_t)&unk_2558CC160, (uint64_t)v98);
        swift_release();
        swift_release();
      }
      else
      {
        v73 = v109;
        v72 = v110;
        if (qword_2558CB378 != -1)
          swift_once();
        v74 = __swift_project_value_buffer(v72, (uint64_t)qword_2558CC248);
        v75 = v101;
        (*(void (**)(char *, uint64_t, uint64_t))(v73 + 16))(v101, v74, v72);
        v76 = sub_22727D4D0();
        v77 = sub_22727D770();
        if (os_log_type_enabled(v76, v77))
        {
          v78 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v78 = 0;
          _os_log_impl(&dword_22723A000, v76, v77, "INPlayMediaIntentHandler#play ensureWarm complete - moving to play", v78, 2u);
          MEMORY[0x2276AF6D4](v78, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v73 + 8))(v75, v72);
        v79 = v102;
        v80 = (_QWORD *)swift_allocObject();
        v80[2] = v43;
        v80[3] = v79;
        v81 = v108;
        v80[4] = v107;
        v80[5] = v81;
        v82 = v43;
        v83 = v79;
        swift_retain();
        sub_22727CDC8();
        swift_release();
      }
    }
    swift_release();
  }
}

uint64_t sub_227273FFC(uint64_t a1, void (**a2)(uint64_t, _QWORD), uint64_t a3, void (*a4)(id), uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  unint64_t v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v52;
  void (*v53)(char *, uint64_t);
  id v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  id v74;
  _QWORD v75[2];
  uint64_t v76;
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  void (**v82)(uint64_t, _QWORD);
  void (*v83)(id);
  uint64_t v84;
  uint64_t v85[2];
  uint64_t v86;

  v83 = a4;
  v84 = a5;
  v82 = a2;
  v6 = sub_22727D194();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v77 = (char *)v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v79 = (char *)v75 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v75 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB750);
  MEMORY[0x24BDAC7A8](v14);
  v81 = (char *)v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22727D4E8();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v80 = (uint64_t)v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v78 = (char *)v75 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v75 - v22;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC138);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (_QWORD *)((char *)v75 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2272471A0(a1, (uint64_t)v26, &qword_2558CC138);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v7 + 32))(v13, v26, v6);
    v27 = v6;
    if (qword_2558CB378 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v16, (uint64_t)qword_2558CC248);
    v82 = (void (**)(uint64_t, _QWORD))v17;
    v29 = v80;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v80, v28, v16);
    v30 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v31 = v79;
    v30(v79, v13, v27);
    v32 = sub_22727D4D0();
    v33 = sub_22727D788();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = swift_slowAlloc();
      v81 = v13;
      v35 = (uint8_t *)v34;
      v78 = (char *)swift_slowAlloc();
      v85[0] = (uint64_t)v78;
      v76 = v16;
      *(_DWORD *)v35 = 136315138;
      v75[1] = v35 + 4;
      v30(v77, v31, v27);
      v36 = sub_22727D590();
      v86 = sub_2272403C4(v36, v37, v85);
      sub_22727D920();
      swift_bridgeObjectRelease();
      v38 = *(void (**)(char *, uint64_t))(v7 + 8);
      v38(v31, v27);
      _os_log_impl(&dword_22723A000, v32, v33, "INPlayMediaIntentHandler#play Unexpected error playing content, code: %s", v35, 0xCu);
      v39 = v78;
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v39, -1, -1);
      v40 = v35;
      v13 = v81;
      MEMORY[0x2276AF6D4](v40, -1, -1);

      v82[1](v29, v76);
    }
    else
    {
      v38 = *(void (**)(char *, uint64_t))(v7 + 8);
      v38(v31, v27);

      v82[1](v29, v16);
    }
    v47 = objc_allocWithZone(MEMORY[0x24BDD1960]);
    v48 = (void *)sub_22727D578();
    v49 = objc_msgSend(v47, sel_initWithActivityType_, v48);

    v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F68]), sel_initWithCode_userActivity_, 6, v49);
    v83(v50);

    return ((uint64_t (*)(char *, uint64_t))v38)(v13, v27);
  }
  else
  {
    v41 = *v26;
    if (qword_2558CB378 != -1)
      swift_once();
    v42 = __swift_project_value_buffer(v16, (uint64_t)qword_2558CC248);
    v43 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
    v43(v23, v42, v16);
    swift_retain();
    v44 = sub_22727D4D0();
    v45 = sub_22727D770();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v46 = 67109120;
      LODWORD(v85[0]) = v41 != 0;
      sub_22727D920();
      swift_release();
      _os_log_impl(&dword_22723A000, v44, v45, " Successfully played content, continuation? %{BOOL}d", v46, 8u);
      MEMORY[0x2276AF6D4](v46, -1, -1);

    }
    else
    {

      swift_release();
    }
    v52 = v82;
    v53 = *(void (**)(char *, uint64_t))(v17 + 8);
    v53(v23, v16);
    v54 = objc_msgSend(v52, sel_intentId);
    if (v54)
    {
      v55 = v54;
      v56 = sub_22727D584();
      v58 = v57;

      v59 = v78;
      v43(v78, v42, v16);
      swift_bridgeObjectRetain_n();
      v60 = sub_22727D4D0();
      v61 = sub_22727D770();
      if (os_log_type_enabled(v60, v61))
      {
        v76 = v16;
        v62 = swift_slowAlloc();
        v80 = v56;
        v63 = (uint8_t *)v62;
        v64 = swift_slowAlloc();
        v85[0] = v64;
        *(_DWORD *)v63 = 136446210;
        swift_bridgeObjectRetain();
        v86 = sub_2272403C4(v80, v58, v85);
        sub_22727D920();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22723A000, v60, v61, "INPlayMediaIntentHandler#play FOUND intentId for intent: %{public}s - tracking continuation for wrapper flow frame", v63, 0xCu);
        swift_arrayDestroy();
        v65 = v64;
        v52 = v82;
        MEMORY[0x2276AF6D4](v65, -1, -1);
        v66 = v63;
        v56 = v80;
        MEMORY[0x2276AF6D4](v66, -1, -1);

        v67 = v59;
        v68 = v76;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v67 = v59;
        v68 = v16;
      }
      v53(v67, v68);
      if (qword_2558CB3F8 != -1)
        swift_once();
      if (!v41)
      {
        if (qword_2558CB400 != -1)
          swift_once();
        swift_retain();
      }
      v85[0] = v56;
      v85[1] = v58;
      swift_retain();
      sub_22727CE10();
    }
    v69 = swift_allocObject();
    v70 = v84;
    *(_QWORD *)(v69 + 16) = v83;
    *(_QWORD *)(v69 + 24) = v70;
    v71 = sub_22727D6BC();
    v72 = (uint64_t)v81;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 56))(v81, 1, 1, v71);
    v73 = (_QWORD *)swift_allocObject();
    v73[2] = 0;
    v73[3] = 0;
    v73[4] = v52;
    v73[5] = sub_22727ADF8;
    v73[6] = v69;
    swift_retain();
    v74 = v52;
    swift_retain();
    sub_22726AD40(v72, (uint64_t)&unk_2558CC178, (uint64_t)v73);
    swift_release();
    swift_release();
    return swift_release();
  }
}

uint64_t sub_227274854(void (*a1)(id))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v15;

  v2 = sub_22727D4E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_allocWithZone(MEMORY[0x24BDD1960]);
  v7 = (void *)sub_22727D578();
  v8 = objc_msgSend(v6, sel_initWithActivityType_, v7);

  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9F68]), sel_initWithCode_userActivity_, 4, v8);
  a1(v9);

  if (qword_2558CB378 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v2, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
  v11 = sub_22727D4D0();
  v12 = sub_22727D770();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_22723A000, v11, v12, "INPlayMediaIntentHandler#play completion called", v13, 2u);
    MEMORY[0x2276AF6D4](v13, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_227274A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v7 = sub_22727CFB4();
  v6[5] = v7;
  v6[6] = *(_QWORD *)(v7 - 8);
  v6[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_227274A90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);
  sub_22727CFA8();
  v4 = sub_22727CF9C();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if ((v4 & 1) != 0)
  {
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v6;
    *v6 = v0;
    v6[1] = sub_227274B3C;
    return sub_227248940(*(_QWORD *)(v0 + 16));
  }
  else
  {
    (*(void (**)(uint64_t))(v0 + 24))(v5);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_227274B3C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_227274B90()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 24))();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227274BCC(char *a1, void (*a2)(uint64_t), uint64_t a3)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  char *v24;
  uint8_t *v25;
  uint8_t *v26;
  void (*v27)(char *, uint64_t);
  id v28;
  char *v29;
  void *v30;
  id v31;
  unint64_t v32;
  void (*v33)(uint64_t);
  char *v34;
  unint64_t v35;
  char *v36;
  NSObject *v37;
  int v38;
  void (*v39)(void);
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  _QWORD *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  uint8_t *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(void);
  NSObject *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint8_t *v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  char v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  void (*v94)(char *, uint64_t);
  char *v95;
  char *v96;
  char *v97;
  uint64_t v98;
  void (*v99)(uint64_t);
  void (*v100)(void);
  char *v101;
  uint64_t v102;
  uint64_t v103;

  v99 = a2;
  v5 = sub_22727D4E8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v96 = (char *)&v91 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v97 = (char *)&v91 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v101 = (char *)&v91 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v91 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v95 = (char *)&v91 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v91 - v18;
  if (qword_2558CB378 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v5, (uint64_t)qword_2558CC248);
  v100 = *(void (**)(void))(v6 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v100)(v19, v20, v5);
  v21 = sub_22727D4D0();
  v22 = sub_22727D77C();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = v20;
    v24 = a1;
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_22723A000, v21, v22, "INPlayMediaIntentHandler#item looking in private audiosearch results...", v25, 2u);
    v26 = v25;
    a1 = v24;
    v20 = v23;
    MEMORY[0x2276AF6D4](v26, -1, -1);
  }

  v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  v27(v19, v5);
  v28 = objc_msgSend(a1, sel_privatePlayMediaIntentData);
  v29 = v15;
  if (!v28
    || (v30 = v28,
        v31 = objc_msgSend(v28, sel_audioSearchResults),
        v30,
        !v31))
  {
LABEL_30:
    v60 = v100;
    ((void (*)(char *, uint64_t, uint64_t))v100)(v29, v20, v5);
    v61 = sub_22727D4D0();
    v62 = sub_22727D788();
    v63 = os_log_type_enabled(v61, v62);
    v98 = a3;
    if (v63)
    {
      v92 = v29;
      v64 = (uint8_t *)swift_slowAlloc();
      v65 = swift_slowAlloc();
      v95 = a1;
      v66 = v65;
      v103 = v65;
      *(_DWORD *)v64 = 136446210;
      v93 = v20;
      v67 = sub_22727D218();
      v102 = sub_2272403C4(v67, v68, &v103);
      v20 = v93;
      v33 = v99;
      v60 = v100;
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v61, v62, "INPlayMediaIntentHandler#item %{public}s Intent has missing or invalid audioSearchResults (possibly expected for createRadio or wholeLibrary queries)", v64, 0xCu);
      swift_arrayDestroy();
      v69 = v66;
      a1 = v95;
      MEMORY[0x2276AF6D4](v69, -1, -1);
      v70 = v64;
      a3 = v98;
      MEMORY[0x2276AF6D4](v70, -1, -1);

      v27(v92, v5);
    }
    else
    {

      v27(v29, v5);
      v33 = v99;
    }
    v71 = v20;
    ((void (*)(char *, uint64_t, uint64_t))v60)(v101, v20, v5);
    v72 = sub_22727D4D0();
    v73 = sub_22727D77C();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_22723A000, v72, v73, "INPlayMediaIntentHandler#item evaluating if create radio...", v74, 2u);
      MEMORY[0x2276AF6D4](v74, -1, -1);
    }

    v75 = v5;
    v27(v101, v5);
    v76 = sub_22727D884();
    if ((sub_22727D89C() & 1) != 0)
    {
      v77 = sub_22727D83C();
      v78 = v71;
      if ((v76 & 1) == 0)
      {
        if ((v77 & 1) != 0 && (sub_22727D86C() & 1) == 0)
          return sub_22727A784((uint64_t)v33, a3);
        goto LABEL_45;
      }
    }
    else
    {
      v78 = v71;
      if ((v76 & 1) == 0)
      {
LABEL_45:
        ((void (*)(char *, uint64_t, uint64_t))v60)(v97, v78, v75);
        v88 = sub_22727D4D0();
        v89 = sub_22727D794();
        if (os_log_type_enabled(v88, v89))
        {
          v90 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v90 = 0;
          _os_log_impl(&dword_22723A000, v88, v89, "INPlayMediaIntentHandler#item not create radio, trying local search as fallback", v90, 2u);
          MEMORY[0x2276AF6D4](v90, -1, -1);
        }

        v27(v97, v75);
        return sub_227277E94(a1, 0, 0, (uint64_t)v33, a3);
      }
    }
    v94 = v27;
    v79 = v75;
    v80 = v96;
    v60();
    v81 = sub_22727D4D0();
    v82 = sub_22727D794();
    if (os_log_type_enabled(v81, v82))
    {
      v83 = (uint8_t *)swift_slowAlloc();
      v84 = swift_slowAlloc();
      v103 = v84;
      *(_DWORD *)v83 = 136446210;
      v85 = sub_22727D218();
      v102 = sub_2272403C4(v85, v86, &v103);
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v81, v82, "INPlayMediaIntentHandler#item %{public}s Creating radio station from currently playing item", v83, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v84, -1, -1);
      MEMORY[0x2276AF6D4](v83, -1, -1);
    }

    v94(v80, v79);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v87 = swift_allocObject();
    *(_OWORD *)(v87 + 16) = xmmword_22727E830;
    sub_227247C88(0, (unint64_t *)&qword_2558CB810);
    *(_QWORD *)(v87 + 32) = sub_22727D704();
    v103 = v87;
    sub_22727D650();
    v58 = v103;
    goto LABEL_44;
  }
  sub_227247C88(0, (unint64_t *)&qword_2558CB810);
  v32 = sub_22727D638();

  if (v32 >> 62)
  {
    swift_bridgeObjectRetain();
    v29 = v15;
    v59 = sub_22727D9BC();
    swift_bridgeObjectRelease();
    v33 = v99;
    if (v59)
      goto LABEL_9;
    goto LABEL_29;
  }
  v33 = v99;
  if (!*(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_29:
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
LABEL_9:
  v34 = (char *)v5;
  v35 = sub_22727D734();
  swift_bridgeObjectRelease();
  v36 = v95;
  ((void (*)(char *, uint64_t, char *))v100)(v95, v20, v34);
  swift_bridgeObjectRetain_n();
  v37 = sub_22727D4D0();
  v38 = sub_22727D794();
  if (!os_log_type_enabled(v37, (os_log_type_t)v38))
  {

    swift_bridgeObjectRelease_n();
    v27(v36, (uint64_t)v34);
LABEL_27:
    v58 = v35;
LABEL_44:
    v33(v58);
    return swift_bridgeObjectRelease();
  }
  v101 = v34;
  v98 = a3;
  v39 = (void (*)(void))swift_slowAlloc();
  v40 = swift_slowAlloc();
  v103 = v40;
  v100 = v39;
  *(_DWORD *)v39 = 136315138;
  if (v35 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_22727D9BC();
    v41 = result;
  }
  else
  {
    v41 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v94 = v27;
  LODWORD(v97) = v38;
  v96 = (char *)v40;
  if (!v41)
  {
    v44 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_26:
    swift_bridgeObjectRelease();
    v53 = (uint8_t *)v100;
    v54 = MEMORY[0x2276AEEAC](v44, MEMORY[0x24BEE0D00]);
    v56 = v55;
    swift_bridgeObjectRelease();
    v102 = sub_2272403C4(v54, v56, &v103);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v37, (os_log_type_t)v97, "INPlayMediaIntentHandler#item using unique private server search results: %s", v53, 0xCu);
    v57 = v96;
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v57, -1, -1);
    MEMORY[0x2276AF6D4](v53, -1, -1);

    v94(v95, (uint64_t)v101);
    v33 = v99;
    goto LABEL_27;
  }
  if (v41 >= 1)
  {
    v43 = 0;
    v44 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v35 & 0xC000000000000001) != 0)
        v45 = (id)MEMORY[0x2276AF200](v43, v35);
      else
        v45 = *(id *)(v35 + 8 * v43 + 32);
      v46 = v45;
      v47 = sub_22727D71C();
      v49 = v48;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v44 = sub_227278930(0, v44[2] + 1, 1, v44);
      v51 = v44[2];
      v50 = v44[3];
      if (v51 >= v50 >> 1)
        v44 = sub_227278930((_QWORD *)(v50 > 1), v51 + 1, 1, v44);
      ++v43;
      v44[2] = v51 + 1;
      v52 = &v44[2 * v51];
      v52[4] = v47;
      v52[5] = v49;
    }
    while (v41 != v43);
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_2272755FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *), uint64_t a6)
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD v32[2];
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  void (*v36)(uint64_t *);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v35 = a4;
  v36 = a5;
  v37 = a6;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC138);
  MEMORY[0x24BDAC7A8](v33);
  v9 = (_QWORD *)((char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = sub_22727D4E8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v32 - v15;
  if (!a2)
    goto LABEL_9;
  if (qword_2558CB3F8 != -1)
    swift_once();
  v39 = a1;
  v40 = a2;
  v17 = sub_22727CDF8();
  if (v17)
  {
    v18 = v17;
    if (qword_2558CB378 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v10, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v19, v10);
    swift_bridgeObjectRetain_n();
    v20 = sub_22727D4D0();
    v21 = sub_22727D770();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v38 = v35;
      v39 = a1;
      v34 = v22;
      *(_DWORD *)v22 = 136446210;
      v32[1] = v22 + 4;
      v40 = a2;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB9F0);
      v23 = sub_22727D590();
      v39 = sub_2272403C4(v23, v24, &v38);
      sub_22727D920();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v25 = v34;
      _os_log_impl(&dword_22723A000, v20, v21, "INPlayMediaIntentHandler#ensureWarm Found continuation from previous 'resolve' for intentId: %{public}s", v34, 0xCu);
      v26 = v35;
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v26, -1, -1);
      MEMORY[0x2276AF6D4](v25, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    *v9 = v18;
    swift_storeEnumTagMultiPayload();
    swift_retain();
    v36(v9);
    swift_release();
    return sub_227246BC0((uint64_t)v9, &qword_2558CC138);
  }
  else
  {
LABEL_9:
    if (qword_2558CB378 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v10, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v27, v10);
    v28 = sub_22727D4D0();
    v29 = sub_22727D770();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_22723A000, v28, v29, "INPlayMediaIntentHandler#ensureWarm No result present from previous call to warm, ensuring warmup before handle...", v30, 2u);
      MEMORY[0x2276AF6D4](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    return sub_22727CDD4();
  }
}

uint64_t sub_227275A00@<X0>(void *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  NSObject *v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t (*v54)(_QWORD *, uint64_t, uint64_t, uint64_t);
  _QWORD *v55;
  void (*v56)(char *, uint64_t);
  id v57;
  void *v58;
  id v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  void (*v65)(uint64_t, uint64_t, uint64_t);
  void *v66;
  char *v67;
  NSObject *v68;
  os_log_type_t v69;
  _BOOL4 v70;
  _QWORD *v71;
  uint8_t *v72;
  NSObject *v73;
  char v74;
  id v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint8_t *v82;
  uint64_t v83;
  id v84;
  _QWORD *v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  void *v93;
  char *v94;
  uint64_t v95;
  char *v96;
  NSObject *v97;
  os_log_type_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  char *v110;
  NSObject *v111;
  os_log_type_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  char *v120;
  _QWORD *v121;
  uint64_t v122;
  char *v123;
  char *v125;
  unsigned int v126;
  NSObject *v127;
  char *v128;
  char *v129;
  void (*v130)(uint64_t, uint64_t);
  uint64_t v131;
  uint64_t v132;
  char *v133;
  _QWORD *v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(char *, uint64_t, uint64_t);
  id v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150[3];

  v135 = sub_22727CF60();
  v6 = *(_QWORD *)(v135 - 8);
  v7 = MEMORY[0x24BDAC7A8](v135);
  v9 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v143 = (char *)&v125 - v10;
  v11 = sub_22727CF6C();
  v141 = *(_QWORD *)(v11 - 8);
  v142 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v148 = (char *)&v125 - v15;
  v16 = sub_22727D0C8();
  v145 = *(_QWORD *)(v16 - 8);
  v146 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v144 = (char *)&v125 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v147 = (uint64_t)&v125 - v19;
  v20 = sub_22727D4E8();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v125 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v22);
  v133 = (char *)&v125 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v139 = (char *)&v125 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v30 = MEMORY[0x24BDAC7A8](v29);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v125 - v33;
  if (!a1)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v49 = __swift_project_value_buffer(v20, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v24, v49, v20);
    v50 = sub_22727D4D0();
    v51 = sub_22727D788();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_22723A000, v50, v51, "INPlayMediaIntentHandler#convert Unexpected missing item to convert", v52, 2u);
      MEMORY[0x2276AF6D4](v52, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC100);
    v54 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56);
    v55 = a3;
    goto LABEL_30;
  }
  v125 = v32;
  v129 = v14;
  v138 = a2;
  v132 = v31;
  v134 = a3;
  v35 = qword_2558CB378;
  v36 = a1;
  if (v35 != -1)
    swift_once();
  v37 = __swift_project_value_buffer(v20, (uint64_t)qword_2558CC248);
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v140 = v37;
  v137 = v38;
  ((void (*)(char *))v38)(v34);
  v39 = v36;
  v40 = sub_22727D4D0();
  v41 = sub_22727D77C();
  v42 = os_log_type_enabled(v40, v41);
  v131 = v6;
  v128 = v9;
  if (v42)
  {
    v43 = swift_slowAlloc();
    v44 = swift_slowAlloc();
    v150[0] = v44;
    *(_DWORD *)v43 = 136446466;
    v45 = sub_22727D20C();
    v130 = (void (*)(uint64_t, uint64_t))v20;
    v149 = sub_2272403C4(v45, v46, v150);
    sub_22727D920();
    swift_bridgeObjectRelease();
    *(_WORD *)(v43 + 12) = 2082;
    v47 = sub_22727D71C();
    v149 = sub_2272403C4(v47, v48, v150);
    v20 = (uint64_t)v130;
    sub_22727D920();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v40, v41, "INPlayMediaIntentHandler#convert %{public}s converting mediaItem: %{public}s", (uint8_t *)v43, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v44, -1, -1);
    MEMORY[0x2276AF6D4](v43, -1, -1);

  }
  else
  {

  }
  v56 = *(void (**)(char *, uint64_t))(v21 + 8);
  v56(v34, v20);
  v57 = -[NSObject privateMediaItemValueData](v39, sel_privateMediaItemValueData);
  if (v57
    && (v58 = v57, v59 = objc_msgSend(v57, sel_mediaSubItems),
                   v58,
                   v59))
  {
    sub_227247C88(0, &qword_2558CC118);
    v60 = sub_22727D638();

  }
  else
  {
    v60 = MEMORY[0x24BEE4AF8];
  }
  v61 = sub_22726ABE4(v60);
  swift_bridgeObjectRelease();
  v62 = sub_227276B40(v39, v61);
  swift_bridgeObjectRelease();
  if (!v62)
  {
    v67 = v133;
    v137(v133, v140, v20);
    v68 = sub_22727D4D0();
    v69 = sub_22727D788();
    v70 = os_log_type_enabled(v68, v69);
    v71 = v134;
    if (v70)
    {
      v72 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v72 = 0;
      _os_log_impl(&dword_22723A000, v68, v69, "INPlayMediaIntentHandler#convert Unexpected nil PlaybackItem transforming from INMediaItem for container", v72, 2u);
      MEMORY[0x2276AF6D4](v72, -1, -1);
      v73 = v39;
    }
    else
    {
      v73 = v68;
      v68 = v39;
    }

    v56(v67, v20);
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC100);
    v54 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56);
    v55 = v71;
LABEL_30:
    v83 = 1;
    return v54(v55, v83, 1, v53);
  }
  v63 = v138;
  v64 = objc_msgSend(v138, sel_playShuffled);
  v65 = (void (*)(uint64_t, uint64_t, uint64_t))v137;
  if (v64)
  {
    v66 = v64;
    v126 = objc_msgSend(v64, sel_BOOLValue);

  }
  else
  {
    v126 = 0;
  }
  v74 = sub_22727D884();
  v133 = (char *)v62;
  if ((v74 & 1) != 0 && (sub_22727D83C() & 1) == 0)
  {
    v75 = objc_msgSend(v63, sel_backingStore);
    objc_opt_self();
    v76 = swift_dynamicCastObjCClass();
    if (v76)
    {
      v77 = (void *)v76;
      v78 = v39;
      v65((uint64_t)v125, v140, v20);
      v79 = sub_22727D4D0();
      v80 = sub_22727D77C();
      if (os_log_type_enabled(v79, v80))
      {
        v81 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v81 = 0;
        _os_log_impl(&dword_22723A000, v79, v80, "INPlayMediaIntentHandler#convert User is asking to create station from currently playing and we received a station from server. Add that to up next", v81, 2u);
        v82 = v81;
        v63 = v138;
        MEMORY[0x2276AF6D4](v82, -1, -1);
      }

      v56(v125, v20);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v145 + 104))(v147, *MEMORY[0x24BE91530], v146);
      objc_msgSend(v77, sel_setPlaybackQueueLocation_, 2);

      v39 = v78;
      goto LABEL_33;
    }

  }
  v84 = objc_msgSend(v63, sel_playbackQueueLocation);
  sub_227254614((uint64_t)v84, v147);
LABEL_33:
  v127 = v39;
  objc_msgSend(v63, sel_playbackRepeatMode);
  sub_22727D8F0();
  v85 = (_QWORD *)(v136 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v136 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider), *(_QWORD *)(v136 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider + 24));
  if ((sub_22727CF00() & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1(v85, v85[3]);
    sub_22727CF0C();
  }
  v86 = v138;
  v87 = objc_msgSend(v138, sel_privatePlayMediaIntentData);
  v130 = (void (*)(uint64_t, uint64_t))v56;
  if (v87)
  {
    v88 = v87;
    v89 = objc_msgSend(v87, sel_privateMediaIntentData);

    if (v89)
    {
      v90 = objc_msgSend(v89, sel_speakerIDInfo);

      if (v90)
      {
        v91 = objc_msgSend(v90, sel_sharedUserID);

        if (v91)
        {
          sub_22727D584();

          v86 = v138;
          sub_22727D59C();
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v145 + 16))(v144, v147, v146);
  sub_22727D80C();
  v92 = objc_msgSend(v86, sel_hashedRouteUIDs);
  if (v92)
  {
    v93 = v92;
    sub_22727D638();

  }
  sub_22727D830();
  (*(void (**)(char *, char *, uint64_t))(v141 + 16))(v129, v148, v142);
  v94 = v143;
  sub_22727CF54();
  v95 = v132;
  v65(v132, v140, v20);
  v96 = v133;
  swift_retain_n();
  v97 = sub_22727D4D0();
  v98 = sub_22727D77C();
  if (os_log_type_enabled(v97, v98))
  {
    v99 = swift_slowAlloc();
    v100 = swift_slowAlloc();
    v150[0] = v100;
    *(_DWORD *)v99 = 136446466;
    v101 = sub_22727D20C();
    v149 = sub_2272403C4(v101, v102, v150);
    sub_22727D920();
    swift_bridgeObjectRelease();
    *(_WORD *)(v99 + 12) = 2082;
    v149 = (uint64_t)v96;
    sub_22727D098();
    sub_22723CA60(&qword_2558CC110, (uint64_t (*)(uint64_t))MEMORY[0x24BE914F0], MEMORY[0x24BE91140]);
    v103 = sub_22727DA04();
    v149 = sub_2272403C4(v103, v104, v150);
    sub_22727D920();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v97, v98, "INPlayMediaIntentHandler#convert %{public}s PlaybackItem: %{public}s", (uint8_t *)v99, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v100, -1, -1);
    v105 = v99;
    v94 = v143;
    MEMORY[0x2276AF6D4](v105, -1, -1);

    v106 = v132;
    v65 = (void (*)(uint64_t, uint64_t, uint64_t))v137;
  }
  else
  {

    swift_release_n();
    v106 = v95;
  }
  v130(v106, v20);
  v107 = v135;
  v108 = v131;
  v109 = v128;
  v110 = v139;
  v65((uint64_t)v139, v140, v20);
  (*(void (**)(char *, char *, uint64_t))(v108 + 16))(v109, v94, v107);
  v111 = sub_22727D4D0();
  v112 = sub_22727D77C();
  if (os_log_type_enabled(v111, v112))
  {
    v113 = swift_slowAlloc();
    v114 = swift_slowAlloc();
    v150[0] = v114;
    *(_DWORD *)v113 = 136446466;
    v115 = sub_22727D20C();
    v149 = sub_2272403C4(v115, v116, v150);
    sub_22727D920();
    swift_bridgeObjectRelease();
    *(_WORD *)(v113 + 12) = 2082;
    sub_22723CA60(&qword_2558CC108, (uint64_t (*)(uint64_t))MEMORY[0x24BE91388], MEMORY[0x24BE91398]);
    v117 = sub_22727DA04();
    v149 = sub_2272403C4(v117, v118, v150);
    v108 = v131;
    sub_22727D920();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v108 + 8))(v109, v107);
    _os_log_impl(&dword_22723A000, v111, v112, "INPlayMediaIntentHandler#convert %{public}s PlaybackAttributes: %{public}s", (uint8_t *)v113, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v114, -1, -1);
    v119 = v113;
    v94 = v143;
    MEMORY[0x2276AF6D4](v119, -1, -1);

    v120 = v139;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v108 + 8))(v109, v107);
    v120 = v110;
  }
  v130((uint64_t)v120, v20);
  (*(void (**)(char *, uint64_t))(v141 + 8))(v148, v142);
  (*(void (**)(uint64_t, uint64_t))(v145 + 8))(v147, v146);
  v121 = v134;
  v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC100);
  v123 = (char *)v121 + *(int *)(v122 + 48);
  *v121 = v133;
  (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v123, v94, v107);
  v54 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v122 - 8) + 56);
  v55 = v121;
  v83 = 0;
  v53 = v122;
  return v54(v55, v83, 1, v53);
}

uint64_t sub_22727686C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  _QWORD v24[2];
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = sub_22727D4E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(a1, sel_identifier);
  if (v6)
  {
    v7 = v6;
    sub_22727D584();

    v8 = objc_msgSend(a1, sel_assetInfo);
    if (v8)
    {
      v9 = v8;
      sub_22727D584();

    }
    sub_22727CCCC();
    swift_allocObject();
    return sub_22727CCD8();
  }
  else
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v10 = __swift_project_value_buffer(v2, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
    v11 = a1;
    v12 = sub_22727D4D0();
    v13 = sub_22727D788();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v28 = v26;
      v25 = v14;
      *(_DWORD *)v14 = 136446210;
      v24[1] = v14 + 4;
      v15 = v11;
      v16 = objc_msgSend(v15, sel_description);
      v17 = sub_22727D584();
      v19 = v18;

      v27 = sub_2272403C4(v17, v19, &v28);
      sub_22727D920();

      swift_bridgeObjectRelease();
      v20 = v13;
      v21 = v25;
      _os_log_impl(&dword_22723A000, v12, v20, "INPlayMediaIntentHandler#convert identifier nil for mediaSubItem: %{public}s", v25, 0xCu);
      v22 = v26;
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v22, -1, -1);
      MEMORY[0x2276AF6D4](v21, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
}

uint64_t sub_227276B40(void *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int (*v48)(uint64_t, uint64_t, uint64_t);
  unint64_t v49;
  uint64_t v50;
  char *v52;
  char v53;
  void (*v54)(char *, uint64_t);
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  id v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  id v76;
  id v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;

  v88 = a2;
  v3 = sub_22727CCC0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v83 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC120);
  MEMORY[0x24BDAC7A8](v89);
  v7 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22727CC6C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC128);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v86 = (uint64_t)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v81 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v81 - v18;
  v20 = sub_22727D4E8();
  v90 = *(_QWORD *)(v20 - 8);
  v91 = v20;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v82 = (char *)&v81 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v81 - v23;
  v92 = a1;
  v25 = objc_msgSend(a1, sel_identifier);
  if (!v25)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v33 = v91;
    v34 = __swift_project_value_buffer(v91, (uint64_t)qword_2558CC248);
    v35 = v90;
    (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v24, v34, v33);
    v36 = v92;
    v37 = sub_22727D4D0();
    v38 = sub_22727D788();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v94 = v40;
      *(_DWORD *)v39 = 136446210;
      v92 = v39 + 4;
      v41 = v36;
      v42 = objc_msgSend(v41, sel_description);
      v43 = sub_22727D584();
      v45 = v44;

      v93 = sub_2272403C4(v43, v45, &v94);
      sub_22727D920();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v37, v38, "INPlayMediaIntentHandler#convert identifier nil for mediaItem: %{public}s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v40, -1, -1);
      MEMORY[0x2276AF6D4](v39, -1, -1);

      (*(void (**)(char *, uint64_t))(v90 + 8))(v24, v91);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v33);
    }
    return 0;
  }
  v26 = v25;
  v84 = v7;
  v27 = v4;
  v28 = sub_22727D584();
  v30 = v29;

  sub_22727CCCC();
  swift_allocObject();
  swift_bridgeObjectRetain();
  v85 = v28;
  v87 = v30;
  if (sub_22727CCD8())
  {
    sub_22727CC78();
    swift_release();
    sub_22727CC60();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v31 = v27;
    v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
    v32(v19, 0, 1, v3);
  }
  else
  {
    v31 = v27;
    v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
    v32(v19, 1, 1, v3);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v17, *MEMORY[0x24BE910E0], v3);
  v32(v17, 0, 1, v3);
  v46 = (uint64_t)v84;
  v47 = (uint64_t)&v84[*(int *)(v89 + 48)];
  sub_2272471A0((uint64_t)v19, (uint64_t)v84, &qword_2558CC128);
  sub_2272471A0((uint64_t)v17, v47, &qword_2558CC128);
  v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48);
  if (v48(v46, 1, v3) == 1)
  {
    sub_227246BC0((uint64_t)v17, &qword_2558CC128);
    sub_227246BC0((uint64_t)v19, &qword_2558CC128);
    if (v48(v47, 1, v3) == 1)
    {
      sub_227246BC0(v46, &qword_2558CC128);
      v49 = v88;
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  v50 = v86;
  sub_2272471A0(v46, v86, &qword_2558CC128);
  if (v48(v47, 1, v3) == 1)
  {
    sub_227246BC0((uint64_t)v17, &qword_2558CC128);
    sub_227246BC0((uint64_t)v19, &qword_2558CC128);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v50, v3);
LABEL_14:
    sub_227246BC0(v46, &qword_2558CC120);
    goto LABEL_24;
  }
  v52 = v83;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(v83, v47, v3);
  sub_22723CA60(&qword_2558CC130, (uint64_t (*)(uint64_t))MEMORY[0x24BE91108], MEMORY[0x24BE91118]);
  v53 = sub_22727D56C();
  v54 = *(void (**)(char *, uint64_t))(v31 + 8);
  v54(v52, v3);
  sub_227246BC0((uint64_t)v17, &qword_2558CC128);
  sub_227246BC0((uint64_t)v19, &qword_2558CC128);
  v54((char *)v50, v3);
  sub_227246BC0(v46, &qword_2558CC128);
  v49 = v88;
  if ((v53 & 1) != 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    v55 = v92;
    if (v49 >> 62)
    {
      swift_bridgeObjectRetain();
      if (sub_22727D9BC())
        goto LABEL_20;
    }
    else
    {
      v56 = *(_QWORD *)((v49 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v56)
      {
LABEL_20:
        if ((v49 & 0xC000000000000001) != 0)
        {
          MEMORY[0x2276AF200](0, v49);
          goto LABEL_23;
        }
        if (*(_QWORD *)((v49 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          swift_retain();
LABEL_23:
          swift_bridgeObjectRelease();
          v85 = sub_22727CC9C();
          v87 = v57;
          swift_release();
          goto LABEL_25;
        }
        __break(1u);
LABEL_42:
        swift_once();
LABEL_37:
        v67 = v91;
        v68 = __swift_project_value_buffer(v91, (uint64_t)qword_2558CC248);
        v69 = v90;
        v70 = v82;
        (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v82, v68, v67);
        v71 = v55;
        v72 = sub_22727D4D0();
        v73 = sub_22727D788();
        if (os_log_type_enabled(v72, v73))
        {
          v74 = (uint8_t *)swift_slowAlloc();
          v75 = swift_slowAlloc();
          v94 = v75;
          *(_DWORD *)v74 = 136446210;
          v92 = v74 + 4;
          v76 = v71;
          v77 = objc_msgSend(v76, sel_description);
          v78 = sub_22727D584();
          v80 = v79;

          v93 = sub_2272403C4(v78, v80, &v94);
          sub_22727D920();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22723A000, v72, v73, "INPlayMediaIntentHandler#convert subItems empty for classicalRecording mediaItem: %{public}s", v74, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2276AF6D4](v75, -1, -1);
          MEMORY[0x2276AF6D4](v74, -1, -1);

          (*(void (**)(char *, uint64_t))(v69 + 8))(v82, v91);
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v67);
        }
        return 0;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_2558CB378 == -1)
      goto LABEL_37;
    goto LABEL_42;
  }
LABEL_24:
  v55 = v92;
LABEL_25:
  v58 = objc_msgSend(v55, sel_privateMediaItemValueData);
  v59 = v58;
  if (v58)
  {
    v60 = objc_msgSend(v58, sel_assetInfo);

    if (v60)
    {
      sub_22727D584();

    }
  }
  v61 = objc_msgSend(v55, sel_privateMediaItemValueData);
  v62 = v61;
  if (v61)
  {
    v63 = objc_msgSend(v61, sel_recommendationId);

    if (v63)
    {
      sub_22727D584();

    }
  }
  v64 = objc_msgSend(v55, sel_privateMediaItemValueData);
  v65 = v64;
  if (v64)
  {
    v66 = objc_msgSend(v64, sel_sharedUserIdFromPlayableMusicAccount);

    if (v66)
    {
      sub_22727D584();

      sub_22727D59C();
      swift_bridgeObjectRelease();
    }
  }
  sub_22727D098();
  swift_allocObject();
  swift_bridgeObjectRetain();
  return sub_22727D0A4();
}

BOOL sub_227277594(void *a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  void (**v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  id v25;
  id v26;
  char v27;
  uint64_t (**v28)();
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  _BOOL8 v54;
  uint64_t v56;
  void (*v57)(char *, uint64_t, uint64_t);
  void (**v58)(char *, uint64_t, uint64_t);
  id v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint8_t *v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint8_t *v71;
  char *v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  uint8_t *v85;
  void (*v86)(char *, uint64_t, uint64_t);
  id v87;
  id v88;
  void (**v89)(char *, uint64_t, uint64_t);
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v4 = v3;
  v91 = sub_22727D4E8();
  v8 = *(void (***)(char *, uint64_t, uint64_t))(v91 - 8);
  v9 = MEMORY[0x24BDAC7A8](v91);
  v11 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v84 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v90 = (char *)&v84 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v89 = (void (**)(char *, uint64_t, uint64_t))((char *)&v84 - v18);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v84 - v19;
  sub_227247C88(0, (unint64_t *)&qword_2558CB790);
  v21 = (void *)sub_22727D8FC();
  v22 = v21;
  if (!a1)
  {

    goto LABEL_11;
  }
  v23 = a1;
  v24 = sub_22727D908();

  if ((v24 & 1) == 0)
  {
LABEL_11:
    if (qword_2558CB378 != -1)
      swift_once();
    v44 = v91;
    v45 = __swift_project_value_buffer(v91, (uint64_t)qword_2558CC248);
    v8[2](v11, v45, v44);
    v46 = sub_22727D4D0();
    v47 = sub_22727D77C();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_22723A000, v46, v47, "INPlayMediaIntentHandler#shouldDisambiguate Entity confidence disabled", v48, 2u);
      MEMORY[0x2276AF6D4](v48, -1, -1);
    }

    ((void (*)(char *, uint64_t))v8[1])(v11, v44);
    return 0;
  }
  if (!a2 || !a3)
  {
    if (qword_2558CB378 != -1)
      swift_once();
    v49 = v91;
    v50 = __swift_project_value_buffer(v91, (uint64_t)qword_2558CC248);
    v8[2](v14, v50, v49);
    v51 = sub_22727D4D0();
    v52 = sub_22727D788();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_22723A000, v51, v52, "INPlayMediaIntentHandler#shouldDisambiguate No ratios for internal / production", v53, 2u);
      MEMORY[0x2276AF6D4](v53, -1, -1);
    }

    ((void (*)(char *, uint64_t))v8[1])(v14, v49);
    return 0;
  }
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_deviceProvider), *(_QWORD *)(v4 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_deviceProvider + 24));
  v25 = a2;
  v26 = a3;
  v27 = sub_22727CDA4();
  v28 = &off_2558CB000;
  v87 = v26;
  v88 = v25;
  if ((v27 & 1) != 0)
  {
    v29 = v91;
    if (qword_2558CB378 != -1)
      swift_once();
    v30 = __swift_project_value_buffer(v29, (uint64_t)qword_2558CC248);
    v86 = v8[2];
    v86(v20, v30, v29);
    v31 = v25;
    v32 = sub_22727D4D0();
    v33 = sub_22727D77C();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = swift_slowAlloc();
      v89 = v8;
      v35 = (uint8_t *)v34;
      v36 = swift_slowAlloc();
      v93 = v36;
      *(_DWORD *)v35 = 136315138;
      v85 = v35 + 4;
      v37 = v31;
      v38 = objc_msgSend(v37, sel_description);
      v39 = sub_22727D584();
      v41 = v40;

      v92 = sub_2272403C4(v39, v41, &v93);
      sub_22727D920();

      v28 = &off_2558CB000;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v32, v33, "INPlayMediaIntentHandler#shouldDisambiguate On internal build with ratio 1/%s", v35, 0xCu);
      swift_arrayDestroy();
      v42 = v36;
      v29 = v91;
      MEMORY[0x2276AF6D4](v42, -1, -1);
      MEMORY[0x2276AF6D4](v35, -1, -1);

      v43 = v89[1];
    }
    else
    {

      v43 = v8[1];
    }
    ((void (*)(char *, uint64_t))v43)(v20, v29);
    v72 = v90;
    v57 = v86;
  }
  else
  {
    v29 = v91;
    if (qword_2558CB378 != -1)
      swift_once();
    v56 = __swift_project_value_buffer(v29, (uint64_t)qword_2558CC248);
    v57 = v8[2];
    v58 = v89;
    v57((char *)v89, v56, v29);
    v59 = v26;
    v60 = sub_22727D4D0();
    v61 = sub_22727D77C();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = swift_slowAlloc();
      v86 = v57;
      v63 = (uint8_t *)v62;
      v64 = swift_slowAlloc();
      v93 = v64;
      *(_DWORD *)v63 = 136315138;
      v85 = v63 + 4;
      v65 = v59;
      v66 = objc_msgSend(v65, sel_description);
      v67 = sub_22727D584();
      v69 = v68;

      v92 = sub_2272403C4(v67, v69, &v93);
      sub_22727D920();

      v28 = &off_2558CB000;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v60, v61, "INPlayMediaIntentHandler#shouldDisambiguate On prod build with ratio 1/%s", v63, 0xCu);
      swift_arrayDestroy();
      v70 = v64;
      v29 = v91;
      MEMORY[0x2276AF6D4](v70, -1, -1);
      v71 = v63;
      v57 = v86;
      MEMORY[0x2276AF6D4](v71, -1, -1);

      v43 = v8[1];
      ((void (*)(void (**)(char *, uint64_t, uint64_t), uint64_t))v43)(v89, v29);
    }
    else
    {

      v43 = v8[1];
      ((void (*)(void (**)(char *, uint64_t, uint64_t), uint64_t))v43)(v58, v29);
    }
    v72 = v90;
  }
  sub_22727D6C8();
  v74 = 1.0 / v73;
  v75 = (double)sub_227279328(0x20000000000001uLL) * 1.11022302e-16 + 0.0;
  v54 = v75 < v74;
  if (v28[111] != (uint64_t (*)())-1)
    swift_once();
  v76 = __swift_project_value_buffer(v29, (uint64_t)qword_2558CC248);
  v57(v72, v76, v29);
  v77 = sub_22727D4D0();
  v78 = sub_22727D77C();
  if (os_log_type_enabled(v77, v78))
  {
    v79 = swift_slowAlloc();
    v80 = swift_slowAlloc();
    v93 = v80;
    *(_DWORD *)v79 = 134218498;
    v92 = *(_QWORD *)&v75;
    sub_22727D920();
    *(_WORD *)(v79 + 12) = 2048;
    v92 = *(_QWORD *)&v74;
    sub_22727D920();
    *(_WORD *)(v79 + 22) = 2080;
    if (v75 >= v74)
      v81 = 0x65736C6166;
    else
      v81 = 1702195828;
    if (v75 >= v74)
      v82 = 0xE500000000000000;
    else
      v82 = 0xE400000000000000;
    v92 = sub_2272403C4(v81, v82, &v93);
    sub_22727D920();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v77, v78, "INPlayMediaIntentHandler#shouldDisambiguate Random number: %f Chance: %f Should disambiguate? %s", (uint8_t *)v79, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v80, -1, -1);
    MEMORY[0x2276AF6D4](v79, -1, -1);

    v83 = v90;
  }
  else
  {

    v83 = v72;
  }
  ((void (*)(char *, uint64_t))v43)(v83, v29);
  return v54;
}

uint64_t sub_227277E94(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(id, uint64_t, uint64_t, uint64_t, uint64_t, NSObject *, uint64_t (*)(void *), _QWORD *, uint64_t, uint64_t);
  NSObject *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;

  v40 = a4;
  v9 = sub_22727D4E8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(a1, sel_privatePlayMediaIntentData);
  v41 = a2;
  v42 = a3;
  if (v13
    && (v14 = v13,
        v15 = objc_msgSend(v13, sel_privateMediaIntentData),
        v14,
        v15)
    && (v16 = objc_msgSend(v15, sel_speakerIDInfo), v15, v16))
  {
    v17 = a5;
    v18 = objc_msgSend(v16, sel_sharedUserID);

    if (v18)
    {
      sub_22727D584();

      v36 = sub_22727D59C();
      v37 = v19;
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  else
  {
    v17 = a5;
  }
  v36 = 0;
  v37 = 0;
LABEL_8:
  if (qword_2558CB378 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v9, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v20, v9);
  v21 = a1;
  v22 = sub_22727D4D0();
  v23 = sub_22727D794();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v24 = 67109120;
    LOBYTE(v43) = sub_22727D7F4() & 1;
    v43 = v43;
    sub_22727D920();

    _os_log_impl(&dword_22723A000, v22, v23, "INPlayMediaIntentHandler#searchSpotlight executing local spotlight search, isPommesResponse=%{BOOL}d", v24, 8u);
    MEMORY[0x2276AF6D4](v24, -1, -1);
  }
  else
  {

    v22 = v21;
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v26 = *(_QWORD *)((char *)v39 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch + 24);
  v25 = *(_QWORD *)((char *)v39 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch + 32);
  v39 = __swift_project_boxed_opaque_existential_1((_QWORD *)((char *)v39 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch), v26);
  v27 = -[NSObject mediaSearch](v21, sel_mediaSearch);
  v38 = MEMORY[0x2276AE738](v21);
  v29 = v28;
  v30 = (_QWORD *)swift_allocObject();
  v31 = v41;
  v32 = v42;
  v30[2] = v41;
  v30[3] = v32;
  v30[4] = v40;
  v30[5] = v17;
  v30[6] = v21;
  v33 = *(void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, NSObject *, uint64_t (*)(void *), _QWORD *, uint64_t, uint64_t))(v25 + 8);
  v34 = v21;
  sub_22727A5BC(v31);
  swift_retain();
  v33(v27, v36, v37, v38, v29, v34, sub_22727A5AC, v30, v26, v25);

  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2272781E8(void *a1, void (*a2)(_QWORD, _QWORD, _QWORD), uint64_t a3, void (*a4)(uint64_t), uint64_t a5, _QWORD *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  id v35;
  _QWORD *v36;
  void (*v37)(_QWORD, _QWORD, _QWORD);
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint8_t *v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  id v53;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t, uint64_t);
  _QWORD *v67;
  void (*v68)(_QWORD, _QWORD, _QWORD);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t);
  uint64_t v73;
  void (*v74)(_QWORD, _QWORD, _QWORD);

  v72 = a4;
  v11 = sub_22727D4E8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v65 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v65 - v19;
  if (a1)
  {
    v21 = qword_2558CB378;
    v22 = a1;
    if (v21 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v11, (uint64_t)qword_2558CC248);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v18, v23, v11);
    v24 = v22;
    v25 = v11;
    v26 = v24;
    v27 = v12;
    v28 = sub_22727D4D0();
    v29 = sub_22727D770();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = swift_slowAlloc();
      v70 = a5;
      v31 = v30;
      v67 = (_QWORD *)swift_slowAlloc();
      v68 = (void (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
      v74 = v68;
      *(_DWORD *)v31 = 136446466;
      v69 = v27;
      v32 = sub_22727D218();
      v73 = sub_2272403C4(v32, v33, (uint64_t *)&v74);
      sub_22727D920();
      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2114;
      v73 = (uint64_t)v26;
      v34 = v26;
      v71 = v25;
      v35 = v34;
      sub_22727D920();
      v36 = v67;
      *v67 = a1;

      _os_log_impl(&dword_22723A000, v28, v29, "INPlayMediaIntentHandler#item %{public}s Successful search result: %{public}@", (uint8_t *)v31, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC0F0);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v36, -1, -1);
      v37 = v68;
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v37, -1, -1);
      MEMORY[0x2276AF6D4](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v69 + 8))(v18, v71);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v27 + 8))(v18, v25);
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v51 = swift_allocObject();
    *(_OWORD *)(v51 + 16) = xmmword_22727E830;
    *(_QWORD *)(v51 + 32) = v26;
    v74 = (void (*)(_QWORD, _QWORD, _QWORD))v51;
    sub_22727D650();
    v52 = (uint64_t)v74;
    v53 = v26;
    v72(v52);

    return swift_bridgeObjectRelease();
  }
  else
  {
    v67 = a6;
    v68 = a2;
    if (qword_2558CB378 != -1)
      swift_once();
    v38 = __swift_project_value_buffer(v11, (uint64_t)qword_2558CC248);
    v39 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v39(v20, v38, v11);
    v40 = sub_22727D4D0();
    v41 = sub_22727D788();
    if (os_log_type_enabled(v40, v41))
    {
      v71 = v11;
      v42 = swift_slowAlloc();
      v70 = a5;
      v43 = (uint8_t *)v42;
      v44 = swift_slowAlloc();
      v66 = v39;
      v45 = v44;
      v74 = (void (*)(_QWORD, _QWORD, _QWORD))v44;
      v65 = v38;
      *(_DWORD *)v43 = 136446210;
      v46 = sub_22727D218();
      v69 = v12;
      v73 = sub_2272403C4(v46, v47, (uint64_t *)&v74);
      v11 = v71;
      v38 = v65;
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v40, v41, "INPlayMediaIntentHandler#searchSpotlight %{public}s No results from local search", v43, 0xCu);
      swift_arrayDestroy();
      v48 = v45;
      v39 = v66;
      MEMORY[0x2276AF6D4](v48, -1, -1);
      v49 = v43;
      a5 = v70;
      MEMORY[0x2276AF6D4](v49, -1, -1);

      v50 = *(void (**)(char *, uint64_t))(v69 + 8);
    }
    else
    {

      v50 = *(void (**)(char *, uint64_t))(v12 + 8);
    }
    v50(v20, v11);
    if (v68)
    {
      v39(v15, v38, v11);
      swift_retain();
      v55 = sub_22727D4D0();
      v56 = sub_22727D788();
      if (os_log_type_enabled(v55, v56))
      {
        v57 = swift_slowAlloc();
        v70 = a3;
        v58 = (uint8_t *)v57;
        v59 = swift_slowAlloc();
        v74 = (void (*)(_QWORD, _QWORD, _QWORD))v59;
        v71 = v11;
        *(_DWORD *)v58 = 136446210;
        v60 = sub_22727D218();
        v73 = sub_2272403C4(v60, v61, (uint64_t *)&v74);
        sub_22727D920();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22723A000, v55, v56, "INPlayMediaIntentHandler#searchSpotlight %{public}s Local search using fallback completion due to nil result", v58, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2276AF6D4](v59, -1, -1);
        MEMORY[0x2276AF6D4](v58, -1, -1);

        v62 = v15;
        v63 = v71;
      }
      else
      {

        v62 = v15;
        v63 = v11;
      }
      v50(v62, v63);
      v64 = (uint64_t)v68;
      v68(v67, v72, a5);
      return sub_22727A5CC(v64);
    }
    else
    {
      return ((uint64_t (*)(_QWORD))v72)(0);
    }
  }
}

id INPlayMediaIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for INPlayMediaIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

_QWORD *sub_227278930(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB588);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_227279B2C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_227278A3C(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC1C0);
  v10 = *(_QWORD *)(sub_22727CBA0() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_22727D9B0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_22727CBA0() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_227279A14(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_227278C44(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_227278C68@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_227278C90(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x24BEE4AF8];
    v8 = v5;
    if (v5 <= 0)
    {
      v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0)
          goto LABEL_19;
        v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8)
          goto LABEL_19;
        sub_227247C88(0, (unint64_t *)&qword_2558CB810);
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 25;
      v9[2] = v5;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  result = sub_22727D9E0();
  __break(1u);
  return result;
}

uint64_t sub_227278E20(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_227278E74(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_227278E3C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_227279054(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_227278E58(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2272791C0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_227278E74(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CC1C0);
  v10 = *(_QWORD *)(sub_22727CBA0() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_22727CBA0() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_22727D9E0();
  __break(1u);
  return result;
}

uint64_t sub_227279054(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC198);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_22727D9E0();
  __break(1u);
  return result;
}

uint64_t sub_2272791C0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558CB588);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_22727D9E0();
  __break(1u);
  return result;
}

unint64_t sub_227279328(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x2276AF6E0](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x2276AF6E0](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_2272793B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  id v37;
  objc_super v46;
  uint64_t v47[5];
  uint64_t v48[5];
  uint64_t v49[5];
  uint64_t v50[5];
  uint64_t v51[5];
  uint64_t v52[5];
  uint64_t v53[5];
  uint64_t v54[6];

  v54[3] = a17;
  v54[4] = a25;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v54);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a17 - 8) + 32))(boxed_opaque_existential_1, a2, a17);
  v53[3] = a14;
  v53[4] = a22;
  v30 = __swift_allocate_boxed_opaque_existential_1(v53);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a14 - 8) + 32))(v30, a3, a14);
  v52[3] = a19;
  v52[4] = a27;
  v31 = __swift_allocate_boxed_opaque_existential_1(v52);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a19 - 8) + 32))(v31, a4, a19);
  v51[3] = a15;
  v51[4] = a23;
  v32 = __swift_allocate_boxed_opaque_existential_1(v51);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a15 - 8) + 32))(v32, a5, a15);
  v50[3] = a16;
  v50[4] = a24;
  v33 = __swift_allocate_boxed_opaque_existential_1(v50);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a16 - 8) + 32))(v33, a7, a16);
  v49[3] = a13;
  v49[4] = a21;
  v34 = __swift_allocate_boxed_opaque_existential_1(v49);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a13 - 8) + 32))(v34, a8, a13);
  v48[3] = a18;
  v48[4] = a26;
  v35 = __swift_allocate_boxed_opaque_existential_1(v48);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a18 - 8) + 32))(v35, a9, a18);
  v47[3] = a20;
  v47[4] = a28;
  v36 = __swift_allocate_boxed_opaque_existential_1(v47);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a20 - 8) + 32))(v36, a11, a20);
  *(_QWORD *)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_playbackService] = a1;
  sub_227240AC4((uint64_t)v54, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch]);
  sub_227240AC4((uint64_t)v53, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_deviceProvider]);
  sub_227240AC4((uint64_t)v52, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nowPlaying]);
  sub_227240AC4((uint64_t)v51, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider]);
  sub_227240AC4((uint64_t)v49, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_appleMediaServicesProvider]);
  sub_227240AC4(a6, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_accountProvider]);
  sub_227240AC4((uint64_t)v50, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_featureFlagProvider]);
  sub_227240AC4((uint64_t)v48, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nearDeviceProvider]);
  sub_227240AC4(a10, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_siriKitTaskLoggingProvider]);
  sub_227240AC4((uint64_t)v47, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_onscreenEntityProvider]);
  v46.receiver = a12;
  v46.super_class = (Class)type metadata accessor for INPlayMediaIntentHandler();
  v37 = objc_msgSendSuper2(&v46, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
  __swift_destroy_boxed_opaque_existential_1Tm(a10);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
  __swift_destroy_boxed_opaque_existential_1Tm(a6);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v53);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
  return v37;
}

id sub_2272796DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12)
{
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  id v29;
  objc_super v32;
  uint64_t v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  uint64_t v36[5];
  _QWORD v37[5];
  uint64_t v38[5];
  uint64_t v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[6];

  v42[3] = sub_22727CD98();
  v42[4] = MEMORY[0x24BE911E8];
  v42[0] = a6;
  v41[3] = sub_22727CB34();
  v41[4] = MEMORY[0x24BE90F48];
  v41[0] = a10;
  v40[3] = &type metadata for INLocalSearchProvider;
  v40[4] = &protocol witness table for INLocalSearchProvider;
  v19 = swift_allocObject();
  v40[0] = v19;
  v20 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v19 + 32) = v20;
  *(_QWORD *)(v19 + 48) = *(_QWORD *)(a2 + 32);
  v21 = sub_22727CCF0();
  v39[3] = v21;
  v39[4] = MEMORY[0x24BE91150];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v39);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(boxed_opaque_existential_1, a3, v21);
  v23 = sub_22727CF3C();
  v38[3] = v23;
  v38[4] = MEMORY[0x24BE91368];
  v24 = __swift_allocate_boxed_opaque_existential_1(v38);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v24, a4, v23);
  v37[3] = sub_22727CEAC();
  v37[4] = MEMORY[0x24BE912D8];
  v37[0] = a5;
  v25 = sub_22727CFB4();
  v36[3] = v25;
  v36[4] = MEMORY[0x24BE913D0];
  v26 = __swift_allocate_boxed_opaque_existential_1(v36);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v26, a7, v25);
  v35[3] = sub_22727D170();
  v35[4] = MEMORY[0x24BE91620];
  v35[0] = a8;
  v34[3] = sub_22727CF24();
  v34[4] = MEMORY[0x24BE91350];
  v34[0] = a9;
  v27 = sub_22727D110();
  v33[3] = v27;
  v33[4] = MEMORY[0x24BE91588];
  v28 = __swift_allocate_boxed_opaque_existential_1(v33);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(v28, a11, v27);
  *(_QWORD *)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_playbackService] = a1;
  sub_227240AC4((uint64_t)v40, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_localSearch]);
  sub_227240AC4((uint64_t)v39, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_deviceProvider]);
  sub_227240AC4((uint64_t)v38, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nowPlaying]);
  sub_227240AC4((uint64_t)v37, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_seDeviceProvider]);
  sub_227240AC4((uint64_t)v35, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_appleMediaServicesProvider]);
  sub_227240AC4((uint64_t)v42, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_accountProvider]);
  sub_227240AC4((uint64_t)v36, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_featureFlagProvider]);
  sub_227240AC4((uint64_t)v34, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nearDeviceProvider]);
  sub_227240AC4((uint64_t)v41, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_siriKitTaskLoggingProvider]);
  sub_227240AC4((uint64_t)v33, (uint64_t)&a12[OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_onscreenEntityProvider]);
  v32.receiver = a12;
  v32.super_class = (Class)type metadata accessor for INPlayMediaIntentHandler();
  v29 = objc_msgSendSuper2(&v32, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v41);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
  return v29;
}

uint64_t sub_227279A14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_22727CBA0() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_22727D9E0();
  __break(1u);
  return result;
}

uint64_t sub_227279B2C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_22727D9E0();
  __break(1u);
  return result;
}

id sub_227279C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  __int128 v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v76[40];
  _OWORD v77[2];
  uint64_t v78;

  v71 = a8;
  v63 = a7;
  v74 = a6;
  v69 = a5;
  v62 = a4;
  v72 = a10;
  v73 = a1;
  v70 = a9;
  v68 = a11;
  v13 = sub_22727D110();
  v66 = *(_QWORD *)(v13 - 8);
  v67 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v65 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_22727CFB4();
  v15 = *(_QWORD *)(v75 - 8);
  v16 = MEMORY[0x24BDAC7A8](v75);
  v64 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v53 - v18;
  v20 = sub_22727CF3C();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v61 = (char *)&v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v53 - v24;
  v26 = sub_22727CCF0();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v53 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v53 - v31;
  v33 = *(_OWORD *)(a2 + 16);
  v77[0] = *(_OWORD *)a2;
  v77[1] = v33;
  v78 = *(_QWORD *)(a2 + 32);
  v34 = *(void (**)(char *, uint64_t))(v27 + 32);
  v60 = v27;
  v35 = a3;
  v37 = v36;
  v59 = v36;
  v34((char *)&v53 - v31, v35);
  v58 = v21;
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 32);
  v56 = v25;
  v39 = v20;
  v57 = v20;
  v38(v25, v62, v20);
  v55 = v15;
  v40 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  v54 = v19;
  v41 = v75;
  v40(v19, v63, v75);
  v63 = (char *)objc_allocWithZone((Class)type metadata accessor for INPlayMediaIntentHandler());
  sub_22726B790((uint64_t)v77, (uint64_t)v76);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v30, v32, v37);
  v42 = (uint64_t)v61;
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v61, v25, v39);
  v43 = (uint64_t)v64;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v64, v19, v41);
  v44 = (uint64_t)v65;
  v45 = v66;
  v47 = v67;
  v46 = v68;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v65, v68, v67);
  v48 = v69;
  swift_retain();
  v49 = v71;
  swift_retain();
  v50 = swift_retain();
  v51 = sub_2272796DC(v73, (uint64_t)v76, (uint64_t)v30, v42, v48, v74, v43, v49, v50, v72, v44, v63);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v47);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v75);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v57);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v32, v59);
  sub_227279FD0((uint64_t)v77);
  return v51;
}

uint64_t sub_227279FD0(uint64_t a1)
{
  destroy for INLocalSearchProvider(a1);
  return a1;
}

id sub_22727A004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int128 a21,__int128 a22,__int128 a23,uint64_t a24,uint64_t a25)
{
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
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  void (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v86 = a8;
  v89 = a7;
  v98 = a6;
  v83 = a5;
  v82 = a4;
  v79 = a3;
  v77 = a2;
  v94 = a22;
  v95 = a21;
  v93 = a23;
  v91 = a25;
  v92 = a24;
  v90 = a11;
  v96 = a10;
  v97 = a1;
  v88 = a9;
  v71 = a15;
  v73 = a16;
  v76 = a13;
  v81 = a18;
  v65 = a19;
  v87 = a20;
  v85 = *(_QWORD *)(a20 - 8);
  v25 = MEMORY[0x24BDAC7A8](a16);
  v84 = (char *)&v63 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = *(_QWORD *)(v27 - 8);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v78 = (char *)&v63 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = *(_QWORD *)(v30 - 8);
  v31 = MEMORY[0x24BDAC7A8](v28);
  v74 = (char *)&v63 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = *(_QWORD *)(v31 - 8);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v99 = (uint64_t)&v63 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = *(_QWORD *)(v35 - 8);
  v37 = MEMORY[0x24BDAC7A8](v33);
  v39 = (char *)&v63 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = v39;
  v41 = *(_QWORD *)(v40 - 8);
  v42 = MEMORY[0x24BDAC7A8](v37);
  v44 = (char *)&v63 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = v44;
  v45 = *(_QWORD *)(a14 - 8);
  v46 = MEMORY[0x24BDAC7A8](v42);
  v48 = (char *)&v63 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = v48;
  v67 = a17;
  v49 = *(_QWORD *)(a17 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v51 = (char *)&v63 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = v51;
  v69 = (char *)objc_allocWithZone((Class)type metadata accessor for INPlayMediaIntentHandler());
  (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v51, v77, a17);
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v48, v79, a14);
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 16);
  v53 = v65;
  v52(v44, v82, v65);
  v54 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v39, v83, v71);
  v55 = v73;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16))(v99, v89, v73);
  v56 = (uint64_t)v74;
  v57 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v74, v86, v76);
  v58 = (uint64_t)v78;
  v59 = v81;
  (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v78, v88, v81);
  v60 = (uint64_t)v84;
  v61 = v87;
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v84, v90, v87);
  return sub_2272793B0(v97, (uint64_t)v70, (uint64_t)v68, (uint64_t)v66, (uint64_t)v64, v98, v99, v56, v58, v96, v60, v69, v57, a14, v54, v55, v67, v59, v53,
           v61,
           v95,
           *((uint64_t *)&v95 + 1),
           v94,
           *((uint64_t *)&v94 + 1),
           v93,
           *((uint64_t *)&v93 + 1),
           v92,
           v91);
}

uint64_t sub_22727A44C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_22727A470()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22727A4A4()
{
  uint64_t v0;

  return sub_22726C504(*(_QWORD *)(v0 + 16), *(uint64_t (**)(_QWORD))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_22727A4C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558CBFE8;
  if (!qword_2558CBFE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558CBFE0);
    result = MEMORY[0x2276AF644](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2558CBFE8);
  }
  return result;
}

uint64_t sub_22727A518(uint64_t a1)
{
  return sub_22727AECC(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, unint64_t, _QWORD, _QWORD))sub_22725D54C);
}

uint64_t sub_22727A524()
{
  swift_release();
  return swift_deallocObject();
}

void sub_22727A548(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_227272CD0(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t type metadata accessor for INPlayMediaIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_22727A570()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22727A5AC(void *a1)
{
  uint64_t v1;

  return sub_2272781E8(a1, *(void (**)(_QWORD, _QWORD, _QWORD))(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(uint64_t))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD **)(v1 + 48));
}

uint64_t sub_22727A5BC(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_22727A5CC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_22727A5DC(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = result;
    v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v5 = sub_22727D9BC();
  result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  if (v5 < 0)
    v6 = v3;
  if (v3)
    v7 = v6;
  else
    v7 = 0;
  if (v4)
  {
    swift_bridgeObjectRetain();
    v9 = sub_22727D9BC();
    result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    v8 = sub_22727D9BC();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_227247C88(0, (unint64_t *)&qword_2558CB810);
    v10 = 0;
    do
    {
      v11 = v10 + 1;
      sub_22727D98C();
      v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    v12 = sub_22727D9C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

uint64_t sub_22727A784(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v31 = sub_22727D4E8();
  v35 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22727D4C4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - v11;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v14 = qword_2558CB390;
  swift_retain();
  if (v14 != -1)
    swift_once();
  v15 = (id)logObject;
  sub_22727D4AC();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v16 = (*(unsigned __int8 *)(v7 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v17 = (v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = "playMediaIntentHandlerResolveNowPlayingItem";
  *(_QWORD *)(v18 + 24) = 43;
  *(_BYTE *)(v18 + 32) = 2;
  v33 = v7;
  v34 = v6;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v16, v10, v6);
  v19 = (_QWORD *)(v18 + v17);
  *v19 = sub_227263658;
  v19[1] = v13;
  swift_retain();
  sub_22727D8D8();
  sub_22727D4A0();
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = sub_22727A518;
  *(_QWORD *)(v20 + 24) = v18;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = sub_22725D668;
  *(_QWORD *)(v21 + 24) = v20;
  v22 = qword_2558CB378;
  swift_retain();
  swift_retain();
  if (v22 != -1)
    swift_once();
  v23 = v31;
  v24 = __swift_project_value_buffer(v31, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v5, v24, v23);
  v25 = sub_22727D4D0();
  v26 = sub_22727D77C();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_22723A000, v25, v26, "INPlayMediaIntentHandler: resolveNowPlayingItem resolving...", v27, 2u);
    MEMORY[0x2276AF6D4](v27, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v35 + 8))(v5, v23);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v32 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nowPlaying), *(_QWORD *)(v32 + OBJC_IVAR____TtC17SiriAudioInternal24INPlayMediaIntentHandler_nowPlaying + 24));
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = sub_227263354;
  *(_QWORD *)(v28 + 24) = v21;
  sub_22727CFE4();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v34);
  return swift_release();
}

uint64_t sub_22727AB38(uint64_t a1)
{
  uint64_t v1;

  return sub_227272258(a1, *(void (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_22727AB40()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_22727AB64(uint64_t a1)
{
  uint64_t v1;

  sub_2272721F4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22727AB6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC100);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();

  swift_release();
  v5 = v0 + v3 + *(int *)(v1 + 48);
  v6 = sub_22727CF60();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  return swift_deallocObject();
}

uint64_t sub_22727AC20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_22727AC68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2558CC100) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_227273570(a1, *(void (**)(id))(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), (_QWORD *)(v1 + v4), *(void **)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_22727ACC4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22727ACF8(uint64_t a1)
{
  uint64_t v1;

  return sub_227273FFC(a1, *(void (***)(uint64_t, _QWORD))(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(id))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_22727AD08(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_2272471E4;
  return sub_227274A2C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_22727AD88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2272463F4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2558CC168 + dword_2558CC168))(a1, v4);
}

uint64_t sub_22727ADF8()
{
  uint64_t v0;

  return sub_227274854(*(void (**)(id))(v0 + 16));
}

uint64_t objectdestroy_51Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22727AE48(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_2272463F4;
  return sub_227274A2C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_22727AECC(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, unint64_t, _QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(sub_22727D4C4() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 33) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (_QWORD *)(v2 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a2(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), v2 + v5, *v6, v6[1]);
}

void sub_22727AF38(void (*a1)(uint64_t *), uint64_t a2)
{
  uint64_t v2;

  sub_22726C9E4(a1, a2, *(void **)(v2 + 16), *(char **)(v2 + 24));
}

uint64_t sub_22727AF40()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22727AF64()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22727AFA8(int a1)
{
  uint64_t v1;

  return sub_22726D878(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(void (**)(uint64_t))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_22727AFB8(void *a1, uint64_t a2, void *a3, void (*a4)(uint64_t), uint64_t a5, int a6, void *a7, uint64_t a8, uint64_t a9)
{
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  void (*v37)(char *, uint64_t);
  id v38;
  void *v39;
  id v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  NSObject *v44;
  int v45;
  _DWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  _QWORD *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  uint8_t *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint64_t v69;
  uint8_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  _BOOL4 v81;
  id v82;
  uint8_t *v83;
  uint64_t v84;
  char v85;
  char v86;
  char *v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  NSObject *v94;
  os_log_type_t v95;
  uint8_t *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(char *, uint64_t);
  uint64_t v101;
  char *v102;
  uint64_t v103;
  char *v104;
  id v105;
  char *v106;
  int v107;
  void (*v108)(uint64_t);
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  char *v114;
  id v115;
  uint64_t v116;
  uint64_t v117[2];

  v103 = a2;
  v115 = a1;
  v15 = sub_22727D4E8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v102 = (char *)&v99 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v112 = (char *)&v99 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v104 = (char *)&v99 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v113 = (char *)&v99 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v114 = (char *)&v99 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v99 - v27;
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = a3;
  *(_QWORD *)(v29 + 24) = a4;
  v108 = a4;
  *(_QWORD *)(v29 + 32) = a5;
  v107 = a6;
  *(_BYTE *)(v29 + 40) = a6;
  *(_QWORD *)(v29 + 48) = a7;
  *(_QWORD *)(v29 + 56) = a8;
  v30 = v29;
  *(_QWORD *)(v29 + 64) = a9;
  v31 = qword_2558CB378;
  v105 = a3;
  v109 = a5;
  swift_retain();
  v106 = a7;
  v111 = a8;
  swift_bridgeObjectRetain();
  v110 = a9;
  swift_retain();
  if (v31 != -1)
    swift_once();
  v32 = __swift_project_value_buffer(v15, (uint64_t)qword_2558CC248);
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v33(v28, v32, v15);
  v34 = sub_22727D4D0();
  v35 = sub_22727D77C();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v36 = 0;
    _os_log_impl(&dword_22723A000, v34, v35, "INPlayMediaIntentHandler#item looking in private audiosearch results...", v36, 2u);
    MEMORY[0x2276AF6D4](v36, -1, -1);
  }

  v37 = *(void (**)(char *, uint64_t))(v16 + 8);
  v37(v28, v15);
  v38 = objc_msgSend(v115, sel_privatePlayMediaIntentData);
  if (!v38
    || (v39 = v38,
        v40 = objc_msgSend(v38, sel_audioSearchResults),
        v39,
        !v40))
  {
LABEL_30:
    v66 = v114;
    v33(v114, v32, v15);
    v67 = sub_22727D4D0();
    v68 = sub_22727D788();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = swift_slowAlloc();
      v101 = v30;
      v70 = (uint8_t *)v69;
      v71 = swift_slowAlloc();
      v100 = v37;
      v72 = v71;
      v117[0] = v71;
      *(_DWORD *)v70 = 136446210;
      v73 = sub_22727D218();
      v116 = sub_2272403C4(v73, v74, v117);
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v67, v68, "INPlayMediaIntentHandler#item %{public}s Intent has missing or invalid audioSearchResults (possibly expected for createRadio or wholeLibrary queries)", v70, 0xCu);
      swift_arrayDestroy();
      v75 = v72;
      v37 = v100;
      MEMORY[0x2276AF6D4](v75, -1, -1);
      v76 = v101;
      MEMORY[0x2276AF6D4](v70, -1, -1);

      v37(v114, v15);
    }
    else
    {

      v37(v66, v15);
      v76 = v30;
    }
    v77 = v113;
    v78 = v15;
    v33(v113, v32, v15);
    v79 = sub_22727D4D0();
    v80 = sub_22727D77C();
    v81 = os_log_type_enabled(v79, v80);
    v82 = v115;
    if (v81)
    {
      v83 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v83 = 0;
      _os_log_impl(&dword_22723A000, v79, v80, "INPlayMediaIntentHandler#item evaluating if create radio...", v83, 2u);
      MEMORY[0x2276AF6D4](v83, -1, -1);
    }

    v84 = v78;
    v37(v77, v78);
    v85 = sub_22727D884();
    if ((sub_22727D89C() & 1) != 0)
    {
      v86 = sub_22727D83C();
      if ((v85 & 1) == 0)
      {
        if ((v86 & 1) != 0 && (sub_22727D86C() & 1) == 0)
        {
          sub_22727A784((uint64_t)sub_22727C7DC, v76);
          return swift_release();
        }
LABEL_43:
        v33(v112, v32, v84);
        v94 = sub_22727D4D0();
        v95 = sub_22727D794();
        if (os_log_type_enabled(v94, v95))
        {
          v96 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v96 = 0;
          _os_log_impl(&dword_22723A000, v94, v95, "INPlayMediaIntentHandler#item not create radio, trying local search as fallback", v96, 2u);
          MEMORY[0x2276AF6D4](v96, -1, -1);
        }

        v37(v112, v84);
        sub_227277E94(v82, 0, 0, (uint64_t)sub_22727C7DC, v76);
        return swift_release();
      }
    }
    else if ((v85 & 1) == 0)
    {
      goto LABEL_43;
    }
    v87 = v104;
    v33(v104, v32, v84);
    v88 = sub_22727D4D0();
    v89 = sub_22727D794();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = (uint8_t *)swift_slowAlloc();
      v91 = swift_slowAlloc();
      v117[0] = v91;
      *(_DWORD *)v90 = 136446210;
      v92 = sub_22727D218();
      v116 = sub_2272403C4(v92, v93, v117);
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v88, v89, "INPlayMediaIntentHandler#item %{public}s Creating radio station from currently playing item", v90, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v91, -1, -1);
      MEMORY[0x2276AF6D4](v90, -1, -1);

      v37(v104, v84);
    }
    else
    {

      v37(v87, v84);
    }
    v97 = v105;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v98 = swift_allocObject();
    *(_OWORD *)(v98 + 16) = xmmword_22727E830;
    sub_227247C88(0, (unint64_t *)&qword_2558CB810);
    *(_QWORD *)(v98 + 32) = sub_22727D704();
    v117[0] = v98;
    sub_22727D650();
    sub_22726D934(v117[0], v97, v108, v109, v107 & 1, v106, v111, v110);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  sub_227247C88(0, (unint64_t *)&qword_2558CB810);
  v41 = sub_22727D638();

  if (!(v41 >> 62))
  {
    if (*(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_9;
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  v65 = sub_22727D9BC();
  swift_bridgeObjectRelease();
  if (!v65)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
LABEL_9:
  v42 = sub_22727D734();
  swift_bridgeObjectRelease();
  v43 = v102;
  v33(v102, v32, v15);
  swift_bridgeObjectRetain_n();
  v44 = sub_22727D4D0();
  v45 = sub_22727D794();
  if (!os_log_type_enabled(v44, (os_log_type_t)v45))
  {

    swift_bridgeObjectRelease_n();
    v37(v43, v15);
LABEL_27:
    sub_22726D934(v42, v105, v108, v109, v107 & 1, v106, v111, v110);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  v46 = (_DWORD *)swift_slowAlloc();
  v47 = swift_slowAlloc();
  v117[0] = v47;
  v115 = v46;
  *v46 = 136315138;
  v100 = v37;
  if (v42 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_22727D9BC();
    v48 = result;
  }
  else
  {
    v48 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v101 = v30;
  v99 = v15;
  LODWORD(v114) = v45;
  v113 = (char *)v47;
  if (!v48)
  {
    v51 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_26:
    swift_bridgeObjectRelease();
    v60 = (uint8_t *)v115;
    v61 = MEMORY[0x2276AEEAC](v51, MEMORY[0x24BEE0D00]);
    v63 = v62;
    swift_bridgeObjectRelease();
    v116 = sub_2272403C4(v61, v63, v117);
    sub_22727D920();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22723A000, v44, (os_log_type_t)v114, "INPlayMediaIntentHandler#item using unique private server search results: %s", v60, 0xCu);
    v64 = v113;
    swift_arrayDestroy();
    MEMORY[0x2276AF6D4](v64, -1, -1);
    MEMORY[0x2276AF6D4](v60, -1, -1);

    v100(v102, v99);
    goto LABEL_27;
  }
  if (v48 >= 1)
  {
    v50 = 0;
    v51 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v42 & 0xC000000000000001) != 0)
        v52 = (id)MEMORY[0x2276AF200](v50, v42);
      else
        v52 = *(id *)(v42 + 8 * v50 + 32);
      v53 = v52;
      v54 = sub_22727D71C();
      v56 = v55;

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v51 = sub_227278930(0, v51[2] + 1, 1, v51);
      v58 = v51[2];
      v57 = v51[3];
      if (v58 >= v57 >> 1)
        v51 = sub_227278930((_QWORD *)(v57 > 1), v58 + 1, 1, v51);
      ++v50;
      v51[2] = v58 + 1;
      v59 = &v51[2 * v58];
      v59[4] = v54;
      v59[5] = v56;
    }
    while (v48 != v50);
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_22727BA78(uint64_t a1, uint64_t a2)
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
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  char *v27;

  v4 = sub_22727D4C4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22727D4E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2558CB378 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2558CC248);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = sub_22727D4D0();
  v14 = sub_22727D77C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v27 = v7;
    v16 = v5;
    v17 = v4;
    v18 = a1;
    v19 = a2;
    v20 = v15;
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_22723A000, v13, v14, "INPlayMediaIntentHandler#logSpotlightResult", v15, 2u);
    v21 = v20;
    a2 = v19;
    a1 = v18;
    v4 = v17;
    v5 = v16;
    v7 = v27;
    MEMORY[0x2276AF6D4](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_22727D8E4();
  if (qword_2558CB390 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558CC190);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_22727E590;
  v23 = MEMORY[0x24BEE1768];
  v24 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v22 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v22 + 64) = v24;
  *(_QWORD *)(v22 + 32) = a1;
  *(_QWORD *)(v22 + 96) = v23;
  *(_QWORD *)(v22 + 104) = v24;
  *(_QWORD *)(v22 + 72) = a2;
  sub_22727D4B8();
  sub_22727D494();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_22727BD10(void *a1, void *a2, void *a3, void (*a4)(uint64_t), uint64_t a5, int a6, void *a7, uint64_t a8, uint64_t a9)
{
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  char *v31;
  uint64_t v32;
  void (*v33)(void);
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint8_t *v38;
  id v39;
  void *v40;
  unint64_t v41;
  id v42;
  id v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  char *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  uint8_t *v66;
  id v67;
  char *v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  void *v76;
  void (*v77)(uint64_t);
  char *v78;
  NSObject *v79;
  uint64_t v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  id v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  char *v96;
  char *v97;
  char *v98;
  void *v99;
  int v100;
  void (*v101)(uint64_t);
  char *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(char *, uint64_t);
  uint64_t v108;
  id v109;
  uint64_t v110;
  unint64_t v111;

  v99 = a2;
  v109 = a1;
  v15 = sub_22727D4E8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v96 = (char *)&v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v98 = (char *)&v96 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v97 = (char *)&v96 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v102 = (char *)&v96 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v96 - v25;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = a3;
  *(_QWORD *)(v27 + 24) = a4;
  v101 = a4;
  *(_QWORD *)(v27 + 32) = a5;
  v100 = a6;
  *(_BYTE *)(v27 + 40) = a6;
  *(_QWORD *)(v27 + 48) = a7;
  *(_QWORD *)(v27 + 56) = a8;
  v104 = v27;
  *(_QWORD *)(v27 + 64) = a9;
  v28 = qword_2558CB378;
  v29 = a3;
  v106 = a5;
  swift_retain_n();
  v30 = a7;
  v105 = a8;
  swift_bridgeObjectRetain_n();
  v108 = a9;
  swift_retain_n();
  v103 = v29;
  v31 = (char *)v30;
  if (v28 != -1)
    swift_once();
  v32 = __swift_project_value_buffer(v15, (uint64_t)qword_2558CC248);
  v33 = *(void (**)(void))(v16 + 16);
  ((void (*)(char *, uint64_t, uint64_t))v33)(v26, v32, v15);
  v34 = sub_22727D4D0();
  v35 = sub_22727D77C();
  v36 = v15;
  if (os_log_type_enabled(v34, v35))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v37 = 0;
    _os_log_impl(&dword_22723A000, v34, v35, "INPlayMediaIntentHandler#item working to resolve item to play...", v37, 2u);
    v38 = v37;
    v36 = v15;
    MEMORY[0x2276AF6D4](v38, -1, -1);
  }

  v107 = *(void (**)(char *, uint64_t))(v16 + 8);
  v107(v26, v36);
  v39 = objc_msgSend(v109, sel_mediaItems);
  if (!v39)
    goto LABEL_24;
  v40 = v39;
  sub_227247C88(0, (unint64_t *)&qword_2558CB810);
  v41 = sub_22727D638();

  if (!(v41 >> 62))
  {
    if (*(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_8;
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  v61 = sub_22727D9BC();
  swift_bridgeObjectRelease();
  if (!v61)
    goto LABEL_22;
LABEL_8:
  if ((v41 & 0xC000000000000001) != 0)
  {
    v42 = (id)MEMORY[0x2276AF200](0, v41);
  }
  else
  {
    if (!*(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_40;
    }
    v42 = *(id *)(v41 + 32);
  }
  v40 = v42;
  swift_bridgeObjectRelease();
  v43 = objc_msgSend(v109, sel_mediaItems);
  if (!v43)
  {

LABEL_23:
    v36 = v15;
    goto LABEL_24;
  }
  v44 = v43;
  v45 = sub_22727D638();

  if (v45 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    v46 = sub_22727D9BC();
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v46 = *(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_14:
  v36 = v15;
  swift_bridgeObjectRelease();
  if (v46 == 1)
  {
    v47 = v96;
    ((void (*)(char *, uint64_t, uint64_t))v33)(v96, v32, v15);
    v48 = v40;
    v49 = sub_22727D4D0();
    v50 = sub_22727D794();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v111 = v52;
      v102 = v31;
      *(_DWORD *)v51 = 136446210;
      v53 = sub_22727D71C();
      v110 = sub_2272403C4(v53, v54, (uint64_t *)&v111);
      sub_22727D920();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v49, v50, "INPlayMediaIntentHandler#item Overriding results with disambiguation selected item: %{public}s", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v52, -1, -1);
      MEMORY[0x2276AF6D4](v51, -1, -1);

      v55 = v47;
      v56 = v36;
      v31 = v102;
    }
    else
    {

      v55 = v47;
      v56 = v36;
    }
    v107(v55, v56);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v57 = swift_allocObject();
    *(_OWORD *)(v57 + 16) = xmmword_22727E830;
    *(_QWORD *)(v57 + 32) = v48;
    v111 = v57;
    sub_22727D650();
    v58 = v111;
    v59 = v48;
    v60 = v103;
    sub_22726D934(v58, v103, v101, v106, v100 & 1, v31, v105, v108);

    swift_release();
LABEL_36:
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }

LABEL_24:
  v62 = v102;
  ((void (*)(char *, uint64_t, uint64_t))v33)(v102, v32, v36);
  v63 = sub_22727D4D0();
  v64 = sub_22727D77C();
  if (os_log_type_enabled(v63, v64))
  {
    v65 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v65 = 0;
    _os_log_impl(&dword_22723A000, v63, v64, "INPlayMediaIntentHandler#item evaluating if create radio and server search was suppressed (we have to handle on client)...", v65, 2u);
    v66 = v65;
    v36 = v15;
    MEMORY[0x2276AF6D4](v66, -1, -1);
  }

  v107(v62, v36);
  v67 = v109;
  if ((sub_22727D884() & 1) != 0 && (sub_22727D83C() & 1) != 0)
  {
    v68 = v97;
    ((void (*)(char *, uint64_t, uint64_t))v33)(v97, v32, v36);
    v69 = sub_22727D4D0();
    v70 = sub_22727D794();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      v72 = swift_slowAlloc();
      v111 = v72;
      *(_DWORD *)v71 = 136446210;
      v73 = sub_22727D218();
      v110 = sub_2272403C4(v73, v74, (uint64_t *)&v111);
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v69, v70, "INPlayMediaIntentHandler#item %{public}s Creating radio station from currently playing item when server search was suppressed", v71, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v72, -1, -1);
      MEMORY[0x2276AF6D4](v71, -1, -1);
    }

    v107(v68, v36);
    v92 = v106;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558CB800);
    v93 = swift_allocObject();
    *(_OWORD *)(v93 + 16) = xmmword_22727E830;
    sub_227247C88(0, (unint64_t *)&qword_2558CB810);
    *(_QWORD *)(v93 + 32) = sub_22727D704();
    v111 = v93;
    sub_22727D650();
    v94 = v103;
    sub_22726D934(v111, v103, v101, v92, v100 & 1, v31, v105, v108);

    swift_release();
    goto LABEL_36;
  }
  v75 = swift_allocObject();
  v76 = v99;
  *(_QWORD *)(v75 + 16) = v99;
  v77 = v76;
  if ((sub_22727D854() & 1) != 0)
  {
    v102 = v31;
    v78 = v98;
    v33();
    v79 = sub_22727D4D0();
    v80 = v36;
    v81 = sub_22727D794();
    if (os_log_type_enabled(v79, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc();
      v83 = swift_slowAlloc();
      v101 = v77;
      v84 = v83;
      v111 = v83;
      *(_DWORD *)v82 = 136446210;
      v85 = sub_22727D218();
      v110 = sub_2272403C4(v85, v86, (uint64_t *)&v111);
      v67 = v109;
      sub_22727D920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22723A000, v79, v81, "INPlayMediaIntentHandler#item %{public}s Executing local search as force spotlight search flag was present", v82, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2276AF6D4](v84, -1, -1);
      MEMORY[0x2276AF6D4](v82, -1, -1);
    }

    v107(v78, v80);
    sub_22727BA78(1, 0);
    swift_retain();
    sub_227277E94(v67, (uint64_t)sub_22727C7E0, v75, (uint64_t)sub_22727C7DC, v104);

    swift_release();
    swift_release_n();
    v31 = v102;
  }
  else
  {
    v87 = v103;
    v88 = v106;
    swift_retain();
    v89 = v31;
    v90 = v105;
    swift_bridgeObjectRetain();
    v91 = v108;
    swift_retain();
    sub_22727AFB8(v67, (uint64_t)v77, v87, v101, v88, v100 & 1, v89, v90, v91);
    swift_release();
    swift_release();

    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
  }
LABEL_37:
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_22727C7E0(char *a1, void (*a2)(uint64_t), uint64_t a3)
{
  sub_22727BA78(1, 1);
  return sub_227274BCC(a1, a2, a3);
}

uint64_t objectdestroy_87Tm()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22727C874(unint64_t a1)
{
  uint64_t v1;

  return sub_22726D934(a1, *(id *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), *(unsigned __int8 *)(v1 + 40), *(char **)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64));
}

uint64_t sub_22727C88C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22727C8D8(void (*a1)(char *, uint64_t))
{
  uint64_t v1;

  return sub_22726F118(a1, *(void **)(v1 + 16), *(void (**)(char *, uint64_t))(v1 + 24), *(void (**)(_QWORD))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64));
}

unint64_t sub_22727C8EC()
{
  unint64_t result;

  result = qword_2558CC1A0;
  if (!qword_2558CC1A0)
  {
    result = MEMORY[0x2276AF644](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2558CC1A0);
  }
  return result;
}

uint64_t sub_22727C930()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_22727C990(char a1)
{
  return *(_QWORD *)&aMirt100[8 * a1];
}

uint64_t sub_22727C9A8()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_22727C9B4()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_22727C9C0()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_22727C9CC()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_22727C9D8()
{
  return MEMORY[0x24BDCBAD0]();
}

uint64_t sub_22727C9E4()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t sub_22727C9F0()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_22727C9FC()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_22727CA08()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_22727CA14()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22727CA20()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_22727CA2C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22727CA38()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_22727CA44()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_22727CA50()
{
  return MEMORY[0x24BDCF638]();
}

uint64_t sub_22727CA5C()
{
  return MEMORY[0x24BDCF650]();
}

uint64_t sub_22727CA68()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_22727CA74()
{
  return MEMORY[0x24BE73B98]();
}

uint64_t sub_22727CA80()
{
  return MEMORY[0x24BE73BA0]();
}

uint64_t sub_22727CA8C()
{
  return MEMORY[0x24BE73BC0]();
}

uint64_t sub_22727CA98()
{
  return MEMORY[0x24BE73BC8]();
}

uint64_t sub_22727CAA4()
{
  return MEMORY[0x24BE73C48]();
}

uint64_t sub_22727CAB0()
{
  return MEMORY[0x24BE73C58]();
}

uint64_t sub_22727CABC()
{
  return MEMORY[0x24BE96E08]();
}

uint64_t sub_22727CAC8()
{
  return MEMORY[0x24BE96E30]();
}

uint64_t sub_22727CAD4()
{
  return MEMORY[0x24BE973E8]();
}

uint64_t sub_22727CAE0()
{
  return MEMORY[0x24BE987D8]();
}

uint64_t sub_22727CAEC()
{
  return MEMORY[0x24BE990C8]();
}

uint64_t sub_22727CAF8()
{
  return MEMORY[0x24BE92EC0]();
}

uint64_t sub_22727CB04()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_22727CB10()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_22727CB1C()
{
  return MEMORY[0x24BE90F38]();
}

uint64_t sub_22727CB28()
{
  return MEMORY[0x24BE90F40]();
}

uint64_t sub_22727CB34()
{
  return MEMORY[0x24BE90F50]();
}

uint64_t sub_22727CB40()
{
  return MEMORY[0x24BE90F60]();
}

uint64_t sub_22727CB4C()
{
  return MEMORY[0x24BE90F68]();
}

uint64_t sub_22727CB58()
{
  return MEMORY[0x24BE90F70]();
}

uint64_t sub_22727CB64()
{
  return MEMORY[0x24BE90F78]();
}

uint64_t sub_22727CB70()
{
  return MEMORY[0x24BE90F80]();
}

uint64_t sub_22727CB7C()
{
  return MEMORY[0x24BE90F88]();
}

uint64_t sub_22727CB88()
{
  return MEMORY[0x24BE90F90]();
}

uint64_t sub_22727CB94()
{
  return MEMORY[0x24BE90F98]();
}

uint64_t sub_22727CBA0()
{
  return MEMORY[0x24BE90FA0]();
}

uint64_t sub_22727CBAC()
{
  return MEMORY[0x24BE90FB0]();
}

uint64_t sub_22727CBB8()
{
  return MEMORY[0x24BE90FB8]();
}

uint64_t sub_22727CBC4()
{
  return MEMORY[0x24BE90FC8]();
}

uint64_t sub_22727CBD0()
{
  return MEMORY[0x24BE90FD0]();
}

uint64_t sub_22727CBDC()
{
  return MEMORY[0x24BE90FD8]();
}

uint64_t sub_22727CBE8()
{
  return MEMORY[0x24BE90FE0]();
}

uint64_t sub_22727CBF4()
{
  return MEMORY[0x24BE90FE8]();
}

uint64_t sub_22727CC00()
{
  return MEMORY[0x24BE90FF0]();
}

uint64_t sub_22727CC0C()
{
  return MEMORY[0x24BE90FF8]();
}

uint64_t sub_22727CC18()
{
  return MEMORY[0x24BE91000]();
}

uint64_t sub_22727CC24()
{
  return MEMORY[0x24BE91050]();
}

uint64_t sub_22727CC30()
{
  return MEMORY[0x24BE91058]();
}

uint64_t sub_22727CC3C()
{
  return MEMORY[0x24BE91060]();
}

uint64_t sub_22727CC48()
{
  return MEMORY[0x24BE91068]();
}

uint64_t sub_22727CC54()
{
  return MEMORY[0x24BE91070]();
}

uint64_t sub_22727CC60()
{
  return MEMORY[0x24BE91078]();
}

uint64_t sub_22727CC6C()
{
  return MEMORY[0x24BE91080]();
}

uint64_t sub_22727CC78()
{
  return MEMORY[0x24BE91088]();
}

uint64_t sub_22727CC84()
{
  return MEMORY[0x24BE910A8]();
}

uint64_t sub_22727CC90()
{
  return MEMORY[0x24BE910B8]();
}

uint64_t sub_22727CC9C()
{
  return MEMORY[0x24BE910C8]();
}

uint64_t sub_22727CCA8()
{
  return MEMORY[0x24BE910D8]();
}

uint64_t sub_22727CCB4()
{
  return MEMORY[0x24BE91100]();
}

uint64_t sub_22727CCC0()
{
  return MEMORY[0x24BE91108]();
}

uint64_t sub_22727CCCC()
{
  return MEMORY[0x24BE91128]();
}

uint64_t sub_22727CCD8()
{
  return MEMORY[0x24BE91138]();
}

uint64_t sub_22727CCE4()
{
  return MEMORY[0x24BE91148]();
}

uint64_t sub_22727CCF0()
{
  return MEMORY[0x24BE91158]();
}

uint64_t sub_22727CCFC()
{
  return MEMORY[0x24BE91160]();
}

uint64_t sub_22727CD08()
{
  return MEMORY[0x24BE91168]();
}

uint64_t sub_22727CD14()
{
  return MEMORY[0x24BE91170]();
}

uint64_t sub_22727CD20()
{
  return MEMORY[0x24BE91178]();
}

uint64_t sub_22727CD2C()
{
  return MEMORY[0x24BE91180]();
}

uint64_t sub_22727CD38()
{
  return MEMORY[0x24BE91188]();
}

uint64_t sub_22727CD44()
{
  return MEMORY[0x24BE91190]();
}

uint64_t sub_22727CD50()
{
  return MEMORY[0x24BE91198]();
}

uint64_t sub_22727CD5C()
{
  return MEMORY[0x24BE911A0]();
}

uint64_t sub_22727CD68()
{
  return MEMORY[0x24BE911A8]();
}

uint64_t sub_22727CD74()
{
  return MEMORY[0x24BE911B8]();
}

uint64_t sub_22727CD80()
{
  return MEMORY[0x24BE911D0]();
}

uint64_t sub_22727CD8C()
{
  return MEMORY[0x24BE911E0]();
}

uint64_t sub_22727CD98()
{
  return MEMORY[0x24BE911F0]();
}

uint64_t sub_22727CDA4()
{
  return MEMORY[0x24BE91200]();
}

uint64_t sub_22727CDB0()
{
  return MEMORY[0x24BE91208]();
}

uint64_t sub_22727CDBC()
{
  return MEMORY[0x24BE91218]();
}

uint64_t sub_22727CDC8()
{
  return MEMORY[0x24BE91220]();
}

uint64_t sub_22727CDD4()
{
  return MEMORY[0x24BE91228]();
}

uint64_t sub_22727CDE0()
{
  return MEMORY[0x24BE91230]();
}

uint64_t sub_22727CDEC()
{
  return MEMORY[0x24BE91238]();
}

uint64_t sub_22727CDF8()
{
  return MEMORY[0x24BE91250]();
}

uint64_t sub_22727CE04()
{
  return MEMORY[0x24BE91258]();
}

uint64_t sub_22727CE10()
{
  return MEMORY[0x24BE91268]();
}

uint64_t sub_22727CE1C()
{
  return MEMORY[0x24BE91278]();
}

uint64_t sub_22727CE28()
{
  return MEMORY[0x24BE91280]();
}

uint64_t sub_22727CE34()
{
  return MEMORY[0x24BE91288]();
}

uint64_t sub_22727CE40()
{
  return MEMORY[0x24BE91290]();
}

uint64_t sub_22727CE4C()
{
  return MEMORY[0x24BE91298]();
}

uint64_t sub_22727CE58()
{
  return MEMORY[0x24BE912A0]();
}

uint64_t sub_22727CE64()
{
  return MEMORY[0x24BE912A8]();
}

uint64_t sub_22727CE70()
{
  return MEMORY[0x24BE912B0]();
}

uint64_t sub_22727CE7C()
{
  return MEMORY[0x24BE912B8]();
}

uint64_t sub_22727CE88()
{
  return MEMORY[0x24BE912C0]();
}

uint64_t sub_22727CE94()
{
  return MEMORY[0x24BE912C8]();
}

uint64_t sub_22727CEA0()
{
  return MEMORY[0x24BE912D0]();
}

uint64_t sub_22727CEAC()
{
  return MEMORY[0x24BE912E0]();
}

uint64_t sub_22727CEB8()
{
  return MEMORY[0x24BE912F0]();
}

uint64_t sub_22727CEC4()
{
  return MEMORY[0x24BE91300]();
}

uint64_t sub_22727CED0()
{
  return MEMORY[0x24BE91310]();
}

uint64_t sub_22727CEDC()
{
  return MEMORY[0x24BE91318]();
}

uint64_t sub_22727CEE8()
{
  return MEMORY[0x24BE91320]();
}

uint64_t sub_22727CEF4()
{
  return MEMORY[0x24BE91328]();
}

uint64_t sub_22727CF00()
{
  return MEMORY[0x24BE91338]();
}

uint64_t sub_22727CF0C()
{
  return MEMORY[0x24BE91340]();
}

uint64_t sub_22727CF18()
{
  return MEMORY[0x24BE91348]();
}

uint64_t sub_22727CF24()
{
  return MEMORY[0x24BE91358]();
}

uint64_t sub_22727CF30()
{
  return MEMORY[0x24BE91360]();
}

uint64_t sub_22727CF3C()
{
  return MEMORY[0x24BE91370]();
}

uint64_t sub_22727CF48()
{
  return MEMORY[0x24BE91378]();
}

uint64_t sub_22727CF54()
{
  return MEMORY[0x24BE91380]();
}

uint64_t sub_22727CF60()
{
  return MEMORY[0x24BE91388]();
}

uint64_t sub_22727CF6C()
{
  return MEMORY[0x24BE913A0]();
}

uint64_t sub_22727CF78()
{
  return MEMORY[0x24BE913A8]();
}

uint64_t sub_22727CF84()
{
  return MEMORY[0x24BE913B0]();
}

uint64_t sub_22727CF90()
{
  return MEMORY[0x24BE913B8]();
}

uint64_t sub_22727CF9C()
{
  return MEMORY[0x24BE913C0]();
}

uint64_t sub_22727CFA8()
{
  return MEMORY[0x24BE913C8]();
}

uint64_t sub_22727CFB4()
{
  return MEMORY[0x24BE913D8]();
}

uint64_t sub_22727CFC0()
{
  return MEMORY[0x24BE913F8]();
}

uint64_t sub_22727CFCC()
{
  return MEMORY[0x24BE91400]();
}

uint64_t sub_22727CFD8()
{
  return MEMORY[0x24BE91428]();
}

uint64_t sub_22727CFE4()
{
  return MEMORY[0x24BE91430]();
}

uint64_t sub_22727CFF0()
{
  return MEMORY[0x24BE91438]();
}

uint64_t sub_22727CFFC()
{
  return MEMORY[0x24BE91440]();
}

uint64_t sub_22727D008()
{
  return MEMORY[0x24BE91448]();
}

uint64_t sub_22727D014()
{
  return MEMORY[0x24BE91450]();
}

uint64_t sub_22727D020()
{
  return MEMORY[0x24BE91460]();
}

uint64_t sub_22727D02C()
{
  return MEMORY[0x24BE91468]();
}

uint64_t sub_22727D038()
{
  return MEMORY[0x24BE91470]();
}

uint64_t sub_22727D044()
{
  return MEMORY[0x24BE91478]();
}

uint64_t sub_22727D050()
{
  return MEMORY[0x24BE91480]();
}

uint64_t sub_22727D05C()
{
  return MEMORY[0x24BE91488]();
}

uint64_t sub_22727D068()
{
  return MEMORY[0x24BE91498]();
}

uint64_t sub_22727D074()
{
  return MEMORY[0x24BE914A0]();
}

uint64_t sub_22727D080()
{
  return MEMORY[0x24BE914C8]();
}

uint64_t sub_22727D08C()
{
  return MEMORY[0x24BE914E8]();
}

uint64_t sub_22727D098()
{
  return MEMORY[0x24BE914F0]();
}

uint64_t sub_22727D0A4()
{
  return MEMORY[0x24BE91500]();
}

uint64_t sub_22727D0B0()
{
  return MEMORY[0x24BE91510]();
}

uint64_t sub_22727D0BC()
{
  return MEMORY[0x24BE91518]();
}

uint64_t sub_22727D0C8()
{
  return MEMORY[0x24BE91548]();
}

uint64_t sub_22727D0D4()
{
  return MEMORY[0x24BE91558]();
}

uint64_t sub_22727D0E0()
{
  return MEMORY[0x24BE91560]();
}

uint64_t sub_22727D0EC()
{
  return MEMORY[0x24BE91568]();
}

uint64_t sub_22727D0F8()
{
  return MEMORY[0x24BE91578]();
}

uint64_t sub_22727D104()
{
  return MEMORY[0x24BE91580]();
}

uint64_t sub_22727D110()
{
  return MEMORY[0x24BE91590]();
}

uint64_t sub_22727D11C()
{
  return MEMORY[0x24BE915A0]();
}

uint64_t sub_22727D128()
{
  return MEMORY[0x24BE915A8]();
}

uint64_t sub_22727D134()
{
  return MEMORY[0x24BE915B8]();
}

uint64_t sub_22727D140()
{
  return MEMORY[0x24BE915C8]();
}

uint64_t sub_22727D14C()
{
  return MEMORY[0x24BE915E8]();
}

uint64_t sub_22727D158()
{
  return MEMORY[0x24BE91610]();
}

uint64_t sub_22727D164()
{
  return MEMORY[0x24BE91618]();
}

uint64_t sub_22727D170()
{
  return MEMORY[0x24BE91628]();
}

uint64_t sub_22727D17C()
{
  return MEMORY[0x24BE91630]();
}

uint64_t sub_22727D188()
{
  return MEMORY[0x24BE91638]();
}

uint64_t sub_22727D194()
{
  return MEMORY[0x24BE91640]();
}

uint64_t sub_22727D1A0()
{
  return MEMORY[0x24BE91658]();
}

uint64_t sub_22727D1AC()
{
  return MEMORY[0x24BE91668]();
}

uint64_t sub_22727D1B8()
{
  return MEMORY[0x24BE91670]();
}

uint64_t sub_22727D1C4()
{
  return MEMORY[0x24BE91678]();
}

uint64_t sub_22727D1D0()
{
  return MEMORY[0x24BE91680]();
}

uint64_t sub_22727D1DC()
{
  return MEMORY[0x24BE91688]();
}

uint64_t sub_22727D1E8()
{
  return MEMORY[0x24BE91698]();
}

uint64_t sub_22727D1F4()
{
  return MEMORY[0x24BE916A0]();
}

uint64_t sub_22727D200()
{
  return MEMORY[0x24BE916B0]();
}

uint64_t sub_22727D20C()
{
  return MEMORY[0x24BE916B8]();
}

uint64_t sub_22727D218()
{
  return MEMORY[0x24BE916C0]();
}

uint64_t sub_22727D224()
{
  return MEMORY[0x24BE03DF0]();
}

uint64_t sub_22727D230()
{
  return MEMORY[0x24BE03E00]();
}

uint64_t sub_22727D23C()
{
  return MEMORY[0x24BE03E08]();
}

uint64_t sub_22727D248()
{
  return MEMORY[0x24BE03E10]();
}

uint64_t sub_22727D254()
{
  return MEMORY[0x24BE03E18]();
}

uint64_t sub_22727D260()
{
  return MEMORY[0x24BE03E20]();
}

uint64_t sub_22727D26C()
{
  return MEMORY[0x24BE03E28]();
}

uint64_t sub_22727D278()
{
  return MEMORY[0x24BE03E30]();
}

uint64_t sub_22727D284()
{
  return MEMORY[0x24BE03E38]();
}

uint64_t sub_22727D290()
{
  return MEMORY[0x24BE03E40]();
}

uint64_t sub_22727D29C()
{
  return MEMORY[0x24BE03E50]();
}

uint64_t sub_22727D2A8()
{
  return MEMORY[0x24BE03E58]();
}

uint64_t sub_22727D2B4()
{
  return MEMORY[0x24BE03EF0]();
}

uint64_t sub_22727D2C0()
{
  return MEMORY[0x24BE03F10]();
}

uint64_t sub_22727D2CC()
{
  return MEMORY[0x24BE03F60]();
}

uint64_t sub_22727D2D8()
{
  return MEMORY[0x24BE03F78]();
}

uint64_t sub_22727D2E4()
{
  return MEMORY[0x24BE03F90]();
}

uint64_t sub_22727D2F0()
{
  return MEMORY[0x24BE03F98]();
}

uint64_t sub_22727D2FC()
{
  return MEMORY[0x24BE03FA0]();
}

uint64_t sub_22727D308()
{
  return MEMORY[0x24BE03FA8]();
}

uint64_t sub_22727D314()
{
  return MEMORY[0x24BE03FB8]();
}

uint64_t sub_22727D320()
{
  return MEMORY[0x24BE03FD0]();
}

uint64_t sub_22727D32C()
{
  return MEMORY[0x24BE04018]();
}

uint64_t sub_22727D338()
{
  return MEMORY[0x24BE04020]();
}

uint64_t sub_22727D344()
{
  return MEMORY[0x24BE04040]();
}

uint64_t sub_22727D350()
{
  return MEMORY[0x24BE04048]();
}

uint64_t sub_22727D35C()
{
  return MEMORY[0x24BEA6B40]();
}

uint64_t sub_22727D368()
{
  return MEMORY[0x24BEA6B48]();
}

uint64_t sub_22727D374()
{
  return MEMORY[0x24BEA6B50]();
}

uint64_t sub_22727D380()
{
  return MEMORY[0x24BEA6B80]();
}

uint64_t sub_22727D38C()
{
  return MEMORY[0x24BEA6CD8]();
}

uint64_t sub_22727D398()
{
  return MEMORY[0x24BEA6E90]();
}

uint64_t sub_22727D3A4()
{
  return MEMORY[0x24BEA6F78]();
}

uint64_t sub_22727D3B0()
{
  return MEMORY[0x24BEA6F80]();
}

uint64_t sub_22727D3BC()
{
  return MEMORY[0x24BEA71D8]();
}

uint64_t sub_22727D3C8()
{
  return MEMORY[0x24BEA7248]();
}

uint64_t sub_22727D3D4()
{
  return MEMORY[0x24BEA74E8]();
}

uint64_t sub_22727D3E0()
{
  return MEMORY[0x24BEA7528]();
}

uint64_t sub_22727D3EC()
{
  return MEMORY[0x24BEA7630]();
}

uint64_t sub_22727D3F8()
{
  return MEMORY[0x24BEA7648]();
}

uint64_t sub_22727D404()
{
  return MEMORY[0x24BEA7718]();
}

uint64_t sub_22727D410()
{
  return MEMORY[0x24BEA7720]();
}

uint64_t sub_22727D41C()
{
  return MEMORY[0x24BEA7738]();
}

uint64_t sub_22727D428()
{
  return MEMORY[0x24BEA7748]();
}

uint64_t sub_22727D434()
{
  return MEMORY[0x24BEA7750]();
}

uint64_t sub_22727D440()
{
  return MEMORY[0x24BE92ED0]();
}

uint64_t sub_22727D44C()
{
  return MEMORY[0x24BEA54A8]();
}

uint64_t sub_22727D458()
{
  return MEMORY[0x24BEA54B0]();
}

uint64_t sub_22727D464()
{
  return MEMORY[0x24BEA40F8]();
}

uint64_t sub_22727D470()
{
  return MEMORY[0x24BEA4100]();
}

uint64_t sub_22727D47C()
{
  return MEMORY[0x24BEA4210]();
}

uint64_t sub_22727D488()
{
  return MEMORY[0x24BEA4290]();
}

uint64_t sub_22727D494()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_22727D4A0()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_22727D4AC()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_22727D4B8()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_22727D4C4()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_22727D4D0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22727D4DC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22727D4E8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22727D4F4()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_22727D500()
{
  return MEMORY[0x24BEE5A80]();
}

uint64_t sub_22727D50C()
{
  return MEMORY[0x24BEE5A88]();
}

uint64_t sub_22727D518()
{
  return MEMORY[0x24BEE5A90]();
}

uint64_t sub_22727D524()
{
  return MEMORY[0x24BEE5AA8]();
}

uint64_t sub_22727D530()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22727D53C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22727D548()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_22727D554()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22727D560()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22727D56C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22727D578()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22727D584()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22727D590()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22727D59C()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_22727D5A8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_22727D5B4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22727D5C0()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_22727D5CC()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_22727D5D8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22727D5E4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22727D5F0()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_22727D5FC()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_22727D608()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_22727D614()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22727D620()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22727D62C()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_22727D638()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22727D644()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_22727D650()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22727D65C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22727D668()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22727D674()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22727D680()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22727D68C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_22727D698()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_22727D6A4()
{
  return MEMORY[0x24BEE6978]();
}

uint64_t sub_22727D6B0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22727D6BC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22727D6C8()
{
  return MEMORY[0x24BDCFC40]();
}

uint64_t sub_22727D6D4()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_22727D6E0()
{
  return MEMORY[0x24BE916C8]();
}

uint64_t sub_22727D6EC()
{
  return MEMORY[0x24BE916D0]();
}

uint64_t sub_22727D6F8()
{
  return MEMORY[0x24BE916D8]();
}

uint64_t sub_22727D704()
{
  return MEMORY[0x24BE916E0]();
}

uint64_t sub_22727D710()
{
  return MEMORY[0x24BE916E8]();
}

uint64_t sub_22727D71C()
{
  return MEMORY[0x24BE916F0]();
}

uint64_t sub_22727D728()
{
  return MEMORY[0x24BE916F8]();
}

uint64_t sub_22727D734()
{
  return MEMORY[0x24BE91700]();
}

uint64_t sub_22727D740()
{
  return MEMORY[0x24BE91708]();
}

uint64_t sub_22727D74C()
{
  return MEMORY[0x24BE91710]();
}

uint64_t sub_22727D758()
{
  return MEMORY[0x24BE91718]();
}

uint64_t sub_22727D764()
{
  return MEMORY[0x24BE91720]();
}

uint64_t sub_22727D770()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22727D77C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22727D788()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22727D794()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22727D7A0()
{
  return MEMORY[0x24BE91728]();
}

uint64_t sub_22727D7AC()
{
  return MEMORY[0x24BE91750]();
}

uint64_t sub_22727D7B8()
{
  return MEMORY[0x24BE91758]();
}

uint64_t sub_22727D7C4()
{
  return MEMORY[0x24BE91760]();
}

uint64_t sub_22727D7D0()
{
  return MEMORY[0x24BE91768]();
}

uint64_t sub_22727D7DC()
{
  return MEMORY[0x24BE91770]();
}

uint64_t sub_22727D7E8()
{
  return MEMORY[0x24BE91778]();
}

uint64_t sub_22727D7F4()
{
  return MEMORY[0x24BE91780]();
}

uint64_t sub_22727D800()
{
  return MEMORY[0x24BE91788]();
}

uint64_t sub_22727D80C()
{
  return MEMORY[0x24BE91790]();
}

uint64_t sub_22727D818()
{
  return MEMORY[0x24BE91798]();
}

uint64_t sub_22727D824()
{
  return MEMORY[0x24BE917A0]();
}

uint64_t sub_22727D830()
{
  return MEMORY[0x24BE917A8]();
}

uint64_t sub_22727D83C()
{
  return MEMORY[0x24BE917B0]();
}

uint64_t sub_22727D848()
{
  return MEMORY[0x24BE917B8]();
}

uint64_t sub_22727D854()
{
  return MEMORY[0x24BE917C0]();
}

uint64_t sub_22727D860()
{
  return MEMORY[0x24BE917C8]();
}

uint64_t sub_22727D86C()
{
  return MEMORY[0x24BE917D0]();
}

uint64_t sub_22727D878()
{
  return MEMORY[0x24BE917D8]();
}

uint64_t sub_22727D884()
{
  return MEMORY[0x24BE917E0]();
}

uint64_t sub_22727D890()
{
  return MEMORY[0x24BE917E8]();
}

uint64_t sub_22727D89C()
{
  return MEMORY[0x24BE917F0]();
}

uint64_t sub_22727D8A8()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_22727D8B4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_22727D8C0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22727D8CC()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_22727D8D8()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_22727D8E4()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_22727D8F0()
{
  return MEMORY[0x24BE917F8]();
}

uint64_t sub_22727D8FC()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_22727D908()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22727D914()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_22727D920()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22727D92C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22727D938()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22727D944()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_22727D950()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_22727D95C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_22727D968()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_22727D974()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22727D980()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22727D98C()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_22727D998()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22727D9A4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22727D9B0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22727D9BC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22727D9C8()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_22727D9D4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22727D9E0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22727D9EC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22727D9F8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_22727DA04()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22727DA10()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22727DA1C()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_22727DA28()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_22727DA34()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_22727DA40()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22727DA4C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22727DA58()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22727DA64()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22727DA70()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22727DA7C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22727DA88()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

