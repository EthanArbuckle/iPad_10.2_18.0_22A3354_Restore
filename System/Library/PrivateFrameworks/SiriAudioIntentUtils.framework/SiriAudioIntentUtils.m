uint64_t AudioMediaItem.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioMediaItem.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void AudioMediaItem.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

uint64_t AudioMediaItem.artist.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall AudioMediaItem.init(identifier:title:type:artist:)(SiriAudioIntentUtils::AudioMediaItem *__return_ptr retstr, Swift::String_optional identifier, Swift::String_optional title, SiriAudioIntentUtils::CommonAudio::MediaType type, Swift::String_optional artist)
{
  SiriAudioIntentUtils::CommonAudio::MediaType v5;

  v5 = *(_BYTE *)type;
  retstr->identifier = identifier;
  retstr->title = title;
  retstr->type = v5;
  retstr->artist = artist;
}

uint64_t initializeBufferWithCopyOfBuffer for AudioMediaItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AudioMediaItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AudioMediaItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AudioMediaItem(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AudioMediaItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioMediaItem(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioMediaItem(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioMediaItem()
{
  return &type metadata for AudioMediaItem;
}

uint64_t UsoEntity_common_App.bundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
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
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void (*v45)(char *, unint64_t, uint64_t);
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  unint64_t v55;
  char *v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int (*v67)(uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  char *v69;
  char v70;
  void (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  char *v82;
  void (*v83)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  v94 = sub_2460D4B60();
  v90 = *(_QWORD *)(v94 - 8);
  MEMORY[0x24BDAC7A8](v94);
  v79 = (char *)&v77 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540710);
  MEMORY[0x24BDAC7A8](v2);
  v91 = (uint64_t)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540718);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v93 = (uint64_t)&v77 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v92 = (uint64_t)&v77 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540720);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v77 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v77 - v18;
  v20 = sub_2460D4B90();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v89 = (char *)&v77 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v77 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v77 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v78 = (char *)&v77 - v30;
  v87 = v0;
  v31 = sub_2460D4BE4();
  v95 = v21;
  v84 = v2;
  v81 = v17;
  v82 = v19;
  v80 = v14;
  if (!v31)
  {
    v83 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
    v83(v17, 1, 1, v20);
    v39 = v2;
    goto LABEL_15;
  }
  v32 = *(_QWORD *)(v31 + 16);
  if (!v32)
  {
LABEL_12:
    v83 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
    v83(v17, 1, 1, v20);
    v39 = v84;
    goto LABEL_14;
  }
  v86 = v7;
  v33 = v31 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
  v34 = *(_QWORD *)(v21 + 72);
  v35 = *(void (**)(char *, unint64_t, uint64_t))(v21 + 16);
  swift_bridgeObjectRetain();
  while (1)
  {
    v35(v29, v33, v20);
    v37 = sub_2460D4B84();
    if (!v38)
      goto LABEL_5;
    if (v37 == 0x6C646E7542707061 && v38 == 0xEB00000000644965)
      break;
    v36 = sub_2460D5058();
    swift_bridgeObjectRelease();
    if ((v36 & 1) != 0)
      goto LABEL_13;
LABEL_5:
    (*(void (**)(char *, uint64_t))(v95 + 8))(v29, v20);
    v33 += v34;
    if (!--v32)
    {
      swift_bridgeObjectRelease();
      v21 = v95;
      v14 = v80;
      v17 = v81;
      v7 = v86;
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease();
LABEL_13:
  swift_bridgeObjectRelease();
  v21 = v95;
  v17 = v81;
  (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v81, v29, v20);
  v83 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  v83(v17, 0, 1, v20);
  v14 = v80;
  v39 = v84;
  v7 = v86;
LABEL_14:
  swift_bridgeObjectRelease();
  v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  if (v40(v17, 1, v20) != 1)
  {
    v49 = (uint64_t)v82;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v82, v17, v20);
    v83((char *)v49, 0, 1, v20);
    goto LABEL_50;
  }
LABEL_15:
  v41 = sub_2460D4BE4();
  if (!v41)
  {
    v50 = v83;
    v83(v14, 1, 1, v20);
    goto LABEL_31;
  }
  v86 = v7;
  v42 = *(_QWORD *)(v41 + 16);
  if (!v42)
  {
    v51 = 1;
    goto LABEL_30;
  }
  v43 = v41 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
  v44 = *(_QWORD *)(v21 + 72);
  v45 = *(void (**)(char *, unint64_t, uint64_t))(v21 + 16);
  swift_bridgeObjectRetain();
  while (2)
  {
    v45(v26, v43, v20);
    v47 = sub_2460D4B84();
    if (!v48)
    {
LABEL_19:
      (*(void (**)(char *, uint64_t))(v95 + 8))(v26, v20);
      v43 += v44;
      if (!--v42)
      {
        swift_bridgeObjectRelease();
        v51 = 1;
        v21 = v95;
        v14 = v80;
        v17 = v81;
        goto LABEL_29;
      }
      continue;
    }
    break;
  }
  if (v47 != 0x64695F6D657469 || v48 != 0xE700000000000000)
  {
    v46 = sub_2460D5058();
    swift_bridgeObjectRelease();
    if ((v46 & 1) != 0)
      goto LABEL_28;
    goto LABEL_19;
  }
  swift_bridgeObjectRelease();
LABEL_28:
  swift_bridgeObjectRelease();
  v21 = v95;
  v14 = v80;
  (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v80, v26, v20);
  v51 = 0;
  v17 = v81;
LABEL_29:
  v39 = v84;
LABEL_30:
  v7 = v86;
  v50 = v83;
  v83(v14, v51, 1, v20);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v14, 1, v20) != 1)
  {
    v49 = (uint64_t)v82;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v82, v14, v20);
    v50((char *)v49, 0, 1, v20);
    goto LABEL_49;
  }
LABEL_31:
  v52 = sub_2460D4BE4();
  if (!v52)
  {
    v49 = (uint64_t)v82;
    v50(v82, 1, 1, v20);
    goto LABEL_48;
  }
  v77 = v52;
  v53 = *(_QWORD *)(v52 + 16);
  v54 = v89;
  if (!v53)
  {
LABEL_43:
    v49 = (uint64_t)v82;
    v72 = (uint64_t)v82;
    v73 = 1;
    goto LABEL_47;
  }
  v55 = v77 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
  LODWORD(v87) = *MEMORY[0x24BE9F910];
  v56 = *(char **)(v21 + 16);
  v85 = *(_QWORD *)(v21 + 72);
  v86 = v56;
  v88 = v20;
  while (2)
  {
    v58 = (uint64_t)v7;
    ((void (*)(char *, unint64_t, uint64_t))v86)(v54, v55, v20);
    v59 = v92;
    sub_2460D4B6C();
    v60 = v90;
    v61 = v93;
    v62 = v94;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v90 + 104))(v93, v87, v94);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v60 + 56))(v61, 0, 1, v62);
    v63 = v39;
    v64 = *(int *)(v39 + 48);
    v65 = v91;
    v66 = v91 + v64;
    sub_2460B2C78(v59, v91);
    sub_2460B2C78(v61, v66);
    v67 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v60 + 48);
    if (v67(v65, 1, v62) != 1)
    {
      v7 = (char *)v58;
      sub_2460B2C78(v65, v58);
      if (v67(v66, 1, v62) == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v58, v62);
        v21 = v95;
        v20 = v88;
LABEL_35:
        sub_2460B2CC0(v91, &qword_257540710);
        sub_2460B2CC0(v93, &qword_257540718);
        sub_2460B2CC0(v92, &qword_257540718);
      }
      else
      {
        v68 = v90;
        v69 = v79;
        (*(void (**)(char *, uint64_t, uint64_t))(v90 + 32))(v79, v66, v94);
        sub_2460B2CFC();
        v70 = sub_2460D4ED8();
        v71 = *(void (**)(uint64_t, uint64_t))(v68 + 8);
        v71(v58, v94);
        v63 = v84;
        v71((uint64_t)v69, v94);
        sub_2460B2CC0(v65, &qword_257540718);
        sub_2460B2CC0(v93, &qword_257540718);
        sub_2460B2CC0(v92, &qword_257540718);
        v21 = v95;
        v20 = v88;
        if ((v70 & 1) != 0)
          goto LABEL_46;
      }
      v54 = v89;
      (*(void (**)(char *, uint64_t))(v21 + 8))(v89, v20);
      v55 += v85;
      --v53;
      v39 = v63;
      if (!v53)
        goto LABEL_43;
      continue;
    }
    break;
  }
  v57 = v67(v66, 1, v62);
  v21 = v95;
  v7 = (char *)v58;
  v20 = v88;
  if (v57 != 1)
    goto LABEL_35;
  sub_2460B2CC0(v91, &qword_257540718);
  sub_2460B2CC0(v93, &qword_257540718);
  sub_2460B2CC0(v92, &qword_257540718);
LABEL_46:
  v49 = (uint64_t)v82;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v82, v89, v20);
  v72 = v49;
  v73 = 0;
LABEL_47:
  v83((char *)v72, v73, 1, v20);
  swift_bridgeObjectRelease();
  v14 = v80;
  v17 = v81;
LABEL_48:
  sub_2460B2CC0((uint64_t)v14, &qword_257540720);
LABEL_49:
  sub_2460B2CC0((uint64_t)v17, &qword_257540720);
  v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
LABEL_50:
  if (v40((char *)v49, 1, v20) == 1)
  {
    sub_2460B2CC0(v49, &qword_257540720);
    return 0;
  }
  else
  {
    v75 = v78;
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 32))(v78, v49, v20);
    v74 = sub_2460D4B78();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v75, v20);
  }
  return v74;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24954F734]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2460B2C78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540718);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2460B2CC0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2460B2CFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257540728;
  if (!qword_257540728)
  {
    v1 = sub_2460D4B60();
    result = MEMORY[0x24954F74C](MEMORY[0x24BE9F938], v1);
    atomic_store(result, (unint64_t *)&qword_257540728);
  }
  return result;
}

uint64_t AudioUsoIntent.UsoNamespace.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2460B2D78 + 4 * byte_2460D5330[*v0]))(0xD000000000000012, 0x80000002460D69F0);
}

uint64_t sub_2460B2D78()
{
  return 0x616C50616964656DLL;
}

uint64_t sub_2460B2DCC(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_2460B2FA8()
{
  return 0x64695F6D657469;
}

unint64_t static AudioUsoIntent.pegasusAppBundle.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_2460B2FDC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 177);
  return result;
}

uint64_t sub_2460B301C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 178);
  return result;
}

uint64_t sub_2460B305C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v1 + 179);
  return result;
}

uint64_t sub_2460B309C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 184) = v2;
  swift_retain();
  return swift_release();
}

uint64_t sub_2460B30F8()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_2460B312C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 184) = a1;
  return swift_release();
}

uint64_t (*sub_2460B3170())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_2460B31AC()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 160) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_DWORD *)(v0 + 176) = 67244545;
  *(_OWORD *)(v0 + 184) = xmmword_2460D57E0;
  *(int64x2_t *)(v0 + 200) = vdupq_n_s64(1uLL);
  *(_OWORD *)(v0 + 216) = xmmword_2460D57F0;
  *(_WORD *)(v0 + 232) = 7710;
  *(_OWORD *)(v0 + 240) = xmmword_2460D57E0;
  *(_OWORD *)(v0 + 256) = 0u;
  *(_OWORD *)(v0 + 272) = 0u;
  *(_OWORD *)(v0 + 288) = 0u;
  *(_OWORD *)(v0 + 304) = 0u;
  *(_QWORD *)(v0 + 320) = 0;
  *(_BYTE *)(v0 + 328) = 3;
  *(_QWORD *)(v0 + 336) = 1;
  *(_OWORD *)(v0 + 344) = 0u;
  *(_OWORD *)(v0 + 360) = 0u;
  *(_OWORD *)(v0 + 376) = 0u;
  *(_QWORD *)(v0 + 392) = 1;
  *(_OWORD *)(v0 + 400) = xmmword_2460D57E0;
  *(_OWORD *)(v0 + 416) = 0u;
  *(_QWORD *)(v0 + 432) = 0;
  *(_QWORD *)(v0 + 440) = 1;
  *(_OWORD *)(v0 + 448) = xmmword_2460D57E0;
  *(_OWORD *)(v0 + 464) = 0u;
  *(_WORD *)(v0 + 480) = 2572;
  *(_QWORD *)(v0 + 488) = 0;
  *(_BYTE *)(v0 + 496) = 3;
  *(_QWORD *)(v0 + 520) = 0;
  *(_OWORD *)(v0 + 504) = 0u;
  *(_BYTE *)(v0 + 528) = 3;
  *(_QWORD *)(v0 + 536) = 0;
  *(_WORD *)(v0 + 544) = 256;
  *(_QWORD *)(v0 + 552) = 0;
  *(_BYTE *)(v0 + 560) = 2;
  *(_OWORD *)(v0 + 568) = 0u;
  return result;
}

uint64_t AudioUsoIntent.__allocating_init(task:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  AudioUsoIntent.init(task:)(a1);
  return v2;
}

uint64_t AudioUsoIntent.init(task:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::String v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;
  _BYTE v12[32];

  v2 = v1;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_DWORD *)(v2 + 176) = 67244545;
  *(_OWORD *)(v2 + 184) = xmmword_2460D57E0;
  *(int64x2_t *)(v2 + 200) = vdupq_n_s64(1uLL);
  *(_OWORD *)(v2 + 216) = xmmword_2460D57F0;
  *(_WORD *)(v2 + 232) = 7710;
  *(_OWORD *)(v2 + 240) = xmmword_2460D57E0;
  *(_OWORD *)(v2 + 256) = 0u;
  *(_OWORD *)(v2 + 272) = 0u;
  *(_OWORD *)(v2 + 288) = 0u;
  *(_OWORD *)(v2 + 304) = 0u;
  *(_QWORD *)(v2 + 320) = 0;
  *(_BYTE *)(v2 + 328) = 3;
  *(_QWORD *)(v2 + 336) = 1;
  *(_OWORD *)(v2 + 344) = 0u;
  *(_OWORD *)(v2 + 360) = 0u;
  *(_OWORD *)(v2 + 376) = 0u;
  *(_QWORD *)(v2 + 392) = 1;
  *(_OWORD *)(v2 + 400) = xmmword_2460D57E0;
  *(_OWORD *)(v2 + 416) = 0u;
  *(_QWORD *)(v2 + 432) = 0;
  *(_QWORD *)(v2 + 440) = 1;
  *(_OWORD *)(v2 + 448) = xmmword_2460D57E0;
  *(_OWORD *)(v2 + 464) = 0u;
  *(_WORD *)(v2 + 480) = 2572;
  *(_QWORD *)(v2 + 488) = 0;
  *(_BYTE *)(v2 + 496) = 3;
  *(_QWORD *)(v2 + 520) = 0;
  *(_OWORD *)(v2 + 504) = 0u;
  *(_BYTE *)(v2 + 528) = 3;
  *(_QWORD *)(v2 + 536) = 0;
  *(_WORD *)(v2 + 544) = 256;
  *(_QWORD *)(v2 + 552) = 0;
  *(_BYTE *)(v2 + 560) = 2;
  *(_OWORD *)(v2 + 568) = 0u;
  if (a1)
  {
    swift_beginAccess();
    *(_QWORD *)(v2 + 184) = a1;
    swift_retain_n();
    swift_release();
    v4._countAndFlagsBits = sub_2460D4E90();
    CommonAudio.Verb.init(rawValue:)(v4);
    swift_beginAccess();
    *(_BYTE *)(v2 + 177) = v12[0];
    sub_2460D4E9C();
    v5 = sub_2460D504C();
    swift_bridgeObjectRelease();
    if (v5 == 1)
      v6 = 1;
    else
      v6 = 2;
    if (v5)
      v7 = v6;
    else
      v7 = 0;
    swift_beginAccess();
    *(_BYTE *)(v2 + 178) = v7;
    swift_retain();
    sub_2460D4BFC();
    swift_release_n();
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4D1C();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 16) = v9;
LABEL_87:
        swift_release();
        return v2;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4C20();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 24) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4CD4();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 32) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4DA0();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 40) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4DB8();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 48) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4E84();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 56) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4DF4();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 64) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4E78();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 72) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4D7C();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 80) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4D70();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 88) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4D88();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 96) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4C14();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 120) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4D04();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 128) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4C08();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 136) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4DAC();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 144) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4CE0();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 152) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4E00();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 160) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4D94();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 168) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460C784C((uint64_t)v12, (uint64_t)v10, &qword_257540730);
    if (v11)
    {
      sub_2460D4D10();
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_2460B2CC0((uint64_t)v12, &qword_257540730);
        *(_QWORD *)(v2 + 104) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    sub_2460B3D58((uint64_t)v12, (uint64_t)v10);
    if (v11)
    {
      sub_2460D4C80();
      if ((swift_dynamicCast() & 1) != 0)
      {
        *(_QWORD *)(v2 + 112) = v9;
        goto LABEL_87;
      }
    }
    else
    {
      sub_2460B2CC0((uint64_t)v10, &qword_257540730);
    }
    *(_BYTE *)(v2 + 176) = 0;
  }
  return v2;
}

uint64_t sub_2460B3D58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540730);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t AudioUsoIntent.__allocating_init(userDialogAct:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  unint64_t result;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  unint64_t v26;
  uint64_t v27;
  _BYTE v28[32];

  v2 = sub_2460D4EB4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = &v28[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v28[-v7];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540738);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v28[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_2460D4B18();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = &v28[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2460C784C(a1, (uint64_t)v11, &qword_257540738);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_2460B2CC0((uint64_t)v11, &qword_257540738);
    type metadata accessor for AudioUsoIntent();
    v16 = swift_allocObject();
    sub_2460B31AC();
    if (qword_2575406D8 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v2, (uint64_t)qword_257542C08);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v8, v17, v2);
    v18 = sub_2460D4EA8();
    v19 = sub_2460D4F5C();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_2460B0000, v18, v19, "AudioUsoIntent#init received nil userDialogAct", v20, 2u);
      MEMORY[0x24954F7D0](v20, -1, -1);
    }

    sub_2460B2CC0(a1, &qword_257540738);
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v8, v2);
    return v16;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v13 + 32))(v15, v11, v12);
  if ((sub_2460D4AF4() & 1) != 0)
  {
    sub_2460B2CC0(a1, &qword_257540738);
    (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
    type metadata accessor for AudioUsoIntent();
    v16 = swift_allocObject();
    sub_2460B31AC();
    swift_beginAccess();
    *(_BYTE *)(v16 + 179) = 0;
    if ((*(_BYTE *)(v16 + 176) & 1) != 0)
      return v16;
    goto LABEL_29;
  }
  if ((sub_2460D4B00() & 1) != 0)
  {
    sub_2460B2CC0(a1, &qword_257540738);
    (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
    type metadata accessor for AudioUsoIntent();
    v16 = swift_allocObject();
    sub_2460B31AC();
    swift_beginAccess();
    *(_BYTE *)(v16 + 179) = 1;
    if ((*(_BYTE *)(v16 + 176) & 1) != 0)
      return v16;
    goto LABEL_29;
  }
  if ((sub_2460D4B0C() & 1) != 0)
  {
    sub_2460B2CC0(a1, &qword_257540738);
    (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
    type metadata accessor for AudioUsoIntent();
    v16 = swift_allocObject();
    sub_2460B31AC();
    swift_beginAccess();
    *(_BYTE *)(v16 + 179) = 2;
    if ((*(_BYTE *)(v16 + 176) & 1) != 0)
      return v16;
LABEL_29:
    swift_release();
    return 0;
  }
  if ((sub_2460D4AE8() & 1) == 0)
  {
    if (qword_2575406D8 != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v2, (uint64_t)qword_257542C08);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v6, v22, v2);
    v23 = sub_2460D4EA8();
    v24 = sub_2460D4F5C();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_2460B0000, v23, v24, "AudioUsoIntent#init unexpected userDialogAct", v25, 2u);
      MEMORY[0x24954F7D0](v25, -1, -1);
    }

    sub_2460B2CC0(a1, &qword_257540738);
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
    (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
    return 0;
  }
  result = sub_2460D4B24();
  v26 = result;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    v27 = sub_2460D5028();
    result = swift_bridgeObjectRelease();
    if (!v27)
    {
LABEL_28:
      swift_bridgeObjectRelease();
      type metadata accessor for AudioUsoIntent();
      v16 = swift_allocObject();
      AudioUsoIntent.init(task:)(v27);
      sub_2460B2CC0(a1, &qword_257540738);
      (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
      if ((*(_BYTE *)(v16 + 176) & 1) != 0)
        return v16;
      goto LABEL_29;
    }
  }
  else
  {
    v27 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v27)
      goto LABEL_28;
  }
  if ((v26 & 0xC000000000000001) != 0)
  {
    v27 = MEMORY[0x24954F500](0, v26);
    goto LABEL_28;
  }
  if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v27 = *(_QWORD *)(v26 + 32);
    swift_retain();
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AudioUsoIntent()
{
  return objc_opt_self();
}

uint64_t sub_2460B4360()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[24];
  v2 = v1;
  if (v1 == 1)
  {
    v2 = sub_2460B43BC(v0);
    v3 = v0[24];
    v0[24] = v2;
    swift_retain();
    sub_2460C62E0(v3);
  }
  sub_2460C7790(v1);
  return v2;
}

uint64_t sub_2460B43BC(_QWORD *a1)
{
  uint64_t v2;

  if (a1[2])
    goto LABEL_2;
  if (!a1[3] && !a1[4])
  {
    if (!a1[5] && !a1[6] && !a1[7])
    {
      if (a1[8] || a1[9] || a1[10])
        goto LABEL_16;
      if (!a1[11])
      {
        if (a1[12])
          goto LABEL_16;
        if (a1[15])
          return 0;
        if (a1[16] || a1[18])
        {
LABEL_16:
          swift_retain();
          sub_2460D4B3C();
          goto LABEL_3;
        }
        if (!a1[20] && !a1[21])
          return 0;
      }
    }
LABEL_2:
    swift_retain();
    sub_2460D4E18();
LABEL_3:
    swift_release();
    return v2;
  }
  return 0;
}

uint64_t sub_2460B44D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[25];
  v2 = v1;
  if (v1 == 1)
  {
    v2 = sub_2460B4530(v0);
    v3 = v0[25];
    v0[25] = v2;
    swift_retain();
    sub_2460C62E0(v3);
  }
  sub_2460C7790(v1);
  return v2;
}

uint64_t sub_2460B4530(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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

  if (!a1[2])
    goto LABEL_8;
  swift_retain();
  v1 = sub_2460D4E60();
  a1 = (_QWORD *)swift_release();
  if (!v1)
    return 0;
  v2 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v1 >> 62)
    goto LABEL_49;
  if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_67;
LABEL_5:
  if ((v1 & 0xC000000000000001) != 0)
  {
LABEL_88:
    MEMORY[0x24954F500](0, v1);
    goto LABEL_29;
  }
  if (*(_QWORD *)(v2 + 16))
    goto LABEL_28;
  __break(1u);
LABEL_8:
  if (!a1[3])
    goto LABEL_15;
  swift_retain();
  v1 = sub_2460D4E60();
  a1 = (_QWORD *)swift_release();
  if (!v1)
    return 0;
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_12;
LABEL_67:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v7 = sub_2460D5028();
  a1 = (_QWORD *)swift_bridgeObjectRelease();
  if (!v7)
    goto LABEL_67;
LABEL_12:
  if ((v1 & 0xC000000000000001) != 0)
    goto LABEL_88;
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_28;
  __break(1u);
LABEL_15:
  if (a1[4])
  {
    swift_retain();
    v1 = sub_2460D4E60();
    a1 = (_QWORD *)swift_release();
    if (v1)
    {
      v3 = v1 & 0xFFFFFFFFFFFFFF8;
      if (v1 >> 62)
        goto LABEL_64;
      if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_19;
      goto LABEL_67;
    }
    return 0;
  }
  while (1)
  {
    if (a1[5])
    {
      swift_retain();
      v1 = sub_2460D4E60();
      swift_release();
      if (!v1)
        return 0;
      v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (v1 >> 62)
      {
        swift_bridgeObjectRetain();
        v9 = sub_2460D5028();
        swift_bridgeObjectRelease();
        if (!v9)
          goto LABEL_67;
      }
      else if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_67;
      }
      if ((v1 & 0xC000000000000001) != 0)
        goto LABEL_88;
      if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_28;
      __break(1u);
LABEL_70:
      swift_bridgeObjectRetain();
      v10 = sub_2460D5028();
      a1 = (_QWORD *)swift_bridgeObjectRelease();
      if (!v10)
        goto LABEL_67;
      goto LABEL_36;
    }
    if (a1[6])
      return 0;
    if (!a1[7])
      goto LABEL_39;
    swift_retain();
    v1 = sub_2460D4E60();
    a1 = (_QWORD *)swift_release();
    if (!v1)
      return 0;
    v4 = v1 & 0xFFFFFFFFFFFFFF8;
    if (v1 >> 62)
      goto LABEL_70;
    if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_67;
LABEL_36:
    if ((v1 & 0xC000000000000001) != 0)
      goto LABEL_88;
    if (*(_QWORD *)(v4 + 16))
      goto LABEL_28;
    __break(1u);
LABEL_39:
    if (a1[8] || a1[9] || a1[10])
      return 0;
    if (a1[11])
    {
      swift_retain();
      v1 = sub_2460D4E60();
      swift_release();
      if (!v1)
        return 0;
      v2 = v1 & 0xFFFFFFFFFFFFFF8;
      if (v1 >> 62)
      {
        swift_bridgeObjectRetain();
        v11 = sub_2460D5028();
        swift_bridgeObjectRelease();
        if (!v11)
          goto LABEL_67;
      }
      else if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_67;
      }
      if ((v1 & 0xC000000000000001) != 0)
        goto LABEL_88;
      if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_28;
      __break(1u);
LABEL_49:
      swift_bridgeObjectRetain();
      v6 = sub_2460D5028();
      a1 = (_QWORD *)swift_bridgeObjectRelease();
      if (v6)
        goto LABEL_5;
      goto LABEL_67;
    }
    if (a1[12] || a1[15] || a1[16] || a1[18])
      return 0;
    if (!a1[20])
      break;
    swift_retain();
    v1 = sub_2460D4E60();
    swift_release();
    if (!v1)
      return 0;
    v3 = v1 & 0xFFFFFFFFFFFFFF8;
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      v12 = sub_2460D5028();
      swift_bridgeObjectRelease();
      if (!v12)
        goto LABEL_67;
    }
    else if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_67;
    }
    if ((v1 & 0xC000000000000001) != 0)
      goto LABEL_88;
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_28;
    __break(1u);
LABEL_64:
    swift_bridgeObjectRetain();
    v8 = sub_2460D5028();
    a1 = (_QWORD *)swift_bridgeObjectRelease();
    if (!v8)
      goto LABEL_67;
LABEL_19:
    if ((v1 & 0xC000000000000001) != 0)
      goto LABEL_88;
    if (*(_QWORD *)(v3 + 16))
      goto LABEL_28;
    __break(1u);
  }
  if (a1[21])
  {
    swift_retain();
    v1 = sub_2460D4E60();
    a1 = (_QWORD *)swift_release();
    if (!v1)
      return 0;
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      v13 = sub_2460D5028();
      a1 = (_QWORD *)swift_bridgeObjectRelease();
      if (!v13)
        goto LABEL_67;
    }
    else if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_67;
    }
    if ((v1 & 0xC000000000000001) != 0)
      goto LABEL_88;
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_28;
    __break(1u);
  }
  if (a1[13])
  {
    swift_retain();
    sub_2460D4B3C();
    goto LABEL_30;
  }
  if (!a1[14])
    return 0;
  swift_retain();
  v1 = sub_2460D4E60();
  swift_release();
  if (!v1)
    return 0;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_2460D5028();
    swift_bridgeObjectRelease();
    if (!v14)
      goto LABEL_67;
  }
  else if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_67;
  }
  if ((v1 & 0xC000000000000001) != 0)
    goto LABEL_88;
  if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_88;
  }
LABEL_28:
  swift_retain();
LABEL_29:
  swift_bridgeObjectRelease();
  sub_2460D4B9C();
LABEL_30:
  swift_release();
  return v15;
}

uint64_t sub_2460B4A34()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[26];
  v2 = v1;
  if (v1 == 1)
  {
    v2 = sub_2460B4A90(v0);
    v3 = v0[26];
    v0[26] = v2;
    swift_bridgeObjectRetain();
    sub_2460C62F0(v3);
  }
  sub_2460C7780(v1);
  return v2;
}

uint64_t sub_2460B4A90(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1[2] || a1[3] || a1[4] || a1[5])
    goto LABEL_5;
  if (a1[6])
  {
LABEL_9:
    swift_retain();
    v1 = sub_2460D4B30();
    goto LABEL_6;
  }
  if (!a1[7])
  {
    if (a1[8] || a1[9] || a1[10])
      goto LABEL_9;
    if (!a1[11])
    {
      if (a1[12] || a1[15] || a1[16] || a1[18])
        goto LABEL_9;
      if (!a1[20] && !a1[21])
      {
        if (!a1[13])
        {
          if (!a1[14])
            return 0;
          goto LABEL_5;
        }
        goto LABEL_9;
      }
    }
  }
LABEL_5:
  swift_retain();
  v1 = sub_2460D4E54();
LABEL_6:
  v2 = v1;
  swift_release();
  return v2;
}

uint64_t sub_2460B4B9C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[27];
  v2 = v1;
  if (v1 == 1)
  {
    v2 = sub_2460B4BF8(v0);
    v3 = v0[27];
    v0[27] = v2;
    swift_retain();
    sub_2460C62E0(v3);
  }
  sub_2460C7790(v1);
  return v2;
}

uint64_t sub_2460B4BF8(_QWORD *a1)
{
  uint64_t v2;

  if (a1[2] || a1[3] || a1[4] || !a1[6])
    return 0;
  swift_retain();
  sub_2460D4B3C();
  swift_release();
  return v2;
}

uint64_t sub_2460B4C5C()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 224))
  {
    v1 = *(_QWORD *)(v0 + 224);
  }
  else
  {
    v1 = sub_2460B4CB8();
    *(_QWORD *)(v0 + 224) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460B4CB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x24BEE4AF8];
  if (sub_2460B4360())
  {
    v0 = swift_retain();
    MEMORY[0x24954F44C](v0);
    if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2460D4F38();
    sub_2460D4F44();
    sub_2460D4F2C();
    swift_release();
  }
  if (sub_2460B4B9C())
  {
    v1 = swift_retain();
    MEMORY[0x24954F44C](v1);
    if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2460D4F38();
    sub_2460D4F44();
    sub_2460D4F2C();
    swift_release();
  }
  return v3;
}

uint64_t sub_2460B4DCC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v3;
  uint64_t result;
  char v5;

  v3 = *(unsigned __int8 *)(v1 + 232);
  if (v3 == 30)
  {
    result = sub_2460B4E14(&v5);
    LOBYTE(v3) = v5;
    *(_BYTE *)(v1 + 232) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_2460B4E14@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v12 - v6;
  if (sub_2460B4360())
  {
    if (sub_2460D4C38())
    {
      sub_2460D4CA4();
      swift_release();
    }
    else
    {
      v9 = sub_2460D4D34();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
    }
    static CommonAudio.MediaType.from(_:)((uint64_t)v7, a1);
    swift_release();
    v10 = (uint64_t)v7;
  }
  else
  {
    result = sub_2460B4B9C();
    if (!result)
    {
      *a1 = 29;
      return result;
    }
    if (sub_2460D4C38())
    {
      sub_2460D4CA4();
      swift_release();
    }
    else
    {
      v11 = sub_2460D4D34();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v5, 1, 1, v11);
    }
    static CommonAudio.MediaType.from(_:)((uint64_t)v5, a1);
    swift_release();
    v10 = (uint64_t)v5;
  }
  return sub_2460B2CC0(v10, &qword_257540740);
}

uint64_t sub_2460B4F90@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  result = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(unsigned __int8 *)(v1 + 233);
  if (v7 == 30)
  {
    result = sub_2460B4B9C();
    if (result)
    {
      if (sub_2460D4C38())
      {
        sub_2460D4CA4();
        swift_release();
      }
      else
      {
        v8 = sub_2460D4D34();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
      }
      static CommonAudio.MediaType.from(_:)((uint64_t)v6, &v10);
      swift_release();
      result = sub_2460B2CC0((uint64_t)v6, &qword_257540740);
      LOBYTE(v7) = v10;
    }
    else
    {
      LOBYTE(v7) = 29;
    }
    *(_BYTE *)(v1 + 233) = v7;
  }
  *a1 = v7;
  return result;
}

uint64_t sub_2460B5098()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 240))
  {
    v1 = *(_QWORD *)(v0 + 240);
  }
  else
  {
    v1 = sub_2460B50F4();
    *(_QWORD *)(v0 + 240) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460B50F4()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v0 = sub_2460B4C5C();
  v1 = sub_2460CCB08(v0, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460B5298, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v4, v1);
      else
        swift_retain();
      v7 = sub_2460D4C5C();
      v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_2460CBD64(0, v5[2] + 1, 1, v5);
        v11 = v5[2];
        v10 = v5[3];
        if (v11 >= v10 >> 1)
          v5 = sub_2460CBD64((_QWORD *)(v10 > 1), v11 + 1, 1, v5);
        v5[2] = v11 + 1;
        v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460B5298()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t result;

  v0 = sub_2460D4C5C();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    swift_bridgeObjectRelease();
    v4 = HIBYTE(v3) & 0xF;
    if ((v3 & 0x2000000000000000) == 0)
      v4 = v2 & 0xFFFFFFFFFFFFLL;
    v5 = v4 != 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(sub_2460D4B48() + 16);
  swift_bridgeObjectRelease();
  result = 0;
  if (v5 && !v6)
  {
    if (sub_2460D4C38())
    {
      swift_release();
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_2460B5324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 248);
  v2 = v1;
  if (v1 == 1)
  {
    v2 = sub_2460B5380();
    v3 = *(_QWORD *)(v0 + 248);
    *(_QWORD *)(v0 + 248) = v2;
    swift_retain();
    sub_2460C62E0(v3);
  }
  sub_2460C7790(v1);
  return v2;
}

uint64_t sub_2460B5380()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = sub_2460B4C5C();
  v1 = v0;
  if (v0 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    v2 = sub_2460D5028();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      v3 = 4;
      v4 = MEMORY[0x24BEE4AF8];
      do
      {
        v5 = v3 - 4;
        if ((v1 & 0xC000000000000001) != 0)
        {
          v6 = MEMORY[0x24954F500](v3 - 4, v1);
          v7 = v3 - 3;
          if (__OFADD__(v5, 1))
            goto LABEL_13;
        }
        else
        {
          v6 = *(_QWORD *)(v1 + 8 * v3);
          swift_retain();
          v7 = v3 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        v8 = sub_2460C9F24(v4, v6);
        swift_release();
        if (v8)
          goto LABEL_12;
        ++v3;
      }
      while (v7 != v2);
    }
  }
  v8 = 0;
LABEL_12:
  swift_bridgeObjectRelease_n();
  return v8;
}

uint64_t sub_2460B5488()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  if (*(_QWORD *)(v0 + 256))
  {
    v1 = *(_QWORD *)(v0 + 256);
  }
  else
  {
    v2 = sub_2460B4C5C();
    v1 = sub_2460CCB08(v2, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460B5514, 0);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 256) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_2460B5514()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  _BOOL4 v30;

  v0 = sub_2460D4B90();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v29 - v5;
  v7 = sub_2460D4C5C();
  if (v8)
  {
    v9 = v7;
    v10 = v8;
    swift_bridgeObjectRelease();
    v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0)
      v11 = v9 & 0xFFFFFFFFFFFFLL;
    v12 = v11 == 0;
  }
  else
  {
    v12 = 1;
  }
  v13 = sub_2460D4B48();
  v14 = *(_QWORD *)(v13 + 16);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v30 = v12;
  v15 = v13 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  v16 = *(_QWORD *)(v1 + 72);
  v17 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  v29 = v13;
  swift_bridgeObjectRetain();
  while (1)
  {
    v17(v6, v15, v0);
    v20 = sub_2460D4B84();
    if (!v21)
    {
      v17(v4, (unint64_t)v6, v0);
LABEL_21:
      v26 = *(void (**)(char *, uint64_t))(v1 + 8);
      v26(v4, v0);
      v26(v6, v0);
      goto LABEL_9;
    }
    if (v20 == 1701605234 && v21 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
      v17(v4, (unint64_t)v6, v0);
    }
    else
    {
      v22 = sub_2460D5058();
      swift_bridgeObjectRelease();
      v17(v4, (unint64_t)v6, v0);
      if ((v22 & 1) == 0)
        goto LABEL_21;
    }
    v23 = sub_2460D4B78();
    v25 = v24;
    if (qword_257540690 != -1)
      swift_once();
    if (v23 == qword_2575411C8 && v25 == unk_2575411D0)
      break;
    v18 = sub_2460D5058();
    swift_bridgeObjectRelease();
    v19 = *(void (**)(char *, uint64_t))(v1 + 8);
    v19(v4, v0);
    v19(v6, v0);
    if ((v18 & 1) != 0)
      goto LABEL_24;
LABEL_9:
    v15 += v16;
    if (!--v14)
    {
      swift_bridgeObjectRelease_n();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  v27 = *(void (**)(char *, uint64_t))(v1 + 8);
  v27(v4, v0);
  v27(v6, v0);
LABEL_24:
  swift_bridgeObjectRelease_n();
  return !v30;
}

uint64_t sub_2460B57DC()
{
  _QWORD *v0;
  uint64_t v1;

  if (v0[33])
  {
    v1 = v0[33];
  }
  else
  {
    v1 = sub_2460B5838(v0);
    v0[33] = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460B5838(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1[15])
  {
    swift_retain();
    sub_2460D4B3C();
    swift_release();
    v2 = v12;
    if (v12)
      goto LABEL_20;
  }
  if (a1[5])
  {
    swift_retain();
    sub_2460D4E18();
    swift_release();
    if (v12)
    {
      v2 = sub_2460D4BC0();
      swift_release();
      if (v2)
        goto LABEL_20;
    }
  }
  if (a1[4])
  {
    swift_retain();
    sub_2460D4E18();
    swift_release();
    if (v12)
    {
      v2 = sub_2460D4BC0();
      swift_release();
      if (v2)
        goto LABEL_20;
    }
  }
  if (a1[13])
  {
    swift_retain();
    sub_2460D4B3C();
    swift_release();
    if (v12)
    {
      v2 = sub_2460D4BC0();
      swift_release();
      if (v2)
        goto LABEL_20;
    }
  }
  if (a1[14])
  {
    swift_retain();
    sub_2460D4E18();
    swift_release();
    if (v12)
    {
      v2 = sub_2460D4BC0();
      swift_release();
      if (v2)
        goto LABEL_20;
    }
  }
  if (sub_2460B4B9C() && (v2 = sub_2460D4BC0(), swift_release(), v2)
    || a1[20] && (swift_retain(), sub_2460D4E18(), swift_release(), v12) && (v2 = sub_2460D4BC0(), swift_release(), v2))
  {
LABEL_20:
    __swift_instantiateConcreteTypeFromMangledName(&qword_257541120);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_2460D5800;
    *(_QWORD *)(v3 + 32) = v2;
    v13 = v3;
    sub_2460D4F2C();
    return v13;
  }
  v6 = sub_2460B4C5C();
  v7 = v6;
  v14 = MEMORY[0x24BEE4AF8];
  if (!(v6 >> 62))
  {
    v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_24;
LABEL_36:
    swift_bridgeObjectRelease();
    v4 = MEMORY[0x24BEE4AF8];
LABEL_37:
    swift_bridgeObjectRelease();
    return v4;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v8 = result;
  if (!result)
    goto LABEL_36;
LABEL_24:
  if (v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
    {
      if ((v7 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](i, v7);
      else
        swift_retain();
      v10 = sub_2460D4BC0();
      v11 = swift_release();
      if (v10)
      {
        MEMORY[0x24954F44C](v11);
        if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2460D4F38();
        sub_2460D4F44();
        sub_2460D4F2C();
      }
    }
    swift_bridgeObjectRelease();
    v4 = v14;
    goto LABEL_37;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460B5B74()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 272))
  {
    v1 = *(_QWORD *)(v0 + 272);
  }
  else
  {
    v1 = sub_2460B5BD0();
    *(_QWORD *)(v0 + 272) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460B5BD0()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v0 = sub_2460B4C5C();
  v1 = sub_2460CCB08(v0, MEMORY[0x24BEE4AF8], sub_2460B5D74, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v4, v1);
      else
        swift_retain();
      v7 = sub_2460D4C5C();
      v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_2460CBD64(0, v5[2] + 1, 1, v5);
        v11 = v5[2];
        v10 = v5[3];
        if (v11 >= v10 >> 1)
          v5 = sub_2460CBD64((_QWORD *)(v10 > 1), v11 + 1, 1, v5);
        v5[2] = v11 + 1;
        v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460B5D74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(char *, unint64_t, uint64_t);
  char v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  unsigned int (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  char v48;
  void (*v49)(uint64_t, uint64_t);
  _QWORD v51[2];
  _BOOL4 v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;

  v2 = sub_2460D4D34();
  v59 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v51[0] = (char *)v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v56);
  v5 = (char *)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v57 = (char *)v51 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v58 = (char *)v51 - v12;
  v13 = sub_2460D4B90();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v51 - v18;
  v61 = a1;
  v20 = sub_2460D4C5C();
  v53 = v9;
  if (v21)
  {
    v22 = v20;
    v23 = v21;
    swift_bridgeObjectRelease();
    v24 = HIBYTE(v23) & 0xF;
    if ((v23 & 0x2000000000000000) == 0)
      v24 = v22 & 0xFFFFFFFFFFFFLL;
    v25 = v24 == 0;
  }
  else
  {
    v25 = 1;
  }
  v26 = sub_2460D4B48();
  v27 = *(_QWORD *)(v26 + 16);
  if (!v27)
  {
    swift_bridgeObjectRelease();
LABEL_23:
    v39 = (uint64_t)v58;
    v38 = v59;
    v40 = (uint64_t)v57;
    if (!v25)
    {
      v41 = 1;
      goto LABEL_30;
    }
    return 0;
  }
  v52 = v25;
  v54 = v5;
  v55 = v2;
  v28 = v26 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  v65 = *(_QWORD *)(v14 + 72);
  v29 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
  v51[1] = v26;
  swift_bridgeObjectRetain();
  v63 = "appAudiobookTitleId";
  v60 = 0x80000002460D6BC0;
  v64 = "appMusicArtistNameId";
  v62 = 0x80000002460D6C00;
  while (1)
  {
    v29(v19, v28, v13);
    v32 = sub_2460D4B84();
    if (!v33)
    {
      v29(v17, (unint64_t)v19, v13);
      goto LABEL_16;
    }
    if (v32 == 0xD000000000000012 && v33 == v62)
      break;
    v34 = sub_2460D5058();
    swift_bridgeObjectRelease();
    v29(v17, (unint64_t)v19, v13);
    if ((v34 & 1) != 0)
      goto LABEL_26;
LABEL_16:
    v35 = sub_2460D4B84();
    if (v36)
    {
      if (v35 == 0xD000000000000012 && v36 == v60)
      {
        v43 = *(void (**)(char *, uint64_t))(v14 + 8);
        v43(v17, v13);
        swift_bridgeObjectRelease();
        v43(v19, v13);
        goto LABEL_28;
      }
      v30 = sub_2460D5058();
      v31 = *(void (**)(char *, uint64_t))(v14 + 8);
      v31(v17, v13);
      swift_bridgeObjectRelease();
      v31(v19, v13);
      if ((v30 & 1) != 0)
        goto LABEL_28;
    }
    else
    {
      v37 = *(void (**)(char *, uint64_t))(v14 + 8);
      v37(v17, v13);
      v37(v19, v13);
    }
    v28 += v65;
    if (!--v27)
    {
      swift_bridgeObjectRelease_n();
      v5 = v54;
      v2 = v55;
      LOBYTE(v25) = v52;
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease();
  v29(v17, (unint64_t)v19, v13);
LABEL_26:
  v42 = *(void (**)(char *, uint64_t))(v14 + 8);
  v42(v17, v13);
  v42(v19, v13);
LABEL_28:
  swift_bridgeObjectRelease_n();
  v5 = v54;
  v2 = v55;
  v39 = (uint64_t)v58;
  v38 = v59;
  v40 = (uint64_t)v57;
  if (v52)
    return 0;
  v41 = 0;
LABEL_30:
  if (sub_2460D4C38())
  {
    sub_2460D4CA4();
    swift_release();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56))(v39, 1, 1, v2);
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v38 + 104))(v40, *MEMORY[0x24BEA16B0], v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v38 + 56))(v40, 0, 1, v2);
  v44 = (uint64_t)&v5[*(int *)(v56 + 48)];
  sub_2460C784C(v39, (uint64_t)v5, &qword_257540740);
  sub_2460C784C(v40, v44, &qword_257540740);
  v45 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48);
  if (v45((uint64_t)v5, 1, v2) != 1)
  {
    v46 = (uint64_t)v53;
    sub_2460C784C((uint64_t)v5, (uint64_t)v53, &qword_257540740);
    if (v45(v44, 1, v2) == 1)
    {
      sub_2460B2CC0(v40, &qword_257540740);
      sub_2460B2CC0(v39, &qword_257540740);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v46, v2);
      goto LABEL_38;
    }
    v47 = v51[0];
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v38 + 32))(v51[0], v44, v2);
    sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
    v48 = sub_2460D4ED8();
    v49 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    v49(v47, v2);
    sub_2460B2CC0(v40, &qword_257540740);
    sub_2460B2CC0(v39, &qword_257540740);
    v49(v46, v2);
    sub_2460B2CC0((uint64_t)v5, &qword_257540740);
    if ((v48 & 1) != 0)
      return v41;
    return 0;
  }
  sub_2460B2CC0(v40, &qword_257540740);
  sub_2460B2CC0(v39, &qword_257540740);
  if (v45(v44, 1, v2) != 1)
  {
LABEL_38:
    sub_2460B2CC0((uint64_t)v5, &qword_257541100);
    return 0;
  }
  sub_2460B2CC0((uint64_t)v5, &qword_257540740);
  return v41;
}

uint64_t sub_2460B63A4()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 280))
  {
    v1 = *(_QWORD *)(v0 + 280);
  }
  else
  {
    v1 = sub_2460B6400();
    *(_QWORD *)(v0 + 280) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460B6400()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v0 = sub_2460B4C5C();
  v1 = sub_2460CCB08(v0, MEMORY[0x24BEE4AF8], sub_2460B65A4, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v4, v1);
      else
        swift_retain();
      v7 = sub_2460D4C5C();
      v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_2460CBD64(0, v5[2] + 1, 1, v5);
        v11 = v5[2];
        v10 = v5[3];
        if (v11 >= v10 >> 1)
          v5 = sub_2460CBD64((_QWORD *)(v10 > 1), v11 + 1, 1, v5);
        v5[2] = v11 + 1;
        v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460B65A4(uint64_t a1)
{
  return sub_2460BB6C4(a1, MEMORY[0x24BEA1688]);
}

_QWORD *sub_2460B65B0()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_QWORD *)(v0 + 288))
  {
    v1 = *(_QWORD **)(v0 + 288);
  }
  else
  {
    v1 = sub_2460B660C();
    *(_QWORD *)(v0 + 288) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *sub_2460B660C()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void (*v44)(char *, unint64_t, uint64_t);
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v60;
  unint64_t v61;
  _QWORD *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  void (*v72)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  unint64_t v78;
  unint64_t v79;
  const char *v80;
  char *v81;

  v0 = sub_2460D4B90();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v67 = (char *)&v60 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v60 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540720);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v60 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v66 = (char *)&v60 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v60 - v18;
  v20 = sub_2460B4C5C();
  v21 = sub_2460CCB08(v20, MEMORY[0x24BEE4AF8], sub_2460B6D3C, 0);
  swift_bridgeObjectRelease();
  v68 = v21;
  if (v21 >> 62)
  {
LABEL_51:
    swift_bridgeObjectRetain();
    v21 = v68;
    v23 = sub_2460D5028();
    if (v23)
      goto LABEL_3;
  }
  else
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v23 = v22;
    if (v22)
    {
LABEL_3:
      v24 = 0;
      v65 = v21 & 0xC000000000000001;
      v61 = v21 + 32;
      v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v63 = v12;
      v81 = "ce_source";
      v79 = 0x80000002460D6B30;
      v80 = "appPlaylistTitle";
      v78 = 0x80000002460D6B50;
      v70 = v15;
      v71 = v19;
      v64 = v23;
      while (1)
      {
        if (v65)
        {
          v12 = (char *)MEMORY[0x24954F500](v24, v21);
          v26 = __OFADD__(v24, 1);
          v27 = v24 + 1;
          if (v26)
            goto LABEL_50;
        }
        else
        {
          v12 = *(char **)(v61 + 8 * v24);
          swift_retain();
          v26 = __OFADD__(v24, 1);
          v27 = v24 + 1;
          if (v26)
          {
LABEL_50:
            __break(1u);
            goto LABEL_51;
          }
        }
        v74 = v27;
        v28 = sub_2460D4B48();
        v29 = *(_QWORD *)(v28 + 16);
        v76 = v28;
        v77 = v12;
        if (!v29)
        {
LABEL_22:
          v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
          v72(v19, 1, 1, v0);
          v36 = (uint64_t)v66;
          v24 = v74;
          goto LABEL_24;
        }
        v30 = v28 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
        swift_bridgeObjectRetain();
        v31 = *(_QWORD *)(v1 + 72);
        v32 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
        v32(v8, v30, v0);
        while (1)
        {
          v34 = sub_2460D4B84();
          if (!v35)
            goto LABEL_15;
          if (v34 == 0xD000000000000012 && v35 == v78)
            break;
          v33 = sub_2460D5058();
          swift_bridgeObjectRelease();
          if ((v33 & 1) != 0)
            goto LABEL_23;
LABEL_15:
          (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
          v30 += v31;
          if (!--v29)
          {
            swift_bridgeObjectRelease();
            v15 = v70;
            v19 = v71;
            goto LABEL_22;
          }
          v32(v8, v30, v0);
        }
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();
        v19 = v71;
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v71, v8, v0);
        v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
        v72(v19, 0, 1, v0);
        v15 = v70;
        v36 = (uint64_t)v66;
        v24 = v74;
LABEL_24:
        swift_bridgeObjectRelease();
        sub_2460C784C((uint64_t)v19, v36, &qword_257540720);
        v73 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
        if (v73(v36, 1, v0) == 1)
        {
          v69 = 0;
          v76 = 0;
        }
        else
        {
          v37 = v36;
          v38 = v67;
          (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v67, v37, v0);
          v69 = sub_2460D4B78();
          v76 = v39;
          (*(void (**)(char *, uint64_t))(v1 + 8))(v38, v0);
        }
        sub_2460B2CC0((uint64_t)v19, &qword_257540720);
        v40 = sub_2460D4B48();
        v41 = *(_QWORD *)(v40 + 16);
        v75 = v40;
        if (!v41)
        {
          v48 = 1;
          v49 = (uint64_t)v63;
          v19 = v71;
          goto LABEL_40;
        }
        v42 = v40 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
        swift_bridgeObjectRetain();
        v43 = *(_QWORD *)(v1 + 72);
        v44 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
        v44(v4, v42, v0);
        while (2)
        {
          v46 = sub_2460D4B84();
          if (!v47)
            goto LABEL_30;
          if (v46 != 0xD000000000000010 || v47 != v79)
          {
            v45 = sub_2460D5058();
            swift_bridgeObjectRelease();
            if ((v45 & 1) != 0)
              goto LABEL_38;
LABEL_30:
            (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
            v42 += v43;
            if (!--v41)
            {
              swift_bridgeObjectRelease();
              v48 = 1;
              v49 = (uint64_t)v63;
              v15 = v70;
              goto LABEL_39;
            }
            v44(v4, v42, v0);
            continue;
          }
          break;
        }
        swift_bridgeObjectRelease();
LABEL_38:
        swift_bridgeObjectRelease();
        v15 = v70;
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v70, v4, v0);
        v48 = 0;
        v49 = (uint64_t)v63;
LABEL_39:
        v19 = v71;
        v24 = v74;
LABEL_40:
        v72(v15, v48, 1, v0);
        swift_bridgeObjectRelease();
        sub_2460C784C((uint64_t)v15, v49, &qword_257540720);
        if (v73(v49, 1, v0) == 1)
        {
          sub_2460B2CC0((uint64_t)v15, &qword_257540720);
LABEL_5:
          swift_release();
          swift_bridgeObjectRelease();
          v21 = v68;
          v25 = v64;
          goto LABEL_6;
        }
        v50 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v67, v49, v0);
        v51 = sub_2460D4B78();
        v53 = v52;
        (*(void (**)(char *, uint64_t))(v1 + 8))(v50, v0);
        sub_2460B2CC0((uint64_t)v15, &qword_257540720);
        if (!v76 || !v53)
          goto LABEL_5;
        swift_release();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v62 = sub_2460CBE70(0, v62[2] + 1, 1, v62);
        v55 = v62[2];
        v54 = v62[3];
        v25 = v64;
        if (v55 >= v54 >> 1)
        {
          v62 = sub_2460CBE70((_QWORD *)(v54 > 1), v55 + 1, 1, v62);
          v25 = v64;
        }
        v56 = v62;
        v62[2] = v55 + 1;
        v57 = &v56[4 * v55];
        v57[4] = v51;
        v57[5] = v53;
        v15 = v70;
        v58 = v76;
        v57[6] = v69;
        v57[7] = v58;
        v21 = v68;
LABEL_6:
        if (v24 == v25)
          goto LABEL_53;
      }
    }
  }
  v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_53:
  swift_bridgeObjectRelease_n();
  return v62;
}

uint64_t sub_2460B6D3C(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  char v38;
  void (*v39)(uint64_t, uint64_t);
  _QWORD v41[2];
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL4 v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;

  v2 = sub_2460D4D34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v41[0] = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v46);
  v6 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v50 = (uint64_t)v41 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v49 = (char *)v41 - v13;
  v14 = sub_2460D4B90();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2460D4C5C();
  if (v19)
  {
    v20 = v18;
    v21 = v19;
    swift_bridgeObjectRelease();
    v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0)
      v22 = v20 & 0xFFFFFFFFFFFFLL;
    v23 = v22 == 0;
  }
  else
  {
    v23 = 1;
  }
  v47 = v23;
  v48 = a1;
  v24 = sub_2460D4B48();
  v25 = *(_QWORD *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
LABEL_17:
    v32 = (uint64_t)v49;
    v33 = v50;
    if (v47)
      return 0;
    v34 = 0;
    if (!sub_2460D4C38())
      goto LABEL_22;
LABEL_19:
    sub_2460D4CA4();
    swift_release();
    goto LABEL_23;
  }
  v42 = v10;
  v43 = v3;
  v44 = v6;
  v45 = v2;
  v26 = v24 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  v27 = *(_QWORD *)(v15 + 72);
  v28 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  v41[1] = v24;
  swift_bridgeObjectRetain();
  v51 = 0x80000002460D6B30;
  while (1)
  {
    v28(v17, v26, v14);
    v30 = sub_2460D4B84();
    if (!v31)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      goto LABEL_9;
    }
    if (v30 == 0xD000000000000010 && v31 == v51)
      break;
    v29 = sub_2460D5058();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    if ((v29 & 1) != 0)
      goto LABEL_20;
LABEL_9:
    v26 += v27;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      v6 = v44;
      v2 = v45;
      v10 = v42;
      v3 = v43;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_20:
  swift_bridgeObjectRelease_n();
  v6 = v44;
  v2 = v45;
  v10 = v42;
  v3 = v43;
  v32 = (uint64_t)v49;
  v33 = v50;
  if (v47)
    return 0;
  v34 = 1;
  if (sub_2460D4C38())
    goto LABEL_19;
LABEL_22:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v32, 1, 1, v2);
LABEL_23:
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v33, *MEMORY[0x24BEA1700], v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v33, 0, 1, v2);
  v35 = (uint64_t)&v6[*(int *)(v46 + 48)];
  sub_2460C784C(v32, (uint64_t)v6, &qword_257540740);
  sub_2460C784C(v33, v35, &qword_257540740);
  v36 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v36((uint64_t)v6, 1, v2) != 1)
  {
    sub_2460C784C((uint64_t)v6, (uint64_t)v10, &qword_257540740);
    if (v36(v35, 1, v2) != 1)
    {
      v37 = v41[0];
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(v41[0], v35, v2);
      sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
      v38 = sub_2460D4ED8();
      v39 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
      v39(v37, v2);
      sub_2460B2CC0(v50, &qword_257540740);
      sub_2460B2CC0(v32, &qword_257540740);
      v39((uint64_t)v10, v2);
      sub_2460B2CC0((uint64_t)v6, &qword_257540740);
      if ((v38 & 1) != 0)
        return v34;
      return 0;
    }
    sub_2460B2CC0(v33, &qword_257540740);
    sub_2460B2CC0(v32, &qword_257540740);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
LABEL_28:
    sub_2460B2CC0((uint64_t)v6, &qword_257541100);
    return 0;
  }
  sub_2460B2CC0(v33, &qword_257540740);
  sub_2460B2CC0(v32, &qword_257540740);
  if (v36(v35, 1, v2) != 1)
    goto LABEL_28;
  sub_2460B2CC0((uint64_t)v6, &qword_257540740);
  return v34;
}

_QWORD *sub_2460B7250()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_QWORD *)(v0 + 296))
  {
    v1 = *(_QWORD **)(v0 + 296);
  }
  else
  {
    v1 = sub_2460B72AC();
    *(_QWORD *)(v0 + 296) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *sub_2460B72AC()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (*v31)(char *, unint64_t, uint64_t);
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void (*v43)(char *, unint64_t, uint64_t);
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  unint64_t v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  void (*v70)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v0 = sub_2460D4B90();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v65 = (char *)&v59 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v59 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540720);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v59 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v64 = (char *)&v59 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v59 - v18;
  v20 = sub_2460B4C5C();
  v21 = sub_2460CCB08(v20, MEMORY[0x24BEE4AF8], sub_2460B7A04, 0);
  swift_bridgeObjectRelease();
  v66 = v21;
  if (v21 >> 62)
  {
LABEL_51:
    swift_bridgeObjectRetain_n();
    v21 = v66;
    v22 = sub_2460D5028();
    swift_bridgeObjectRelease();
    if (v22)
      goto LABEL_3;
  }
  else
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v22)
    {
LABEL_3:
      v23 = 0;
      v63 = v21 & 0xC000000000000001;
      v59 = v21 + 32;
      v60 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v61 = v12;
      v12 = &qword_257540720;
      v68 = v15;
      v69 = v19;
      v62 = v22;
      while (1)
      {
        if (v63)
        {
          v24 = MEMORY[0x24954F500](v23, v21);
          v25 = __OFADD__(v23, 1);
          v26 = v23 + 1;
          if (v25)
            goto LABEL_50;
        }
        else
        {
          v24 = *(_QWORD *)(v59 + 8 * v23);
          swift_retain();
          v25 = __OFADD__(v23, 1);
          v26 = v23 + 1;
          if (v25)
          {
LABEL_50:
            __break(1u);
            goto LABEL_51;
          }
        }
        v72 = v26;
        v27 = sub_2460D4B48();
        v28 = *(_QWORD *)(v27 + 16);
        v74 = v27;
        v75 = v24;
        if (!v28)
        {
LABEL_22:
          v70 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
          v70(v19, 1, 1, v0);
          v35 = (uint64_t)v64;
          v23 = v72;
          goto LABEL_24;
        }
        v29 = v27 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
        swift_bridgeObjectRetain();
        v30 = *(_QWORD *)(v1 + 72);
        v31 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
        v31(v8, v29, v0);
        while (1)
        {
          v33 = sub_2460D4B84();
          if (!v34)
            goto LABEL_15;
          if (v33 == 0x54776F6853707061 && v34 == 0xEE006449656C7469)
            break;
          v32 = sub_2460D5058();
          swift_bridgeObjectRelease();
          if ((v32 & 1) != 0)
            goto LABEL_23;
LABEL_15:
          (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
          v29 += v30;
          if (!--v28)
          {
            swift_bridgeObjectRelease();
            v15 = v68;
            v19 = v69;
            v12 = &qword_257540720;
            goto LABEL_22;
          }
          v31(v8, v29, v0);
        }
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();
        v19 = v69;
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v69, v8, v0);
        v70 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
        v70(v19, 0, 1, v0);
        v15 = v68;
        v35 = (uint64_t)v64;
        v23 = v72;
        v12 = &qword_257540720;
LABEL_24:
        swift_bridgeObjectRelease();
        sub_2460C784C((uint64_t)v19, v35, &qword_257540720);
        v71 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
        if (v71(v35, 1, v0) == 1)
        {
          v67 = 0;
          v74 = 0;
        }
        else
        {
          v36 = v35;
          v37 = v65;
          (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v65, v36, v0);
          v67 = sub_2460D4B78();
          v74 = v38;
          (*(void (**)(char *, uint64_t))(v1 + 8))(v37, v0);
        }
        sub_2460B2CC0((uint64_t)v19, &qword_257540720);
        v39 = sub_2460D4B48();
        v40 = *(_QWORD *)(v39 + 16);
        v73 = v39;
        if (!v40)
        {
          v47 = 1;
          v48 = (uint64_t)v61;
          v19 = v69;
          goto LABEL_40;
        }
        v41 = v39 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
        swift_bridgeObjectRetain();
        v42 = *(_QWORD *)(v1 + 72);
        v43 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
        v43(v4, v41, v0);
        while (2)
        {
          v45 = sub_2460D4B84();
          if (!v46)
            goto LABEL_30;
          if (v45 != 0x54776F6853707061 || v46 != 0xEC000000656C7469)
          {
            v44 = sub_2460D5058();
            swift_bridgeObjectRelease();
            if ((v44 & 1) != 0)
              goto LABEL_38;
LABEL_30:
            (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
            v41 += v42;
            if (!--v40)
            {
              swift_bridgeObjectRelease();
              v47 = 1;
              v48 = (uint64_t)v61;
              v15 = v68;
              goto LABEL_39;
            }
            v43(v4, v41, v0);
            continue;
          }
          break;
        }
        swift_bridgeObjectRelease();
LABEL_38:
        swift_bridgeObjectRelease();
        v15 = v68;
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v68, v4, v0);
        v47 = 0;
        v48 = (uint64_t)v61;
LABEL_39:
        v19 = v69;
        v23 = v72;
        v12 = &qword_257540720;
LABEL_40:
        v70(v15, v47, 1, v0);
        swift_bridgeObjectRelease();
        sub_2460C784C((uint64_t)v15, v48, &qword_257540720);
        if (v71(v48, 1, v0) == 1)
        {
          sub_2460B2CC0((uint64_t)v15, &qword_257540720);
LABEL_5:
          swift_release();
          swift_bridgeObjectRelease();
          v21 = v66;
          goto LABEL_6;
        }
        v49 = v65;
        (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v65, v48, v0);
        v73 = sub_2460D4B78();
        v51 = v50;
        (*(void (**)(char *, uint64_t))(v1 + 8))(v49, v0);
        sub_2460B2CC0((uint64_t)v15, &qword_257540720);
        if (!v74)
        {
          v12 = &qword_257540720;
          goto LABEL_5;
        }
        if (!v51)
        {
          v12 = &qword_257540720;
          goto LABEL_5;
        }
        swift_release();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v60 = sub_2460CBE70(0, v60[2] + 1, 1, v60);
        v52 = v67;
        v54 = v60[2];
        v53 = v60[3];
        if (v54 >= v53 >> 1)
          v60 = sub_2460CBE70((_QWORD *)(v53 > 1), v54 + 1, 1, v60);
        v55 = v60;
        v60[2] = v54 + 1;
        v56 = &v55[4 * v54];
        v56[4] = v73;
        v56[5] = v51;
        v57 = v74;
        v56[6] = v52;
        v56[7] = v57;
        v15 = v68;
        v21 = v66;
        v12 = &qword_257540720;
LABEL_6:
        if (v23 == v62)
          goto LABEL_53;
      }
    }
  }
  v60 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_53:
  swift_bridgeObjectRelease_n();
  return v60;
}

uint64_t sub_2460B7A04(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(uint64_t, uint64_t, uint64_t);
  char *v37;
  char v38;
  void (*v39)(char *, uint64_t);
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL4 v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;

  v2 = sub_2460D4D34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v41 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v46);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v50 = (uint64_t)&v41 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v49 = (char *)&v41 - v13;
  v14 = sub_2460D4B90();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2460D4C5C();
  if (v19)
  {
    v20 = v18;
    v21 = v19;
    swift_bridgeObjectRelease();
    v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0)
      v22 = v20 & 0xFFFFFFFFFFFFLL;
    v23 = v22 == 0;
  }
  else
  {
    v23 = 1;
  }
  v47 = v23;
  v48 = a1;
  v24 = sub_2460D4B48();
  v25 = *(_QWORD *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
LABEL_17:
    v32 = (uint64_t)v49;
    v33 = v50;
    if (v47)
      return 0;
    v34 = 0;
    if (!sub_2460D4C38())
      goto LABEL_22;
LABEL_19:
    sub_2460D4CA4();
    swift_release();
    goto LABEL_23;
  }
  v42 = v10;
  v43 = v3;
  v44 = v6;
  v45 = v2;
  v26 = v24 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  v27 = *(_QWORD *)(v15 + 72);
  v28 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  swift_bridgeObjectRetain();
  while (1)
  {
    v28(v17, v26, v14);
    v30 = sub_2460D4B84();
    if (!v31)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      goto LABEL_9;
    }
    if (v30 == 0x54776F6853707061 && v31 == 0xEC000000656C7469)
      break;
    v29 = sub_2460D5058();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    if ((v29 & 1) != 0)
      goto LABEL_20;
LABEL_9:
    v26 += v27;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      v6 = v44;
      v2 = v45;
      v10 = v42;
      v3 = v43;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_20:
  swift_bridgeObjectRelease_n();
  v6 = v44;
  v2 = v45;
  v10 = v42;
  v3 = v43;
  v32 = (uint64_t)v49;
  v33 = v50;
  if (v47)
    return 0;
  v34 = 1;
  if (sub_2460D4C38())
    goto LABEL_19;
LABEL_22:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v32, 1, 1, v2);
LABEL_23:
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v33, *MEMORY[0x24BEA1678], v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v33, 0, 1, v2);
  v35 = (uint64_t)&v6[*(int *)(v46 + 48)];
  sub_2460C784C(v32, (uint64_t)v6, &qword_257540740);
  sub_2460C784C(v33, v35, &qword_257540740);
  v36 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v36((uint64_t)v6, 1, v2) != 1)
  {
    sub_2460C784C((uint64_t)v6, (uint64_t)v10, &qword_257540740);
    if (v36(v35, 1, v2) != 1)
    {
      v37 = v41;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v41, v35, v2);
      sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
      v38 = sub_2460D4ED8();
      v39 = *(void (**)(char *, uint64_t))(v3 + 8);
      v39(v37, v2);
      sub_2460B2CC0(v50, &qword_257540740);
      sub_2460B2CC0(v32, &qword_257540740);
      v39(v10, v2);
      sub_2460B2CC0((uint64_t)v6, &qword_257540740);
      if ((v38 & 1) != 0)
        return v34;
      return 0;
    }
    sub_2460B2CC0(v33, &qword_257540740);
    sub_2460B2CC0(v32, &qword_257540740);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
LABEL_28:
    sub_2460B2CC0((uint64_t)v6, &qword_257541100);
    return 0;
  }
  sub_2460B2CC0(v33, &qword_257540740);
  sub_2460B2CC0(v32, &qword_257540740);
  if (v36(v35, 1, v2) != 1)
    goto LABEL_28;
  sub_2460B2CC0((uint64_t)v6, &qword_257540740);
  return v34;
}

_QWORD *sub_2460B7F2C()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_QWORD *)(v0 + 304))
  {
    v1 = *(_QWORD **)(v0 + 304);
  }
  else
  {
    v1 = sub_2460B7F88();
    *(_QWORD *)(v0 + 304) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *sub_2460B7F88()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void (*v44)(char *, unint64_t, uint64_t);
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v60;
  unint64_t v61;
  _QWORD *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  void (*v72)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  unint64_t v78;
  unint64_t v79;
  const char *v80;
  char *v81;

  v0 = sub_2460D4B90();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v67 = (char *)&v60 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v60 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540720);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v60 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v66 = (char *)&v60 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v60 - v18;
  v20 = sub_2460B4C5C();
  v21 = sub_2460CCB08(v20, MEMORY[0x24BEE4AF8], sub_2460B86B8, 0);
  swift_bridgeObjectRelease();
  v68 = v21;
  if (v21 >> 62)
  {
LABEL_51:
    swift_bridgeObjectRetain();
    v21 = v68;
    v23 = sub_2460D5028();
    if (v23)
      goto LABEL_3;
  }
  else
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v23 = v22;
    if (v22)
    {
LABEL_3:
      v24 = 0;
      v65 = v21 & 0xC000000000000001;
      v61 = v21 + 32;
      v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v63 = v12;
      v81 = "Id";
      v79 = 0x80000002460D6B80;
      v80 = "appAudiobookTitle";
      v78 = 0x80000002460D6BA0;
      v70 = v15;
      v71 = v19;
      v64 = v23;
      while (1)
      {
        if (v65)
        {
          v12 = (char *)MEMORY[0x24954F500](v24, v21);
          v26 = __OFADD__(v24, 1);
          v27 = v24 + 1;
          if (v26)
            goto LABEL_50;
        }
        else
        {
          v12 = *(char **)(v61 + 8 * v24);
          swift_retain();
          v26 = __OFADD__(v24, 1);
          v27 = v24 + 1;
          if (v26)
          {
LABEL_50:
            __break(1u);
            goto LABEL_51;
          }
        }
        v74 = v27;
        v28 = sub_2460D4B48();
        v29 = *(_QWORD *)(v28 + 16);
        v76 = v28;
        v77 = v12;
        if (!v29)
        {
LABEL_22:
          v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
          v72(v19, 1, 1, v0);
          v36 = (uint64_t)v66;
          v24 = v74;
          goto LABEL_24;
        }
        v30 = v28 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
        swift_bridgeObjectRetain();
        v31 = *(_QWORD *)(v1 + 72);
        v32 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
        v32(v8, v30, v0);
        while (1)
        {
          v34 = sub_2460D4B84();
          if (!v35)
            goto LABEL_15;
          if (v34 == 0xD000000000000013 && v35 == v78)
            break;
          v33 = sub_2460D5058();
          swift_bridgeObjectRelease();
          if ((v33 & 1) != 0)
            goto LABEL_23;
LABEL_15:
          (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
          v30 += v31;
          if (!--v29)
          {
            swift_bridgeObjectRelease();
            v15 = v70;
            v19 = v71;
            goto LABEL_22;
          }
          v32(v8, v30, v0);
        }
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();
        v19 = v71;
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v71, v8, v0);
        v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
        v72(v19, 0, 1, v0);
        v15 = v70;
        v36 = (uint64_t)v66;
        v24 = v74;
LABEL_24:
        swift_bridgeObjectRelease();
        sub_2460C784C((uint64_t)v19, v36, &qword_257540720);
        v73 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
        if (v73(v36, 1, v0) == 1)
        {
          v69 = 0;
          v76 = 0;
        }
        else
        {
          v37 = v36;
          v38 = v67;
          (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v67, v37, v0);
          v69 = sub_2460D4B78();
          v76 = v39;
          (*(void (**)(char *, uint64_t))(v1 + 8))(v38, v0);
        }
        sub_2460B2CC0((uint64_t)v19, &qword_257540720);
        v40 = sub_2460D4B48();
        v41 = *(_QWORD *)(v40 + 16);
        v75 = v40;
        if (!v41)
        {
          v48 = 1;
          v49 = (uint64_t)v63;
          v19 = v71;
          goto LABEL_40;
        }
        v42 = v40 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
        swift_bridgeObjectRetain();
        v43 = *(_QWORD *)(v1 + 72);
        v44 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
        v44(v4, v42, v0);
        while (2)
        {
          v46 = sub_2460D4B84();
          if (!v47)
            goto LABEL_30;
          if (v46 != 0xD000000000000011 || v47 != v79)
          {
            v45 = sub_2460D5058();
            swift_bridgeObjectRelease();
            if ((v45 & 1) != 0)
              goto LABEL_38;
LABEL_30:
            (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
            v42 += v43;
            if (!--v41)
            {
              swift_bridgeObjectRelease();
              v48 = 1;
              v49 = (uint64_t)v63;
              v15 = v70;
              goto LABEL_39;
            }
            v44(v4, v42, v0);
            continue;
          }
          break;
        }
        swift_bridgeObjectRelease();
LABEL_38:
        swift_bridgeObjectRelease();
        v15 = v70;
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v70, v4, v0);
        v48 = 0;
        v49 = (uint64_t)v63;
LABEL_39:
        v19 = v71;
        v24 = v74;
LABEL_40:
        v72(v15, v48, 1, v0);
        swift_bridgeObjectRelease();
        sub_2460C784C((uint64_t)v15, v49, &qword_257540720);
        if (v73(v49, 1, v0) == 1)
        {
          sub_2460B2CC0((uint64_t)v15, &qword_257540720);
LABEL_5:
          swift_release();
          swift_bridgeObjectRelease();
          v21 = v68;
          v25 = v64;
          goto LABEL_6;
        }
        v50 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v67, v49, v0);
        v51 = sub_2460D4B78();
        v53 = v52;
        (*(void (**)(char *, uint64_t))(v1 + 8))(v50, v0);
        sub_2460B2CC0((uint64_t)v15, &qword_257540720);
        if (!v76 || !v53)
          goto LABEL_5;
        swift_release();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v62 = sub_2460CBE70(0, v62[2] + 1, 1, v62);
        v55 = v62[2];
        v54 = v62[3];
        v25 = v64;
        if (v55 >= v54 >> 1)
        {
          v62 = sub_2460CBE70((_QWORD *)(v54 > 1), v55 + 1, 1, v62);
          v25 = v64;
        }
        v56 = v62;
        v62[2] = v55 + 1;
        v57 = &v56[4 * v55];
        v57[4] = v51;
        v57[5] = v53;
        v15 = v70;
        v58 = v76;
        v57[6] = v69;
        v57[7] = v58;
        v21 = v68;
LABEL_6:
        if (v24 == v25)
          goto LABEL_53;
      }
    }
  }
  v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_53:
  swift_bridgeObjectRelease_n();
  return v62;
}

uint64_t sub_2460B86B8(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  char v38;
  void (*v39)(uint64_t, uint64_t);
  _QWORD v41[2];
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL4 v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;

  v2 = sub_2460D4D34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v41[0] = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v46);
  v6 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v50 = (uint64_t)v41 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v49 = (char *)v41 - v13;
  v14 = sub_2460D4B90();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2460D4C5C();
  if (v19)
  {
    v20 = v18;
    v21 = v19;
    swift_bridgeObjectRelease();
    v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0)
      v22 = v20 & 0xFFFFFFFFFFFFLL;
    v23 = v22 == 0;
  }
  else
  {
    v23 = 1;
  }
  v47 = v23;
  v48 = a1;
  v24 = sub_2460D4B48();
  v25 = *(_QWORD *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
LABEL_17:
    v32 = (uint64_t)v49;
    v33 = v50;
    if (v47)
      return 0;
    v34 = 0;
    if (!sub_2460D4C38())
      goto LABEL_22;
LABEL_19:
    sub_2460D4CA4();
    swift_release();
    goto LABEL_23;
  }
  v42 = v10;
  v43 = v3;
  v44 = v6;
  v45 = v2;
  v26 = v24 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  v27 = *(_QWORD *)(v15 + 72);
  v28 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  v41[1] = v24;
  swift_bridgeObjectRetain();
  v51 = 0x80000002460D6B80;
  while (1)
  {
    v28(v17, v26, v14);
    v30 = sub_2460D4B84();
    if (!v31)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      goto LABEL_9;
    }
    if (v30 == 0xD000000000000011 && v31 == v51)
      break;
    v29 = sub_2460D5058();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    if ((v29 & 1) != 0)
      goto LABEL_20;
LABEL_9:
    v26 += v27;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      v6 = v44;
      v2 = v45;
      v10 = v42;
      v3 = v43;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_20:
  swift_bridgeObjectRelease_n();
  v6 = v44;
  v2 = v45;
  v10 = v42;
  v3 = v43;
  v32 = (uint64_t)v49;
  v33 = v50;
  if (v47)
    return 0;
  v34 = 1;
  if (sub_2460D4C38())
    goto LABEL_19;
LABEL_22:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v32, 1, 1, v2);
LABEL_23:
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v33, *MEMORY[0x24BEA1618], v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v33, 0, 1, v2);
  v35 = (uint64_t)&v6[*(int *)(v46 + 48)];
  sub_2460C784C(v32, (uint64_t)v6, &qword_257540740);
  sub_2460C784C(v33, v35, &qword_257540740);
  v36 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v36((uint64_t)v6, 1, v2) != 1)
  {
    sub_2460C784C((uint64_t)v6, (uint64_t)v10, &qword_257540740);
    if (v36(v35, 1, v2) != 1)
    {
      v37 = v41[0];
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(v41[0], v35, v2);
      sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
      v38 = sub_2460D4ED8();
      v39 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
      v39(v37, v2);
      sub_2460B2CC0(v50, &qword_257540740);
      sub_2460B2CC0(v32, &qword_257540740);
      v39((uint64_t)v10, v2);
      sub_2460B2CC0((uint64_t)v6, &qword_257540740);
      if ((v38 & 1) != 0)
        return v34;
      return 0;
    }
    sub_2460B2CC0(v33, &qword_257540740);
    sub_2460B2CC0(v32, &qword_257540740);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
LABEL_28:
    sub_2460B2CC0((uint64_t)v6, &qword_257541100);
    return 0;
  }
  sub_2460B2CC0(v33, &qword_257540740);
  sub_2460B2CC0(v32, &qword_257540740);
  if (v36(v35, 1, v2) != 1)
    goto LABEL_28;
  sub_2460B2CC0((uint64_t)v6, &qword_257540740);
  return v34;
}

_QWORD *sub_2460B8BCC()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_QWORD *)(v0 + 312))
  {
    v1 = *(_QWORD **)(v0 + 312);
  }
  else
  {
    v1 = sub_2460B8C28();
    *(_QWORD *)(v0 + 312) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *sub_2460B8C28()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void (*v44)(char *, unint64_t, uint64_t);
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v60;
  unint64_t v61;
  _QWORD *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  void (*v72)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  unint64_t v78;
  unint64_t v79;
  const char *v80;
  const char *v81;

  v0 = sub_2460D4B90();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v67 = (char *)&v60 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v60 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540720);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v60 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v66 = (char *)&v60 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v60 - v18;
  v20 = sub_2460B4C5C();
  v21 = sub_2460CCB08(v20, MEMORY[0x24BEE4AF8], sub_2460B9358, 0);
  swift_bridgeObjectRelease();
  v68 = v21;
  if (v21 >> 62)
  {
LABEL_51:
    swift_bridgeObjectRetain();
    v21 = v68;
    v23 = sub_2460D5028();
    if (v23)
      goto LABEL_3;
  }
  else
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v23 = v22;
    if (v22)
    {
LABEL_3:
      v24 = 0;
      v65 = v21 & 0xC000000000000001;
      v61 = v21 + 32;
      v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v63 = v12;
      v81 = "appAudiobookTitleId";
      v79 = 0x80000002460D6BC0;
      v80 = "appMusicArtistName";
      v78 = 0x80000002460D6BE0;
      v70 = v15;
      v71 = v19;
      v64 = v23;
      while (1)
      {
        if (v65)
        {
          v12 = (char *)MEMORY[0x24954F500](v24, v21);
          v26 = __OFADD__(v24, 1);
          v27 = v24 + 1;
          if (v26)
            goto LABEL_50;
        }
        else
        {
          v12 = *(char **)(v61 + 8 * v24);
          swift_retain();
          v26 = __OFADD__(v24, 1);
          v27 = v24 + 1;
          if (v26)
          {
LABEL_50:
            __break(1u);
            goto LABEL_51;
          }
        }
        v74 = v27;
        v28 = sub_2460D4B48();
        v29 = *(_QWORD *)(v28 + 16);
        v76 = v28;
        v77 = v12;
        if (!v29)
        {
LABEL_22:
          v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
          v72(v19, 1, 1, v0);
          v36 = (uint64_t)v66;
          v24 = v74;
          goto LABEL_24;
        }
        v30 = v28 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
        swift_bridgeObjectRetain();
        v31 = *(_QWORD *)(v1 + 72);
        v32 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
        v32(v8, v30, v0);
        while (1)
        {
          v34 = sub_2460D4B84();
          if (!v35)
            goto LABEL_15;
          if (v34 == 0xD000000000000014 && v35 == v78)
            break;
          v33 = sub_2460D5058();
          swift_bridgeObjectRelease();
          if ((v33 & 1) != 0)
            goto LABEL_23;
LABEL_15:
          (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
          v30 += v31;
          if (!--v29)
          {
            swift_bridgeObjectRelease();
            v15 = v70;
            v19 = v71;
            goto LABEL_22;
          }
          v32(v8, v30, v0);
        }
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();
        v19 = v71;
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v71, v8, v0);
        v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
        v72(v19, 0, 1, v0);
        v15 = v70;
        v36 = (uint64_t)v66;
        v24 = v74;
LABEL_24:
        swift_bridgeObjectRelease();
        sub_2460C784C((uint64_t)v19, v36, &qword_257540720);
        v73 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
        if (v73(v36, 1, v0) == 1)
        {
          v69 = 0;
          v76 = 0;
        }
        else
        {
          v37 = v36;
          v38 = v67;
          (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v67, v37, v0);
          v69 = sub_2460D4B78();
          v76 = v39;
          (*(void (**)(char *, uint64_t))(v1 + 8))(v38, v0);
        }
        sub_2460B2CC0((uint64_t)v19, &qword_257540720);
        v40 = sub_2460D4B48();
        v41 = *(_QWORD *)(v40 + 16);
        v75 = v40;
        if (!v41)
        {
          v48 = 1;
          v49 = (uint64_t)v63;
          v19 = v71;
          goto LABEL_40;
        }
        v42 = v40 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
        swift_bridgeObjectRetain();
        v43 = *(_QWORD *)(v1 + 72);
        v44 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
        v44(v4, v42, v0);
        while (2)
        {
          v46 = sub_2460D4B84();
          if (!v47)
            goto LABEL_30;
          if (v46 != 0xD000000000000012 || v47 != v79)
          {
            v45 = sub_2460D5058();
            swift_bridgeObjectRelease();
            if ((v45 & 1) != 0)
              goto LABEL_38;
LABEL_30:
            (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
            v42 += v43;
            if (!--v41)
            {
              swift_bridgeObjectRelease();
              v48 = 1;
              v49 = (uint64_t)v63;
              v15 = v70;
              goto LABEL_39;
            }
            v44(v4, v42, v0);
            continue;
          }
          break;
        }
        swift_bridgeObjectRelease();
LABEL_38:
        swift_bridgeObjectRelease();
        v15 = v70;
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v70, v4, v0);
        v48 = 0;
        v49 = (uint64_t)v63;
LABEL_39:
        v19 = v71;
        v24 = v74;
LABEL_40:
        v72(v15, v48, 1, v0);
        swift_bridgeObjectRelease();
        sub_2460C784C((uint64_t)v15, v49, &qword_257540720);
        if (v73(v49, 1, v0) == 1)
        {
          sub_2460B2CC0((uint64_t)v15, &qword_257540720);
LABEL_5:
          swift_release();
          swift_bridgeObjectRelease();
          v21 = v68;
          v25 = v64;
          goto LABEL_6;
        }
        v50 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v67, v49, v0);
        v51 = sub_2460D4B78();
        v53 = v52;
        (*(void (**)(char *, uint64_t))(v1 + 8))(v50, v0);
        sub_2460B2CC0((uint64_t)v15, &qword_257540720);
        if (!v76 || !v53)
          goto LABEL_5;
        swift_release();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v62 = sub_2460CBE70(0, v62[2] + 1, 1, v62);
        v55 = v62[2];
        v54 = v62[3];
        v25 = v64;
        if (v55 >= v54 >> 1)
        {
          v62 = sub_2460CBE70((_QWORD *)(v54 > 1), v55 + 1, 1, v62);
          v25 = v64;
        }
        v56 = v62;
        v62[2] = v55 + 1;
        v57 = &v56[4 * v55];
        v57[4] = v51;
        v57[5] = v53;
        v15 = v70;
        v58 = v76;
        v57[6] = v69;
        v57[7] = v58;
        v21 = v68;
LABEL_6:
        if (v24 == v25)
          goto LABEL_53;
      }
    }
  }
  v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_53:
  swift_bridgeObjectRelease_n();
  return v62;
}

uint64_t sub_2460B9358(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  char v38;
  void (*v39)(uint64_t, uint64_t);
  _QWORD v41[2];
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL4 v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;

  v2 = sub_2460D4D34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v41[0] = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v46);
  v6 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v50 = (uint64_t)v41 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v49 = (char *)v41 - v13;
  v14 = sub_2460D4B90();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2460D4C5C();
  if (v19)
  {
    v20 = v18;
    v21 = v19;
    swift_bridgeObjectRelease();
    v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0)
      v22 = v20 & 0xFFFFFFFFFFFFLL;
    v23 = v22 == 0;
  }
  else
  {
    v23 = 1;
  }
  v47 = v23;
  v48 = a1;
  v24 = sub_2460D4B48();
  v25 = *(_QWORD *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
LABEL_17:
    v32 = (uint64_t)v49;
    v33 = v50;
    if (v47)
      return 0;
    v34 = 0;
    if (!sub_2460D4C38())
      goto LABEL_22;
LABEL_19:
    sub_2460D4CA4();
    swift_release();
    goto LABEL_23;
  }
  v42 = v10;
  v43 = v3;
  v44 = v6;
  v45 = v2;
  v26 = v24 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  v27 = *(_QWORD *)(v15 + 72);
  v28 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  v41[1] = v24;
  swift_bridgeObjectRetain();
  v51 = 0x80000002460D6BC0;
  while (1)
  {
    v28(v17, v26, v14);
    v30 = sub_2460D4B84();
    if (!v31)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      goto LABEL_9;
    }
    if (v30 == 0xD000000000000012 && v31 == v51)
      break;
    v29 = sub_2460D5058();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    if ((v29 & 1) != 0)
      goto LABEL_20;
LABEL_9:
    v26 += v27;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      v6 = v44;
      v2 = v45;
      v10 = v42;
      v3 = v43;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_20:
  swift_bridgeObjectRelease_n();
  v6 = v44;
  v2 = v45;
  v10 = v42;
  v3 = v43;
  v32 = (uint64_t)v49;
  v33 = v50;
  if (v47)
    return 0;
  v34 = 1;
  if (sub_2460D4C38())
    goto LABEL_19;
LABEL_22:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v32, 1, 1, v2);
LABEL_23:
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v33, *MEMORY[0x24BEA16B0], v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v33, 0, 1, v2);
  v35 = (uint64_t)&v6[*(int *)(v46 + 48)];
  sub_2460C784C(v32, (uint64_t)v6, &qword_257540740);
  sub_2460C784C(v33, v35, &qword_257540740);
  v36 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v36((uint64_t)v6, 1, v2) != 1)
  {
    sub_2460C784C((uint64_t)v6, (uint64_t)v10, &qword_257540740);
    if (v36(v35, 1, v2) != 1)
    {
      v37 = v41[0];
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(v41[0], v35, v2);
      sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
      v38 = sub_2460D4ED8();
      v39 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
      v39(v37, v2);
      sub_2460B2CC0(v50, &qword_257540740);
      sub_2460B2CC0(v32, &qword_257540740);
      v39((uint64_t)v10, v2);
      sub_2460B2CC0((uint64_t)v6, &qword_257540740);
      if ((v38 & 1) != 0)
        return v34;
      return 0;
    }
    sub_2460B2CC0(v33, &qword_257540740);
    sub_2460B2CC0(v32, &qword_257540740);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
LABEL_28:
    sub_2460B2CC0((uint64_t)v6, &qword_257541100);
    return 0;
  }
  sub_2460B2CC0(v33, &qword_257540740);
  sub_2460B2CC0(v32, &qword_257540740);
  if (v36(v35, 1, v2) != 1)
    goto LABEL_28;
  sub_2460B2CC0((uint64_t)v6, &qword_257540740);
  return v34;
}

_QWORD *sub_2460B986C()
{
  uint64_t v0;
  _QWORD *v1;

  if (*(_QWORD *)(v0 + 320))
  {
    v1 = *(_QWORD **)(v0 + 320);
  }
  else
  {
    v1 = sub_2460B98C8();
    *(_QWORD *)(v0 + 320) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *sub_2460B98C8()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void (*v44)(char *, unint64_t, uint64_t);
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v60;
  unint64_t v61;
  _QWORD *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  void (*v72)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  unint64_t v78;
  unint64_t v79;
  const char *v80;
  const char *v81;

  v0 = sub_2460D4B90();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v67 = (char *)&v60 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v60 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540720);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v60 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v66 = (char *)&v60 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v60 - v18;
  v20 = sub_2460B4C5C();
  v21 = sub_2460CCB08(v20, MEMORY[0x24BEE4AF8], sub_2460B9FF8, 0);
  swift_bridgeObjectRelease();
  v68 = v21;
  if (v21 >> 62)
  {
LABEL_51:
    swift_bridgeObjectRetain();
    v21 = v68;
    v23 = sub_2460D5028();
    if (v23)
      goto LABEL_3;
  }
  else
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v23 = v22;
    if (v22)
    {
LABEL_3:
      v24 = 0;
      v65 = v21 & 0xC000000000000001;
      v61 = v21 + 32;
      v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v63 = v12;
      v81 = "appMusicArtistNameId";
      v79 = 0x80000002460D6C00;
      v80 = "appAudiobookAuthor";
      v78 = 0x80000002460D6C20;
      v70 = v15;
      v71 = v19;
      v64 = v23;
      while (1)
      {
        if (v65)
        {
          v12 = (char *)MEMORY[0x24954F500](v24, v21);
          v26 = __OFADD__(v24, 1);
          v27 = v24 + 1;
          if (v26)
            goto LABEL_50;
        }
        else
        {
          v12 = *(char **)(v61 + 8 * v24);
          swift_retain();
          v26 = __OFADD__(v24, 1);
          v27 = v24 + 1;
          if (v26)
          {
LABEL_50:
            __break(1u);
            goto LABEL_51;
          }
        }
        v74 = v27;
        v28 = sub_2460D4B48();
        v29 = *(_QWORD *)(v28 + 16);
        v76 = v28;
        v77 = v12;
        if (!v29)
        {
LABEL_22:
          v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
          v72(v19, 1, 1, v0);
          v36 = (uint64_t)v66;
          v24 = v74;
          goto LABEL_24;
        }
        v30 = v28 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
        swift_bridgeObjectRetain();
        v31 = *(_QWORD *)(v1 + 72);
        v32 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
        v32(v8, v30, v0);
        while (1)
        {
          v34 = sub_2460D4B84();
          if (!v35)
            goto LABEL_15;
          if (v34 == 0xD000000000000014 && v35 == v78)
            break;
          v33 = sub_2460D5058();
          swift_bridgeObjectRelease();
          if ((v33 & 1) != 0)
            goto LABEL_23;
LABEL_15:
          (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
          v30 += v31;
          if (!--v29)
          {
            swift_bridgeObjectRelease();
            v15 = v70;
            v19 = v71;
            goto LABEL_22;
          }
          v32(v8, v30, v0);
        }
        swift_bridgeObjectRelease();
LABEL_23:
        swift_bridgeObjectRelease();
        v19 = v71;
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v71, v8, v0);
        v72 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
        v72(v19, 0, 1, v0);
        v15 = v70;
        v36 = (uint64_t)v66;
        v24 = v74;
LABEL_24:
        swift_bridgeObjectRelease();
        sub_2460C784C((uint64_t)v19, v36, &qword_257540720);
        v73 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
        if (v73(v36, 1, v0) == 1)
        {
          v69 = 0;
          v76 = 0;
        }
        else
        {
          v37 = v36;
          v38 = v67;
          (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v67, v37, v0);
          v69 = sub_2460D4B78();
          v76 = v39;
          (*(void (**)(char *, uint64_t))(v1 + 8))(v38, v0);
        }
        sub_2460B2CC0((uint64_t)v19, &qword_257540720);
        v40 = sub_2460D4B48();
        v41 = *(_QWORD *)(v40 + 16);
        v75 = v40;
        if (!v41)
        {
          v48 = 1;
          v49 = (uint64_t)v63;
          v19 = v71;
          goto LABEL_40;
        }
        v42 = v40 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
        swift_bridgeObjectRetain();
        v43 = *(_QWORD *)(v1 + 72);
        v44 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
        v44(v4, v42, v0);
        while (2)
        {
          v46 = sub_2460D4B84();
          if (!v47)
            goto LABEL_30;
          if (v46 != 0xD000000000000012 || v47 != v79)
          {
            v45 = sub_2460D5058();
            swift_bridgeObjectRelease();
            if ((v45 & 1) != 0)
              goto LABEL_38;
LABEL_30:
            (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
            v42 += v43;
            if (!--v41)
            {
              swift_bridgeObjectRelease();
              v48 = 1;
              v49 = (uint64_t)v63;
              v15 = v70;
              goto LABEL_39;
            }
            v44(v4, v42, v0);
            continue;
          }
          break;
        }
        swift_bridgeObjectRelease();
LABEL_38:
        swift_bridgeObjectRelease();
        v15 = v70;
        (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v70, v4, v0);
        v48 = 0;
        v49 = (uint64_t)v63;
LABEL_39:
        v19 = v71;
        v24 = v74;
LABEL_40:
        v72(v15, v48, 1, v0);
        swift_bridgeObjectRelease();
        sub_2460C784C((uint64_t)v15, v49, &qword_257540720);
        if (v73(v49, 1, v0) == 1)
        {
          sub_2460B2CC0((uint64_t)v15, &qword_257540720);
LABEL_5:
          swift_release();
          swift_bridgeObjectRelease();
          v21 = v68;
          v25 = v64;
          goto LABEL_6;
        }
        v50 = v67;
        (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v67, v49, v0);
        v51 = sub_2460D4B78();
        v53 = v52;
        (*(void (**)(char *, uint64_t))(v1 + 8))(v50, v0);
        sub_2460B2CC0((uint64_t)v15, &qword_257540720);
        if (!v76 || !v53)
          goto LABEL_5;
        swift_release();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v62 = sub_2460CBE70(0, v62[2] + 1, 1, v62);
        v55 = v62[2];
        v54 = v62[3];
        v25 = v64;
        if (v55 >= v54 >> 1)
        {
          v62 = sub_2460CBE70((_QWORD *)(v54 > 1), v55 + 1, 1, v62);
          v25 = v64;
        }
        v56 = v62;
        v62[2] = v55 + 1;
        v57 = &v56[4 * v55];
        v57[4] = v51;
        v57[5] = v53;
        v15 = v70;
        v58 = v76;
        v57[6] = v69;
        v57[7] = v58;
        v21 = v68;
LABEL_6:
        if (v24 == v25)
          goto LABEL_53;
      }
    }
  }
  v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_53:
  swift_bridgeObjectRelease_n();
  return v62;
}

uint64_t sub_2460B9FF8(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  char v38;
  void (*v39)(uint64_t, uint64_t);
  _QWORD v41[2];
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL4 v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;

  v2 = sub_2460D4D34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v41[0] = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v46);
  v6 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v50 = (uint64_t)v41 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v49 = (char *)v41 - v13;
  v14 = sub_2460D4B90();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2460D4C5C();
  if (v19)
  {
    v20 = v18;
    v21 = v19;
    swift_bridgeObjectRelease();
    v22 = HIBYTE(v21) & 0xF;
    if ((v21 & 0x2000000000000000) == 0)
      v22 = v20 & 0xFFFFFFFFFFFFLL;
    v23 = v22 == 0;
  }
  else
  {
    v23 = 1;
  }
  v47 = v23;
  v48 = a1;
  v24 = sub_2460D4B48();
  v25 = *(_QWORD *)(v24 + 16);
  if (!v25)
  {
    swift_bridgeObjectRelease();
LABEL_17:
    v32 = (uint64_t)v49;
    v33 = v50;
    if (v47)
      return 0;
    v34 = 0;
    if (!sub_2460D4C38())
      goto LABEL_22;
LABEL_19:
    sub_2460D4CA4();
    swift_release();
    goto LABEL_23;
  }
  v42 = v10;
  v43 = v3;
  v44 = v6;
  v45 = v2;
  v26 = v24 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  v27 = *(_QWORD *)(v15 + 72);
  v28 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
  v41[1] = v24;
  swift_bridgeObjectRetain();
  v51 = 0x80000002460D6C00;
  while (1)
  {
    v28(v17, v26, v14);
    v30 = sub_2460D4B84();
    if (!v31)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      goto LABEL_9;
    }
    if (v30 == 0xD000000000000012 && v31 == v51)
      break;
    v29 = sub_2460D5058();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    if ((v29 & 1) != 0)
      goto LABEL_20;
LABEL_9:
    v26 += v27;
    if (!--v25)
    {
      swift_bridgeObjectRelease_n();
      v6 = v44;
      v2 = v45;
      v10 = v42;
      v3 = v43;
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_20:
  swift_bridgeObjectRelease_n();
  v6 = v44;
  v2 = v45;
  v10 = v42;
  v3 = v43;
  v32 = (uint64_t)v49;
  v33 = v50;
  if (v47)
    return 0;
  v34 = 1;
  if (sub_2460D4C38())
    goto LABEL_19;
LABEL_22:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v32, 1, 1, v2);
LABEL_23:
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v33, *MEMORY[0x24BEA16B0], v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v33, 0, 1, v2);
  v35 = (uint64_t)&v6[*(int *)(v46 + 48)];
  sub_2460C784C(v32, (uint64_t)v6, &qword_257540740);
  sub_2460C784C(v33, v35, &qword_257540740);
  v36 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v36((uint64_t)v6, 1, v2) != 1)
  {
    sub_2460C784C((uint64_t)v6, (uint64_t)v10, &qword_257540740);
    if (v36(v35, 1, v2) != 1)
    {
      v37 = v41[0];
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(v41[0], v35, v2);
      sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
      v38 = sub_2460D4ED8();
      v39 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
      v39(v37, v2);
      sub_2460B2CC0(v50, &qword_257540740);
      sub_2460B2CC0(v32, &qword_257540740);
      v39((uint64_t)v10, v2);
      sub_2460B2CC0((uint64_t)v6, &qword_257540740);
      if ((v38 & 1) != 0)
        return v34;
      return 0;
    }
    sub_2460B2CC0(v33, &qword_257540740);
    sub_2460B2CC0(v32, &qword_257540740);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
LABEL_28:
    sub_2460B2CC0((uint64_t)v6, &qword_257541100);
    return 0;
  }
  sub_2460B2CC0(v33, &qword_257540740);
  sub_2460B2CC0(v32, &qword_257540740);
  if (v36(v35, 1, v2) != 1)
    goto LABEL_28;
  sub_2460B2CC0((uint64_t)v6, &qword_257540740);
  return v34;
}

uint64_t sub_2460BA50C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v3;
  uint64_t result;
  char v5;

  v3 = *(unsigned __int8 *)(v1 + 328);
  if (v3 == 3)
  {
    result = sub_2460BA554(v1, &v5);
    LOBYTE(v3) = v5;
    *(_BYTE *)(v1 + 328) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_2460BA554@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  char v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t result;
  char v42;
  uint64_t v43;
  char *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v44 = a2;
  v3 = sub_2460D4B90();
  v53 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v44 - v7;
  v52 = a1;
  v9 = sub_2460B4C5C();
  v10 = v9;
  if (v9 >> 62)
    goto LABEL_47;
  v11 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v11; v11 = sub_2460D5028())
  {
    v12 = 4;
    while (1)
    {
      v13 = v12 - 4;
      if ((v10 & 0xC000000000000001) != 0)
      {
        v14 = MEMORY[0x24954F500](v12 - 4, v10);
        v15 = v12 - 3;
        if (__OFADD__(v13, 1))
          break;
        goto LABEL_9;
      }
      v14 = *(_QWORD *)(v10 + 8 * v12);
      swift_retain();
      v15 = v12 - 3;
      if (__OFADD__(v13, 1))
        break;
LABEL_9:
      v16 = sub_2460CA084(MEMORY[0x24BEE4AF8], v14);
      swift_release();
      if (v16)
      {
        swift_bridgeObjectRelease_n();
        result = swift_release();
        v42 = 0;
        goto LABEL_56;
      }
      ++v12;
      if (v15 == v11)
        goto LABEL_11;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  v17 = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease_n();
  v18 = sub_2460B4C5C();
  v19 = sub_2460CCB08(v18, v17, (uint64_t (*)(uint64_t))sub_2460BAADC, 0);
  swift_bridgeObjectRelease();
  v54 = v17;
  if (v19 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_2460D5028();
    swift_bridgeObjectRelease();
    v20 = v53;
    if (v10)
      goto LABEL_13;
LABEL_50:
    swift_bridgeObjectRelease();
    v40 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_57;
    goto LABEL_51;
  }
  v10 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
  v20 = v53;
  if (!v10)
    goto LABEL_50;
LABEL_13:
  v21 = 0;
  v48 = v19;
  v49 = v19 & 0xC000000000000001;
  v45 = v19 + 32;
  v46 = v19 & 0xFFFFFFFFFFFFFF8;
  v47 = v10;
  do
  {
    while (1)
    {
      if (v49)
      {
        v22 = MEMORY[0x24954F500](v21, v19);
        v23 = __OFADD__(v21++, 1);
        if (v23)
          goto LABEL_44;
      }
      else
      {
        if (v21 >= *(_QWORD *)(v46 + 16))
          goto LABEL_46;
        v22 = *(_QWORD *)(v45 + 8 * v21);
        swift_retain();
        v23 = __OFADD__(v21++, 1);
        if (v23)
        {
LABEL_44:
          __break(1u);
          goto LABEL_45;
        }
      }
      v24 = sub_2460D4B48();
      v25 = *(_QWORD *)(v24 + 16);
      if (v25)
        break;
      swift_release();
      swift_bridgeObjectRelease();
      if (v21 == v10)
        goto LABEL_41;
    }
    v51 = v22;
    v52 = v21;
    v26 = v24 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
    v50 = v24;
    swift_bridgeObjectRetain();
    v27 = *(_QWORD *)(v20 + 72);
    v28 = *(void (**)(char *, unint64_t, uint64_t))(v20 + 16);
    v28(v8, v26, v3);
    while (1)
    {
      v31 = sub_2460D4B84();
      if (!v32)
      {
        v28(v6, (unint64_t)v8, v3);
LABEL_37:
        v38 = *(void (**)(char *, uint64_t))(v20 + 8);
        v38(v6, v3);
        v38(v8, v3);
        goto LABEL_24;
      }
      if (v31 == 0x616C50616964656DLL && v32 == 0xEF6E756F4E726579)
      {
        swift_bridgeObjectRelease();
        v28(v6, (unint64_t)v8, v3);
      }
      else
      {
        v33 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v28(v6, (unint64_t)v8, v3);
        if ((v33 & 1) == 0)
          goto LABEL_37;
      }
      sub_2460D4B78();
      v34 = sub_2460D4EF0();
      v36 = v35;
      swift_bridgeObjectRelease();
      if (qword_257540688 != -1)
        swift_once();
      if (v34 == sub_2460D4EF0() && v36 == v37)
        break;
      v29 = sub_2460D5058();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v20 = v53;
      v30 = *(void (**)(char *, uint64_t))(v53 + 8);
      v30(v6, v3);
      v30(v8, v3);
      if ((v29 & 1) != 0)
        goto LABEL_39;
LABEL_24:
      v26 += v27;
      if (!--v25)
      {
        swift_release();
        swift_bridgeObjectRelease_n();
        goto LABEL_40;
      }
      v28(v8, v26, v3);
    }
    swift_bridgeObjectRelease_n();
    v20 = v53;
    v39 = *(void (**)(char *, uint64_t))(v53 + 8);
    v39(v6, v3);
    v39(v8, v3);
LABEL_39:
    swift_bridgeObjectRelease_n();
    sub_2460D4FEC();
    sub_2460D5004();
    sub_2460D5010();
    sub_2460D4FF8();
LABEL_40:
    v10 = v47;
    v19 = v48;
    v21 = v52;
  }
  while (v52 != v47);
LABEL_41:
  swift_bridgeObjectRelease();
  v40 = v54;
  if (v54 < 0)
  {
LABEL_57:
    swift_bridgeObjectRetain();
    v43 = sub_2460D5028();
    swift_release();
    goto LABEL_53;
  }
LABEL_51:
  if ((v40 & 0x4000000000000000) != 0)
    goto LABEL_57;
  v43 = *(_QWORD *)(v40 + 16);
LABEL_53:
  result = swift_release();
  if (v43)
    v42 = 1;
  else
    v42 = 2;
LABEL_56:
  *v44 = v42;
  return result;
}

uint64_t sub_2460BAAD0(uint64_t a1)
{
  return sub_2460BB19C(a1, MEMORY[0x24BEA16E8]);
}

uint64_t sub_2460BAAE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 336);
  v2 = v1;
  if (v1 == 1)
  {
    v2 = sub_2460BAB3C();
    v3 = *(_QWORD *)(v0 + 336);
    *(_QWORD *)(v0 + 336) = v2;
    swift_retain();
    sub_2460C62E0(v3);
  }
  sub_2460C7790(v1);
  return v2;
}

uint64_t sub_2460BAB3C()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v0 = sub_2460B4C5C();
  v1 = v0;
  if (v0 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    v2 = sub_2460D5028();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      v3 = 4;
      v4 = MEMORY[0x24BEE4AF8];
      do
      {
        v5 = v3 - 4;
        if ((v1 & 0xC000000000000001) != 0)
        {
          v6 = MEMORY[0x24954F500](v3 - 4, v1);
          v7 = v3 - 3;
          if (__OFADD__(v5, 1))
            goto LABEL_13;
        }
        else
        {
          v6 = *(_QWORD *)(v1 + 8 * v3);
          swift_retain();
          v7 = v3 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        v8 = sub_2460CA098(v4, v6);
        swift_release();
        if (v8)
        {
          swift_bridgeObjectRelease_n();
          swift_retain();
          v10 = sub_2460D4C68();
          swift_release_n();
          return v10;
        }
        ++v3;
      }
      while (v7 != v2);
    }
  }
  swift_bridgeObjectRelease_n();
  return 0;
}

uint64_t sub_2460BAC74()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 344))
  {
    v1 = *(_QWORD *)(v0 + 344);
  }
  else
  {
    v1 = sub_2460BACD0(v0);
    *(_QWORD *)(v0 + 344) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BACD0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26[2];
  uint64_t v27;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541110);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v24 - v6;
  v27 = MEMORY[0x24BEE4B08];
  v8 = sub_2460B4C5C();
  v9 = sub_2460CCB08(v8, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460BB12C, 0);
  swift_bridgeObjectRelease();
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_2460D5028();
    v10 = result;
    if (result)
      goto LABEL_3;
LABEL_38:
    swift_bridgeObjectRelease_n();
    if (*(_QWORD *)(a1 + 48))
    {
      swift_retain();
      sub_2460D4E18();
      swift_release();
      if (v26[0])
      {
        v19 = sub_2460CA204(MEMORY[0x24BEE4AF8], v26[0]);
        swift_release();
        if (v19)
        {
          sub_2460C1A14(v26, 3);
          swift_release();
        }
      }
    }
    if (*(_QWORD *)(a1 + 64))
    {
      swift_retain();
      sub_2460D4E18();
      swift_release();
      if (v26[0])
      {
        sub_2460D4C5C();
        v21 = v20;
        swift_bridgeObjectRelease();
        if (v21)
          sub_2460C1A14(v26, 11);
        v22 = sub_2460D4C68();
        swift_release();
        if (v22)
          sub_2460C1A14(v26, 13);
        v23 = sub_2460D4C44();
        swift_release();
        if (v23)
          sub_2460C1A14(v26, 14);
        swift_release();
      }
    }
    return v27;
  }
  v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v10)
    goto LABEL_38;
LABEL_3:
  if (v10 >= 1)
  {
    v12 = 0;
    v13 = *MEMORY[0x24BEA1248];
    v25 = *MEMORY[0x24BEA11D0];
    while (1)
    {
      if ((v9 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v12, v9);
      else
        swift_retain();
      if (UsoEntity_common_MediaItem.isFromArtist()())
        break;
      if (UsoEntity_common_MediaItem.isFromSong()())
      {
        v14 = 1;
        goto LABEL_22;
      }
      if (UsoEntity_common_MediaItem.isFromAlbum()())
      {
        v14 = 2;
        goto LABEL_22;
      }
      if (UsoEntity_common_MediaItem.isRecommended()())
      {
        v14 = 7;
        goto LABEL_22;
      }
      if (UsoEntity_common_MediaItem.isAffinity()())
      {
        v14 = 6;
        goto LABEL_22;
      }
      if (UsoEntity_common_MediaItem.isDiscover()())
      {
        v14 = 8;
        goto LABEL_22;
      }
      if (UsoEntity_common_MediaItem.isAddToUnspecifiedPlaylist()())
      {
        v14 = 9;
        goto LABEL_22;
      }
      if (sub_2460D4BB4())
      {
        swift_release();
        if (sub_2460D4BB4())
        {
          v24 = v13;
          sub_2460D4CA4();
          swift_release();
          v15 = sub_2460D4CF8();
          v16 = *(_QWORD *)(v15 - 8);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v7, 1, v15) == 1)
            goto LABEL_29;
          sub_2460C784C((uint64_t)v7, (uint64_t)v5, &qword_257541110);
          v17 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v5, v15);
          if (v17 == v24)
          {
            v18 = 12;
            goto LABEL_34;
          }
          if (v17 == v25)
          {
            v18 = 10;
LABEL_34:
            sub_2460B2CC0((uint64_t)v7, &qword_257541110);
            sub_2460C1A14(v26, v18);
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v15);
LABEL_29:
            sub_2460B2CC0((uint64_t)v7, &qword_257541110);
          }
          swift_release();
          v13 = v24;
          goto LABEL_24;
        }
      }
LABEL_23:
      swift_release();
LABEL_24:
      if (v10 == ++v12)
        goto LABEL_38;
    }
    v14 = 0;
LABEL_22:
    sub_2460C1A14(v26, v14);
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460BB12C()
{
  uint64_t result;

  if (!UsoEntity_common_MediaItem.isFromArtist()()
    && !UsoEntity_common_MediaItem.isFromSong()()
    && !UsoEntity_common_MediaItem.isFromAlbum()()
    && !UsoEntity_common_MediaItem.isRecommended()()
    && !UsoEntity_common_MediaItem.isAffinity()()
    && !UsoEntity_common_MediaItem.isDiscover()()
    && !UsoEntity_common_MediaItem.isAddToUnspecifiedPlaylist()())
  {
    result = sub_2460D4BB4();
    if (!result)
      return result;
    swift_release();
  }
  return 1;
}

uint64_t sub_2460BB190(uint64_t a1)
{
  return sub_2460BB19C(a1, MEMORY[0x24BEA16D0]);
}

uint64_t sub_2460BB19C(uint64_t a1, unsigned int *a2)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  int v21;
  uint64_t *v22;
  char v23;
  void (*v24)(char *, uint64_t);
  uint64_t v26;

  v3 = sub_2460D4D34();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v26 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v26 - v17;
  if (sub_2460D4C38())
  {
    sub_2460D4CA4();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v18, 1, 1, v3);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v16, *a2, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v16, 0, 1, v3);
  v19 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_2460C784C((uint64_t)v18, (uint64_t)v9, &qword_257540740);
  sub_2460C784C((uint64_t)v16, v19, &qword_257540740);
  v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v20((uint64_t)v9, 1, v3) == 1)
  {
    sub_2460B2CC0((uint64_t)v16, &qword_257540740);
    sub_2460B2CC0((uint64_t)v18, &qword_257540740);
    v21 = v20(v19, 1, v3);
    if (v21 == 1)
      v22 = &qword_257540740;
    else
      v22 = &qword_257541100;
    if (v21 == 1)
      v23 = -1;
    else
      v23 = 0;
  }
  else
  {
    sub_2460C784C((uint64_t)v9, (uint64_t)v13, &qword_257540740);
    if (v20(v19, 1, v3) == 1)
    {
      sub_2460B2CC0((uint64_t)v16, &qword_257540740);
      sub_2460B2CC0((uint64_t)v18, &qword_257540740);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v3);
      v23 = 0;
      v22 = &qword_257541100;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v6, v19, v3);
      sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
      v23 = sub_2460D4ED8();
      v24 = *(void (**)(char *, uint64_t))(v4 + 8);
      v24(v6, v3);
      v22 = &qword_257540740;
      sub_2460B2CC0((uint64_t)v16, &qword_257540740);
      sub_2460B2CC0((uint64_t)v18, &qword_257540740);
      v24(v13, v3);
    }
  }
  sub_2460B2CC0((uint64_t)v9, v22);
  return v23 & 1;
}

uint64_t sub_2460BB4B8()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 352))
  {
    v1 = *(_QWORD *)(v0 + 352);
  }
  else
  {
    v1 = sub_2460BB514();
    *(_QWORD *)(v0 + 352) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BB514()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v0 = sub_2460B4C5C();
  v1 = sub_2460CCB08(v0, MEMORY[0x24BEE4AF8], sub_2460BB6B8, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v4, v1);
      else
        swift_retain();
      v7 = sub_2460D4C5C();
      v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_2460CBD64(0, v5[2] + 1, 1, v5);
        v11 = v5[2];
        v10 = v5[3];
        if (v11 >= v10 >> 1)
          v5 = sub_2460CBD64((_QWORD *)(v10 > 1), v11 + 1, 1, v5);
        v5[2] = v11 + 1;
        v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460BB6B8(uint64_t a1)
{
  return sub_2460BB6C4(a1, MEMORY[0x24BEA1680]);
}

uint64_t sub_2460BB6C4(uint64_t a1, unsigned int *a2)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  int v25;
  uint64_t *v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  char *v30;
  unsigned int *v31;

  v31 = a2;
  v2 = sub_2460D4D34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v30 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v30 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v30 - v15;
  v17 = sub_2460D4C5C();
  if (!v18)
    goto LABEL_7;
  v19 = v17;
  v20 = v18;
  swift_bridgeObjectRelease();
  v21 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0)
    v21 = v19 & 0xFFFFFFFFFFFFLL;
  if (v21)
  {
    if (sub_2460D4C38())
    {
      sub_2460D4CA4();
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v16, 1, 1, v2);
    }
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v14, *v31, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v14, 0, 1, v2);
    v23 = (uint64_t)&v7[*(int *)(v5 + 48)];
    sub_2460C784C((uint64_t)v16, (uint64_t)v7, &qword_257540740);
    sub_2460C784C((uint64_t)v14, v23, &qword_257540740);
    v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
    if (v24((uint64_t)v7, 1, v2) == 1)
    {
      sub_2460B2CC0((uint64_t)v14, &qword_257540740);
      sub_2460B2CC0((uint64_t)v16, &qword_257540740);
      v25 = v24(v23, 1, v2);
      if (v25 == 1)
        v26 = &qword_257540740;
      else
        v26 = &qword_257541100;
      if (v25 == 1)
        v22 = -1;
      else
        v22 = 0;
    }
    else
    {
      sub_2460C784C((uint64_t)v7, (uint64_t)v11, &qword_257540740);
      if (v24(v23, 1, v2) == 1)
      {
        sub_2460B2CC0((uint64_t)v14, &qword_257540740);
        sub_2460B2CC0((uint64_t)v16, &qword_257540740);
        v22 = 0;
        v27 = *(void (**)(char *, uint64_t))(v3 + 8);
        v26 = &qword_257541100;
      }
      else
      {
        v28 = v30;
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v30, v23, v2);
        sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
        v22 = sub_2460D4ED8();
        v27 = *(void (**)(char *, uint64_t))(v3 + 8);
        v27(v28, v2);
        v26 = &qword_257540740;
        sub_2460B2CC0((uint64_t)v14, &qword_257540740);
        sub_2460B2CC0((uint64_t)v16, &qword_257540740);
      }
      v27(v11, v2);
    }
    sub_2460B2CC0((uint64_t)v7, v26);
  }
  else
  {
LABEL_7:
    v22 = 0;
  }
  return v22 & 1;
}

uint64_t sub_2460BBA18()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 360))
  {
    v1 = *(_QWORD *)(v0 + 360);
  }
  else
  {
    v1 = sub_2460BBA74();
    *(_QWORD *)(v0 + 360) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BBA74()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v0 = sub_2460BBBE8();
  v1 = v0;
  if (!(v0 >> 62))
  {
    v2 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v4, v1);
      else
        swift_retain();
      v7 = sub_2460D4C5C();
      v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_2460CBD64(0, v5[2] + 1, 1, v5);
        v11 = v5[2];
        v10 = v5[3];
        if (v11 >= v10 >> 1)
          v5 = sub_2460CBD64((_QWORD *)(v10 > 1), v11 + 1, 1, v5);
        v5[2] = v11 + 1;
        v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460BBBE8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  if (*(_QWORD *)(v0 + 368))
  {
    v1 = *(_QWORD *)(v0 + 368);
  }
  else
  {
    v2 = sub_2460B4C5C();
    v1 = sub_2460CCB08(v2, MEMORY[0x24BEE4AF8], sub_2460C36F0, 0);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 368) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BBC74()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 376))
  {
    v1 = *(_QWORD *)(v0 + 376);
  }
  else
  {
    v1 = sub_2460C58B0();
    *(_QWORD *)(v0 + 376) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BBCD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 392);
  v4 = v2;
  if (v3 != 1)
    goto LABEL_11;
  v5 = sub_2460B57DC();
  if (!(v5 >> 62))
  {
    result = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_4;
LABEL_9:
    swift_bridgeObjectRelease();
    v4 = 0;
    v8 = 0;
    goto LABEL_10;
  }
  result = sub_2460D5028();
  if (!result)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24954F500](0, v5);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_7:
    swift_bridgeObjectRelease();
    v4 = sub_2460D4BF0();
    v8 = v7;
    swift_release();
LABEL_10:
    v9 = *(_QWORD *)(v1 + 384);
    v10 = *(_QWORD *)(v1 + 392);
    *(_QWORD *)(v1 + 384) = v4;
    *(_QWORD *)(v1 + 392) = v8;
    swift_bridgeObjectRetain();
    sub_2460C5A54(v9, v10);
LABEL_11:
    sub_2460C5A68(v2, v3);
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460BBDE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 400);
  v3 = *(_QWORD *)(v0 + 408);
  v4 = v2;
  if (v3 != 1)
    goto LABEL_11;
  v5 = sub_2460B57DC();
  if (!(v5 >> 62))
  {
    result = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_4;
LABEL_9:
    swift_bridgeObjectRelease();
    v4 = 0;
    v8 = 0;
    goto LABEL_10;
  }
  result = sub_2460D5028();
  if (!result)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24954F500](0, v5);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_7:
    swift_bridgeObjectRelease();
    v4 = UsoEntity_common_App.bundleIdentifier.getter();
    v8 = v7;
    swift_release();
LABEL_10:
    v9 = *(_QWORD *)(v1 + 400);
    v10 = *(_QWORD *)(v1 + 408);
    *(_QWORD *)(v1 + 400) = v4;
    *(_QWORD *)(v1 + 408) = v8;
    swift_bridgeObjectRetain();
    sub_2460C5A54(v9, v10);
LABEL_11:
    sub_2460C5A68(v2, v3);
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460BBF00()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 416))
  {
    v1 = *(_QWORD *)(v0 + 416);
  }
  else
  {
    v1 = sub_2460BBF5C();
    *(_QWORD *)(v0 + 416) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BBF5C()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v0 = sub_2460B4C5C();
  v1 = sub_2460CCB08(v0, MEMORY[0x24BEE4AF8], sub_2460BC100, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v4, v1);
      else
        swift_retain();
      v7 = sub_2460D4C5C();
      v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_2460CBD64(0, v5[2] + 1, 1, v5);
        v11 = v5[2];
        v10 = v5[3];
        if (v11 >= v10 >> 1)
          v5 = sub_2460CBD64((_QWORD *)(v10 > 1), v11 + 1, 1, v5);
        v5[2] = v11 + 1;
        v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460BC100(uint64_t a1)
{
  return sub_2460BB6C4(a1, MEMORY[0x24BEA1620]);
}

uint64_t sub_2460BC10C()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 424))
  {
    v1 = *(_QWORD *)(v0 + 424);
  }
  else
  {
    v1 = sub_2460C5A7C();
    *(_QWORD *)(v0 + 424) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BC168()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 432);
  v2 = *(_QWORD *)(v0 + 440);
  v3 = v1;
  if (v2 == 1)
  {
    v3 = sub_2460C5C20(v0, 11);
    v4 = *(_QWORD *)(v0 + 432);
    v5 = *(_QWORD *)(v0 + 440);
    *(_QWORD *)(v0 + 432) = v3;
    *(_QWORD *)(v0 + 440) = v6;
    swift_bridgeObjectRetain();
    sub_2460C5A54(v4, v5);
  }
  sub_2460C5A68(v1, v2);
  return v3;
}

uint64_t sub_2460BC1F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 448);
  v2 = *(_QWORD *)(v0 + 456);
  v3 = v1;
  if (v2 == 1)
  {
    v3 = sub_2460C5C20(v0, 12);
    v4 = *(_QWORD *)(v0 + 448);
    v5 = *(_QWORD *)(v0 + 456);
    *(_QWORD *)(v0 + 448) = v3;
    *(_QWORD *)(v0 + 456) = v6;
    swift_bridgeObjectRetain();
    sub_2460C5A54(v4, v5);
  }
  sub_2460C5A68(v1, v2);
  return v3;
}

uint64_t sub_2460BC278()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 464))
  {
    v1 = *(_QWORD *)(v0 + 464);
  }
  else
  {
    v1 = sub_2460C613C();
    *(_QWORD *)(v0 + 464) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BC2D4()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 472))
  {
    v1 = *(_QWORD *)(v0 + 472);
  }
  else
  {
    v1 = sub_2460BC330();
    *(_QWORD *)(v0 + 472) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BC330()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v0 = sub_2460B4C5C();
  v1 = sub_2460CCB08(v0, MEMORY[0x24BEE4AF8], sub_2460BC4D4, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v4, v1);
      else
        swift_retain();
      v7 = sub_2460D4C5C();
      v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_2460CBD64(0, v5[2] + 1, 1, v5);
        v11 = v5[2];
        v10 = v5[3];
        if (v11 >= v10 >> 1)
          v5 = sub_2460CBD64((_QWORD *)(v10 > 1), v11 + 1, 1, v5);
        v5[2] = v11 + 1;
        v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460BC4D4(uint64_t a1)
{
  return sub_2460BB6C4(a1, MEMORY[0x24BEA1638]);
}

uint64_t sub_2460BC4E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v3;
  uint64_t result;
  char v5;

  v3 = *(unsigned __int8 *)(v1 + 480);
  if (v3 == 12)
  {
    result = sub_2460BC528(&v5);
    LOBYTE(v3) = v5;
    *(_BYTE *)(v1 + 480) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_2460BC528@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  char v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  unint64_t v62;
  unint64_t v63;
  _BYTE *v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD *v68;
  char *v69;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;

  v64 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540720);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (uint64_t)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (_BYTE **)((char *)&v64 - v5);
  v7 = sub_2460D4B90();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v75 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v64 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v64 - v14;
  v16 = sub_2460B4C5C();
  v17 = sub_2460CCB08(v16, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460BAADC, 0);
  swift_bridgeObjectRelease();
  v70 = v17;
  if (v17 >> 62)
  {
LABEL_74:
    swift_bridgeObjectRetain();
    result = sub_2460D5028();
    v18 = result;
  }
  else
  {
    v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v20 = v75;
  v66 = v6;
  v67 = v4;
  if (v18)
  {
    if (v18 < 1)
    {
      __break(1u);
      return result;
    }
    v21 = 0;
    v22 = v70 & 0xC000000000000001;
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if (v22)
        MEMORY[0x24954F500](v21, v70);
      else
        swift_retain();
      v23 = sub_2460D4B48();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = sub_2460CBF7C(0, v6[2] + 1, 1, v6);
      v24 = v6;
      v25 = v6[2];
      v26 = v24;
      v27 = v24[3];
      v4 = v25 + 1;
      if (v25 >= v27 >> 1)
        v26 = sub_2460CBF7C((_QWORD *)(v27 > 1), v25 + 1, 1, v26);
      ++v21;
      v26[2] = v4;
      v28 = &v26[v25];
      v6 = v26;
      v28[4] = v23;
      v20 = v75;
    }
    while (v18 != v21);
  }
  else
  {
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v76 = (char *)MEMORY[0x24BEE4AF8];
  v69 = (char *)v6[2];
  if (v69)
  {
    v29 = 0;
    v68 = v6 + 4;
    v73 = "";
    v74 = (char *)0x80000002460D69F0;
    v65 = v6;
    while (1)
    {
      if ((unint64_t)v29 >= v6[2])
      {
        __break(1u);
        goto LABEL_74;
      }
      v30 = v68[(_QWORD)v29];
      v31 = *(_QWORD *)(v30 + 16);
      if (!v31)
        goto LABEL_20;
      v71 = v68[(_QWORD)v29];
      v72 = v29;
      v32 = v30 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
      swift_bridgeObjectRetain_n();
      v33 = *(_QWORD *)(v8 + 72);
      v34 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
      v34(v15, v32, v7);
      while (1)
      {
        v36 = sub_2460D4B84();
        if (!v37)
        {
          v34(v13, (uint64_t)v15, v7);
LABEL_25:
          v35 = *(void (**)(char *, uint64_t))(v8 + 8);
          v35(v13, v7);
          v35(v15, v7);
          goto LABEL_26;
        }
        if (v36 == 0xD000000000000012 && v37 == v74)
        {
          swift_bridgeObjectRelease();
          v34(v13, (uint64_t)v15, v7);
        }
        else
        {
          v4 = sub_2460D5058();
          swift_bridgeObjectRelease();
          v34(v13, (uint64_t)v15, v7);
          if ((v4 & 1) == 0)
            goto LABEL_25;
        }
        if (!sub_2460D4B78() && v38 == 0xE000000000000000)
        {
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
        v4 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v39 = *(void (**)(char *, uint64_t))(v8 + 8);
        v39(v13, v7);
        v39(v15, v7);
        if ((v4 & 1) == 0)
          break;
LABEL_26:
        v32 += v33;
        if (!--v31)
        {
          swift_bridgeObjectRelease_n();
          v20 = v75;
          v6 = v65;
          goto LABEL_19;
        }
        v34(v15, v32, v7);
      }
      v4 = v71;
      swift_bridgeObjectRelease();
      v40 = v76;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2460CC498(0, *((_QWORD *)v40 + 2) + 1, 1);
        v40 = v76;
      }
      v6 = v65;
      v42 = *((_QWORD *)v40 + 2);
      v41 = *((_QWORD *)v40 + 3);
      if (v42 >= v41 >> 1)
      {
        sub_2460CC498(v41 > 1, v42 + 1, 1);
        v40 = v76;
      }
      *((_QWORD *)v40 + 2) = v42 + 1;
      *(_QWORD *)&v40[8 * v42 + 32] = v4;
      v20 = v75;
LABEL_19:
      v29 = v72;
LABEL_20:
      if (++v29 == v69)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v43 = v76;
        goto LABEL_44;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v43 = (char *)MEMORY[0x24BEE4AF8];
LABEL_44:
  v45 = (uint64_t)v66;
  v44 = v67;
  v71 = *((_QWORD *)v43 + 2);
  if (v71)
  {
    v69 = v43;
    v70 = (unint64_t)(v43 + 32);
    swift_retain();
    v46 = 0;
    v47 = (char *)MEMORY[0x24BEE4AF8];
    v74 = "";
    v73 = (char *)0x80000002460D69F0;
    while (1)
    {
      v48 = *(_QWORD *)(v70 + 8 * v46);
      v49 = *(_QWORD *)(v48 + 16);
      if (!v49)
      {
        swift_bridgeObjectRetain();
        v57 = 1;
        goto LABEL_61;
      }
      v72 = v47;
      v50 = v48 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
      swift_bridgeObjectRetain_n();
      v51 = *(_QWORD *)(v8 + 72);
      v52 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
      v52(v20, v50, v7);
      while (1)
      {
        v55 = sub_2460D4B84();
        if (!v56)
          goto LABEL_51;
        if (v55 == 0xD000000000000012 && v56 == v73)
          break;
        v53 = sub_2460D5058();
        swift_bridgeObjectRelease();
        if ((v53 & 1) != 0)
          goto LABEL_59;
LABEL_51:
        v54 = v75;
        (*(void (**)(char *, uint64_t))(v8 + 8))(v75, v7);
        v50 += v51;
        if (!--v49)
        {
          swift_bridgeObjectRelease();
          v57 = 1;
          v45 = (uint64_t)v66;
          v44 = v67;
          goto LABEL_60;
        }
        v52(v54, v50, v7);
      }
      swift_bridgeObjectRelease();
LABEL_59:
      swift_bridgeObjectRelease();
      v45 = (uint64_t)v66;
      (*(void (**)(_QWORD *, char *, uint64_t))(v8 + 32))(v66, v75, v7);
      v57 = 0;
      v44 = v67;
LABEL_60:
      v47 = v72;
LABEL_61:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v45, v57, 1, v7);
      sub_2460C784C(v45, v44, &qword_257540720);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v44, 1, v7) == 1)
      {
        sub_2460B2CC0(v44, &qword_257540720);
        v58 = 0;
        v59 = 0;
      }
      else
      {
        v58 = sub_2460D4B78();
        v59 = v60;
        (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v44, v7);
      }
      static CommonAudio.Decade.from(_:)(v58, v59, (char *)&v76);
      swift_bridgeObjectRelease();
      sub_2460B2CC0(v45, &qword_257540720);
      swift_bridgeObjectRelease();
      v61 = (char)v76;
      if (v76 != 11)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v47 = sub_2460CC088(0, *((_QWORD *)v47 + 2) + 1, 1, v47);
        v63 = *((_QWORD *)v47 + 2);
        v62 = *((_QWORD *)v47 + 3);
        if (v63 >= v62 >> 1)
          v47 = sub_2460CC088((char *)(v62 > 1), v63 + 1, 1, v47);
        *((_QWORD *)v47 + 2) = v63 + 1;
        v47[v63 + 32] = v61;
      }
      ++v46;
      v20 = v75;
      if (v46 == v71)
      {
        swift_release_n();
        if (*((_QWORD *)v47 + 2))
          goto LABEL_70;
LABEL_72:
        result = swift_bridgeObjectRelease();
        *v64 = 11;
        return result;
      }
    }
  }
  swift_release();
  v47 = (char *)MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    goto LABEL_72;
LABEL_70:
  *v64 = v47[32];
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460BCD38@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v3;
  uint64_t result;
  char v5;

  v3 = *(unsigned __int8 *)(v1 + 481);
  if (v3 == 10)
  {
    result = sub_2460BCD80(&v5);
    LOBYTE(v3) = v5;
    *(_BYTE *)(v1 + 481) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_2460BCD80@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
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
  unint64_t v19;
  uint64_t result;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410F8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v25 - v6;
  v8 = sub_2460B4C5C();
  v9 = v8;
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_2460D5028();
    if (v10)
      goto LABEL_3;
LABEL_35:
    swift_bridgeObjectRelease_n();
    goto LABEL_36;
  }
  v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v10)
    goto LABEL_35;
LABEL_3:
  v25[0] = (uint64_t)v5;
  v11 = a1;
  v12 = 4;
  v13 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v14 = v12 - 4;
    if ((v9 & 0xC000000000000001) != 0)
    {
      v15 = MEMORY[0x24954F500](v12 - 4, v9);
      v16 = v15;
      a1 = (char *)(v12 - 3);
      if (__OFADD__(v14, 1))
        goto LABEL_28;
    }
    else
    {
      v16 = *(_QWORD *)(v9 + 8 * v12);
      LODWORD(v15) = swift_retain();
      a1 = (char *)(v12 - 3);
      if (__OFADD__(v14, 1))
      {
LABEL_28:
        __break(1u);
LABEL_29:
        if ((_DWORD)v15 == *MEMORY[0x24BEA1830])
        {
          v22 = 1;
          goto LABEL_38;
        }
        if ((_DWORD)v15 != *MEMORY[0x24BEA1838])
        {
          if ((_DWORD)v15 == *MEMORY[0x24BEA1858])
          {
            v22 = 5;
          }
          else if ((_DWORD)v15 == *MEMORY[0x24BEA1840])
          {
            v22 = 2;
          }
          else if ((_DWORD)v15 == *MEMORY[0x24BEA1868])
          {
            v22 = 7;
          }
          else
          {
            if ((_DWORD)v15 != *MEMORY[0x24BEA1870])
            {
              (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v25[0], v9);
              goto LABEL_37;
            }
            v22 = 6;
          }
LABEL_38:
          *a1 = v22;
          return sub_2460B2CC0((uint64_t)v7, &qword_2575410F8);
        }
LABEL_27:
        v22 = 0;
        goto LABEL_38;
      }
    }
    v17 = sub_2460CA218(v13, v16);
    swift_release();
    if (v17)
      break;
    ++v12;
    if (a1 == (char *)v10)
    {
      swift_bridgeObjectRelease_n();
      a1 = v11;
      goto LABEL_36;
    }
  }
  swift_bridgeObjectRelease_n();
  swift_retain();
  v18 = sub_2460D4BD8();
  swift_release();
  a1 = v11;
  if (!v18 || (v19 = sub_2460D4DE8(), result = swift_release(), !v19))
  {
LABEL_23:
    swift_release();
    goto LABEL_36;
  }
  if (!(v19 >> 62))
  {
    if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_16;
LABEL_46:
    swift_release();
    swift_bridgeObjectRelease();
LABEL_36:
    v23 = sub_2460D4D64();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v7, 1, 1, v23);
LABEL_37:
    v22 = 9;
    goto LABEL_38;
  }
  swift_bridgeObjectRetain();
  v24 = sub_2460D5028();
  result = swift_bridgeObjectRelease();
  if (!v24)
    goto LABEL_46;
LABEL_16:
  if ((v19 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24954F500](0, v19);
LABEL_19:
    swift_bridgeObjectRelease();
    sub_2460D4B9C();
    swift_release();
    if (v25[1])
    {
      sub_2460D4CA4();
      swift_release();
      swift_release();
      v9 = sub_2460D4D64();
      v14 = *(_QWORD *)(v9 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v7, 1, v9) == 1)
        goto LABEL_37;
      v21 = v25[0];
      sub_2460C784C((uint64_t)v7, v25[0], &qword_2575410F8);
      LODWORD(v15) = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 88))(v21, v9);
      if ((_DWORD)v15 == *MEMORY[0x24BEA1850])
      {
        v22 = 4;
        goto LABEL_38;
      }
      if ((_DWORD)v15 == *MEMORY[0x24BEA1848])
      {
        v22 = 3;
        goto LABEL_38;
      }
      if ((_DWORD)v15 == *MEMORY[0x24BEA1860])
        goto LABEL_27;
      goto LABEL_29;
    }
    goto LABEL_23;
  }
  if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460BD1AC()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = sub_2460D4BD8();
  if (!result)
    return result;
  v1 = sub_2460D4DE8();
  result = swift_release();
  if (!v1)
    return 0;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_2460D5028();
    result = swift_bridgeObjectRelease();
    if (v2)
      goto LABEL_5;
    goto LABEL_11;
  }
  if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_5:
  if ((v1 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24954F500](0, v1);
  }
  else
  {
    if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  sub_2460D4B9C();
  swift_release();
  result = v3;
  if (v3)
  {
    swift_release();
    return 1;
  }
  return result;
}

uint64_t sub_2460BD2A0()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 488))
  {
    v1 = *(_QWORD *)(v0 + 488);
  }
  else
  {
    v1 = sub_2460BD2FC();
    *(_QWORD *)(v0 + 488) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BD2FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, unint64_t);
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int (*v43)(uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char v47;
  void (*v48)(uint64_t, unint64_t);
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v54;
  char *v55;
  char v56;
  void (*v57)(char *, uint64_t);
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t result;
  uint64_t v76;
  char *v77;
  char *v78;
  unint64_t v79;
  char *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unsigned int v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;

  v0 = sub_2460D4CC8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v77 = (char *)&v76 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410C0);
  MEMORY[0x24BDAC7A8](v84);
  v96 = (uint64_t)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410C8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v83 = (uint64_t)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v93 = (uint64_t)&v76 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v86 = (uint64_t)&v76 - v9;
  v10 = sub_2460D4CB0();
  v94 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v78 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410D0);
  MEMORY[0x24BDAC7A8](v91);
  v13 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410D8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v76 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v97 = (char *)&v76 - v21;
  v22 = sub_2460B4C5C();
  v23 = sub_2460CCB08(v22, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460BE118, 0);
  swift_bridgeObjectRelease();
  if (v23 >> 62)
  {
LABEL_83:
    swift_bridgeObjectRetain_n();
    v24 = sub_2460D5028();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v85 = v23;
  if (!v24)
  {
    v17 = (char *)MEMORY[0x24BEE4B08];
LABEL_79:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v17;
  }
  v80 = v17;
  v98 = v13;
  v23 = 0;
  v90 = v85 & 0xC000000000000001;
  v79 = v85 + 32;
  v88 = *MEMORY[0x24BEA0C40];
  v81 = *MEMORY[0x24BEA0C90];
  v17 = (char *)MEMORY[0x24BEE4B08];
  v25 = &qword_2575410D8;
  v95 = v0;
  v82 = v1;
  v87 = v10;
  v1 = v94;
  v92 = v20;
  v13 = v97;
  v89 = v24;
  while (1)
  {
    if (v90)
    {
      v0 = MEMORY[0x24954F500](v23, v85);
      v27 = __OFADD__(v23++, 1);
      if (v27)
        goto LABEL_80;
    }
    else
    {
      v0 = *(_QWORD *)(v79 + 8 * v23);
      swift_retain();
      v27 = __OFADD__(v23++, 1);
      if (v27)
      {
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
LABEL_82:
        __break(1u);
        goto LABEL_83;
      }
    }
    v28 = v25;
    if (sub_2460D4BA8())
    {
      sub_2460D4CA4();
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, unint64_t))(v1 + 56))(v13, 1, 1, v10);
    }
    v29 = v13;
    (*(void (**)(char *, _QWORD, unint64_t))(v1 + 104))(v20, v88, v10);
    (*(void (**)(char *, _QWORD, uint64_t, unint64_t))(v1 + 56))(v20, 0, 1, v10);
    v30 = (uint64_t)v98;
    v31 = (uint64_t)&v98[*(int *)(v91 + 48)];
    v32 = (uint64_t)v29;
    v25 = v28;
    sub_2460C784C(v32, (uint64_t)v98, v28);
    sub_2460C784C((uint64_t)v20, v31, v28);
    v33 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v1 + 48);
    v34 = v33(v30, 1, v10);
    v99 = v0;
    if (v34 == 1)
    {
      if (v33(v31, 1, v10) == 1)
      {
        sub_2460B2CC0((uint64_t)v98, v28);
        sub_2460B2CC0((uint64_t)v20, v28);
        v13 = v97;
        sub_2460B2CC0((uint64_t)v97, v28);
LABEL_34:
        sub_2460D507C();
        swift_bridgeObjectRetain();
        sub_2460D4EFC();
        v50 = sub_2460D5094();
        v51 = -1 << v17[32];
        v10 = v50 & ~v51;
        if (((*(_QWORD *)&v17[((v10 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v10) & 1) != 0)
        {
          v0 = ~v51;
          while ((*(_BYTE *)(*((_QWORD *)v17 + 6) + v10) & 1) != 0)
          {
            v52 = sub_2460D5058();
            swift_bridgeObjectRelease();
            if ((v52 & 1) != 0)
              goto LABEL_5;
            v10 = (v10 + 1) & v0;
            if (((*(_QWORD *)&v17[((v10 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v10) & 1) == 0)
              goto LABEL_39;
          }
LABEL_53:
          swift_bridgeObjectRelease();
LABEL_5:
          swift_bridgeObjectRelease();
          goto LABEL_6;
        }
LABEL_39:
        swift_bridgeObjectRelease();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v100 = v17;
        if (*((_QWORD *)v17 + 3) <= *((_QWORD *)v17 + 2))
        {
          if (isUniquelyReferenced_nonNull_native)
            sub_2460C23EC();
          else
            sub_2460C3428();
          v17 = v100;
          sub_2460D507C();
          sub_2460D4EFC();
          v66 = sub_2460D5094();
          v67 = -1 << v17[32];
          v10 = v66 & ~v67;
          if (((*(_QWORD *)&v17[((v10 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v10) & 1) != 0)
          {
            v0 = ~v67;
            while ((*(_BYTE *)(*((_QWORD *)v17 + 6) + v10) & 1) != 0)
            {
              v68 = sub_2460D5058();
              swift_bridgeObjectRelease();
              if ((v68 & 1) != 0)
                goto LABEL_85;
              v10 = (v10 + 1) & v0;
              if (((*(_QWORD *)&v17[((v10 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v10) & 1) == 0)
              {
                v1 = v94;
                v26 = v89;
                goto LABEL_65;
              }
            }
            goto LABEL_84;
          }
          v1 = v94;
          v26 = v89;
        }
        else
        {
          v1 = v94;
          v26 = v89;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_2460C2E28();
            v26 = v89;
            v17 = v100;
          }
        }
LABEL_65:
        *(_QWORD *)&v17[((v10 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] |= 1 << v10;
        *(_BYTE *)(*((_QWORD *)v17 + 6) + v10) = 0;
        v69 = *((_QWORD *)v17 + 2);
        v27 = __OFADD__(v69, 1);
        v70 = v69 + 1;
        if (v27)
          goto LABEL_81;
LABEL_77:
        *((_QWORD *)v17 + 2) = v70;
        swift_release();
        swift_bridgeObjectRelease();
        v10 = v87;
        goto LABEL_7;
      }
      goto LABEL_21;
    }
    v35 = (uint64_t)v80;
    sub_2460C784C(v30, (uint64_t)v80, v28);
    if (v33(v31, 1, v10) == 1)
    {
      (*(void (**)(uint64_t, unint64_t))(v94 + 8))(v35, v10);
      v20 = v92;
LABEL_21:
      sub_2460B2CC0((uint64_t)v98, &qword_2575410D0);
      sub_2460B2CC0((uint64_t)v20, v28);
      sub_2460B2CC0((uint64_t)v97, v28);
      goto LABEL_22;
    }
    v45 = v94;
    v46 = v78;
    (*(void (**)(char *, uint64_t, unint64_t))(v94 + 32))(v78, v31, v10);
    sub_2460C780C(&qword_2575410E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA0C60], MEMORY[0x24BEA0C70]);
    v47 = sub_2460D4ED8();
    v48 = *(void (**)(uint64_t, unint64_t))(v45 + 8);
    v48(v35, v10);
    v49 = v46;
    v25 = v28;
    v48((uint64_t)v49, v10);
    sub_2460B2CC0(v30, v28);
    v20 = v92;
    sub_2460B2CC0((uint64_t)v92, v28);
    v13 = v97;
    sub_2460B2CC0((uint64_t)v97, v28);
    if ((v47 & 1) != 0)
      goto LABEL_34;
LABEL_22:
    if (sub_2460D4BD8() && (v36 = sub_2460D4DC4(), swift_release(), v36))
    {
      v37 = v86;
      sub_2460D4CA4();
      swift_release();
      v38 = v82;
      v39 = v95;
    }
    else
    {
      v38 = v82;
      v37 = v86;
      v39 = v95;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56))(v86, 1, 1, v95);
    }
    v40 = v93;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v38 + 104))(v93, v81, v39);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v38 + 56))(v40, 0, 1, v39);
    v41 = v96;
    v42 = v96 + *(int *)(v84 + 48);
    sub_2460C784C(v37, v96, &qword_2575410C8);
    sub_2460C784C(v40, v42, &qword_2575410C8);
    v43 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48);
    v44 = v41;
    v0 = v95;
    if (v43(v44, 1, v95) == 1)
      break;
    sub_2460C784C(v96, v83, &qword_2575410C8);
    if (v43(v42, 1, v0) == 1)
    {
      sub_2460B2CC0(v93, &qword_2575410C8);
      sub_2460B2CC0(v86, &qword_2575410C8);
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v83, v0);
      goto LABEL_31;
    }
    v54 = v83;
    v55 = v77;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v77, v42, v0);
    sub_2460C780C(&qword_2575410E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA0C98], MEMORY[0x24BEA0CA8]);
    v56 = sub_2460D4ED8();
    v57 = *(void (**)(char *, uint64_t))(v38 + 8);
    v58 = v55;
    v25 = v28;
    v59 = v96;
    v0 = (uint64_t)v92;
    v60 = v93;
    v57(v58, v95);
    sub_2460B2CC0(v60, &qword_2575410C8);
    sub_2460B2CC0(v86, &qword_2575410C8);
    v61 = v54;
    v13 = v97;
    v57((char *)v61, v95);
    v20 = (char *)v0;
    sub_2460B2CC0(v59, &qword_2575410C8);
    if ((v56 & 1) != 0)
      goto LABEL_43;
LABEL_6:
    swift_release();
    v10 = v87;
    v1 = v94;
    v26 = v89;
LABEL_7:
    if (v23 == v26)
      goto LABEL_79;
  }
  sub_2460B2CC0(v93, &qword_2575410C8);
  sub_2460B2CC0(v37, &qword_2575410C8);
  if (v43(v42, 1, v0) != 1)
  {
LABEL_31:
    sub_2460B2CC0(v96, &qword_2575410C0);
    v20 = v92;
    v13 = v97;
    goto LABEL_6;
  }
  sub_2460B2CC0(v96, &qword_2575410C8);
  v20 = v92;
  v13 = v97;
LABEL_43:
  sub_2460D507C();
  swift_bridgeObjectRetain();
  sub_2460D4EFC();
  v62 = sub_2460D5094();
  v63 = -1 << v17[32];
  v10 = v62 & ~v63;
  if (((*(_QWORD *)&v17[((v10 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v10) & 1) != 0)
  {
    v0 = ~v63;
    while (*(_BYTE *)(*((_QWORD *)v17 + 6) + v10) != 1)
    {
      v64 = sub_2460D5058();
      swift_bridgeObjectRelease();
      if ((v64 & 1) != 0)
        goto LABEL_5;
      v10 = (v10 + 1) & v0;
      if (((*(_QWORD *)&v17[((v10 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v10) & 1) == 0)
        goto LABEL_48;
    }
    goto LABEL_53;
  }
LABEL_48:
  swift_bridgeObjectRelease();
  v65 = swift_isUniquelyReferenced_nonNull_native();
  v100 = v17;
  if (*((_QWORD *)v17 + 3) > *((_QWORD *)v17 + 2))
  {
    v1 = v94;
    v26 = v89;
    if ((v65 & 1) == 0)
    {
      sub_2460C2E28();
      v26 = v89;
      v17 = v100;
    }
    goto LABEL_76;
  }
  if (v65)
    sub_2460C23EC();
  else
    sub_2460C3428();
  v17 = v100;
  sub_2460D507C();
  sub_2460D4EFC();
  v71 = sub_2460D5094();
  v72 = -1 << v17[32];
  v10 = v71 & ~v72;
  if (((*(_QWORD *)&v17[((v10 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v10) & 1) == 0)
  {
    v1 = v94;
    v26 = v89;
LABEL_76:
    *(_QWORD *)&v17[((v10 >> 3) & 0xFFFFFFFFFFFFFF8) + 56] |= 1 << v10;
    *(_BYTE *)(*((_QWORD *)v17 + 6) + v10) = 1;
    v74 = *((_QWORD *)v17 + 2);
    v27 = __OFADD__(v74, 1);
    v70 = v74 + 1;
    if (v27)
      goto LABEL_82;
    goto LABEL_77;
  }
  v0 = ~v72;
  while (*(_BYTE *)(*((_QWORD *)v17 + 6) + v10) != 1)
  {
    v73 = sub_2460D5058();
    swift_bridgeObjectRelease();
    if ((v73 & 1) != 0)
      goto LABEL_85;
    v10 = (v10 + 1) & v0;
    if (((*(_QWORD *)&v17[((v10 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v10) & 1) == 0)
    {
      v1 = v94;
      v26 = v89;
      goto LABEL_76;
    }
  }
LABEL_84:
  swift_bridgeObjectRelease();
LABEL_85:
  result = sub_2460D5070();
  __break(1u);
  return result;
}

BOOL sub_2460BE118()
{
  return UsoEntity_common_MediaItem.isMoreOf()() || UsoEntity_common_MediaItem.isDifferentThan()();
}

uint64_t sub_2460BE14C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v3;
  uint64_t result;
  char v5;

  v3 = *(unsigned __int8 *)(v1 + 496);
  if (v3 == 3)
  {
    result = sub_2460BE194(&v5);
    LOBYTE(v3) = v5;
    *(_BYTE *)(v1 + 496) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_2460BE194@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
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
  int v20;
  char v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410B8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v24 - v6;
  v8 = sub_2460B4C5C();
  v9 = v8;
  if (!(v8 >> 62))
  {
    v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v10)
      goto LABEL_3;
LABEL_22:
    swift_bridgeObjectRelease_n();
LABEL_23:
    v22 = sub_2460D4D4C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v7, 1, 1, v22);
    goto LABEL_24;
  }
LABEL_21:
  swift_bridgeObjectRetain();
  v10 = sub_2460D5028();
  if (!v10)
    goto LABEL_22;
LABEL_3:
  v25 = v5;
  v5 = a1;
  v11 = 4;
  v12 = MEMORY[0x24BEE4AF8];
  while (1)
  {
    v13 = v11 - 4;
    if ((v9 & 0xC000000000000001) != 0)
    {
      v14 = MEMORY[0x24954F500](v11 - 4, v9);
      a1 = (char *)(v11 - 3);
      if (__OFADD__(v13, 1))
        goto LABEL_20;
    }
    else
    {
      v14 = *(_QWORD *)(v9 + 8 * v11);
      swift_retain();
      a1 = (char *)(v11 - 3);
      if (__OFADD__(v13, 1))
      {
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
    }
    v15 = sub_2460CA394(v12, v14);
    swift_release();
    if (v15)
      break;
    ++v11;
    if (a1 == (char *)v10)
    {
      swift_bridgeObjectRelease_n();
      a1 = v5;
      goto LABEL_23;
    }
  }
  swift_bridgeObjectRelease_n();
  swift_retain();
  v16 = sub_2460D4BCC();
  swift_release();
  a1 = v5;
  if (!v16)
  {
    swift_release();
    goto LABEL_23;
  }
  sub_2460D4CA4();
  swift_release();
  swift_release();
  v17 = sub_2460D4D4C();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v7, 1, v17) == 1)
    goto LABEL_24;
  v19 = (uint64_t)v25;
  sub_2460C784C((uint64_t)v7, (uint64_t)v25, &qword_2575410B8);
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 88))(v19, v17);
  if (v20 == *MEMORY[0x24BEA17F8])
  {
    v21 = 1;
    goto LABEL_25;
  }
  if (v20 == *MEMORY[0x24BEA1800])
  {
    v21 = 0;
    goto LABEL_25;
  }
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v17);
LABEL_24:
  v21 = 2;
LABEL_25:
  *a1 = v21;
  return sub_2460B2CC0((uint64_t)v7, &qword_2575410B8);
}

uint64_t sub_2460BE444()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 504))
  {
    v1 = *(_QWORD *)(v0 + 504);
  }
  else
  {
    v1 = sub_2460BE4A0();
    *(_QWORD *)(v0 + 504) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BE4A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  char v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  char *v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  char *v67;
  uint64_t v68;

  v0 = sub_2460D4B90();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v67 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v60 = (char *)&v60 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v60 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v60 - v9;
  v11 = sub_2460B4C5C();
  v12 = sub_2460CCB08(v11, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460BAADC, 0);
  swift_bridgeObjectRelease();
  v64 = v12;
  if (v12 >> 62)
  {
LABEL_63:
    swift_bridgeObjectRetain();
    result = sub_2460D5028();
    v13 = result;
  }
  else
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v16 = v67;
  if (v13)
  {
    if (v13 < 1)
    {
      __break(1u);
      return result;
    }
    v17 = 0;
    v18 = v64 & 0xC000000000000001;
    do
    {
      if (v18)
        MEMORY[0x24954F500](v17, v64);
      else
        swift_retain();
      v19 = sub_2460D4B48();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v15 = sub_2460CBF7C(0, v15[2] + 1, 1, v15);
      v20 = v15;
      v21 = v15[2];
      v22 = v20;
      v23 = v20[3];
      if (v21 >= v23 >> 1)
        v22 = sub_2460CBF7C((_QWORD *)(v23 > 1), v21 + 1, 1, v22);
      ++v17;
      v22[2] = v21 + 1;
      v24 = &v22[v21];
      v15 = v22;
      v24[4] = v19;
      v16 = v67;
    }
    while (v13 != v17);
  }
  swift_bridgeObjectRelease();
  v68 = MEMORY[0x24BEE4AF8];
  v63 = v15[2];
  if (v63)
  {
    v25 = 0;
    v61 = v15;
    v62 = v15 + 4;
    while (1)
    {
      if (v25 >= v15[2])
      {
        __break(1u);
        goto LABEL_63;
      }
      v26 = (_QWORD *)v62[v25];
      v27 = v26[2];
      if (!v27)
        goto LABEL_17;
      v65 = v25;
      v66 = v26;
      v28 = (uint64_t)v26 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
      swift_bridgeObjectRetain_n();
      v29 = *(_QWORD *)(v1 + 72);
      v30 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
      v30(v10, v28, v0);
      while (1)
      {
        v32 = sub_2460D4B84();
        if (!v33)
        {
          v30(v8, (uint64_t)v10, v0);
LABEL_22:
          v31 = *(void (**)(char *, uint64_t))(v1 + 8);
          v31(v8, v0);
          v31(v10, v0);
          goto LABEL_23;
        }
        if (v32 == 0x6E6547636973756DLL && v33 == 0xEA00000000006572)
        {
          swift_bridgeObjectRelease();
          v30(v8, (uint64_t)v10, v0);
        }
        else
        {
          v34 = sub_2460D5058();
          swift_bridgeObjectRelease();
          v30(v8, (uint64_t)v10, v0);
          if ((v34 & 1) == 0)
            goto LABEL_22;
        }
        if (!sub_2460D4B78() && v35 == 0xE000000000000000)
        {
          swift_bridgeObjectRelease();
          goto LABEL_22;
        }
        v36 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v37 = *(void (**)(char *, uint64_t))(v1 + 8);
        v37(v8, v0);
        v37(v10, v0);
        if ((v36 & 1) == 0)
          break;
LABEL_23:
        v28 += v29;
        if (!--v27)
        {
          swift_bridgeObjectRelease_n();
          v16 = v67;
          v15 = v61;
          v25 = v65;
          goto LABEL_17;
        }
        v30(v10, v28, v0);
      }
      swift_bridgeObjectRelease();
      v38 = v68;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2460CC498(0, *(_QWORD *)(v38 + 16) + 1, 1);
        v38 = v68;
      }
      v15 = v61;
      v25 = v65;
      v39 = v66;
      v41 = *(_QWORD *)(v38 + 16);
      v40 = *(_QWORD *)(v38 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_2460CC498(v40 > 1, v41 + 1, 1);
        v39 = v66;
        v38 = v68;
      }
      *(_QWORD *)(v38 + 16) = v41 + 1;
      *(_QWORD *)(v38 + 8 * v41 + 32) = v39;
      v16 = v67;
LABEL_17:
      if (++v25 == v63)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v42 = v68;
        goto LABEL_41;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v42 = MEMORY[0x24BEE4AF8];
LABEL_41:
  v65 = *(_QWORD *)(v42 + 16);
  if (!v65)
  {
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  v63 = v42;
  v64 = v42 + 32;
  swift_retain();
  v43 = 0;
  v44 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (2)
  {
    v45 = *(_QWORD *)(v64 + 8 * v43);
    v46 = *(_QWORD *)(v45 + 16);
    if (!v46)
      goto LABEL_44;
    v66 = v44;
    v47 = v45 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    swift_bridgeObjectRetain_n();
    v48 = *(_QWORD *)(v1 + 72);
    v49 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
    v49(v16, v47, v0);
    while (1)
    {
      v51 = sub_2460D4B84();
      if (!v52)
        goto LABEL_48;
      if (v51 == 0x6E6547636973756DLL && v52 == 0xEA00000000006572)
        break;
      v50 = sub_2460D5058();
      swift_bridgeObjectRelease();
      if ((v50 & 1) != 0)
        goto LABEL_54;
LABEL_48:
      v16 = v67;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v67, v0);
      v47 += v48;
      if (!--v46)
      {
        swift_bridgeObjectRelease_n();
        v44 = v66;
        goto LABEL_44;
      }
      v49(v16, v47, v0);
    }
    swift_bridgeObjectRelease();
LABEL_54:
    swift_bridgeObjectRelease();
    v53 = v60;
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v60, v67, v0);
    v54 = sub_2460D4B78();
    v56 = v55;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v53, v0);
    swift_bridgeObjectRelease();
    v44 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v44 = sub_2460CBD64(0, v44[2] + 1, 1, v44);
    v58 = v44[2];
    v57 = v44[3];
    if (v58 >= v57 >> 1)
      v44 = sub_2460CBD64((_QWORD *)(v57 > 1), v58 + 1, 1, v44);
    v44[2] = v58 + 1;
    v59 = &v44[2 * v58];
    v59[4] = v54;
    v59[5] = v56;
    v16 = v67;
LABEL_44:
    if (++v43 != v65)
      continue;
    break;
  }
  swift_release_n();
  return (uint64_t)v44;
}

uint64_t sub_2460BEB84()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 512))
  {
    v1 = *(_QWORD *)(v0 + 512);
  }
  else
  {
    v1 = sub_2460BEBE0();
    *(_QWORD *)(v0 + 512) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BEBE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  char v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  char *v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  char *v67;
  uint64_t v68;

  v0 = sub_2460D4B90();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v67 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v60 = (char *)&v60 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v60 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v60 - v9;
  v11 = sub_2460B4C5C();
  v12 = sub_2460CCB08(v11, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460BAADC, 0);
  swift_bridgeObjectRelease();
  v64 = v12;
  if (v12 >> 62)
  {
LABEL_63:
    swift_bridgeObjectRetain();
    result = sub_2460D5028();
    v13 = result;
  }
  else
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v16 = v67;
  if (v13)
  {
    if (v13 < 1)
    {
      __break(1u);
      return result;
    }
    v17 = 0;
    v18 = v64 & 0xC000000000000001;
    do
    {
      if (v18)
        MEMORY[0x24954F500](v17, v64);
      else
        swift_retain();
      v19 = sub_2460D4B48();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v15 = sub_2460CBF7C(0, v15[2] + 1, 1, v15);
      v20 = v15;
      v21 = v15[2];
      v22 = v20;
      v23 = v20[3];
      if (v21 >= v23 >> 1)
        v22 = sub_2460CBF7C((_QWORD *)(v23 > 1), v21 + 1, 1, v22);
      ++v17;
      v22[2] = v21 + 1;
      v24 = &v22[v21];
      v15 = v22;
      v24[4] = v19;
      v16 = v67;
    }
    while (v13 != v17);
  }
  swift_bridgeObjectRelease();
  v68 = MEMORY[0x24BEE4AF8];
  v63 = v15[2];
  if (v63)
  {
    v25 = 0;
    v61 = v15;
    v62 = v15 + 4;
    while (1)
    {
      if (v25 >= v15[2])
      {
        __break(1u);
        goto LABEL_63;
      }
      v26 = (_QWORD *)v62[v25];
      v27 = v26[2];
      if (!v27)
        goto LABEL_17;
      v65 = v25;
      v66 = v26;
      v28 = (uint64_t)v26 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
      swift_bridgeObjectRetain_n();
      v29 = *(_QWORD *)(v1 + 72);
      v30 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
      v30(v10, v28, v0);
      while (1)
      {
        v32 = sub_2460D4B84();
        if (!v33)
        {
          v30(v8, (uint64_t)v10, v0);
LABEL_22:
          v31 = *(void (**)(char *, uint64_t))(v1 + 8);
          v31(v8, v0);
          v31(v10, v0);
          goto LABEL_23;
        }
        if (v32 == 0x616C50616964656DLL && v33 == 0xEF646F6F4D726579)
        {
          swift_bridgeObjectRelease();
          v30(v8, (uint64_t)v10, v0);
        }
        else
        {
          v34 = sub_2460D5058();
          swift_bridgeObjectRelease();
          v30(v8, (uint64_t)v10, v0);
          if ((v34 & 1) == 0)
            goto LABEL_22;
        }
        if (!sub_2460D4B78() && v35 == 0xE000000000000000)
        {
          swift_bridgeObjectRelease();
          goto LABEL_22;
        }
        v36 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v37 = *(void (**)(char *, uint64_t))(v1 + 8);
        v37(v8, v0);
        v37(v10, v0);
        if ((v36 & 1) == 0)
          break;
LABEL_23:
        v28 += v29;
        if (!--v27)
        {
          swift_bridgeObjectRelease_n();
          v16 = v67;
          v15 = v61;
          v25 = v65;
          goto LABEL_17;
        }
        v30(v10, v28, v0);
      }
      swift_bridgeObjectRelease();
      v38 = v68;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2460CC498(0, *(_QWORD *)(v38 + 16) + 1, 1);
        v38 = v68;
      }
      v15 = v61;
      v25 = v65;
      v39 = v66;
      v41 = *(_QWORD *)(v38 + 16);
      v40 = *(_QWORD *)(v38 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_2460CC498(v40 > 1, v41 + 1, 1);
        v39 = v66;
        v38 = v68;
      }
      *(_QWORD *)(v38 + 16) = v41 + 1;
      *(_QWORD *)(v38 + 8 * v41 + 32) = v39;
      v16 = v67;
LABEL_17:
      if (++v25 == v63)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v42 = v68;
        goto LABEL_41;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v42 = MEMORY[0x24BEE4AF8];
LABEL_41:
  v65 = *(_QWORD *)(v42 + 16);
  if (!v65)
  {
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  v63 = v42;
  v64 = v42 + 32;
  swift_retain();
  v43 = 0;
  v44 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (2)
  {
    v45 = *(_QWORD *)(v64 + 8 * v43);
    v46 = *(_QWORD *)(v45 + 16);
    if (!v46)
      goto LABEL_44;
    v66 = v44;
    v47 = v45 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    swift_bridgeObjectRetain_n();
    v48 = *(_QWORD *)(v1 + 72);
    v49 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
    v49(v16, v47, v0);
    while (1)
    {
      v51 = sub_2460D4B84();
      if (!v52)
        goto LABEL_48;
      if (v51 == 0x616C50616964656DLL && v52 == 0xEF646F6F4D726579)
        break;
      v50 = sub_2460D5058();
      swift_bridgeObjectRelease();
      if ((v50 & 1) != 0)
        goto LABEL_54;
LABEL_48:
      v16 = v67;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v67, v0);
      v47 += v48;
      if (!--v46)
      {
        swift_bridgeObjectRelease_n();
        v44 = v66;
        goto LABEL_44;
      }
      v49(v16, v47, v0);
    }
    swift_bridgeObjectRelease();
LABEL_54:
    swift_bridgeObjectRelease();
    v53 = v60;
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v60, v67, v0);
    v54 = sub_2460D4B78();
    v56 = v55;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v53, v0);
    swift_bridgeObjectRelease();
    v44 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v44 = sub_2460CBD64(0, v44[2] + 1, 1, v44);
    v58 = v44[2];
    v57 = v44[3];
    if (v58 >= v57 >> 1)
      v44 = sub_2460CBD64((_QWORD *)(v57 > 1), v58 + 1, 1, v44);
    v44[2] = v58 + 1;
    v59 = &v44[2 * v58];
    v59[4] = v54;
    v59[5] = v56;
    v16 = v67;
LABEL_44:
    if (++v43 != v65)
      continue;
    break;
  }
  swift_release_n();
  return (uint64_t)v44;
}

uint64_t sub_2460BF2E4()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 520))
  {
    v1 = *(_QWORD *)(v0 + 520);
  }
  else
  {
    v1 = sub_2460BF340();
    *(_QWORD *)(v0 + 520) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460BF340()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  char v34;
  uint64_t v35;
  char v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  char v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  char *v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;

  v0 = sub_2460D4B90();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v69 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v60 = (char *)&v60 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v60 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v60 - v9;
  v11 = sub_2460B4C5C();
  v12 = sub_2460CCB08(v11, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460BAADC, 0);
  swift_bridgeObjectRelease();
  v64 = v12;
  if (v12 >> 62)
  {
LABEL_63:
    swift_bridgeObjectRetain();
    result = sub_2460D5028();
    v13 = result;
  }
  else
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v16 = v69;
  if (v13)
  {
    if (v13 < 1)
    {
      __break(1u);
      return result;
    }
    v17 = 0;
    v18 = v64 & 0xC000000000000001;
    do
    {
      if (v18)
        MEMORY[0x24954F500](v17, v64);
      else
        swift_retain();
      v19 = sub_2460D4B48();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v15 = sub_2460CBF7C(0, v15[2] + 1, 1, v15);
      v20 = v15;
      v21 = v15[2];
      v22 = v20;
      v23 = v20[3];
      if (v21 >= v23 >> 1)
        v22 = sub_2460CBF7C((_QWORD *)(v23 > 1), v21 + 1, 1, v22);
      ++v17;
      v22[2] = v21 + 1;
      v24 = &v22[v21];
      v15 = v22;
      v24[4] = v19;
      v16 = v69;
    }
    while (v13 != v17);
  }
  swift_bridgeObjectRelease();
  v70 = MEMORY[0x24BEE4AF8];
  v63 = v15[2];
  if (v63)
  {
    v25 = 0;
    v61 = v15;
    v62 = v15 + 4;
    v67 = "de";
    v68 = (char *)0x80000002460D6A20;
    while (1)
    {
      if (v25 >= v15[2])
      {
        __break(1u);
        goto LABEL_63;
      }
      v26 = (_QWORD *)v62[v25];
      v27 = v26[2];
      if (!v27)
        goto LABEL_17;
      v65 = v25;
      v66 = v26;
      v28 = (uint64_t)v26 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
      swift_bridgeObjectRetain_n();
      v29 = *(_QWORD *)(v1 + 72);
      v30 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
      v30(v10, v28, v0);
      while (1)
      {
        v32 = sub_2460D4B84();
        if (!v33)
        {
          v30(v8, (uint64_t)v10, v0);
LABEL_22:
          v31 = *(void (**)(char *, uint64_t))(v1 + 8);
          v31(v8, v0);
          v31(v10, v0);
          goto LABEL_23;
        }
        if (v32 == 0xD000000000000013 && v33 == v68)
        {
          swift_bridgeObjectRelease();
          v30(v8, (uint64_t)v10, v0);
        }
        else
        {
          v34 = sub_2460D5058();
          swift_bridgeObjectRelease();
          v30(v8, (uint64_t)v10, v0);
          if ((v34 & 1) == 0)
            goto LABEL_22;
        }
        if (!sub_2460D4B78() && v35 == 0xE000000000000000)
        {
          swift_bridgeObjectRelease();
          goto LABEL_22;
        }
        v36 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v37 = *(void (**)(char *, uint64_t))(v1 + 8);
        v37(v8, v0);
        v37(v10, v0);
        if ((v36 & 1) == 0)
          break;
LABEL_23:
        v28 += v29;
        if (!--v27)
        {
          swift_bridgeObjectRelease_n();
          v16 = v69;
          v15 = v61;
          v25 = v65;
          goto LABEL_17;
        }
        v30(v10, v28, v0);
      }
      swift_bridgeObjectRelease();
      v38 = v70;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2460CC498(0, *(_QWORD *)(v38 + 16) + 1, 1);
        v38 = v70;
      }
      v15 = v61;
      v25 = v65;
      v39 = v66;
      v41 = *(_QWORD *)(v38 + 16);
      v40 = *(_QWORD *)(v38 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_2460CC498(v40 > 1, v41 + 1, 1);
        v39 = v66;
        v38 = v70;
      }
      *(_QWORD *)(v38 + 16) = v41 + 1;
      *(_QWORD *)(v38 + 8 * v41 + 32) = v39;
      v16 = v69;
LABEL_17:
      if (++v25 == v63)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v42 = v70;
        goto LABEL_41;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v42 = MEMORY[0x24BEE4AF8];
LABEL_41:
  v65 = *(_QWORD *)(v42 + 16);
  if (!v65)
  {
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  v63 = v42;
  v64 = v42 + 32;
  swift_retain();
  v43 = 0;
  v44 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v68 = "de";
  v67 = (char *)0x80000002460D6A20;
  while (2)
  {
    v45 = *(_QWORD *)(v64 + 8 * v43);
    v46 = *(_QWORD *)(v45 + 16);
    if (!v46)
      goto LABEL_44;
    v66 = v44;
    v47 = v45 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    swift_bridgeObjectRetain_n();
    v48 = *(_QWORD *)(v1 + 72);
    v49 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
    v49(v16, v47, v0);
    while (1)
    {
      v51 = sub_2460D4B84();
      if (!v52)
        goto LABEL_48;
      if (v51 == 0xD000000000000013 && v52 == v67)
        break;
      v50 = sub_2460D5058();
      swift_bridgeObjectRelease();
      if ((v50 & 1) != 0)
        goto LABEL_54;
LABEL_48:
      v16 = v69;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v69, v0);
      v47 += v48;
      if (!--v46)
      {
        swift_bridgeObjectRelease_n();
        v44 = v66;
        goto LABEL_44;
      }
      v49(v16, v47, v0);
    }
    swift_bridgeObjectRelease();
LABEL_54:
    swift_bridgeObjectRelease();
    v53 = v60;
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v60, v69, v0);
    v54 = sub_2460D4B78();
    v56 = v55;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v53, v0);
    swift_bridgeObjectRelease();
    v44 = v66;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v44 = sub_2460CBD64(0, v44[2] + 1, 1, v44);
    v58 = v44[2];
    v57 = v44[3];
    if (v58 >= v57 >> 1)
      v44 = sub_2460CBD64((_QWORD *)(v57 > 1), v58 + 1, 1, v44);
    v44[2] = v58 + 1;
    v59 = &v44[2 * v58];
    v59[4] = v54;
    v59[5] = v56;
    v16 = v69;
LABEL_44:
    if (++v43 != v65)
      continue;
    break;
  }
  swift_release_n();
  return (uint64_t)v44;
}

uint64_t sub_2460BFA2C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v3;
  uint64_t result;
  char v5;

  v3 = *(unsigned __int8 *)(v1 + 528);
  if (v3 == 3)
  {
    result = sub_2460BFA74(&v5);
    LOBYTE(v3) = v5;
    *(_BYTE *)(v1 + 528) = v5;
  }
  *a1 = v3;
  return result;
}

uint64_t sub_2460BFA74@<X0>(_BYTE *a1@<X8>)
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
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  char v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  unint64_t v59;
  unint64_t v60;
  _BYTE *v61;
  _QWORD *v62;
  char *v63;
  char *v64;
  _QWORD *v65;
  char *v66;
  unint64_t v67;
  uint64_t v68;
  char *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  char *v73;

  v61 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540720);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v64 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v63 = (char *)&v61 - v4;
  v5 = sub_2460D4B90();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (uint64_t)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v61 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v61 - v13;
  v15 = sub_2460B4C5C();
  v16 = sub_2460CCB08(v15, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460BAADC, 0);
  swift_bridgeObjectRelease();
  v67 = v16;
  if (v16 >> 62)
  {
LABEL_76:
    swift_bridgeObjectRetain();
    result = sub_2460D5028();
    v17 = result;
  }
  else
  {
    v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v19 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v72 = v9;
  if (v17)
  {
    if (v17 < 1)
    {
      __break(1u);
      return result;
    }
    v20 = 0;
    v21 = v67 & 0xC000000000000001;
    do
    {
      if (v21)
        MEMORY[0x24954F500](v20);
      else
        swift_retain();
      v22 = sub_2460D4B48();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v19 = sub_2460CBF7C(0, v19[2] + 1, 1, v19);
      v23 = v19;
      v24 = v19[2];
      v25 = v23;
      v26 = v23[3];
      v9 = v24 + 1;
      if (v24 >= v26 >> 1)
        v25 = sub_2460CBF7C((_QWORD *)(v26 > 1), v24 + 1, 1, v25);
      ++v20;
      v25[2] = v9;
      v27 = &v25[v24];
      v19 = v25;
      v27[4] = v22;
    }
    while (v17 != v20);
  }
  swift_bridgeObjectRelease();
  v73 = (char *)MEMORY[0x24BEE4AF8];
  v66 = (char *)v19[2];
  if (v66)
  {
    v28 = 0;
    v65 = v19 + 4;
    v70 = "mediaPlayerActivity";
    v71 = (const char *)0x80000002460D6A40;
    v62 = v19;
    while (1)
    {
      if ((unint64_t)v28 >= v19[2])
      {
        __break(1u);
        goto LABEL_76;
      }
      v29 = v65[(_QWORD)v28];
      v30 = *(_QWORD *)(v29 + 16);
      if (!v30)
        goto LABEL_18;
      v68 = v65[(_QWORD)v28];
      v69 = v28;
      v31 = v29 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      swift_bridgeObjectRetain_n();
      v32 = *(_QWORD *)(v6 + 72);
      v33 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v33(v14, v31, v5);
      while (1)
      {
        v35 = sub_2460D4B84();
        if (!v36)
        {
          v33(v12, (uint64_t)v14, v5);
LABEL_23:
          v34 = *(void (**)(char *, uint64_t))(v6 + 8);
          v34(v12, v5);
          v34(v14, v5);
          goto LABEL_24;
        }
        if (v35 == 0xD000000000000014 && v36 == v71)
        {
          swift_bridgeObjectRelease();
          v33(v12, (uint64_t)v14, v5);
        }
        else
        {
          v9 = sub_2460D5058();
          swift_bridgeObjectRelease();
          v33(v12, (uint64_t)v14, v5);
          if ((v9 & 1) == 0)
            goto LABEL_23;
        }
        if (!sub_2460D4B78() && v37 == 0xE000000000000000)
        {
          swift_bridgeObjectRelease();
          goto LABEL_23;
        }
        v9 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v38 = *(void (**)(char *, uint64_t))(v6 + 8);
        v38(v12, v5);
        v38(v14, v5);
        if ((v9 & 1) == 0)
          break;
LABEL_24:
        v31 += v32;
        if (!--v30)
        {
          swift_bridgeObjectRelease_n();
          v19 = v62;
          goto LABEL_17;
        }
        v33(v14, v31, v5);
      }
      v9 = v68;
      swift_bridgeObjectRelease();
      v39 = v73;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2460CC498(0, *((_QWORD *)v39 + 2) + 1, 1);
        v39 = v73;
      }
      v19 = v62;
      v41 = *((_QWORD *)v39 + 2);
      v40 = *((_QWORD *)v39 + 3);
      if (v41 >= v40 >> 1)
      {
        sub_2460CC498(v40 > 1, v41 + 1, 1);
        v39 = v73;
      }
      *((_QWORD *)v39 + 2) = v41 + 1;
      *(_QWORD *)&v39[8 * v41 + 32] = v9;
LABEL_17:
      v28 = v69;
LABEL_18:
      if (++v28 == v66)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v42 = v73;
        goto LABEL_42;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v42 = (char *)MEMORY[0x24BEE4AF8];
LABEL_42:
  v44 = (uint64_t)v63;
  v43 = (uint64_t)v64;
  v68 = *((_QWORD *)v42 + 2);
  if (v68)
  {
    v66 = v42;
    v67 = (unint64_t)(v42 + 32);
    swift_retain();
    v45 = 0;
    v46 = (char *)MEMORY[0x24BEE4AF8];
    v71 = "mediaPlayerActivity";
    v70 = (const char *)0x80000002460D6A40;
    while (1)
    {
      v47 = *(_QWORD *)(v67 + 8 * v45);
      v48 = *(_QWORD *)(v47 + 16);
      if (!v48)
      {
        swift_bridgeObjectRetain();
        v56 = 1;
        goto LABEL_59;
      }
      v69 = v46;
      v49 = v47 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      swift_bridgeObjectRetain_n();
      v50 = *(_QWORD *)(v6 + 72);
      v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      v51(v72, v49, v5);
      while (1)
      {
        v54 = sub_2460D4B84();
        if (!v55)
          goto LABEL_49;
        if (v54 == 0xD000000000000014 && v55 == v70)
          break;
        v52 = sub_2460D5058();
        swift_bridgeObjectRelease();
        if ((v52 & 1) != 0)
          goto LABEL_57;
LABEL_49:
        v53 = v72;
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v72, v5);
        v49 += v50;
        if (!--v48)
        {
          swift_bridgeObjectRelease();
          v56 = 1;
          v44 = (uint64_t)v63;
          v43 = (uint64_t)v64;
          goto LABEL_58;
        }
        v51(v53, v49, v5);
      }
      swift_bridgeObjectRelease();
LABEL_57:
      swift_bridgeObjectRelease();
      v44 = (uint64_t)v63;
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v63, v72, v5);
      v56 = 0;
      v43 = (uint64_t)v64;
LABEL_58:
      v46 = v69;
LABEL_59:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v44, v56, 1, v5);
      sub_2460C784C(v44, v43, &qword_257540720);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v43, 1, v5) == 1)
      {
        sub_2460B2CC0(v43, &qword_257540720);
      }
      else
      {
        sub_2460D4B78();
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v43, v5);
      }
      v57 = sub_2460D504C();
      swift_bridgeObjectRelease();
      if (v57)
      {
        if (v57 == 1)
        {
          v58 = 1;
          goto LABEL_66;
        }
        sub_2460B2CC0(v44, &qword_257540720);
        swift_bridgeObjectRelease();
      }
      else
      {
        v58 = 0;
LABEL_66:
        sub_2460B2CC0(v44, &qword_257540720);
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v46 = sub_2460CC180(0, *((_QWORD *)v46 + 2) + 1, 1, v46);
        v60 = *((_QWORD *)v46 + 2);
        v59 = *((_QWORD *)v46 + 3);
        if (v60 >= v59 >> 1)
          v46 = sub_2460CC180((char *)(v59 > 1), v60 + 1, 1, v46);
        *((_QWORD *)v46 + 2) = v60 + 1;
        v46[v60 + 32] = v58;
      }
      if (++v45 == v68)
      {
        swift_release_n();
        if (*((_QWORD *)v46 + 2))
          goto LABEL_72;
LABEL_74:
        result = swift_bridgeObjectRelease();
        *v61 = 2;
        return result;
      }
    }
  }
  swift_release();
  v46 = (char *)MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    goto LABEL_74;
LABEL_72:
  *v61 = v46[32];
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C0298()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  if ((*(_BYTE *)(v0 + 545) & 1) == 0)
    return *(_QWORD *)(v0 + 536);
  result = sub_2460C02E4();
  *(_QWORD *)(v0 + 536) = result;
  *(_BYTE *)(v0 + 544) = v2 & 1;
  *(_BYTE *)(v0 + 545) = 0;
  return result;
}

uint64_t sub_2460C02E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  const char *v35;
  char v36;
  uint64_t v37;
  char v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t);
  char v54;
  char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  _BYTE *v64;
  BOOL v65;
  _BYTE *v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  _QWORD *v72;
  _QWORD *v73;
  char *v74;
  char *v75;
  _QWORD *v76;
  _QWORD *v77;
  unint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  const char *v81;
  const char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  BOOL v86;
  uint64_t v87;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540720);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v75 = (char *)&v72 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v74 = (char *)&v72 - v3;
  v4 = sub_2460D4B90();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v83 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v72 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v72 - v11;
  v13 = sub_2460B4C5C();
  v14 = 0;
  v15 = sub_2460CCB08(v13, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460BAADC, 0);
  swift_bridgeObjectRelease();
  v78 = v15;
  if (v15 >> 62)
  {
LABEL_91:
    swift_bridgeObjectRetain();
    result = sub_2460D5028();
    v16 = result;
  }
  else
  {
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v18 = v83;
  v72 = v14;
  if (v16)
  {
    if (v16 < 1)
    {
      __break(1u);
      return result;
    }
    v19 = 0;
    v20 = v78 & 0xC000000000000001;
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if (v20)
        MEMORY[0x24954F500](v19, v78);
      else
        swift_retain();
      v21 = sub_2460D4B48();
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v14 = sub_2460CBF7C(0, v14[2] + 1, 1, v14);
      v22 = v14;
      v23 = v14[2];
      v24 = v22;
      v25 = v22[3];
      if (v23 >= v25 >> 1)
        v24 = sub_2460CBF7C((_QWORD *)(v25 > 1), v23 + 1, 1, v24);
      ++v19;
      v24[2] = v23 + 1;
      v26 = &v24[v23];
      v14 = v24;
      v26[4] = v21;
      v18 = v83;
    }
    while (v16 != v19);
  }
  else
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v84 = MEMORY[0x24BEE4AF8];
  v77 = (_QWORD *)v14[2];
  if (v77)
  {
    v27 = 0;
    v76 = v14 + 4;
    v81 = "mediaPlayerReference";
    v82 = (const char *)0x80000002460D6AA0;
    v73 = v14;
    while (1)
    {
      if (v27 >= v14[2])
      {
        __break(1u);
        goto LABEL_91;
      }
      v28 = v76[v27];
      v29 = *(_QWORD *)(v28 + 16);
      if (!v29)
        goto LABEL_20;
      v79 = v76[v27];
      v80 = (_QWORD *)v27;
      v30 = v28 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
      swift_bridgeObjectRetain_n();
      v31 = *(_QWORD *)(v5 + 72);
      v32 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v32(v12, v30, v4);
      while (1)
      {
        v34 = sub_2460D4B84();
        if (!v35)
        {
          v32(v10, (uint64_t)v12, v4);
LABEL_25:
          v33 = *(void (**)(char *, uint64_t))(v5 + 8);
          v33(v10, v4);
          v33(v12, v4);
          goto LABEL_26;
        }
        if (v34 == 0xD000000000000015 && v35 == v82)
        {
          swift_bridgeObjectRelease();
          v32(v10, (uint64_t)v12, v4);
        }
        else
        {
          v36 = sub_2460D5058();
          swift_bridgeObjectRelease();
          v32(v10, (uint64_t)v12, v4);
          if ((v36 & 1) == 0)
            goto LABEL_25;
        }
        if (!sub_2460D4B78() && v37 == 0xE000000000000000)
        {
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
        v38 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v39 = *(void (**)(char *, uint64_t))(v5 + 8);
        v39(v10, v4);
        v39(v12, v4);
        if ((v38 & 1) == 0)
          break;
LABEL_26:
        v30 += v31;
        if (!--v29)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_19;
        }
        v32(v12, v30, v4);
      }
      v40 = v79;
      swift_bridgeObjectRelease();
      v41 = v84;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2460CC498(0, *(_QWORD *)(v41 + 16) + 1, 1);
        v41 = v84;
      }
      v43 = *(_QWORD *)(v41 + 16);
      v42 = *(_QWORD *)(v41 + 24);
      if (v43 >= v42 >> 1)
      {
        sub_2460CC498(v42 > 1, v43 + 1, 1);
        v41 = v84;
      }
      *(_QWORD *)(v41 + 16) = v43 + 1;
      *(_QWORD *)(v41 + 8 * v43 + 32) = v40;
LABEL_19:
      v18 = v83;
      v14 = v73;
      v27 = (unint64_t)v80;
LABEL_20:
      if ((_QWORD *)++v27 == v77)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v44 = v84;
        goto LABEL_44;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v44 = MEMORY[0x24BEE4AF8];
LABEL_44:
  v46 = (uint64_t)v74;
  v45 = (uint64_t)v75;
  v79 = *(_QWORD *)(v44 + 16);
  if (v79)
  {
    v77 = (_QWORD *)v44;
    v78 = v44 + 32;
    swift_retain();
    v47 = 0;
    v48 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v82 = "mediaPlayerReference";
    v81 = (const char *)0x80000002460D6AA0;
    while (1)
    {
      v80 = v48;
      v49 = *(_QWORD *)(v78 + 8 * v47);
      v50 = *(_QWORD *)(v49 + 16);
      if (!v50)
      {
        swift_bridgeObjectRetain();
        v58 = 1;
        goto LABEL_60;
      }
      v51 = v49 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
      swift_bridgeObjectRetain_n();
      v52 = *(_QWORD *)(v5 + 72);
      v53 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v53(v18, v51, v4);
      while (1)
      {
        v56 = sub_2460D4B84();
        if (!v57)
          goto LABEL_51;
        if (v56 == 0xD000000000000015 && v57 == v81)
          break;
        v54 = sub_2460D5058();
        swift_bridgeObjectRelease();
        if ((v54 & 1) != 0)
          goto LABEL_59;
LABEL_51:
        v55 = v83;
        (*(void (**)(char *, uint64_t))(v5 + 8))(v83, v4);
        v51 += v52;
        if (!--v50)
        {
          swift_bridgeObjectRelease();
          v58 = 1;
          v46 = (uint64_t)v74;
          v45 = (uint64_t)v75;
          goto LABEL_60;
        }
        v53(v55, v51, v4);
      }
      swift_bridgeObjectRelease();
LABEL_59:
      swift_bridgeObjectRelease();
      v46 = (uint64_t)v74;
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v74, v83, v4);
      v58 = 0;
      v45 = (uint64_t)v75;
LABEL_60:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v46, v58, 1, v4);
      sub_2460C784C(v46, v45, &qword_257540720);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v45, 1, v4) == 1)
      {
        v59 = sub_2460B2CC0(v45, &qword_257540720);
        v60 = 0;
        v61 = 0xE000000000000000;
      }
      else
      {
        v60 = sub_2460D4B78();
        v61 = v62;
        v59 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v45, v4);
      }
      v87 = 0;
      MEMORY[0x24BDAC7A8](v59);
      *(&v72 - 2) = &v87;
      if ((v61 & 0x1000000000000000) != 0)
        goto LABEL_84;
      if ((v61 & 0x2000000000000000) != 0)
      {
        v84 = v60;
        v85 = v61 & 0xFFFFFFFFFFFFFFLL;
        if (v60 <= 0x20u && ((0x100003E01uLL >> v60) & 1) != 0)
          goto LABEL_74;
        v66 = (_BYTE *)_swift_stdlib_strtod_clocale();
        v48 = v80;
        if (v66)
          v65 = *v66 == 0;
        else
          v65 = 0;
LABEL_76:
        v86 = v65;
        swift_bridgeObjectRelease();
      }
      else
      {
        if ((v60 & 0x1000000000000000) != 0)
        {
          v63 = *(unsigned __int8 *)(v61 + 32);
          if (v63 >= 0x21 || ((0x100003E01uLL >> v63) & 1) == 0)
          {
            v64 = (_BYTE *)_swift_stdlib_strtod_clocale();
            v48 = v80;
            if (v64)
              v65 = *v64 == 0;
            else
              v65 = 0;
            goto LABEL_76;
          }
LABEL_74:
          v65 = 0;
          v48 = v80;
          goto LABEL_76;
        }
LABEL_84:
        v70 = v72;
        sub_2460D4FB0();
        v72 = v70;
        swift_bridgeObjectRelease();
        v48 = v80;
      }
      v18 = v83;
      if (v86)
      {
        v67 = v87;
        sub_2460B2CC0(v46, &qword_257540720);
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v48 = sub_2460CC278(0, v48[2] + 1, 1, v48);
        v69 = v48[2];
        v68 = v48[3];
        if (v69 >= v68 >> 1)
          v48 = sub_2460CC278((_QWORD *)(v68 > 1), v69 + 1, 1, v48);
        v48[2] = v69 + 1;
        v48[v69 + 4] = v67;
        v18 = v83;
      }
      else
      {
        sub_2460B2CC0(v46, &qword_257540720);
        swift_bridgeObjectRelease();
      }
      if (++v47 == v79)
      {
        swift_release_n();
        if (v48[2])
          goto LABEL_86;
LABEL_88:
        v71 = 0;
        goto LABEL_89;
      }
    }
  }
  swift_release();
  v48 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    goto LABEL_88;
LABEL_86:
  v71 = v48[4];
LABEL_89:
  swift_bridgeObjectRelease();
  return v71;
}

uint64_t sub_2460C0C38()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_2460D4C5C();
  if (!v1)
    return 0;
  v2 = v0;
  v3 = v1;
  swift_bridgeObjectRelease();
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = v2 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return 0;
  if (sub_2460D4C38())
  {
    swift_release();
    return 0;
  }
  return 1;
}

char *sub_2460C0CA0()
{
  uint64_t v0;
  char *v1;

  if (*(_QWORD *)(v0 + 552))
  {
    v1 = *(char **)(v0 + 552);
  }
  else
  {
    if (sub_2460B44D4())
    {
      v1 = UsoEntity_common_Setting.usoMediaSettingNames()();
      swift_release();
    }
    else
    {
      v1 = (char *)MEMORY[0x24BEE4AF8];
    }
    *(_QWORD *)(v0 + 552) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_2460C0D20()
{
  uint64_t v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  _BOOL8 result;

  v1 = *(unsigned __int8 *)(v0 + 560);
  if (v1 != 2)
    return v1 & 1;
  v2 = sub_2460B57DC();
  if (v2 >> 62)
    v3 = sub_2460D5028();
  else
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  result = v3 == 0;
  *(_BYTE *)(v0 + 560) = result;
  return result;
}

uint64_t sub_2460C0D98(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 568) = v3;
  *(_QWORD *)(v4 + 576) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C0DF8()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 568);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2460C0E44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 568) = a1;
  *(_QWORD *)(v2 + 576) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2460C0E98())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

SiriAudioIntentUtils::AudioUsoIntent::UsoNamespace_optional __swiftcall AudioUsoIntent.UsoNamespace.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  SiriAudioIntentUtils::AudioUsoIntent::UsoNamespace_optional result;
  char v5;
  char v6;

  v2 = v1;
  v3 = sub_2460D5064();
  result.value = swift_bridgeObjectRelease();
  v5 = 0;
  v6 = 10;
  switch(v3)
  {
    case 0:
      goto LABEL_12;
    case 1:
      v5 = 1;
      goto LABEL_12;
    case 2:
      v5 = 2;
      goto LABEL_12;
    case 3:
      v5 = 3;
      goto LABEL_12;
    case 4:
      v5 = 4;
      goto LABEL_12;
    case 5:
      v5 = 5;
      goto LABEL_12;
    case 6:
      v5 = 6;
      goto LABEL_12;
    case 7:
      v5 = 7;
      goto LABEL_12;
    case 8:
      v5 = 8;
      goto LABEL_12;
    case 9:
      v5 = 9;
LABEL_12:
      v6 = v5;
      break;
    case 10:
      break;
    case 11:
      v6 = 11;
      break;
    case 12:
      v6 = 12;
      break;
    case 13:
      v6 = 13;
      break;
    case 14:
      v6 = 14;
      break;
    case 15:
      v6 = 15;
      break;
    case 16:
      v6 = 16;
      break;
    case 17:
      v6 = 17;
      break;
    case 18:
      v6 = 18;
      break;
    case 19:
      v6 = 19;
      break;
    case 20:
      v6 = 20;
      break;
    case 21:
      v6 = 21;
      break;
    case 22:
      v6 = 22;
      break;
    case 23:
      v6 = 23;
      break;
    case 24:
      v6 = 24;
      break;
    case 25:
      v6 = 25;
      break;
    case 26:
      v6 = 26;
      break;
    case 27:
      v6 = 27;
      break;
    default:
      v6 = 28;
      break;
  }
  *v2 = v6;
  return result;
}

uint64_t sub_2460C102C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2460CD1A8(*a1, *a2);
}

uint64_t sub_2460C1038()
{
  sub_2460D507C();
  AudioUsoIntent.UsoNamespace.rawValue.getter();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460C109C()
{
  AudioUsoIntent.UsoNamespace.rawValue.getter();
  sub_2460D4EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C10EC()
{
  sub_2460D507C();
  AudioUsoIntent.UsoNamespace.rawValue.getter();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

SiriAudioIntentUtils::AudioUsoIntent::UsoNamespace_optional sub_2460C114C(Swift::String *a1)
{
  return AudioUsoIntent.UsoNamespace.init(rawValue:)(*a1);
}

uint64_t sub_2460C1158@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AudioUsoIntent.UsoNamespace.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t static AudioUsoIntent.IterationOptions.== infix(_:_:)()
{
  return 1;
}

uint64_t AudioUsoIntent.IterationOptions.hash(into:)()
{
  return sub_2460D5088();
}

uint64_t AudioUsoIntent.IterationOptions.hashValue.getter()
{
  sub_2460D507C();
  sub_2460D5088();
  return sub_2460D5094();
}

uint64_t sub_2460C11E8()
{
  return 1;
}

uint64_t sub_2460C11F0()
{
  sub_2460D507C();
  sub_2460D5088();
  return sub_2460D5094();
}

uint64_t sub_2460C1230()
{
  return sub_2460D5088();
}

uint64_t sub_2460C1254()
{
  sub_2460D507C();
  sub_2460D5088();
  return sub_2460D5094();
}

uint64_t *AudioUsoIntent.deinit()
{
  uint64_t *v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2460C62E0(v0[24]);
  sub_2460C62E0(v0[25]);
  sub_2460C62F0(v0[26]);
  sub_2460C62E0(v0[27]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2460C62E0(v0[31]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2460C62E0(v0[42]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2460C5A54(v0[48], v0[49]);
  sub_2460C5A54(v0[50], v0[51]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2460C5A54(v0[54], v0[55]);
  sub_2460C5A54(v0[56], v0[57]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AudioUsoIntent.__deallocating_deinit()
{
  AudioUsoIntent.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2460C148C()
{
  return sub_2460BF2E4();
}

uint64_t sub_2460C14AC()
{
  return sub_2460B63A4();
}

_QWORD *sub_2460C14CC()
{
  return sub_2460B986C();
}

_QWORD *sub_2460C14EC()
{
  return sub_2460B7F2C();
}

_QWORD *sub_2460C150C()
{
  return sub_2460B8BCC();
}

uint64_t sub_2460C152C()
{
  return sub_2460BBCD0();
}

_QWORD *sub_2460C154C()
{
  return sub_2460B65B0();
}

_QWORD *sub_2460C156C()
{
  return sub_2460B7250();
}

uint64_t sub_2460C158C()
{
  return sub_2460BBC74();
}

uint64_t sub_2460C15AC()
{
  return sub_2460BC278();
}

uint64_t sub_2460C15CC()
{
  return sub_2460B57DC();
}

uint64_t sub_2460C15EC()
{
  return sub_2460B5B74();
}

uint64_t sub_2460C160C()
{
  return sub_2460BAC74();
}

uint64_t sub_2460C162C()
{
  return sub_2460BAAE0();
}

uint64_t sub_2460C164C@<X0>(_BYTE *a1@<X8>)
{
  return sub_2460BC4E0(a1);
}

uint64_t sub_2460C166C()
{
  return sub_2460B5098();
}

uint64_t sub_2460C168C()
{
  return sub_2460C0298();
}

uint64_t sub_2460C16B0()
{
  return sub_2460BE444();
}

uint64_t sub_2460C16D0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 568);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2460C1720@<X0>(_BYTE *a1@<X8>)
{
  return sub_2460B4DCC(a1);
}

uint64_t sub_2460C1740@<X0>(_BYTE *a1@<X8>)
{
  return sub_2460B4F90(a1);
}

uint64_t sub_2460C1760()
{
  return sub_2460BD2A0();
}

uint64_t sub_2460C1780()
{
  return sub_2460BEB84();
}

uint64_t sub_2460C17A0()
{
  return sub_2460BB4B8();
}

uint64_t sub_2460C17C0@<X0>(_BYTE *a1@<X8>)
{
  return sub_2460BA50C(a1);
}

uint64_t sub_2460C17E0()
{
  return sub_2460BBA18();
}

uint64_t sub_2460C1800()
{
  return sub_2460BC10C();
}

uint64_t sub_2460C1820()
{
  return sub_2460BC168();
}

uint64_t sub_2460C1840()
{
  return sub_2460BC1F0();
}

uint64_t sub_2460C1860()
{
  return sub_2460BC2D4();
}

uint64_t sub_2460C1880@<X0>(_BYTE *a1@<X8>)
{
  return sub_2460BFA2C(a1);
}

uint64_t sub_2460C18A0@<X0>(_BYTE *a1@<X8>)
{
  return sub_2460BE14C(a1);
}

uint64_t sub_2460C18C0()
{
  return sub_2460B5324();
}

uint64_t sub_2460C18E0()
{
  return sub_2460BBF00();
}

uint64_t sub_2460C1900@<X0>(_BYTE *a1@<X8>)
{
  return sub_2460BCD38(a1);
}

uint64_t sub_2460C1920@<X0>(_BYTE *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v3 + 177);
  return result;
}

char *sub_2460C1964()
{
  return sub_2460C0CA0();
}

BOOL sub_2460C1984()
{
  return sub_2460C0D20();
}

uint64_t sub_2460C19A8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_beginAccess();
  *a1 = *(_BYTE *)(v3 + 179);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2460C1A04(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2460C1A14(_BYTE *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  unint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t *v8;
  uint64_t v10;

  v4 = *v2;
  sub_2460D507C();
  CommonAudio.Attribute.rawValue.getter();
  swift_bridgeObjectRetain();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  v5 = sub_2460D5094() & ~(-1 << *(_BYTE *)(v4 + 32));
  if (((*(_QWORD *)(v4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    __asm { BR              X9 }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *v8;
  *v8 = 0x8000000000000000;
  sub_2460C26E8(a2, v5, isUniquelyReferenced_nonNull_native);
  *v8 = v10;
  swift_bridgeObjectRelease();
  result = 1;
  *a1 = a2;
  return result;
}

uint64_t sub_2460C1F48()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257541118);
  v3 = sub_2460D4FA4();
  if (!*(_QWORD *)(v2 + 16))
    goto LABEL_25;
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v15 = (_QWORD *)(v2 + 56);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v2 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  swift_retain();
  if (v6)
  {
    v8 = __clz(__rbit64(v6));
    goto LABEL_20;
  }
  if (v7 > 1)
  {
    v9 = *(_QWORD *)(v2 + 64);
    v10 = 1;
    if (v9)
      goto LABEL_19;
    v10 = 2;
    if (v7 > 2)
    {
      v9 = *(_QWORD *)(v2 + 72);
      if (v9)
        goto LABEL_19;
      v10 = 3;
      if (v7 > 3)
      {
        v9 = *(_QWORD *)(v2 + 80);
        if (!v9)
        {
          v11 = 4;
          if (v7 > 4)
          {
            v9 = *(_QWORD *)(v2 + 88);
            if (v9)
            {
              v10 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v10 = v11 + 1;
              if (__OFADD__(v11, 1))
              {
                __break(1u);
                JUMPOUT(0x2460C23B0);
              }
              if (v10 >= v7)
                break;
              v9 = v15[v10];
              ++v11;
              if (v9)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v8 = __clz(__rbit64(v9)) + (v10 << 6);
LABEL_20:
        v12 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v8);
        sub_2460D507C();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  swift_release();
  v1 = v0;
  v13 = 1 << *(_BYTE *)(v2 + 32);
  if (v13 > 63)
    bzero(v15, ((unint64_t)(v13 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v15 = -1 << v13;
  *(_QWORD *)(v2 + 16) = 0;
LABEL_25:
  result = swift_release();
  *v1 = v3;
  return result;
}

uint64_t sub_2460C23EC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575410F0);
  v3 = sub_2460D4FA4();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
      sub_2460D507C();
      sub_2460D4EFC();
      swift_bridgeObjectRelease();
      result = sub_2460D5094();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_BYTE *)(*(_QWORD *)(v4 + 48) + v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2460C26E8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  char v14;

  v5 = *(_QWORD *)(*v3 + 16);
  v6 = *(_QWORD *)(*v3 + 24);
  if (v6 <= v5 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_2460C1F48();
    }
    else
    {
      if (v6 > v5)
      {
        result = (uint64_t)sub_2460C2C98();
        goto LABEL_10;
      }
      sub_2460C2FB8();
    }
    v8 = *v3;
    sub_2460D507C();
    CommonAudio.Attribute.rawValue.getter();
    sub_2460D4EFC();
    swift_bridgeObjectRelease();
    result = sub_2460D5094();
    a2 = result & ~(-1 << *(_BYTE *)(v8 + 32));
    if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
      __asm { BR              X9 }
  }
LABEL_10:
  v9 = *v13;
  *(_QWORD *)(*v13 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v9 + 48) + a2) = v14;
  v10 = *(_QWORD *)(v9 + 16);
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
  {
    __break(1u);
    JUMPOUT(0x2460C2C00);
  }
  *(_QWORD *)(v9 + 16) = v12;
  return result;
}

void *sub_2460C2C98()
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
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257541118);
  v2 = *v0;
  v3 = sub_2460D4F98();
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
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2460C2E28()
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
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575410F0);
  v2 = *v0;
  v3 = sub_2460D4F98();
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
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2460C2FB8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257541118);
  v3 = sub_2460D4FA4();
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
    goto LABEL_23;
  }
  v4 = 1 << *(_BYTE *)(v2 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v4 + 63) >> 6;
  swift_retain();
  if (v6)
  {
    v7 = __clz(__rbit64(v6));
    goto LABEL_20;
  }
  if (v13 > 1)
  {
    v8 = *(_QWORD *)(v2 + 64);
    v9 = 1;
    if (v8)
      goto LABEL_19;
    v9 = 2;
    if (v13 > 2)
    {
      v8 = *(_QWORD *)(v2 + 72);
      if (v8)
        goto LABEL_19;
      v9 = 3;
      if (v13 > 3)
      {
        v8 = *(_QWORD *)(v2 + 80);
        if (!v8)
        {
          v10 = 4;
          if (v13 > 4)
          {
            v8 = *(_QWORD *)(v2 + 88);
            if (v8)
            {
              v9 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v9 = v10 + 1;
              if (__OFADD__(v10, 1))
              {
                __break(1u);
                JUMPOUT(0x2460C33ECLL);
              }
              if (v9 >= v13)
                break;
              v8 = *(_QWORD *)(v2 + 56 + 8 * v9);
              ++v10;
              if (v8)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v7 = __clz(__rbit64(v8)) + (v9 << 6);
LABEL_20:
        v11 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v7);
        sub_2460D507C();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  result = swift_release_n();
  v1 = v0;
LABEL_23:
  *v1 = v3;
  return result;
}

uint64_t sub_2460C3428()
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
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575410F0);
  v3 = sub_2460D4FA4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
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
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    sub_2460D507C();
    sub_2460D4EFC();
    swift_bridgeObjectRelease();
    result = sub_2460D5094();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2460C36F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, _QWORD, uint64_t, uint64_t);
  char *v47;
  char v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  unsigned int (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  unint64_t v53;
  char *v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void (*v60)(char *, unint64_t, uint64_t);
  char v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t);
  int v71;
  void (*v72)(char *, uint64_t);
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void (*v77)(char *, unint64_t, uint64_t);
  char *v78;
  char v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v83;
  char *v84;
  void (*v85)(char *, uint64_t, uint64_t);
  void (*v86)(char *, _QWORD, uint64_t, uint64_t);
  unsigned int (*v87)(uint64_t, uint64_t, uint64_t);
  uint64_t v88;
  char *v89;
  int v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;

  v2 = sub_2460D4B90();
  v98 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v97 = (char *)&v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v83 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v83 - v8;
  v10 = sub_2460D4D34();
  v96 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v84 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  v12 = MEMORY[0x24BDAC7A8](v95);
  v89 = (char *)&v83 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v83 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v88 = (uint64_t)&v83 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v92 = (uint64_t)&v83 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v93 = (char *)&v83 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v91 = (char *)&v83 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v83 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v83 - v28;
  v30 = sub_2460D4C5C();
  if (v31)
  {
    v32 = v30;
    v33 = v31;
    swift_bridgeObjectRelease();
    v34 = HIBYTE(v33) & 0xF;
    if ((v33 & 0x2000000000000000) == 0)
      v34 = v32 & 0xFFFFFFFFFFFFLL;
    v35 = v34 == 0;
  }
  else
  {
    v35 = 1;
  }
  v90 = v35;
  v36 = sub_2460D4C38();
  v94 = a1;
  if (v36)
  {
    sub_2460D4CA4();
    swift_release();
    v37 = (_QWORD *)v96;
  }
  else
  {
    v37 = (_QWORD *)v96;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v96 + 56))(v29, 1, 1, v10);
  }
  v38 = *MEMORY[0x24BEA1700];
  v85 = (void (*)(char *, uint64_t, uint64_t))v37[13];
  v85(v27, v38, v10);
  v86 = (void (*)(char *, _QWORD, uint64_t, uint64_t))v37[7];
  v86(v27, 0, 1, v10);
  v39 = (uint64_t)&v15[*(int *)(v95 + 48)];
  sub_2460C784C((uint64_t)v29, (uint64_t)v15, &qword_257540740);
  sub_2460C784C((uint64_t)v27, v39, &qword_257540740);
  v40 = (unsigned int (*)(char *, uint64_t, uint64_t))v37[6];
  v41 = v40(v15, 1, v10);
  v87 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v40;
  if (v41 != 1)
  {
    v42 = (uint64_t)v91;
    sub_2460C784C((uint64_t)v15, (uint64_t)v91, &qword_257540740);
    if (v40((char *)v39, 1, v10) != 1)
    {
      v47 = v84;
      (*(void (**)(char *, uint64_t, uint64_t))(v96 + 32))(v84, v39, v10);
      sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
      v48 = sub_2460D4ED8();
      v49 = *(void (**)(char *, uint64_t))(v96 + 8);
      v49(v47, v10);
      sub_2460B2CC0((uint64_t)v27, &qword_257540740);
      sub_2460B2CC0((uint64_t)v29, &qword_257540740);
      v49(v91, v10);
      sub_2460B2CC0((uint64_t)v15, &qword_257540740);
      if ((v48 & 1) != 0)
        goto LABEL_23;
LABEL_15:
      if (sub_2460D4C38())
      {
        v43 = (uint64_t)v93;
        sub_2460D4CA4();
        swift_release();
        v44 = (uint64_t)v89;
        v45 = v92;
        v46 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v86;
      }
      else
      {
        v43 = (uint64_t)v93;
        v46 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v86;
        v86(v93, 1, 1, v10);
        v44 = (uint64_t)v89;
        v45 = v92;
      }
      v85((char *)v45, *MEMORY[0x24BEA1640], v10);
      v46(v45, 0, 1, v10);
      v50 = v44 + *(int *)(v95 + 48);
      sub_2460C784C(v43, v44, &qword_257540740);
      sub_2460C784C(v45, v50, &qword_257540740);
      v51 = v87;
      if (v87(v44, 1, v10) == 1)
      {
        sub_2460B2CC0(v45, &qword_257540740);
        sub_2460B2CC0(v43, &qword_257540740);
        if (v51(v50, 1, v10) == 1)
        {
          sub_2460B2CC0(v44, &qword_257540740);
LABEL_23:
          LODWORD(v95) = 1;
          goto LABEL_28;
        }
      }
      else
      {
        sub_2460C784C(v44, v88, &qword_257540740);
        if (v51(v50, 1, v10) != 1)
        {
          v52 = v88;
          v53 = v96;
          v54 = v84;
          (*(void (**)(char *, uint64_t, uint64_t))(v96 + 32))(v84, v50, v10);
          sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
          LODWORD(v95) = sub_2460D4ED8();
          v55 = *(void (**)(char *, uint64_t))(v53 + 8);
          v55(v54, v10);
          sub_2460B2CC0(v92, &qword_257540740);
          sub_2460B2CC0((uint64_t)v93, &qword_257540740);
          v55((char *)v52, v10);
          sub_2460B2CC0(v44, &qword_257540740);
          goto LABEL_28;
        }
        sub_2460B2CC0(v45, &qword_257540740);
        sub_2460B2CC0(v43, &qword_257540740);
        (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v88, v10);
      }
      sub_2460B2CC0(v44, &qword_257541100);
      LODWORD(v95) = 0;
      goto LABEL_28;
    }
    sub_2460B2CC0((uint64_t)v27, &qword_257540740);
    sub_2460B2CC0((uint64_t)v29, &qword_257540740);
    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v42, v10);
LABEL_14:
    sub_2460B2CC0((uint64_t)v15, &qword_257541100);
    goto LABEL_15;
  }
  sub_2460B2CC0((uint64_t)v27, &qword_257540740);
  sub_2460B2CC0((uint64_t)v29, &qword_257540740);
  if (v40((char *)v39, 1, v10) != 1)
    goto LABEL_14;
  sub_2460B2CC0((uint64_t)v15, &qword_257540740);
  LODWORD(v95) = 1;
LABEL_28:
  v56 = sub_2460D4B48();
  v57 = *(_QWORD *)(v56 + 16);
  if (!v57)
  {
    swift_bridgeObjectRelease();
    v71 = 1;
    goto LABEL_45;
  }
  v58 = v56 + ((*(unsigned __int8 *)(v98 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80));
  v59 = *(_QWORD *)(v98 + 72);
  v60 = *(void (**)(char *, unint64_t, uint64_t))(v98 + 16);
  v93 = (char *)v56;
  swift_bridgeObjectRetain();
  v96 = 0x80000002460D6EE0;
  while (1)
  {
    v60(v9, v58, v2);
    v63 = sub_2460D4B84();
    if (!v64)
    {
      v60(v7, (unint64_t)v9, v2);
LABEL_41:
      v70 = *(void (**)(char *, uint64_t))(v98 + 8);
      v70(v7, v2);
      v70(v9, v2);
      goto LABEL_31;
    }
    if (v63 == 0x7473696C79616C70 && v64 == 0xED0000656C746954)
    {
      swift_bridgeObjectRelease();
      v60(v7, (unint64_t)v9, v2);
    }
    else
    {
      v65 = sub_2460D5058();
      swift_bridgeObjectRelease();
      v60(v7, (unint64_t)v9, v2);
      if ((v65 & 1) == 0)
        goto LABEL_41;
    }
    sub_2460D4B54();
    v66 = sub_2460D4EF0();
    v68 = v67;
    swift_bridgeObjectRelease();
    if (v66 == sub_2460D4EF0() && v68 == v69)
      break;
    v61 = sub_2460D5058();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v62 = *(void (**)(char *, uint64_t))(v98 + 8);
    v62(v7, v2);
    v62(v9, v2);
    if ((v61 & 1) != 0)
      goto LABEL_44;
LABEL_31:
    v58 += v59;
    if (!--v57)
    {
      swift_bridgeObjectRelease_n();
      v71 = 1;
      goto LABEL_45;
    }
  }
  swift_bridgeObjectRelease_n();
  v72 = *(void (**)(char *, uint64_t))(v98 + 8);
  v72(v7, v2);
  v72(v9, v2);
LABEL_44:
  swift_bridgeObjectRelease_n();
  v71 = 0;
LABEL_45:
  v73 = sub_2460D4B48();
  v74 = *(_QWORD *)(v73 + 16);
  if (!v74)
  {
    swift_bridgeObjectRelease();
    return v95 & v71 & ~v90;
  }
  LODWORD(v94) = v71;
  v75 = v73 + ((*(unsigned __int8 *)(v98 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80));
  v76 = *(_QWORD *)(v98 + 72);
  v77 = *(void (**)(char *, unint64_t, uint64_t))(v98 + 16);
  v96 = v73;
  swift_bridgeObjectRetain();
  v78 = v97;
  while (2)
  {
    v77(v78, v75, v2);
    v80 = sub_2460D4B84();
    if (!v81)
    {
      (*(void (**)(char *, uint64_t))(v98 + 8))(v78, v2);
LABEL_48:
      v75 += v76;
      if (!--v74)
      {
        swift_bridgeObjectRelease_n();
        v71 = v94;
        return v95 & v71 & ~v90;
      }
      continue;
    }
    break;
  }
  if (v80 != 0xD000000000000010 || v81 != 0x80000002460D6B30)
  {
    v79 = sub_2460D5058();
    swift_bridgeObjectRelease();
    v78 = v97;
    (*(void (**)(char *, uint64_t))(v98 + 8))(v97, v2);
    if ((v79 & 1) != 0)
      goto LABEL_57;
    goto LABEL_48;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v98 + 8))(v97, v2);
LABEL_57:
  swift_bridgeObjectRelease_n();
  return 0;
}

BOOL sub_2460C4174(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int (*v40)(char *, uint64_t, uint64_t);
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, _QWORD, uint64_t, uint64_t);
  char *v47;
  char v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  unsigned int (*v51)(uint64_t, uint64_t, uint64_t);
  int v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  int v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  void (*v62)(char *, unint64_t, uint64_t);
  char v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t);
  int v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  void (*v79)(char *, unint64_t, uint64_t);
  char *v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  char *v86;
  void (*v87)(char *, uint64_t, uint64_t);
  void (*v88)(char *, _QWORD, uint64_t, uint64_t);
  unsigned int (*v89)(uint64_t, uint64_t, uint64_t);
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  _BOOL4 v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;

  v2 = sub_2460D4B90();
  v100 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v99 = (char *)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v85 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v85 - v8;
  v10 = sub_2460D4D34();
  v98 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v86 = (char *)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  v12 = MEMORY[0x24BDAC7A8](v97);
  v91 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v85 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v90 = (uint64_t)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v94 = (uint64_t)&v85 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v93 = (char *)&v85 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v92 = (char *)&v85 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v85 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v85 - v28;
  v30 = sub_2460D4C5C();
  if (v31)
  {
    v32 = v30;
    v33 = v31;
    swift_bridgeObjectRelease();
    v34 = HIBYTE(v33) & 0xF;
    if ((v33 & 0x2000000000000000) == 0)
      v34 = v32 & 0xFFFFFFFFFFFFLL;
    v35 = v34 == 0;
  }
  else
  {
    v35 = 1;
  }
  v95 = v35;
  v36 = sub_2460D4C38();
  v96 = a1;
  if (v36)
  {
    sub_2460D4CA4();
    swift_release();
    v37 = (_QWORD *)v98;
  }
  else
  {
    v37 = (_QWORD *)v98;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v98 + 56))(v29, 1, 1, v10);
  }
  v38 = *MEMORY[0x24BEA1700];
  v87 = (void (*)(char *, uint64_t, uint64_t))v37[13];
  v87(v27, v38, v10);
  v88 = (void (*)(char *, _QWORD, uint64_t, uint64_t))v37[7];
  v88(v27, 0, 1, v10);
  v39 = (uint64_t)&v15[*(int *)(v97 + 48)];
  sub_2460C784C((uint64_t)v29, (uint64_t)v15, &qword_257540740);
  sub_2460C784C((uint64_t)v27, v39, &qword_257540740);
  v40 = (unsigned int (*)(char *, uint64_t, uint64_t))v37[6];
  v41 = v40(v15, 1, v10);
  v89 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v40;
  if (v41 != 1)
  {
    v42 = (uint64_t)v92;
    sub_2460C784C((uint64_t)v15, (uint64_t)v92, &qword_257540740);
    if (v40((char *)v39, 1, v10) != 1)
    {
      v47 = v86;
      (*(void (**)(char *, uint64_t, uint64_t))(v98 + 32))(v86, v39, v10);
      sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
      v48 = sub_2460D4ED8();
      v49 = *(void (**)(char *, uint64_t))(v98 + 8);
      v49(v47, v10);
      sub_2460B2CC0((uint64_t)v27, &qword_257540740);
      sub_2460B2CC0((uint64_t)v29, &qword_257540740);
      v49(v92, v10);
      sub_2460B2CC0((uint64_t)v15, &qword_257540740);
      v43 = v94;
      if ((v48 & 1) != 0)
        goto LABEL_23;
LABEL_15:
      if (sub_2460D4C38())
      {
        v44 = (uint64_t)v93;
        sub_2460D4CA4();
        swift_release();
        v45 = (uint64_t)v91;
        v46 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v88;
      }
      else
      {
        v44 = (uint64_t)v93;
        v46 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v88;
        v88(v93, 1, 1, v10);
        v45 = (uint64_t)v91;
      }
      v87((char *)v43, *MEMORY[0x24BEA1640], v10);
      v46(v43, 0, 1, v10);
      v50 = v45 + *(int *)(v97 + 48);
      sub_2460C784C(v44, v45, &qword_257540740);
      sub_2460C784C(v43, v50, &qword_257540740);
      v51 = v89;
      if (v89(v45, 1, v10) == 1)
      {
        sub_2460B2CC0(v43, &qword_257540740);
        sub_2460B2CC0(v44, &qword_257540740);
        if (v51(v50, 1, v10) == 1)
        {
          sub_2460B2CC0(v45, &qword_257540740);
LABEL_23:
          LODWORD(v97) = 0;
          goto LABEL_29;
        }
      }
      else
      {
        sub_2460C784C(v45, v90, &qword_257540740);
        if (v51(v50, 1, v10) != 1)
        {
          v53 = v98;
          v54 = v90;
          v55 = v86;
          (*(void (**)(char *, uint64_t, uint64_t))(v98 + 32))(v86, v50, v10);
          sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
          v56 = sub_2460D4ED8();
          v57 = *(void (**)(char *, uint64_t))(v53 + 8);
          v57(v55, v10);
          sub_2460B2CC0(v94, &qword_257540740);
          sub_2460B2CC0((uint64_t)v93, &qword_257540740);
          v57((char *)v54, v10);
          sub_2460B2CC0(v45, &qword_257540740);
          v52 = v56 ^ 1;
          goto LABEL_28;
        }
        sub_2460B2CC0(v43, &qword_257540740);
        sub_2460B2CC0(v44, &qword_257540740);
        (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v90, v10);
      }
      sub_2460B2CC0(v45, &qword_257541100);
      v52 = 1;
LABEL_28:
      LODWORD(v97) = v52;
      goto LABEL_29;
    }
    sub_2460B2CC0((uint64_t)v27, &qword_257540740);
    sub_2460B2CC0((uint64_t)v29, &qword_257540740);
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v42, v10);
LABEL_14:
    sub_2460B2CC0((uint64_t)v15, &qword_257541100);
    v43 = v94;
    goto LABEL_15;
  }
  sub_2460B2CC0((uint64_t)v27, &qword_257540740);
  sub_2460B2CC0((uint64_t)v29, &qword_257540740);
  if (v40((char *)v39, 1, v10) != 1)
    goto LABEL_14;
  sub_2460B2CC0((uint64_t)v15, &qword_257540740);
  LODWORD(v97) = 0;
LABEL_29:
  v58 = sub_2460D4B48();
  v59 = *(_QWORD *)(v58 + 16);
  if (!v59)
  {
    swift_bridgeObjectRelease();
    v73 = 1;
    goto LABEL_46;
  }
  v60 = v58 + ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80));
  v61 = *(_QWORD *)(v100 + 72);
  v62 = *(void (**)(char *, unint64_t, uint64_t))(v100 + 16);
  v94 = v58;
  swift_bridgeObjectRetain();
  v98 = 0x80000002460D6EE0;
  while (1)
  {
    v62(v9, v60, v2);
    v65 = sub_2460D4B84();
    if (!v66)
    {
      v62(v7, (unint64_t)v9, v2);
LABEL_42:
      v72 = *(void (**)(char *, uint64_t))(v100 + 8);
      v72(v7, v2);
      v72(v9, v2);
      goto LABEL_32;
    }
    if (v65 == 0x7473696C79616C70 && v66 == 0xED0000656C746954)
    {
      swift_bridgeObjectRelease();
      v62(v7, (unint64_t)v9, v2);
    }
    else
    {
      v67 = sub_2460D5058();
      swift_bridgeObjectRelease();
      v62(v7, (unint64_t)v9, v2);
      if ((v67 & 1) == 0)
        goto LABEL_42;
    }
    sub_2460D4B54();
    v68 = sub_2460D4EF0();
    v70 = v69;
    swift_bridgeObjectRelease();
    if (v68 == sub_2460D4EF0() && v70 == v71)
      break;
    v63 = sub_2460D5058();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v64 = *(void (**)(char *, uint64_t))(v100 + 8);
    v64(v7, v2);
    v64(v9, v2);
    if ((v63 & 1) != 0)
      goto LABEL_45;
LABEL_32:
    v60 += v61;
    if (!--v59)
    {
      swift_bridgeObjectRelease_n();
      v73 = 1;
      goto LABEL_46;
    }
  }
  swift_bridgeObjectRelease_n();
  v74 = *(void (**)(char *, uint64_t))(v100 + 8);
  v74(v7, v2);
  v74(v9, v2);
LABEL_45:
  swift_bridgeObjectRelease_n();
  v73 = 0;
LABEL_46:
  v75 = sub_2460D4B48();
  v76 = *(_QWORD *)(v75 + 16);
  if (v76)
  {
    LODWORD(v98) = v73;
    v77 = v75 + ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80));
    v78 = *(_QWORD *)(v100 + 72);
    v79 = *(void (**)(char *, unint64_t, uint64_t))(v100 + 16);
    v96 = v75;
    swift_bridgeObjectRetain();
    v80 = v99;
    while (1)
    {
      v79(v80, v77, v2);
      v82 = sub_2460D4B84();
      if (v83)
      {
        if (v82 == 0xD000000000000010 && v83 == 0x80000002460D6B30)
        {
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v100 + 8))(v99, v2);
LABEL_59:
          swift_bridgeObjectRelease_n();
          return 0;
        }
        v81 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v80 = v99;
        (*(void (**)(char *, uint64_t))(v100 + 8))(v99, v2);
        if ((v81 & 1) != 0)
          goto LABEL_59;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v100 + 8))(v80, v2);
      }
      v77 += v78;
      if (!--v76)
      {
        swift_bridgeObjectRelease_n();
        v73 = v98;
        return ((v95 | v97 | v73) & 1) == 0;
      }
    }
  }
  swift_bridgeObjectRelease();
  return ((v95 | v97 | v73) & 1) == 0;
}

uint64_t sub_2460C4C14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unint64_t, uint64_t);
  char v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  unsigned int (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  char *v48;
  void (*v49)(char *, uint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;

  v2 = sub_2460D4D34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v52 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v59);
  v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v58 = (uint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v51 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v62 = (char *)&v51 - v13;
  v14 = sub_2460D4B90();
  v64 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v51 - v18;
  v20 = sub_2460D4C5C();
  if (v21)
  {
    v22 = v20;
    v23 = v21;
    swift_bridgeObjectRelease();
    v24 = HIBYTE(v23) & 0xF;
    if ((v23 & 0x2000000000000000) == 0)
      v24 = v22 & 0xFFFFFFFFFFFFLL;
    v25 = v24 == 0;
  }
  else
  {
    v25 = 1;
  }
  v60 = v25;
  v61 = a1;
  v26 = sub_2460D4B48();
  v27 = *(_QWORD *)(v26 + 16);
  if (!v27)
  {
    swift_bridgeObjectRelease();
LABEL_22:
    v41 = (uint64_t)v62;
    if (!v60)
    {
      v42 = 1;
      goto LABEL_25;
    }
    return 0;
  }
  v54 = v12;
  v55 = v3;
  v56 = v6;
  v57 = v2;
  v28 = v26 + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
  v29 = *(_QWORD *)(v64 + 72);
  v30 = *(void (**)(char *, unint64_t, uint64_t))(v64 + 16);
  v53 = v26;
  swift_bridgeObjectRetain();
  v63 = 0x80000002460D6EE0;
  while (1)
  {
    v30(v19, v28, v14);
    v33 = sub_2460D4B84();
    if (!v34)
    {
      v30(v17, (unint64_t)v19, v14);
LABEL_19:
      v40 = *(void (**)(char *, uint64_t))(v64 + 8);
      v40(v17, v14);
      v40(v19, v14);
      goto LABEL_9;
    }
    if (v33 == 0x5474736163646F70 && v34 == 0xEC000000656C7469)
    {
      swift_bridgeObjectRelease();
      v30(v17, (unint64_t)v19, v14);
    }
    else
    {
      v35 = sub_2460D5058();
      swift_bridgeObjectRelease();
      v30(v17, (unint64_t)v19, v14);
      if ((v35 & 1) == 0)
        goto LABEL_19;
    }
    sub_2460D4B54();
    v36 = sub_2460D4EF0();
    v38 = v37;
    swift_bridgeObjectRelease();
    if (v36 == sub_2460D4EF0() && v38 == v39)
      break;
    v31 = sub_2460D5058();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = *(void (**)(char *, uint64_t))(v64 + 8);
    v32(v17, v14);
    v32(v19, v14);
    if ((v31 & 1) != 0)
      goto LABEL_24;
LABEL_9:
    v28 += v29;
    if (!--v27)
    {
      swift_bridgeObjectRelease_n();
      v6 = v56;
      v2 = v57;
      v12 = v54;
      v3 = v55;
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease_n();
  v43 = *(void (**)(char *, uint64_t))(v64 + 8);
  v43(v17, v14);
  v43(v19, v14);
LABEL_24:
  swift_bridgeObjectRelease_n();
  v42 = 0;
  v6 = v56;
  v2 = v57;
  v12 = v54;
  v3 = v55;
  v41 = (uint64_t)v62;
  if (!v60)
  {
LABEL_25:
    if (sub_2460D4C38())
    {
      sub_2460D4CA4();
      swift_release();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v41, 1, 1, v2);
    }
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v12, *MEMORY[0x24BEA16F0], v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v12, 0, 1, v2);
    v44 = (uint64_t)&v6[*(int *)(v59 + 48)];
    sub_2460C784C(v41, (uint64_t)v6, &qword_257540740);
    sub_2460C784C((uint64_t)v12, v44, &qword_257540740);
    v45 = (uint64_t)v12;
    v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
    if (v46((uint64_t)v6, 1, v2) == 1)
    {
      sub_2460B2CC0(v45, &qword_257540740);
      sub_2460B2CC0(v41, &qword_257540740);
      if (v46(v44, 1, v2) == 1)
      {
        sub_2460B2CC0((uint64_t)v6, &qword_257540740);
        return v42;
      }
LABEL_33:
      sub_2460B2CC0((uint64_t)v6, &qword_257541100);
    }
    else
    {
      v47 = v58;
      sub_2460C784C((uint64_t)v6, v58, &qword_257540740);
      if (v46(v44, 1, v2) == 1)
      {
        sub_2460B2CC0(v45, &qword_257540740);
        sub_2460B2CC0(v41, &qword_257540740);
        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v47, v2);
        goto LABEL_33;
      }
      v48 = v52;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v52, v44, v2);
      sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
      LODWORD(v64) = sub_2460D4ED8();
      v49 = *(void (**)(char *, uint64_t))(v3 + 8);
      v49(v48, v2);
      sub_2460B2CC0(v45, &qword_257540740);
      sub_2460B2CC0(v41, &qword_257540740);
      v49((char *)v47, v2);
      sub_2460B2CC0((uint64_t)v6, &qword_257540740);
      if ((v64 & 1) != 0)
        return v42;
    }
    return 0;
  }
  return v42;
}

uint64_t sub_2460C5260(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unint64_t, uint64_t);
  char v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  unsigned int (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  char *v48;
  void (*v49)(char *, uint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;

  v2 = sub_2460D4D34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v52 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v59);
  v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v58 = (uint64_t)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v51 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v62 = (char *)&v51 - v13;
  v14 = sub_2460D4B90();
  v64 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v51 - v18;
  v20 = sub_2460D4C5C();
  if (v21)
  {
    v22 = v20;
    v23 = v21;
    swift_bridgeObjectRelease();
    v24 = HIBYTE(v23) & 0xF;
    if ((v23 & 0x2000000000000000) == 0)
      v24 = v22 & 0xFFFFFFFFFFFFLL;
    v25 = v24 == 0;
  }
  else
  {
    v25 = 1;
  }
  v60 = v25;
  v61 = a1;
  v26 = sub_2460D4B48();
  v27 = *(_QWORD *)(v26 + 16);
  if (!v27)
  {
    swift_bridgeObjectRelease();
LABEL_22:
    v41 = (uint64_t)v62;
    if (v60)
      return 0;
    v42 = 0;
    if (!sub_2460D4C38())
      goto LABEL_27;
LABEL_24:
    sub_2460D4CA4();
    swift_release();
    goto LABEL_28;
  }
  v54 = v12;
  v55 = v3;
  v56 = v6;
  v57 = v2;
  v28 = v26 + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80));
  v29 = *(_QWORD *)(v64 + 72);
  v30 = *(void (**)(char *, unint64_t, uint64_t))(v64 + 16);
  v53 = v26;
  swift_bridgeObjectRetain();
  v63 = 0x80000002460D6EE0;
  while (1)
  {
    v30(v19, v28, v14);
    v33 = sub_2460D4B84();
    if (!v34)
    {
      v30(v17, (unint64_t)v19, v14);
LABEL_19:
      v40 = *(void (**)(char *, uint64_t))(v64 + 8);
      v40(v17, v14);
      v40(v19, v14);
      goto LABEL_9;
    }
    if (v33 == 0x5474736163646F70 && v34 == 0xEC000000656C7469)
    {
      swift_bridgeObjectRelease();
      v30(v17, (unint64_t)v19, v14);
    }
    else
    {
      v35 = sub_2460D5058();
      swift_bridgeObjectRelease();
      v30(v17, (unint64_t)v19, v14);
      if ((v35 & 1) == 0)
        goto LABEL_19;
    }
    sub_2460D4B54();
    v36 = sub_2460D4EF0();
    v38 = v37;
    swift_bridgeObjectRelease();
    if (v36 == sub_2460D4EF0() && v38 == v39)
      break;
    v31 = sub_2460D5058();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = *(void (**)(char *, uint64_t))(v64 + 8);
    v32(v17, v14);
    v32(v19, v14);
    if ((v31 & 1) != 0)
      goto LABEL_25;
LABEL_9:
    v28 += v29;
    if (!--v27)
    {
      swift_bridgeObjectRelease_n();
      v6 = v56;
      v2 = v57;
      v12 = v54;
      v3 = v55;
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease_n();
  v43 = *(void (**)(char *, uint64_t))(v64 + 8);
  v43(v17, v14);
  v43(v19, v14);
LABEL_25:
  swift_bridgeObjectRelease_n();
  v6 = v56;
  v2 = v57;
  v12 = v54;
  v3 = v55;
  v41 = (uint64_t)v62;
  if (v60)
    return 0;
  v42 = 1;
  if (sub_2460D4C38())
    goto LABEL_24;
LABEL_27:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v41, 1, 1, v2);
LABEL_28:
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v12, *MEMORY[0x24BEA16F0], v2);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v12, 0, 1, v2);
  v44 = (uint64_t)&v6[*(int *)(v59 + 48)];
  sub_2460C784C(v41, (uint64_t)v6, &qword_257540740);
  sub_2460C784C((uint64_t)v12, v44, &qword_257540740);
  v45 = (uint64_t)v12;
  v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v46((uint64_t)v6, 1, v2) != 1)
  {
    v47 = v58;
    sub_2460C784C((uint64_t)v6, v58, &qword_257540740);
    if (v46(v44, 1, v2) != 1)
    {
      v48 = v52;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v52, v44, v2);
      sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
      LODWORD(v64) = sub_2460D4ED8();
      v49 = *(void (**)(char *, uint64_t))(v3 + 8);
      v49(v48, v2);
      sub_2460B2CC0(v45, &qword_257540740);
      sub_2460B2CC0(v41, &qword_257540740);
      v49((char *)v47, v2);
      sub_2460B2CC0((uint64_t)v6, &qword_257540740);
      if ((v64 & 1) != 0)
        return v42;
      return 0;
    }
    sub_2460B2CC0(v45, &qword_257540740);
    sub_2460B2CC0(v41, &qword_257540740);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v47, v2);
LABEL_33:
    sub_2460B2CC0((uint64_t)v6, &qword_257541100);
    return 0;
  }
  sub_2460B2CC0(v45, &qword_257540740);
  sub_2460B2CC0(v41, &qword_257540740);
  if (v46(v44, 1, v2) != 1)
    goto LABEL_33;
  sub_2460B2CC0((uint64_t)v6, &qword_257540740);
  return v42;
}

uint64_t sub_2460C58B0()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v0 = sub_2460B4C5C();
  v1 = sub_2460CCB08(v0, MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_2460C4174, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v4, v1);
      else
        swift_retain();
      v7 = sub_2460D4C5C();
      v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_2460CBD64(0, v5[2] + 1, 1, v5);
        v11 = v5[2];
        v10 = v5[3];
        if (v11 >= v10 >> 1)
          v5 = sub_2460CBD64((_QWORD *)(v10 > 1), v11 + 1, 1, v5);
        v5[2] = v11 + 1;
        v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460C5A54(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_2460C5A68(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_2460C5A7C()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v0 = sub_2460B4C5C();
  v1 = sub_2460CCB08(v0, MEMORY[0x24BEE4AF8], sub_2460C4C14, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v4, v1);
      else
        swift_retain();
      v7 = sub_2460D4C5C();
      v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_2460CBD64(0, v5[2] + 1, 1, v5);
        v11 = v5[2];
        v10 = v5[3];
        if (v11 >= v10 >> 1)
          v5 = sub_2460CBD64((_QWORD *)(v10 > 1), v11 + 1, 1, v5);
        v5[2] = v11 + 1;
        v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460C5C20(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(uint64_t, uint64_t, uint64_t);
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v38;
  uint64_t v39;
  char *v40;
  int v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  unsigned __int8 v46;

  v41 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540720);
  MEMORY[0x24BDAC7A8](v3);
  v43 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2460D4B90();
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v40 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2460D4D34();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v39 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v39 - v21;
  v45 = a1;
  v23 = sub_2460B4360();
  if (!v23)
    return 0;
  v44 = v23;
  v24 = sub_2460D4C38();
  v39 = v5;
  if (v24)
  {
    sub_2460D4CA4();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v22, 1, 1, v7);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v20, *MEMORY[0x24BEA1670], v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v20, 0, 1, v7);
  v25 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_2460C784C((uint64_t)v22, (uint64_t)v13, &qword_257540740);
  sub_2460C784C((uint64_t)v20, v25, &qword_257540740);
  v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (v26((uint64_t)v13, 1, v7) == 1)
  {
    sub_2460B2CC0((uint64_t)v20, &qword_257540740);
    sub_2460B2CC0((uint64_t)v22, &qword_257540740);
    if (v26(v25, 1, v7) == 1)
    {
      sub_2460B2CC0((uint64_t)v13, &qword_257540740);
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  sub_2460C784C((uint64_t)v13, (uint64_t)v17, &qword_257540740);
  if (v26(v25, 1, v7) == 1)
  {
    sub_2460B2CC0((uint64_t)v20, &qword_257540740);
    sub_2460B2CC0((uint64_t)v22, &qword_257540740);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v17, v7);
LABEL_10:
    sub_2460B2CC0((uint64_t)v13, &qword_257541100);
LABEL_15:
    swift_release();
    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v10, v25, v7);
  sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
  v27 = sub_2460D4ED8();
  v28 = *(void (**)(char *, uint64_t))(v8 + 8);
  v28(v10, v7);
  sub_2460B2CC0((uint64_t)v20, &qword_257540740);
  sub_2460B2CC0((uint64_t)v22, &qword_257540740);
  v28(v17, v7);
  sub_2460B2CC0((uint64_t)v13, &qword_257540740);
  if ((v27 & 1) == 0)
    goto LABEL_15;
LABEL_12:
  if (!sub_2460B4B9C())
    goto LABEL_15;
  v46 = v41;
  v29 = sub_2460D4EF0();
  v31 = UsoEntity_common_MediaItem.identifiers(forNamespace:appBundleId:)(&v46, v29, v30);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v31 + 16))
  {
    v33 = v42;
    v32 = (uint64_t)v43;
    v34 = v39;
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + 16))(v43, v31 + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80)), v39);
    v35 = 0;
  }
  else
  {
    v35 = 1;
    v34 = v39;
    v33 = v42;
    v32 = (uint64_t)v43;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 56))(v32, v35, 1, v34);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v32, 1, v34) != 1)
  {
    v38 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 32))(v40, v32, v34);
    v36 = sub_2460D4B78();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v38, v34);
    return v36;
  }
  swift_release();
  swift_release();
  sub_2460B2CC0(v32, &qword_257540720);
  return 0;
}

uint64_t sub_2460C613C()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v0 = sub_2460B4C5C();
  v1 = sub_2460CCB08(v0, MEMORY[0x24BEE4AF8], sub_2460C5260, 0);
  swift_bridgeObjectRelease();
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_16:
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v5;
  }
  swift_bridgeObjectRetain();
  result = sub_2460D5028();
  v2 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](v4, v1);
      else
        swift_retain();
      v7 = sub_2460D4C5C();
      v9 = v8;
      swift_release();
      if (v9)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_2460CBD64(0, v5[2] + 1, 1, v5);
        v11 = v5[2];
        v10 = v5[3];
        if (v11 >= v10 >> 1)
          v5 = sub_2460CBD64((_QWORD *)(v10 > 1), v11 + 1, 1, v5);
        v5[2] = v11 + 1;
        v6 = &v5[2 * v11];
        v6[4] = v7;
        v6[5] = v9;
      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460C62E0(uint64_t result)
{
  if (result != 1)
    return swift_release();
  return result;
}

uint64_t sub_2460C62F0(uint64_t result)
{
  if (result != 1)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_2460C6304()
{
  unint64_t result;

  result = qword_257540748;
  if (!qword_257540748)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for AudioUsoIntent.UsoNamespace, &type metadata for AudioUsoIntent.UsoNamespace);
    atomic_store(result, (unint64_t *)&qword_257540748);
  }
  return result;
}

unint64_t sub_2460C634C()
{
  unint64_t result;

  result = qword_257540750;
  if (!qword_257540750)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for AudioUsoIntent.IterationOptions, &type metadata for AudioUsoIntent.IterationOptions);
    atomic_store(result, (unint64_t *)&qword_257540750);
  }
  return result;
}

uint64_t sub_2460C6390@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 177);
  return result;
}

uint64_t sub_2460C63D4(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 177) = v2;
  return result;
}

uint64_t sub_2460C6414@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 178);
  return result;
}

uint64_t sub_2460C6458(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 178) = v2;
  return result;
}

uint64_t sub_2460C6498@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 179);
  return result;
}

uint64_t sub_2460C64DC(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 179) = v2;
  return result;
}

uint64_t sub_2460C651C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 184);
  return swift_retain();
}

uint64_t sub_2460C6568@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2460B4DCC(&v3);
  *a1 = v3;
  return result;
}

_BYTE *sub_2460C65A0(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)a2 + 232) = *result;
  return result;
}

uint64_t sub_2460C65B0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2460B4F90(&v3);
  *a1 = v3;
  return result;
}

_BYTE *sub_2460C65E8(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)a2 + 233) = *result;
  return result;
}

uint64_t sub_2460C65F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460B5098();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6620(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 240) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6650@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460B5324();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6678(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)a2 + 248);
  *(_QWORD *)(*(_QWORD *)a2 + 248) = *a1;
  swift_retain();
  return sub_2460C62E0(v2);
}

uint64_t sub_2460C66A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460B5488();
  *a1 = result;
  return result;
}

uint64_t sub_2460C66D0(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 256) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6700@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460B57DC();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6728(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 264) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6758@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460B5B74();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6780(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 272) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C67B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460B63A4();
  *a1 = result;
  return result;
}

uint64_t sub_2460C67D8(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 280) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_2460C6808@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = sub_2460B65B0();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6830(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 288) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_2460C6860@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = sub_2460B7250();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6888(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 296) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_2460C68B8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = sub_2460B7F2C();
  *a1 = result;
  return result;
}

uint64_t sub_2460C68E0(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 304) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_2460C6910@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = sub_2460B8BCC();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6938(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 312) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_2460C6968@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = sub_2460B986C();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6990(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 320) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C69C0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2460BA50C(&v3);
  *a1 = v3;
  return result;
}

_BYTE *sub_2460C69F8(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)a2 + 328) = *result;
  return result;
}

uint64_t sub_2460C6A08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BAAE0();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6A30(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)a2 + 336);
  *(_QWORD *)(*(_QWORD *)a2 + 336) = *a1;
  swift_retain();
  return sub_2460C62E0(v2);
}

uint64_t sub_2460C6A60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BAC74();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6A88(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 344) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6AB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BB4B8();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6AE0(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 352) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6B10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BBA18();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6B38(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 360) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6B68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BBBE8();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6B90(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 368) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6BC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BBC74();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6BE8(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 376) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6C18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2460BBCD0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2460C6C40(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 384);
  v6 = *(_QWORD *)(*a2 + 392);
  *(_QWORD *)(v4 + 384) = v3;
  *(_QWORD *)(v4 + 392) = v2;
  swift_bridgeObjectRetain();
  return sub_2460C5A54(v5, v6);
}

uint64_t sub_2460C6C74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2460BBDE8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2460C6C9C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 400);
  v6 = *(_QWORD *)(*a2 + 408);
  *(_QWORD *)(v4 + 400) = v3;
  *(_QWORD *)(v4 + 408) = v2;
  swift_bridgeObjectRetain();
  return sub_2460C5A54(v5, v6);
}

uint64_t sub_2460C6CD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BBF00();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6CF8(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 416) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6D28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BC10C();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6D50(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 424) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6D80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2460BC168();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2460C6DA8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 432);
  v6 = *(_QWORD *)(*a2 + 440);
  *(_QWORD *)(v4 + 432) = v3;
  *(_QWORD *)(v4 + 440) = v2;
  swift_bridgeObjectRetain();
  return sub_2460C5A54(v5, v6);
}

uint64_t sub_2460C6DDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2460BC1F0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2460C6E04(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 448);
  v6 = *(_QWORD *)(*a2 + 456);
  *(_QWORD *)(v4 + 448) = v3;
  *(_QWORD *)(v4 + 456) = v2;
  swift_bridgeObjectRetain();
  return sub_2460C5A54(v5, v6);
}

uint64_t sub_2460C6E38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BC278();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6E60(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 464) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6E90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BC2D4();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6EB8(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 472) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6EE8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2460BC4E0(&v3);
  *a1 = v3;
  return result;
}

_BYTE *sub_2460C6F20(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)a2 + 480) = *result;
  return result;
}

uint64_t sub_2460C6F30@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2460BCD38(&v3);
  *a1 = v3;
  return result;
}

_BYTE *sub_2460C6F68(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)a2 + 481) = *result;
  return result;
}

uint64_t sub_2460C6F78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BD2A0();
  *a1 = result;
  return result;
}

uint64_t sub_2460C6FA0(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 488) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C6FD0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2460BE14C(&v3);
  *a1 = v3;
  return result;
}

_BYTE *sub_2460C7008(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)a2 + 496) = *result;
  return result;
}

uint64_t sub_2460C7018@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BE444();
  *a1 = result;
  return result;
}

uint64_t sub_2460C7040(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 504) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C7070@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BEB84();
  *a1 = result;
  return result;
}

uint64_t sub_2460C7098(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 512) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C70C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2460BF2E4();
  *a1 = result;
  return result;
}

uint64_t sub_2460C70F0(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 520) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460C7120@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2460BFA2C(&v3);
  *a1 = v3;
  return result;
}

_BYTE *sub_2460C7158(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)a2 + 528) = *result;
  return result;
}

uint64_t sub_2460C7168@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2460C0298();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2460C7198(uint64_t result, uint64_t *a2)
{
  unsigned __int8 v2;
  uint64_t v3;

  v2 = *(_BYTE *)(result + 8);
  v3 = *a2;
  *(_QWORD *)(v3 + 536) = *(_QWORD *)result;
  *(_WORD *)(v3 + 544) = v2;
  return result;
}

char *sub_2460C71B4@<X0>(char **a1@<X8>)
{
  char *result;

  result = sub_2460C0CA0();
  *a1 = result;
  return result;
}

uint64_t sub_2460C71DC(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)a2 + 552) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

BOOL sub_2460C720C@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_2460C0D20();
  *a1 = result;
  return result;
}

_BYTE *sub_2460C7238(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)a2 + 560) = *result;
  return result;
}

uint64_t sub_2460C7248@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 576);
  *a2 = *(_QWORD *)(v3 + 568);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for AudioUsoIntent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AudioUsoIntent.verb.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1144))();
}

uint64_t dispatch thunk of AudioUsoIntent.baseEntity.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1168))();
}

uint64_t dispatch thunk of AudioUsoIntent.confirmationState.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1192))();
}

uint64_t dispatch thunk of AudioUsoIntent.usoTask.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1216))();
}

uint64_t dispatch thunk of AudioUsoIntent.usoTask.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1224))();
}

uint64_t dispatch thunk of AudioUsoIntent.usoTask.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1232))();
}

uint64_t dispatch thunk of AudioUsoIntent.__allocating_init(task:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 1248))();
}

uint64_t dispatch thunk of AudioUsoIntent.mediaType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1376))();
}

uint64_t dispatch thunk of AudioUsoIntent.targetMediaType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1400))();
}

uint64_t dispatch thunk of AudioUsoIntent.entities.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1424))();
}

uint64_t dispatch thunk of AudioUsoIntent.resolvedReference.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1448))();
}

uint64_t dispatch thunk of AudioUsoIntent.disambiguationEntities.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1472))();
}

uint64_t dispatch thunk of AudioUsoIntent.apps.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1496))();
}

uint64_t dispatch thunk of AudioUsoIntent.artists.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1520))();
}

uint64_t dispatch thunk of AudioUsoIntent.albums.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1544))();
}

uint64_t dispatch thunk of AudioUsoIntent.appPlaylistTitles.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1568))();
}

uint64_t dispatch thunk of AudioUsoIntent.appShowTitles.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1592))();
}

uint64_t dispatch thunk of AudioUsoIntent.appAudiobookTitles.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1616))();
}

uint64_t dispatch thunk of AudioUsoIntent.appMusicArtistNames.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1640))();
}

uint64_t dispatch thunk of AudioUsoIntent.appAudiobookAuthors.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1664))();
}

uint64_t dispatch thunk of AudioUsoIntent.noun.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1688))();
}

uint64_t dispatch thunk of AudioUsoIntent.dateTime.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1712))();
}

uint64_t dispatch thunk of AudioUsoIntent.attributes.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1736))();
}

uint64_t dispatch thunk of AudioUsoIntent.musicTitles.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1760))();
}

uint64_t dispatch thunk of AudioUsoIntent.playlistTitles.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1784))();
}

uint64_t dispatch thunk of AudioUsoIntent.playlistMediaItems.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1808))();
}

uint64_t dispatch thunk of AudioUsoIntent.applePlaylistTitles.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1832))();
}

uint64_t dispatch thunk of AudioUsoIntent.appName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1856))();
}

uint64_t dispatch thunk of AudioUsoIntent.appBundleId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1880))();
}

uint64_t dispatch thunk of AudioUsoIntent.showTitles.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1904))();
}

uint64_t dispatch thunk of AudioUsoIntent.podcastTitles.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1928))();
}

uint64_t dispatch thunk of AudioUsoIntent.newsPodcastTopicId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1952))();
}

uint64_t dispatch thunk of AudioUsoIntent.newsPodcastIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 1976))();
}

uint64_t dispatch thunk of AudioUsoIntent.applePodcastTitles.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2000))();
}

uint64_t dispatch thunk of AudioUsoIntent.radioStationNames.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2024))();
}

uint64_t dispatch thunk of AudioUsoIntent.decade.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2048))();
}

uint64_t dispatch thunk of AudioUsoIntent.sort.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2072))();
}

uint64_t dispatch thunk of AudioUsoIntent.modifiers.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2096))();
}

uint64_t dispatch thunk of AudioUsoIntent.reference.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2120))();
}

uint64_t dispatch thunk of AudioUsoIntent.genres.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2144))();
}

uint64_t dispatch thunk of AudioUsoIntent.moods.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2168))();
}

uint64_t dispatch thunk of AudioUsoIntent.activities.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2192))();
}

uint64_t dispatch thunk of AudioUsoIntent.radioType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2216))();
}

uint64_t dispatch thunk of AudioUsoIntent.frequency.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2240))();
}

uint64_t dispatch thunk of AudioUsoIntent.audioSettingNames.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2264))();
}

uint64_t dispatch thunk of AudioUsoIntent.appInferred.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2288))();
}

uint64_t dispatch thunk of AudioUsoIntent.mediaIdentifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2312))();
}

uint64_t dispatch thunk of AudioUsoIntent.mediaIdentifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2320))();
}

uint64_t dispatch thunk of AudioUsoIntent.mediaIdentifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 2328))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioUsoIntent.UsoNamespace(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE5)
    goto LABEL_17;
  if (a2 + 27 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 27) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 27;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 27;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 27;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1C;
  v8 = v6 - 28;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioUsoIntent.UsoNamespace(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 27 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 27) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE4)
    return ((uint64_t (*)(void))((char *)&loc_2460C75F4 + 4 * byte_2460D538B[v4]))();
  *a1 = a2 + 27;
  return ((uint64_t (*)(void))((char *)sub_2460C7628 + 4 * byte_2460D5386[v4]))();
}

uint64_t sub_2460C7628(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460C7630(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2460C7638);
  return result;
}

uint64_t sub_2460C7644(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2460C764CLL);
  *(_BYTE *)result = a2 + 27;
  return result;
}

uint64_t sub_2460C7650(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460C7658(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460C7664(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2460C7670(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudioUsoIntent.UsoNamespace()
{
  return &type metadata for AudioUsoIntent.UsoNamespace;
}

uint64_t getEnumTagSinglePayload for AudioUsoIntent.IterationOptions(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AudioUsoIntent.IterationOptions(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2460C771C + 4 * byte_2460D5390[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2460C773C + 4 * byte_2460D5395[v4]))();
}

_BYTE *sub_2460C771C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2460C773C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2460C7744(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2460C774C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2460C7754(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2460C775C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2460C7768()
{
  return 0;
}

ValueMetadata *type metadata accessor for AudioUsoIntent.IterationOptions()
{
  return &type metadata for AudioUsoIntent.IterationOptions;
}

uint64_t sub_2460C7780(uint64_t result)
{
  if (result != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_2460C7790(uint64_t result)
{
  if (result != 1)
    return swift_retain();
  return result;
}

_BYTE *sub_2460C77A0@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t sub_2460C780C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24954F74C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2460C784C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2460C7894()
{
  uint64_t result;

  sub_2460C78F4();
  result = sub_2460D4F74();
  qword_257542BF0 = result;
  return result;
}

unint64_t sub_2460C78F4()
{
  unint64_t result;

  result = qword_257541128;
  if (!qword_257541128)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257541128);
  }
  return result;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.hasNonEmptyName()()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_2460D4C5C();
  if (!v1)
    return 0;
  v2 = v0;
  v3 = v1;
  swift_bridgeObjectRelease();
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = v2 & 0xFFFFFFFFFFFFLL;
  return v4 != 0;
}

uint64_t Array<A>.findAll(options:with:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, unint64_t a4)
{
  uint64_t v8;

  swift_bridgeObjectRetain();
  swift_retain();
  v8 = sub_2460CCB08(a4, a1, a2, a3);
  swift_bridgeObjectRelease();
  swift_release();
  return v8;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isResolvedReference()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  char v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void (*v27)(char *, unint64_t, uint64_t);
  char v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[3];
  unint64_t v33;
  const char *v34;
  unint64_t v35;
  const char *v36;
  unint64_t v37;

  v1 = sub_2460D4B90();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)v32 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v32 - v9;
  v11 = sub_2460D4B48();
  v12 = *(_QWORD *)(v11 + 16);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v32[1] = v11;
  v32[2] = v0;
  v13 = v11 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v37 = *(_QWORD *)(v2 + 72);
  v14 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
  swift_bridgeObjectRetain();
  v34 = "identifier";
  v35 = 0x80000002460D6B00;
  v36 = "media_controls";
  v33 = 0x80000002460D6EE0;
  while (1)
  {
    v14(v10, v13, v1);
    v17 = sub_2460D4B84();
    if (!v18)
    {
      v14(v8, (unint64_t)v10, v1);
LABEL_14:
      v21 = *(void (**)(char *, uint64_t))(v2 + 8);
      v21(v8, v1);
      v21(v10, v1);
      goto LABEL_4;
    }
    if (v17 == 0xD000000000000019 && v18 == v35)
    {
      swift_bridgeObjectRelease();
      v14(v8, (unint64_t)v10, v1);
    }
    else
    {
      v19 = sub_2460D5058();
      swift_bridgeObjectRelease();
      v14(v8, (unint64_t)v10, v1);
      if ((v19 & 1) == 0)
        goto LABEL_14;
    }
    if (sub_2460D4B54() == 0xD00000000000001CLL && v20 == v33)
      break;
    v15 = sub_2460D5058();
    swift_bridgeObjectRelease();
    v16 = *(void (**)(char *, uint64_t))(v2 + 8);
    v16(v8, v1);
    v16(v10, v1);
    if ((v15 & 1) != 0)
      goto LABEL_17;
LABEL_4:
    v13 += v37;
    if (!--v12)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  v22 = *(void (**)(char *, uint64_t))(v2 + 8);
  v22(v8, v1);
  v22(v10, v1);
LABEL_17:
  swift_bridgeObjectRelease_n();
  LODWORD(v12) = 1;
LABEL_18:
  v23 = sub_2460D4B48();
  v24 = *(_QWORD *)(v23 + 16);
  if (!v24)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  LODWORD(v36) = v12;
  v25 = v23 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v26 = *(_QWORD *)(v2 + 72);
  v27 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
  v35 = v23;
  swift_bridgeObjectRetain();
  v37 = 0x80000002460D6A80;
  while (2)
  {
    v27(v5, v25, v1);
    v29 = sub_2460D4B84();
    if (!v30)
    {
      (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
LABEL_21:
      v25 += v26;
      if (!--v24)
      {
        swift_bridgeObjectRelease_n();
        return 0;
      }
      continue;
    }
    break;
  }
  if (v29 != 0xD000000000000014 || v30 != v37)
  {
    v28 = sub_2460D5058();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    if ((v28 & 1) != 0)
      goto LABEL_29;
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
LABEL_29:
  swift_bridgeObjectRelease_n();
  return (v36 & 1) != 0;
}

uint64_t Array<A>.findFirst(options:with:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a4 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    v8 = sub_2460D5028();
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v8 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      v9 = 4;
      do
      {
        v10 = v9 - 4;
        if ((a4 & 0xC000000000000001) != 0)
        {
          MEMORY[0x24954F500](v9 - 4, a4);
          v11 = v9 - 3;
          if (__OFADD__(v10, 1))
            goto LABEL_13;
        }
        else
        {
          swift_retain();
          v11 = v9 - 3;
          if (__OFADD__(v10, 1))
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        v12 = UsoEntity_common_MediaItem.findFirst(options:with:)(a1, a2, a3);
        swift_release();
        if (v12)
          goto LABEL_12;
        ++v9;
      }
      while (v11 != v8);
    }
  }
  v12 = 0;
LABEL_12:
  swift_bridgeObjectRelease();
  return v12;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isFromArtist()()
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
  uint64_t v10;
  uint64_t v11;
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
  unint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  const char *v55;
  unint64_t v56;

  v1 = sub_2460D4D34();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v52);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v49 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v53 = (char *)&v45 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v54 = (char *)&v45 - v12;
  v13 = sub_2460D4B90();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v45 - v18;
  v51 = v0;
  v20 = sub_2460D4B48();
  v21 = *(_QWORD *)(v20 + 16);
  if (v21)
  {
    v45 = v4;
    v46 = v2;
    v47 = v6;
    v48 = v1;
    v22 = v20 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    v23 = *(_QWORD *)(v14 + 72);
    v24 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    v50 = v20;
    swift_bridgeObjectRetain();
    v55 = "mediaPlayerRadioType";
    v56 = 0x80000002460D6A60;
    while (1)
    {
      v24(v19, v22, v13);
      v27 = sub_2460D4B84();
      if (!v28)
        break;
      if (v27 == 0xD000000000000015 && v28 == v56)
      {
        swift_bridgeObjectRelease();
        v24(v17, (unint64_t)v19, v13);
      }
      else
      {
        v29 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v24(v17, (unint64_t)v19, v13);
        if ((v29 & 1) == 0)
          goto LABEL_14;
      }
      if (sub_2460D4B78() == 0x697472416D6F7266 && v30 == 0xEA00000000007473)
      {
        swift_bridgeObjectRelease();
        v33 = *(void (**)(char *, uint64_t))(v14 + 8);
        v33(v17, v13);
        v33(v19, v13);
LABEL_17:
        swift_bridgeObjectRelease_n();
        if (sub_2460D4C38())
        {
          v34 = (uint64_t)v54;
          sub_2460D4CA4();
          swift_release();
          v36 = (uint64_t)v47;
          v35 = v48;
          v37 = v46;
        }
        else
        {
          v37 = v46;
          v34 = (uint64_t)v54;
          v35 = v48;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v54, 1, 1, v48);
          v36 = (uint64_t)v47;
        }
        v38 = v45;
        v39 = (uint64_t)v53;
        (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v53, *MEMORY[0x24BEA16B0], v35);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(v39, 0, 1, v35);
        v40 = v36 + *(int *)(v52 + 48);
        sub_2460C784C(v34, v36, &qword_257540740);
        sub_2460C784C(v39, v40, &qword_257540740);
        v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
        if (v41(v36, 1, v35) == 1)
        {
          sub_2460B2CC0(v39, &qword_257540740);
          sub_2460B2CC0(v34, &qword_257540740);
          if (v41(v40, 1, v35) == 1)
          {
            sub_2460B2CC0(v36, &qword_257540740);
            v32 = 1;
            return v32 & 1;
          }
        }
        else
        {
          v42 = v49;
          sub_2460C784C(v36, v49, &qword_257540740);
          if (v41(v40, 1, v35) != 1)
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v38, v40, v35);
            sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
            v32 = sub_2460D4ED8();
            v43 = *(void (**)(char *, uint64_t))(v37 + 8);
            v43(v38, v35);
            sub_2460B2CC0(v39, &qword_257540740);
            sub_2460B2CC0(v34, &qword_257540740);
            v43((char *)v42, v35);
            sub_2460B2CC0(v36, &qword_257540740);
            return v32 & 1;
          }
          sub_2460B2CC0(v39, &qword_257540740);
          sub_2460B2CC0(v34, &qword_257540740);
          (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v42, v35);
        }
        sub_2460B2CC0(v36, &qword_257541100);
        v32 = 0;
        return v32 & 1;
      }
      v25 = sub_2460D5058();
      swift_bridgeObjectRelease();
      v26 = *(void (**)(char *, uint64_t))(v14 + 8);
      v26(v17, v13);
      v26(v19, v13);
      if ((v25 & 1) != 0)
        goto LABEL_17;
LABEL_4:
      v22 += v23;
      if (!--v21)
      {
        swift_bridgeObjectRelease_n();
        v32 = 0;
        return v32 & 1;
      }
    }
    v24(v17, (unint64_t)v19, v13);
LABEL_14:
    v31 = *(void (**)(char *, uint64_t))(v14 + 8);
    v31(v17, v13);
    v31(v19, v13);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  v32 = 0;
  return v32 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isFromSong()()
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
  uint64_t v10;
  uint64_t v11;
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
  unint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  const char *v55;
  unint64_t v56;

  v1 = sub_2460D4D34();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v52);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v49 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v53 = (char *)&v45 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v54 = (char *)&v45 - v12;
  v13 = sub_2460D4B90();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v45 - v18;
  v51 = v0;
  v20 = sub_2460D4B48();
  v21 = *(_QWORD *)(v20 + 16);
  if (v21)
  {
    v45 = v4;
    v46 = v2;
    v47 = v6;
    v48 = v1;
    v22 = v20 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    v23 = *(_QWORD *)(v14 + 72);
    v24 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    v50 = v20;
    swift_bridgeObjectRetain();
    v55 = "mediaPlayerRadioType";
    v56 = 0x80000002460D6A60;
    while (1)
    {
      v24(v19, v22, v13);
      v27 = sub_2460D4B84();
      if (!v28)
        break;
      if (v27 == 0xD000000000000015 && v28 == v56)
      {
        swift_bridgeObjectRelease();
        v24(v17, (unint64_t)v19, v13);
      }
      else
      {
        v29 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v24(v17, (unint64_t)v19, v13);
        if ((v29 & 1) == 0)
          goto LABEL_14;
      }
      if (sub_2460D4B78() == 0x676E6F536D6F7266 && v30 == 0xE800000000000000)
      {
        swift_bridgeObjectRelease();
        v33 = *(void (**)(char *, uint64_t))(v14 + 8);
        v33(v17, v13);
        v33(v19, v13);
LABEL_17:
        swift_bridgeObjectRelease_n();
        if (sub_2460D4C38())
        {
          v34 = (uint64_t)v54;
          sub_2460D4CA4();
          swift_release();
          v36 = (uint64_t)v47;
          v35 = v48;
          v37 = v46;
        }
        else
        {
          v37 = v46;
          v34 = (uint64_t)v54;
          v35 = v48;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v54, 1, 1, v48);
          v36 = (uint64_t)v47;
        }
        v38 = v45;
        v39 = (uint64_t)v53;
        (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v53, *MEMORY[0x24BEA1680], v35);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(v39, 0, 1, v35);
        v40 = v36 + *(int *)(v52 + 48);
        sub_2460C784C(v34, v36, &qword_257540740);
        sub_2460C784C(v39, v40, &qword_257540740);
        v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
        if (v41(v36, 1, v35) == 1)
        {
          sub_2460B2CC0(v39, &qword_257540740);
          sub_2460B2CC0(v34, &qword_257540740);
          if (v41(v40, 1, v35) == 1)
          {
            sub_2460B2CC0(v36, &qword_257540740);
            v32 = 1;
            return v32 & 1;
          }
        }
        else
        {
          v42 = v49;
          sub_2460C784C(v36, v49, &qword_257540740);
          if (v41(v40, 1, v35) != 1)
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v38, v40, v35);
            sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
            v32 = sub_2460D4ED8();
            v43 = *(void (**)(char *, uint64_t))(v37 + 8);
            v43(v38, v35);
            sub_2460B2CC0(v39, &qword_257540740);
            sub_2460B2CC0(v34, &qword_257540740);
            v43((char *)v42, v35);
            sub_2460B2CC0(v36, &qword_257540740);
            return v32 & 1;
          }
          sub_2460B2CC0(v39, &qword_257540740);
          sub_2460B2CC0(v34, &qword_257540740);
          (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v42, v35);
        }
        sub_2460B2CC0(v36, &qword_257541100);
        v32 = 0;
        return v32 & 1;
      }
      v25 = sub_2460D5058();
      swift_bridgeObjectRelease();
      v26 = *(void (**)(char *, uint64_t))(v14 + 8);
      v26(v17, v13);
      v26(v19, v13);
      if ((v25 & 1) != 0)
        goto LABEL_17;
LABEL_4:
      v22 += v23;
      if (!--v21)
      {
        swift_bridgeObjectRelease_n();
        v32 = 0;
        return v32 & 1;
      }
    }
    v24(v17, (unint64_t)v19, v13);
LABEL_14:
    v31 = *(void (**)(char *, uint64_t))(v14 + 8);
    v31(v17, v13);
    v31(v19, v13);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  v32 = 0;
  return v32 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isFromAlbum()()
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
  uint64_t v10;
  uint64_t v11;
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
  unint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  const char *v55;
  unint64_t v56;

  v1 = sub_2460D4D34();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v52);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v49 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v53 = (char *)&v45 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v54 = (char *)&v45 - v12;
  v13 = sub_2460D4B90();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v45 - v18;
  v51 = v0;
  v20 = sub_2460D4B48();
  v21 = *(_QWORD *)(v20 + 16);
  if (v21)
  {
    v45 = v4;
    v46 = v2;
    v47 = v6;
    v48 = v1;
    v22 = v20 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    v23 = *(_QWORD *)(v14 + 72);
    v24 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    v50 = v20;
    swift_bridgeObjectRetain();
    v55 = "mediaPlayerRadioType";
    v56 = 0x80000002460D6A60;
    while (1)
    {
      v24(v19, v22, v13);
      v27 = sub_2460D4B84();
      if (!v28)
        break;
      if (v27 == 0xD000000000000015 && v28 == v56)
      {
        swift_bridgeObjectRelease();
        v24(v17, (unint64_t)v19, v13);
      }
      else
      {
        v29 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v24(v17, (unint64_t)v19, v13);
        if ((v29 & 1) == 0)
          goto LABEL_14;
      }
      if (sub_2460D4B78() == 0x75626C416D6F7266 && v30 == 0xE90000000000006DLL)
      {
        swift_bridgeObjectRelease();
        v33 = *(void (**)(char *, uint64_t))(v14 + 8);
        v33(v17, v13);
        v33(v19, v13);
LABEL_17:
        swift_bridgeObjectRelease_n();
        if (sub_2460D4C38())
        {
          v34 = (uint64_t)v54;
          sub_2460D4CA4();
          swift_release();
          v36 = (uint64_t)v47;
          v35 = v48;
          v37 = v46;
        }
        else
        {
          v37 = v46;
          v34 = (uint64_t)v54;
          v35 = v48;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v54, 1, 1, v48);
          v36 = (uint64_t)v47;
        }
        v38 = v45;
        v39 = (uint64_t)v53;
        (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v53, *MEMORY[0x24BEA1688], v35);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(v39, 0, 1, v35);
        v40 = v36 + *(int *)(v52 + 48);
        sub_2460C784C(v34, v36, &qword_257540740);
        sub_2460C784C(v39, v40, &qword_257540740);
        v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
        if (v41(v36, 1, v35) == 1)
        {
          sub_2460B2CC0(v39, &qword_257540740);
          sub_2460B2CC0(v34, &qword_257540740);
          if (v41(v40, 1, v35) == 1)
          {
            sub_2460B2CC0(v36, &qword_257540740);
            v32 = 1;
            return v32 & 1;
          }
        }
        else
        {
          v42 = v49;
          sub_2460C784C(v36, v49, &qword_257540740);
          if (v41(v40, 1, v35) != 1)
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v38, v40, v35);
            sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
            v32 = sub_2460D4ED8();
            v43 = *(void (**)(char *, uint64_t))(v37 + 8);
            v43(v38, v35);
            sub_2460B2CC0(v39, &qword_257540740);
            sub_2460B2CC0(v34, &qword_257540740);
            v43((char *)v42, v35);
            sub_2460B2CC0(v36, &qword_257540740);
            return v32 & 1;
          }
          sub_2460B2CC0(v39, &qword_257540740);
          sub_2460B2CC0(v34, &qword_257540740);
          (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v42, v35);
        }
        sub_2460B2CC0(v36, &qword_257541100);
        v32 = 0;
        return v32 & 1;
      }
      v25 = sub_2460D5058();
      swift_bridgeObjectRelease();
      v26 = *(void (**)(char *, uint64_t))(v14 + 8);
      v26(v17, v13);
      v26(v19, v13);
      if ((v25 & 1) != 0)
        goto LABEL_17;
LABEL_4:
      v22 += v23;
      if (!--v21)
      {
        swift_bridgeObjectRelease_n();
        v32 = 0;
        return v32 & 1;
      }
    }
    v24(v17, (unint64_t)v19, v13);
LABEL_14:
    v31 = *(void (**)(char *, uint64_t))(v14 + 8);
    v31(v17, v13);
    v31(v19, v13);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  v32 = 0;
  return v32 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isRecommended()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(unint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(unint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void (**v24)(unint64_t, uint64_t, uint64_t, uint64_t);
  char *v25;
  char v26;
  void (*v27)(unint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  Swift::Bool v30;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  void (**v36)(unint64_t, uint64_t, uint64_t, uint64_t);
  void (**v37)(unint64_t, uint64_t, uint64_t, uint64_t);
  char *v38;
  uint64_t v39;
  unint64_t v40;
  unsigned int v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;

  v0 = sub_2460D4D64();
  v37 = *(void (***)(unint64_t, uint64_t, uint64_t, uint64_t))(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v35 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541130);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410F8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (void (**)(unint64_t, uint64_t, uint64_t, uint64_t))((char *)&v32
                                                                         - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v32 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v32 - v12;
  if (!sub_2460D4BD8())
    return 0;
  v44 = v13;
  v14 = sub_2460D4DE8();
  swift_release();
  if (!v14)
    return 0;
  if (v14 >> 62)
    goto LABEL_25;
  v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v15; v15 = sub_2460D5028())
  {
    v36 = v8;
    v42 = v14 & 0xC000000000000001;
    v41 = *MEMORY[0x24BEA1838];
    v16 = 4;
    v39 = v15;
    v40 = v14;
    v8 = v37;
    v38 = v4;
    v33 = v11;
    v34 = v2;
    while (1)
    {
      if (v42)
      {
        v18 = MEMORY[0x24954F500](v16 - 4, v14);
      }
      else
      {
        v18 = *(_QWORD *)(v14 + 8 * v16);
        swift_retain();
      }
      v19 = v16 - 3;
      v14 = (unint64_t)v44;
      if (__OFADD__(v16 - 4, 1))
        break;
      sub_2460D4B9C();
      v43 = v18;
      if (v45)
      {
        sub_2460D4CA4();
        swift_release();
      }
      else
      {
        v8[7](v14, 1, 1, v0);
      }
      ((void (*)(char *, _QWORD, uint64_t))v8[13])(v11, v41, v0);
      v8[7]((unint64_t)v11, 0, 1, v0);
      v20 = (uint64_t)&v4[*(int *)(v2 + 48)];
      sub_2460C784C(v14, (uint64_t)v4, &qword_2575410F8);
      sub_2460C784C((uint64_t)v11, v20, &qword_2575410F8);
      v21 = v8[6];
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v21)(v4, 1, v0) == 1)
      {
        v17 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v21)(v20, 1, v0);
        v14 = v40;
        if (v17 == 1)
        {
          sub_2460B2CC0((uint64_t)v38, &qword_2575410F8);
          sub_2460B2CC0((uint64_t)v11, &qword_2575410F8);
          sub_2460B2CC0((uint64_t)v44, &qword_2575410F8);
          swift_release();
LABEL_23:
          v30 = 1;
          goto LABEL_27;
        }
        goto LABEL_7;
      }
      v22 = (uint64_t)v36;
      sub_2460C784C((uint64_t)v4, (uint64_t)v36, &qword_2575410F8);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v21)(v20, 1, v0) == 1)
      {
        v23 = v22;
        v8 = v37;
        ((void (*)(uint64_t, uint64_t))v37[1])(v23, v0);
        v14 = v40;
LABEL_7:
        v4 = v38;
        sub_2460B2CC0((uint64_t)v38, &qword_257541130);
        sub_2460B2CC0((uint64_t)v11, &qword_2575410F8);
        sub_2460B2CC0((uint64_t)v44, &qword_2575410F8);
        swift_release();
        goto LABEL_8;
      }
      v24 = v37;
      v25 = v35;
      ((void (*)(char *, uint64_t, uint64_t))v37[4])(v35, v20, v0);
      sub_2460C780C(&qword_257541138, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1878], MEMORY[0x24BEA1888]);
      v26 = sub_2460D4ED8();
      v27 = v24[1];
      v28 = v22;
      v8 = v24;
      v11 = v33;
      ((void (*)(uint64_t, uint64_t))v27)(v28, v0);
      v29 = v25;
      v2 = v34;
      ((void (*)(char *, uint64_t))v27)(v29, v0);
      sub_2460B2CC0((uint64_t)v4, &qword_2575410F8);
      sub_2460B2CC0((uint64_t)v11, &qword_2575410F8);
      sub_2460B2CC0((uint64_t)v44, &qword_2575410F8);
      swift_release();
      v14 = v40;
      if ((v26 & 1) != 0)
        goto LABEL_23;
LABEL_8:
      ++v16;
      if (v19 == v39)
        goto LABEL_26;
    }
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
  }
LABEL_26:
  v30 = 0;
LABEL_27:
  swift_bridgeObjectRelease_n();
  return v30;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isAffinity()()
{
  return sub_2460C94B8(MEMORY[0x24BEA1EF0]);
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isDiscover()()
{
  return sub_2460C94B8(MEMORY[0x24BEA1EF8]);
}

uint64_t sub_2460C94B8(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t);
  int v20;
  uint64_t *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;

  v2 = sub_2460D4DDC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541140);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541148);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v25 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v25 - v16;
  if (sub_2460D4BD8())
  {
    sub_2460D4CA4();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v17, 1, 1, v2);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v15, *a1, v2);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v15, 0, 1, v2);
  v18 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_2460C784C((uint64_t)v17, (uint64_t)v8, &qword_257541148);
  sub_2460C784C((uint64_t)v15, v18, &qword_257541148);
  v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v19((uint64_t)v8, 1, v2) == 1)
  {
    sub_2460B2CC0((uint64_t)v15, &qword_257541148);
    sub_2460B2CC0((uint64_t)v17, &qword_257541148);
    v20 = v19(v18, 1, v2);
    if (v20 == 1)
      v21 = &qword_257541148;
    else
      v21 = &qword_257541140;
    if (v20 == 1)
      v22 = -1;
    else
      v22 = 0;
  }
  else
  {
    sub_2460C784C((uint64_t)v8, (uint64_t)v12, &qword_257541148);
    if (v19(v18, 1, v2) == 1)
    {
      sub_2460B2CC0((uint64_t)v15, &qword_257541148);
      sub_2460B2CC0((uint64_t)v17, &qword_257541148);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
      v22 = 0;
      v21 = &qword_257541140;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v5, v18, v2);
      sub_2460C780C(&qword_257541150, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1F00], MEMORY[0x24BEA1F10]);
      v22 = sub_2460D4ED8();
      v23 = *(void (**)(char *, uint64_t))(v3 + 8);
      v23(v5, v2);
      v21 = &qword_257541148;
      sub_2460B2CC0((uint64_t)v15, &qword_257541148);
      sub_2460B2CC0((uint64_t)v17, &qword_257541148);
      v23(v12, v2);
    }
  }
  sub_2460B2CC0((uint64_t)v8, v21);
  return v22 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isAddToUnspecifiedPlaylist()()
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
  uint64_t v10;
  uint64_t v11;
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
  unint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  unint64_t v55;
  const char *v56;
  char *v57;
  unint64_t v58;

  v1 = sub_2460D4D34();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541100);
  MEMORY[0x24BDAC7A8](v52);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v49 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v53 = (char *)&v45 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v54 = (char *)&v45 - v12;
  v13 = sub_2460D4B90();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v45 - v18;
  v51 = v0;
  v20 = sub_2460D4B48();
  v21 = *(_QWORD *)(v20 + 16);
  if (v21)
  {
    v45 = v4;
    v46 = v2;
    v47 = v6;
    v48 = v1;
    v22 = v20 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    v23 = *(_QWORD *)(v14 + 72);
    v24 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
    v50 = v20;
    swift_bridgeObjectRetain();
    v56 = "mediaPlayerRadioType";
    v57 = "commended";
    v58 = 0x80000002460D6A60;
    v55 = 0x80000002460D6CA0;
    while (1)
    {
      v24(v19, v22, v13);
      v27 = sub_2460D4B84();
      if (!v28)
        break;
      if (v27 == 0xD000000000000015 && v28 == v58)
      {
        swift_bridgeObjectRelease();
        v24(v17, (unint64_t)v19, v13);
      }
      else
      {
        v29 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v24(v17, (unint64_t)v19, v13);
        if ((v29 & 1) == 0)
          goto LABEL_14;
      }
      if (sub_2460D4B78() == 0xD000000000000018 && v30 == v55)
      {
        swift_bridgeObjectRelease();
        v33 = *(void (**)(char *, uint64_t))(v14 + 8);
        v33(v17, v13);
        v33(v19, v13);
LABEL_17:
        swift_bridgeObjectRelease_n();
        if (sub_2460D4C38())
        {
          v34 = (uint64_t)v54;
          sub_2460D4CA4();
          swift_release();
          v36 = (uint64_t)v47;
          v35 = v48;
          v37 = v46;
        }
        else
        {
          v37 = v46;
          v34 = (uint64_t)v54;
          v35 = v48;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v54, 1, 1, v48);
          v36 = (uint64_t)v47;
        }
        v38 = v45;
        v39 = (uint64_t)v53;
        (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v53, *MEMORY[0x24BEA1700], v35);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56))(v39, 0, 1, v35);
        v40 = v36 + *(int *)(v52 + 48);
        sub_2460C784C(v34, v36, &qword_257540740);
        sub_2460C784C(v39, v40, &qword_257540740);
        v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
        if (v41(v36, 1, v35) == 1)
        {
          sub_2460B2CC0(v39, &qword_257540740);
          sub_2460B2CC0(v34, &qword_257540740);
          if (v41(v40, 1, v35) == 1)
          {
            sub_2460B2CC0(v36, &qword_257540740);
            v32 = 1;
            return v32 & 1;
          }
        }
        else
        {
          v42 = v49;
          sub_2460C784C(v36, v49, &qword_257540740);
          if (v41(v40, 1, v35) != 1)
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v38, v40, v35);
            sub_2460C780C(&qword_257541108, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1720], MEMORY[0x24BEA1738]);
            v32 = sub_2460D4ED8();
            v43 = *(void (**)(char *, uint64_t))(v37 + 8);
            v43(v38, v35);
            sub_2460B2CC0(v39, &qword_257540740);
            sub_2460B2CC0(v34, &qword_257540740);
            v43((char *)v42, v35);
            sub_2460B2CC0(v36, &qword_257540740);
            return v32 & 1;
          }
          sub_2460B2CC0(v39, &qword_257540740);
          sub_2460B2CC0(v34, &qword_257540740);
          (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v42, v35);
        }
        sub_2460B2CC0(v36, &qword_257541100);
        v32 = 0;
        return v32 & 1;
      }
      v25 = sub_2460D5058();
      swift_bridgeObjectRelease();
      v26 = *(void (**)(char *, uint64_t))(v14 + 8);
      v26(v17, v13);
      v26(v19, v13);
      if ((v25 & 1) != 0)
        goto LABEL_17;
LABEL_4:
      v22 += v23;
      if (!--v21)
      {
        swift_bridgeObjectRelease_n();
        v32 = 0;
        return v32 & 1;
      }
    }
    v24(v17, (unint64_t)v19, v13);
LABEL_14:
    v31 = *(void (**)(char *, uint64_t))(v14 + 8);
    v31(v17, v13);
    v31(v19, v13);
    goto LABEL_4;
  }
  swift_bridgeObjectRelease();
  v32 = 0;
  return v32 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.hasListPosition()()
{
  uint64_t v0;

  v0 = sub_2460D4BB4();
  if (v0)
    swift_release();
  return v0 != 0;
}

SiriAudioIntentUtils::CommonAudio::Attribute_optional __swiftcall UsoEntity_common_MediaItem.getListPosition()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t v14;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541110);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v14 - v6;
  v8 = sub_2460D4BB4();
  if (v8)
  {
    sub_2460D4CA4();
    swift_release();
    v9 = sub_2460D4CF8();
    v10 = *(_QWORD *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
    {
      sub_2460C784C((uint64_t)v7, (uint64_t)v5, &qword_257541110);
      v11 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v5, v9);
      if (v11 == *MEMORY[0x24BEA1248])
      {
        v12 = 12;
LABEL_10:
        *v1 = v12;
        LOBYTE(v8) = sub_2460B2CC0((uint64_t)v7, &qword_257541110);
        return (SiriAudioIntentUtils::CommonAudio::Attribute_optional)v8;
      }
      if (v11 == *MEMORY[0x24BEA11D0])
      {
        v12 = 10;
        goto LABEL_10;
      }
      (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
    }
    v12 = 15;
    goto LABEL_10;
  }
  *v1 = 15;
  return (SiriAudioIntentUtils::CommonAudio::Attribute_optional)v8;
}

uint64_t sub_2460C9F24(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (!UsoEntity_common_MediaItem.isResolvedReference()())
  {
    if ((!UsoEntity_common_MediaItem.isResolvedReference()() || *(_QWORD *)(a1 + 16))
      && (!UsoEntity_common_MediaItem.isResolvedReference()() || *(_QWORD *)(a1 + 16)))
    {
      v4 = sub_2460D4C2C();
      if (v4)
      {
        v5 = v4;
        if (v4 >> 62)
          goto LABEL_22;
        for (i = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10); i; i = sub_2460D5028())
        {
          v7 = 4;
          while (1)
          {
            v8 = v7 - 4;
            if ((v5 & 0xC000000000000001) == 0)
              break;
            MEMORY[0x24954F500](v7 - 4, v5);
            v9 = v7 - 3;
            if (__OFADD__(v8, 1))
              goto LABEL_21;
LABEL_18:
            sub_2460D4B9C();
            if (v11)
            {
              a2 = ((uint64_t (*)(uint64_t))sub_2460C9F24)(a1);
              swift_release();
              swift_release();
              if (a2)
              {
                swift_bridgeObjectRelease();
                return a2;
              }
            }
            else
            {
              swift_release();
            }
            ++v7;
            if (v9 == i)
              goto LABEL_23;
          }
          swift_retain();
          v9 = v7 - 3;
          if (!__OFADD__(v8, 1))
            goto LABEL_18;
LABEL_21:
          __break(1u);
LABEL_22:
          ;
        }
LABEL_23:
        swift_bridgeObjectRelease();
      }
    }
    return 0;
  }
  swift_retain();
  return a2;
}

uint64_t sub_2460CA084(uint64_t a1, uint64_t a2)
{
  return sub_2460CA22C(a1, a2, sub_2460BAAD0, (uint64_t (*)(uint64_t))sub_2460CA084);
}

uint64_t sub_2460CA098(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (sub_2460D4C68())
  {
    swift_release();
    swift_retain();
  }
  else
  {
    if ((!UsoEntity_common_MediaItem.isResolvedReference()() || *(_QWORD *)(a1 + 16))
      && (!UsoEntity_common_MediaItem.isResolvedReference()() || *(_QWORD *)(a1 + 16)))
    {
      v4 = sub_2460D4C2C();
      if (v4)
      {
        v5 = v4;
        if (v4 >> 62)
          goto LABEL_23;
        v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v6)
        {
LABEL_24:
          swift_bridgeObjectRelease();
          return 0;
        }
LABEL_10:
        v7 = 4;
        while (1)
        {
          v8 = v7 - 4;
          if ((v5 & 0xC000000000000001) != 0)
          {
            MEMORY[0x24954F500](v7 - 4, v5);
            v9 = v7 - 3;
            if (__OFADD__(v8, 1))
              goto LABEL_22;
          }
          else
          {
            swift_retain();
            v9 = v7 - 3;
            if (__OFADD__(v8, 1))
            {
LABEL_22:
              __break(1u);
LABEL_23:
              v6 = sub_2460D5028();
              if (!v6)
                goto LABEL_24;
              goto LABEL_10;
            }
          }
          sub_2460D4B9C();
          if (v11)
          {
            a2 = ((uint64_t (*)(uint64_t))sub_2460CA098)(a1);
            swift_release();
            swift_release();
            if (a2)
            {
              swift_bridgeObjectRelease();
              return a2;
            }
          }
          else
          {
            swift_release();
          }
          ++v7;
          if (v9 == v6)
            goto LABEL_24;
        }
      }
    }
    return 0;
  }
  return a2;
}

uint64_t sub_2460CA204(uint64_t a1, uint64_t a2)
{
  return sub_2460CA22C(a1, a2, sub_2460BB190, (uint64_t (*)(uint64_t))sub_2460CA204);
}

uint64_t sub_2460CA218(uint64_t a1, uint64_t a2)
{
  return sub_2460CA22C(a1, a2, (uint64_t (*)(uint64_t))sub_2460BD1AC, (uint64_t (*)(uint64_t))sub_2460CA218);
}

uint64_t sub_2460CA22C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = a2;
  if ((a3(a2) & 1) == 0)
  {
    if ((!UsoEntity_common_MediaItem.isResolvedReference()() || *(_QWORD *)(a1 + 16))
      && (!UsoEntity_common_MediaItem.isResolvedReference()() || *(_QWORD *)(a1 + 16)))
    {
      v7 = sub_2460D4C2C();
      if (v7)
      {
        v8 = v7;
        if (v7 >> 62)
          goto LABEL_22;
        for (i = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10); i; i = sub_2460D5028())
        {
          v10 = 4;
          while (1)
          {
            v11 = v10 - 4;
            if ((v8 & 0xC000000000000001) == 0)
              break;
            MEMORY[0x24954F500](v10 - 4, v8);
            v12 = v10 - 3;
            if (__OFADD__(v11, 1))
              goto LABEL_21;
LABEL_18:
            sub_2460D4B9C();
            if (v14)
            {
              v5 = a4(a1);
              swift_release();
              swift_release();
              if (v5)
              {
                swift_bridgeObjectRelease();
                return v5;
              }
            }
            else
            {
              swift_release();
            }
            ++v10;
            if (v12 == i)
              goto LABEL_23;
          }
          swift_retain();
          v12 = v10 - 3;
          if (!__OFADD__(v11, 1))
            goto LABEL_18;
LABEL_21:
          __break(1u);
LABEL_22:
          ;
        }
LABEL_23:
        swift_bridgeObjectRelease();
      }
    }
    return 0;
  }
  swift_retain();
  return v5;
}

uint64_t sub_2460CA394(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410B8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!sub_2460D4BCC())
  {
    v8 = sub_2460D4D4C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
LABEL_5:
    sub_2460B2CC0((uint64_t)v6, &qword_2575410B8);
    if ((!UsoEntity_common_MediaItem.isResolvedReference()() || *(_QWORD *)(a1 + 16))
      && (!UsoEntity_common_MediaItem.isResolvedReference()() || *(_QWORD *)(a1 + 16)))
    {
      v9 = sub_2460D4C2C();
      if (v9)
      {
        v10 = v9;
        if (v9 >> 62)
          goto LABEL_24;
        for (i = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10); i; i = sub_2460D5028())
        {
          v12 = 4;
          while (1)
          {
            v13 = v12 - 4;
            if ((v10 & 0xC000000000000001) == 0)
              break;
            MEMORY[0x24954F500](v12 - 4, v10);
            v14 = v12 - 3;
            if (__OFADD__(v13, 1))
              goto LABEL_23;
LABEL_20:
            sub_2460D4B9C();
            if (v17)
            {
              a2 = sub_2460CA394(a1, v17);
              swift_release();
              swift_release();
              if (a2)
              {
                swift_bridgeObjectRelease();
                return a2;
              }
            }
            else
            {
              swift_release();
            }
            ++v12;
            if (v14 == i)
              goto LABEL_25;
          }
          swift_retain();
          v14 = v12 - 3;
          if (!__OFADD__(v13, 1))
            goto LABEL_20;
LABEL_23:
          __break(1u);
LABEL_24:
          ;
        }
LABEL_25:
        swift_bridgeObjectRelease();
      }
    }
    return 0;
  }
  sub_2460D4CA4();
  swift_release();
  v7 = sub_2460D4D4C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7) == 1)
    goto LABEL_5;
  sub_2460B2CC0((uint64_t)v6, &qword_2575410B8);
  swift_retain();
  return a2;
}

uint64_t UsoEntity_common_MediaItem.findFirst(options:with:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;

  v4 = v3;
  if ((a2(v3) & 1) == 0)
  {
    if ((!UsoEntity_common_MediaItem.isResolvedReference()() || *(_QWORD *)(a1 + 16))
      && (!UsoEntity_common_MediaItem.isResolvedReference()() || *(_QWORD *)(a1 + 16)))
    {
      v7 = sub_2460D4C2C();
      if (v7)
      {
        v8 = v7;
        if (v7 >> 62)
          goto LABEL_22;
        for (i = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10); i; i = sub_2460D5028())
        {
          v10 = 4;
          while (1)
          {
            v11 = v10 - 4;
            if ((v8 & 0xC000000000000001) == 0)
              break;
            MEMORY[0x24954F500](v10 - 4, v8);
            v12 = v10 - 3;
            if (__OFADD__(v11, 1))
              goto LABEL_21;
LABEL_18:
            sub_2460D4B9C();
            if (v15)
            {
              v4 = UsoEntity_common_MediaItem.findFirst(options:with:)(a1, a2, a3);
              swift_release();
              swift_release();
              if (v4)
              {
                swift_bridgeObjectRelease();
                return v4;
              }
            }
            else
            {
              swift_release();
            }
            ++v10;
            if (v12 == i)
              goto LABEL_23;
          }
          swift_retain();
          v12 = v10 - 3;
          if (!__OFADD__(v11, 1))
            goto LABEL_18;
LABEL_21:
          __break(1u);
LABEL_22:
          ;
        }
LABEL_23:
        swift_bridgeObjectRelease();
      }
    }
    return 0;
  }
  swift_retain();
  return v4;
}

uint64_t UsoEntity_common_MediaItem.identifiers(forNamespace:appBundleId:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(char *, unint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char v27;
  char v28;
  uint64_t v29;
  char v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  uint64_t v33;
  char *v34;
  char v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char v50;
  uint64_t v51;

  v48 = a3;
  v41 = a2;
  v4 = sub_2460D4B90();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v43 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v42 = (char *)&v40 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v40 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v40 - v13;
  v46 = *a1;
  result = sub_2460D4B48();
  v16 = result;
  v17 = MEMORY[0x24BEE4AF8];
  v51 = MEMORY[0x24BEE4AF8];
  v45 = *(_QWORD *)(result + 16);
  if (!v45)
  {
LABEL_32:
    swift_bridgeObjectRelease();
    return v17;
  }
  v49 = v12;
  v18 = 0;
  v44 = result;
  while (v18 < *(_QWORD *)(v16 + 16))
  {
    v19 = *(_QWORD *)(v5 + 72);
    v47 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v20 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v20(v14, v16 + v47 + v19 * v18, v4);
    v21 = sub_2460D4B84();
    v23 = v22;
    v50 = v46;
    v24 = AudioUsoIntent.UsoNamespace.rawValue.getter();
    if (!v23)
    {
      swift_bridgeObjectRelease();
      v26 = v49;
      v20(v49, (unint64_t)v14, v4);
      v27 = 0;
      goto LABEL_18;
    }
    if (v21 == v24 && v23 == v25)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v20(v49, (unint64_t)v14, v4);
    }
    else
    {
      v28 = sub_2460D5058();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v26 = v49;
      v20(v49, (unint64_t)v14, v4);
      v27 = 0;
      if ((v28 & 1) == 0)
        goto LABEL_18;
    }
    if (sub_2460D4B78() || v29 != 0xE000000000000000)
    {
      v30 = sub_2460D5058();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v30 = 1;
    }
    v27 = v30 ^ 1;
    v26 = v49;
LABEL_18:
    v31 = *(void (**)(char *, uint64_t))(v5 + 8);
    v31(v26, v4);
    if (v48)
    {
      v32 = v42;
      v20(v42, (unint64_t)v14, v4);
      if ((v27 & 1) != 0)
      {
        if (sub_2460D4B54() == v41 && v33 == v48)
        {
          swift_bridgeObjectRelease();
          v31(v32, v4);
LABEL_26:
          v36 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
          v36(v43, v14, v4);
          v37 = v51;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2460CC47C(0, *(_QWORD *)(v37 + 16) + 1, 1);
            v37 = v51;
          }
          v39 = *(_QWORD *)(v37 + 16);
          v38 = *(_QWORD *)(v37 + 24);
          v16 = v44;
          if (v39 >= v38 >> 1)
          {
            sub_2460CC47C(v38 > 1, v39 + 1, 1);
            v37 = v51;
          }
          *(_QWORD *)(v37 + 16) = v39 + 1;
          result = ((uint64_t (*)(unint64_t, char *, uint64_t))v36)(v37 + v47 + v39 * v19, v43, v4);
          v51 = v37;
          goto LABEL_5;
        }
        v34 = v32;
        v35 = sub_2460D5058();
        swift_bridgeObjectRelease();
        v31(v34, v4);
        if ((v35 & 1) != 0)
          goto LABEL_26;
      }
      else
      {
        v31(v32, v4);
      }
    }
    else if ((v27 & 1) != 0)
    {
      goto LABEL_26;
    }
    result = ((uint64_t (*)(char *, uint64_t))v31)(v14, v4);
    v16 = v44;
LABEL_5:
    if (v45 == ++v18)
    {
      v17 = v51;
      goto LABEL_32;
    }
  }
  __break(1u);
  return result;
}

uint64_t Array<A>.identifiers(forNamespace:)(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = sub_2460D4B90();
  v31 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v24 - v6;
  v30 = *a1;
  if (a2 >> 62)
    goto LABEL_23;
  v8 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (v8)
    {
      if (v8 < 1)
      {
        __break(1u);
        JUMPOUT(0x2460CB288);
      }
      v10 = 0;
      v11 = a2 & 0xC000000000000001;
      v12 = a2;
      do
      {
        if (v11)
          MEMORY[0x24954F500](v10, a2);
        else
          swift_retain();
        v13 = sub_2460D4B48();
        swift_release();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v9 = sub_2460CBF7C(0, v9[2] + 1, 1, v9);
        v14 = v9;
        v15 = v9[2];
        v16 = v14;
        v17 = v14[3];
        if (v15 >= v17 >> 1)
          v16 = sub_2460CBF7C((_QWORD *)(v17 > 1), v15 + 1, 1, v16);
        ++v10;
        v16[2] = v15 + 1;
        v18 = &v16[v15];
        v9 = v16;
        v18[4] = v13;
        a2 = v12;
      }
      while (v8 != v10);
    }
    swift_bridgeObjectRelease();
    v32 = MEMORY[0x24BEE4AF8];
    v26 = v9[2];
    if (!v26)
      break;
    v19 = 0;
    v24[1] = v9;
    v25 = v9 + 4;
    v29 = "";
    while (v19 < v9[2])
    {
      v20 = v25[v19];
      if (*(_QWORD *)(v20 + 16))
      {
        v27 = v25[v19];
        v28 = v19;
        v21 = v31;
        v22 = v20 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
        swift_bridgeObjectRetain_n();
        (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v7, v22, v4);
        sub_2460D4B84();
        __asm { BR              X8 }
      }
      if (++v19 == v26)
      {
        swift_bridgeObjectRelease();
        return v32;
      }
    }
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    v8 = sub_2460D5028();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isMoreOf()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  int v18;
  uint64_t *v19;
  char v20;
  void (*v21)(char *, uint64_t);
  uint64_t v23;

  v0 = sub_2460D4CB0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410D0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410D8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v23 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v23 - v14;
  if (sub_2460D4BA8())
  {
    sub_2460D4CA4();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v15, 1, 1, v0);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v13, *MEMORY[0x24BEA0C40], v0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v1 + 56))(v13, 0, 1, v0);
  v16 = (uint64_t)&v6[*(int *)(v4 + 48)];
  sub_2460C784C((uint64_t)v15, (uint64_t)v6, &qword_2575410D8);
  sub_2460C784C((uint64_t)v13, v16, &qword_2575410D8);
  v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v17((uint64_t)v6, 1, v0) == 1)
  {
    sub_2460B2CC0((uint64_t)v13, &qword_2575410D8);
    sub_2460B2CC0((uint64_t)v15, &qword_2575410D8);
    v18 = v17(v16, 1, v0);
    if (v18 == 1)
      v19 = &qword_2575410D8;
    else
      v19 = &qword_2575410D0;
    if (v18 == 1)
      v20 = -1;
    else
      v20 = 0;
  }
  else
  {
    sub_2460C784C((uint64_t)v6, (uint64_t)v10, &qword_2575410D8);
    if (v17(v16, 1, v0) == 1)
    {
      sub_2460B2CC0((uint64_t)v13, &qword_2575410D8);
      sub_2460B2CC0((uint64_t)v15, &qword_2575410D8);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
      v20 = 0;
      v19 = &qword_2575410D0;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v16, v0);
      sub_2460C780C(&qword_2575410E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA0C60], MEMORY[0x24BEA0C70]);
      v20 = sub_2460D4ED8();
      v21 = *(void (**)(char *, uint64_t))(v1 + 8);
      v21(v3, v0);
      v19 = &qword_2575410D8;
      sub_2460B2CC0((uint64_t)v13, &qword_2575410D8);
      sub_2460B2CC0((uint64_t)v15, &qword_2575410D8);
      v21(v10, v0);
    }
  }
  sub_2460B2CC0((uint64_t)v6, v19);
  return v20 & 1;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.isDifferentThan()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);
  int v19;
  uint64_t *v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v24;

  v0 = sub_2460D4CC8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410C0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575410C8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v24 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - v14;
  if (sub_2460D4BD8() && (v16 = sub_2460D4DC4(), swift_release(), v16))
  {
    sub_2460D4CA4();
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v15, 1, 1, v0);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v13, *MEMORY[0x24BEA0C90], v0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v1 + 56))(v13, 0, 1, v0);
  v17 = (uint64_t)&v6[*(int *)(v4 + 48)];
  sub_2460C784C((uint64_t)v15, (uint64_t)v6, &qword_2575410C8);
  sub_2460C784C((uint64_t)v13, v17, &qword_2575410C8);
  v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v18((uint64_t)v6, 1, v0) == 1)
  {
    sub_2460B2CC0((uint64_t)v13, &qword_2575410C8);
    sub_2460B2CC0((uint64_t)v15, &qword_2575410C8);
    v19 = v18(v17, 1, v0);
    if (v19 == 1)
      v20 = &qword_2575410C8;
    else
      v20 = &qword_2575410C0;
    if (v19 == 1)
      v21 = -1;
    else
      v21 = 0;
  }
  else
  {
    sub_2460C784C((uint64_t)v6, (uint64_t)v10, &qword_2575410C8);
    if (v18(v17, 1, v0) == 1)
    {
      sub_2460B2CC0((uint64_t)v13, &qword_2575410C8);
      sub_2460B2CC0((uint64_t)v15, &qword_2575410C8);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
      v21 = 0;
      v20 = &qword_2575410C0;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v17, v0);
      sub_2460C780C(&qword_2575410E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA0C98], MEMORY[0x24BEA0CA8]);
      v21 = sub_2460D4ED8();
      v22 = *(void (**)(char *, uint64_t))(v1 + 8);
      v22(v3, v0);
      v20 = &qword_2575410C8;
      sub_2460B2CC0((uint64_t)v13, &qword_2575410C8);
      sub_2460B2CC0((uint64_t)v15, &qword_2575410C8);
      v22(v10, v0);
    }
  }
  sub_2460B2CC0((uint64_t)v6, v20);
  return v21 & 1;
}

unint64_t UsoEntity_common_MediaItem.findAll(options:with:)(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t result;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = MEMORY[0x24BEE4AF8];
  if ((a2(v3) & 1) != 0)
  {
    v7 = swift_retain();
    MEMORY[0x24954F44C](v7);
    if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2460D4F38();
    sub_2460D4F44();
    sub_2460D4F2C();
  }
  if (UsoEntity_common_MediaItem.isResolvedReference()() && !*(_QWORD *)(a1 + 16))
    return v14;
  result = sub_2460D4C2C();
  if (!result)
    return v14;
  v9 = result;
  if (!(result >> 62))
  {
    v10 = *(_QWORD *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_10;
LABEL_19:
    swift_bridgeObjectRelease();
    return v14;
  }
  result = sub_2460D5028();
  v10 = result;
  if (!result)
    goto LABEL_19;
LABEL_10:
  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0)
        MEMORY[0x24954F500](i, v9);
      else
        swift_retain();
      sub_2460D4B9C();
      swift_release();
      if (v13)
      {
        sub_2460D4B9C();
        v12 = UsoEntity_common_MediaItem.findAll(options:with:)(a1, a2, a3);
        swift_release();
        sub_2460CBB1C(v12);
      }
      swift_release();
    }
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460CBB1C(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2460D5028();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2460D5028();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x24954F50C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_2460CC81C(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_2460D5028();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_2460D4F2C();
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall UsoEntity_common_MediaItem.hasMediaTypeOnly()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_2460D4C38();
  swift_release();
  if (!v0)
    return 0;
  v1 = sub_2460D4C50();
  swift_release();
  if (v1)
    return 0;
  v2 = sub_2460D4BCC();
  swift_release();
  if (v2)
    return 0;
  v3 = sub_2460D4BA8();
  swift_release();
  if (v3)
    return 0;
  v4 = sub_2460D4C2C();
  swift_bridgeObjectRelease();
  if (v4)
    return 0;
  v5 = sub_2460D4BC0();
  swift_release();
  if (v5)
    return 0;
  if (sub_2460D4BB4())
  {
    swift_release();
    return 0;
  }
  return 1;
}

_QWORD *sub_2460CBD64(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257541180);
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
    sub_2460CCCD8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2460CBE70(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575411A8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2460CCDC8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2460CBF7C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257541188);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2460CCED0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_2460CC088(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257541198);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2460CCFD8(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_2460CC180(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257541178);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2460CCFD8(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2460CC278(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257541170);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2460CD0BC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_2460CC384(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257541168);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2460CCFD8(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460CC47C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2460CC4B4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2460CC498(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2460CC694(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2460CC4B4(char a1, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575411A0);
  v10 = *(_QWORD *)(sub_2460D4B90() - 8);
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
  v16 = *(_QWORD *)(sub_2460D4B90() - 8);
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
  result = sub_2460D5040();
  __break(1u);
  return result;
}

uint64_t sub_2460CC694(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257541188);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257541190);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2460D5040();
  __break(1u);
  return result;
}

uint64_t sub_2460CC81C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2460D5028();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_2460D5028();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2460CCC48();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_257541158);
          v12 = sub_2460CCA14(v16, i, a3);
          v14 = *v13;
          swift_retain();
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2460D4C74();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_2460D5040();
  __break(1u);
  return result;
}

void (*sub_2460CCA14(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2460CCA94(v6, a2, a3);
  return sub_2460CCA68;
}

void sub_2460CCA68(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_2460CCA94(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x24954F500](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain();
LABEL_5:
    *v3 = v4;
    return sub_2460CCB00;
  }
  __break(1u);
  return result;
}

uint64_t sub_2460CCB00()
{
  return swift_release();
}

uint64_t sub_2460CCB08(unint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;

  v14 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_12:
    swift_bridgeObjectRetain();
    v7 = sub_2460D5028();
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_3:
      for (i = 4; ; ++i)
      {
        v9 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          MEMORY[0x24954F500](i - 4, a1);
          v10 = i - 3;
          if (__OFADD__(v9, 1))
            goto LABEL_11;
        }
        else
        {
          swift_retain();
          v10 = i - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_11:
            __break(1u);
            goto LABEL_12;
          }
        }
        v11 = UsoEntity_common_MediaItem.findAll(options:with:)(a2, a3, a4);
        swift_release();
        sub_2460CBB1C(v11);
        if (v10 == v7)
        {
          swift_bridgeObjectRelease();
          return v14;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_2460CCC48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257541160;
  if (!qword_257541160)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257541158);
    result = MEMORY[0x24954F74C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_257541160);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24954F740](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2460CCCD8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_2460D5040();
  __break(1u);
  return result;
}

uint64_t sub_2460CCDC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575411B0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2460D5040();
  __break(1u);
  return result;
}

uint64_t sub_2460CCED0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257541190);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2460D5040();
  __break(1u);
  return result;
}

char *sub_2460CCFD8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_2460D5040();
  __break(1u);
  return result;
}

char *sub_2460CD0BC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_2460D5040();
  __break(1u);
  return result;
}

uint64_t sub_2460CD1A8(uint64_t a1, uint64_t a2)
{
  return sub_2460CD498(a1, a2, AudioUsoIntent.UsoNamespace.rawValue.getter);
}

uint64_t sub_2460CD1B4(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000010;
  else
    v3 = 0x6E456F4E5F6F7375;
  if (v2)
    v4 = 0xEC00000079746974;
  else
    v4 = 0x80000002460D69C0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000010;
  else
    v5 = 0x6E456F4E5F6F7375;
  if ((a2 & 1) != 0)
    v6 = 0x80000002460D69C0;
  else
    v6 = 0xEC00000079746974;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2460D5058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2460CD260(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x696E696665646E69;
  else
    v3 = 0x6574696E69666564;
  if (v2)
    v4 = 0xE800000000000000;
  else
    v4 = 0xEA00000000006574;
  if ((a2 & 1) != 0)
    v5 = 0x696E696665646E69;
  else
    v5 = 0x6574696E69666564;
  if ((a2 & 1) != 0)
    v6 = 0xEA00000000006574;
  else
    v6 = 0xE800000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2460D5058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2460CD304(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 28001;
  else
    v2 = 28006;
  if ((a2 & 1) != 0)
    v3 = 28001;
  else
    v3 = 28006;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_2460D5058();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_2460CD368(uint64_t a1, uint64_t a2)
{
  return sub_2460CD498(a1, a2, CommonAudio.MediaType.rawValue.getter);
}

uint64_t sub_2460CD374(uint64_t a1, uint64_t a2)
{
  return sub_2460CD498(a1, a2, CommonAudio.Attribute.rawValue.getter);
}

uint64_t sub_2460CD380(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6E65726566666964;
  else
    v3 = 0x664F65726F6DLL;
  if (v2)
    v4 = 0xE600000000000000;
  else
    v4 = 0xED00006E61685474;
  if ((a2 & 1) != 0)
    v5 = 0x6E65726566666964;
  else
    v5 = 0x664F65726F6DLL;
  if ((a2 & 1) != 0)
    v6 = 0xED00006E61685474;
  else
    v6 = 0xE600000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2460D5058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2460CD428(char a1, char a2)
{
  char v2;

  if (*(_QWORD *)&a1920s_1[8 * a1] == *(_QWORD *)&a1920s_1[8 * a2])
    v2 = 1;
  else
    v2 = sub_2460D5058();
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_2460CD48C(uint64_t a1, uint64_t a2)
{
  return sub_2460CD498(a1, a2, CommonAudio.Verb.rawValue.getter);
}

uint64_t sub_2460CD498(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v4 = a3();
  v6 = v5;
  if (v4 == a3() && v6 == v7)
    v9 = 1;
  else
    v9 = sub_2460D5058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_2460CD530(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aPopular_1[8 * a1] == *(_QWORD *)&aPopular_1[8 * a2]
    && *(_QWORD *)&aMediocregreate[8 * a1 + 16] == *(_QWORD *)&aMediocregreate[8 * a2 + 16])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_2460D5058();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2460CD5B4(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x317374616562;
  else
    v3 = 0x7972617262696CLL;
  if (v2)
    v4 = 0xE700000000000000;
  else
    v4 = 0xE600000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x317374616562;
  else
    v5 = 0x7972617262696CLL;
  if ((a2 & 1) != 0)
    v6 = 0xE600000000000000;
  else
    v6 = 0xE700000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2460D5058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2460CD650(char a1, char a2)
{
  char v3;

  if (qword_2460D5940[a1] == qword_2460D5940[a2] && qword_2460D5960[a1] == qword_2460D5960[a2])
    v3 = 1;
  else
    v3 = sub_2460D5058();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Bool __swiftcall AudioIntent.hasResolvedReference()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = (*(uint64_t (**)(void))(v0 + 272))();
  if (v1)
    swift_release();
  return v1 != 0;
}

Swift::Bool __swiftcall AudioIntent.isReferringToCurrentlyPlayingForAdd()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  void (*v21)(_BYTE *, uint64_t, uint64_t);
  void (*v22)(_BYTE *, uint64_t);
  _BYTE v24[15];
  uint64_t v25;

  v3 = v2;
  v4 = v1;
  v5 = v0;
  v6 = *(_QWORD *)(v0 - 8);
  v7 = ((uint64_t (*)())MEMORY[0x24BDAC7A8])();
  v9 = &v24[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = &v24[-v11];
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(v13 + 296))(&v25, v10);
  if (v25 == 18)
  {
    return 0;
  }
  else
  {
    v24[14] = v25;
    v24[13] = 7;
    v15 = CommonAudio.Verb.rawValue.getter();
    v17 = v16;
    if (v15 == CommonAudio.Verb.rawValue.getter() && v17 == v18)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v19 = sub_2460D5058();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = 0;
      if ((v19 & 1) == 0)
        return v14;
    }
    v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 272))(v5, v4);
    swift_release();
    v21 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16);
    v21(v12, v3, v5);
    if (v20)
      LOBYTE(v20) = AudioIntent.isWithoutTitlesAndArtist()();
    v22 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
    v22(v12, v5);
    v21(v9, v3, v5);
    v14 = (v20 & 1) != 0 || AudioIntent.isWithoutTitlesAndArtistAndGenre()();
    v22(v9, v5);
  }
  return v14;
}

Swift::Bool __swiftcall AudioIntent.isWithoutTitlesAndArtist()()
{
  uint64_t v0;
  uint64_t (**v1)(_QWORD, _QWORD);
  uint64_t v2;
  uint64_t v3;
  uint64_t (**v4)(_QWORD, _QWORD);
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v23;

  v3 = v2;
  v4 = v1;
  v5 = v0;
  v6 = *(_QWORD *)(v0 - 8);
  v7 = ((uint64_t (*)())MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v23 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v23 - v14;
  v17 = *(_QWORD *)((*(uint64_t (**)(uint64_t))(v16 + 136))(v13) + 16);
  swift_bridgeObjectRelease();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v18(v15, v3, v5);
  if (v17)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    v19 = *(_QWORD *)(v4[25](v5, v4) + 16);
    swift_bridgeObjectRelease();
    LODWORD(v19) = v19 == 0;
  }
  v20 = *(void (**)(char *, uint64_t))(v6 + 8);
  v20(v15, v5);
  v18(v12, v3, v5);
  if ((_DWORD)v19)
  {
    v21 = *(_QWORD *)(v4[13](v5, v4) + 16);
    swift_bridgeObjectRelease();
    v20(v12, v5);
    v18(v9, v3, v5);
    if (v21)
    {
      LOBYTE(v19) = 0;
    }
    else
    {
      v19 = *(_QWORD *)(v4[3](v5, v4) + 16);
      swift_bridgeObjectRelease();
      LOBYTE(v19) = v19 == 0;
    }
  }
  else
  {
    v20(v12, v5);
    v18(v9, v3, v5);
  }
  v20(v9, v5);
  return v19;
}

Swift::Bool __swiftcall AudioIntent.isWithoutTitlesAndArtistAndGenre()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  Swift::Bool v12;
  void (*v13)(_BYTE *, uint64_t, uint64_t);
  uint64_t v14;
  _BOOL4 v15;
  void (*v16)(_BYTE *, uint64_t);
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v24[15];
  uint64_t v25;

  v3 = v2;
  v4 = v1;
  v5 = v0;
  v6 = *(_QWORD *)(v0 - 8);
  v7 = ((uint64_t (*)())MEMORY[0x24BDAC7A8])();
  v9 = &v24[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v11 = &v24[-v10];
  v12 = AudioIntent.isWithoutTitlesAndArtist()();
  v13 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16);
  v13(v11, v3, v5);
  if (v12)
  {
    v14 = *(_QWORD *)((*(uint64_t (**)(uint64_t, uint64_t))(v4 + 152))(v5, v4) + 16);
    swift_bridgeObjectRelease();
    v15 = v14 == 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
  v16(v11, v5);
  v13(v9, v3, v5);
  if (v15)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v4 + 168))(&v25, v5, v4);
    if (v25 == 29)
    {
      v17 = 0;
    }
    else
    {
      v24[14] = v25;
      v24[13] = 0;
      v19 = CommonAudio.MediaType.rawValue.getter();
      v21 = v20;
      if (v19 == CommonAudio.MediaType.rawValue.getter() && v21 == v22)
        v17 = 1;
      else
        v17 = sub_2460D5058();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v16(v9, v5);
    v18 = v17 ^ 1;
  }
  else
  {
    v16(v9, v5);
    v18 = 0;
  }
  return v18 & 1;
}

Swift::Bool __swiftcall AudioIntent.isBeats1Only()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  Swift::Bool v6;
  BOOL v7;
  uint64_t v9;

  v2 = v0;
  v3 = *(_QWORD *)(v0 - 8);
  ((void (*)())MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = AudioIntent.hasBeats1ItemOrRadioStationNameOnly()();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v7 = v6 || AudioIntent.hasBeats1NounOnly()();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

Swift::Bool __swiftcall AudioIntent.hasBeats1ItemOrRadioStationNameOnly()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
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
  char v19;

  v2 = v1;
  v3 = v0;
  v4 = (_QWORD *)(*(uint64_t (**)(void))(v1 + 136))();
  if (v4[2])
  {
    v6 = v4[4];
    v5 = v4[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    v6 = 0;
    v5 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  v7 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 248))(v3, v2);
  if (v7[2])
  {
    v9 = v7[4];
    v8 = v7[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    v9 = 0;
    v8 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  v10 = v5 & 0x2000000000000000;
  v11 = HIBYTE(v5) & 0xF;
  v12 = v6 & 0xFFFFFFFFFFFFLL;
  if ((v5 & 0x2000000000000000) != 0)
    v13 = HIBYTE(v5) & 0xF;
  else
    v13 = v6 & 0xFFFFFFFFFFFFLL;
  if (v13)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v10 = v8 & 0x2000000000000000;
    v11 = HIBYTE(v8) & 0xF;
    v12 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (v10)
    v14 = v11;
  else
    v14 = v12;
  if (v14)
  {
    v15 = sub_2460D4EF0();
    v17 = v16;
    swift_bridgeObjectRelease();
    if (qword_257540688 != -1)
      swift_once();
    if (v15 == sub_2460D4EF0() && v17 == v18)
      v19 = 1;
    else
      v19 = sub_2460D5058();
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = 0;
  }
  swift_bridgeObjectRelease();
  return v19 & 1;
}

Swift::Bool __swiftcall AudioIntent.hasBeats1NounOnly()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  v3 = v1;
  v4 = v0;
  v5 = *(_QWORD *)(v0 - 8);
  v6 = ((uint64_t (*)())MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)(*(uint64_t (**)(uint64_t))(v9 + 136))(v6);
  if (v10[2])
  {
    v12 = v10[4];
    v11 = v10[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v13 = v12 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = 0;
    v11 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  if ((v11 & 0x2000000000000000) != 0)
    v14 = HIBYTE(v11) & 0xF;
  else
    v14 = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2, v4);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v15 = 0;
  }
  else
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 208))(&v18, v4, v3);
    if (v18 == 2)
    {
      v15 = 0;
    }
    else
    {
      if ((v18 & 1) != 0)
        v15 = 1;
      else
        v15 = sub_2460D5058();
      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return v15 & 1;
}

Swift::Bool __swiftcall AudioIntent.isReferencedPlayRequest()()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  void (*v17)(_BYTE *, _BYTE *, uint64_t);
  void (*v18)(_BYTE *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  int v24;
  unint64_t v25;
  uint64_t v26;
  _BYTE v28[15];
  uint64_t v29;
  uint64_t v30;

  v3 = v2;
  v4 = v1;
  v5 = v0;
  v6 = *(_QWORD *)(v0 - 8);
  v7 = ((uint64_t (*)())MEMORY[0x24BDAC7A8])();
  v9 = &v28[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = &v28[-v11];
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = &v28[-v14];
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(v16 + 296))(&v30, v13);
  if (v30 == 18)
  {
    v17 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16);
    v17(v15, v2, v5);
LABEL_3:
    v18 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
    v18(v15, v5);
    v17(v12, v2, v5);
LABEL_14:
    LOBYTE(v25) = 0;
    goto LABEL_15;
  }
  v28[14] = v30;
  v28[13] = 0;
  v19 = CommonAudio.Verb.rawValue.getter();
  v21 = v20;
  if (v19 == CommonAudio.Verb.rawValue.getter() && v21 == v22)
  {
    swift_bridgeObjectRelease_n();
    v17 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16);
    v17(v15, v2, v5);
  }
  else
  {
    v23 = sub_2460D5058();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v17 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 16);
    v17(v15, v2, v5);
    if ((v23 & 1) == 0)
      goto LABEL_3;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v4 + 264))(&v29, v5, v4);
  v18 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
  v18(v15, v5);
  v24 = v29;
  v17(v12, v3, v5);
  if (v24 == 2)
    goto LABEL_14;
  v17(v9, v12, v5);
  type metadata accessor for AudioUsoIntent();
  if (!swift_dynamicCast())
    goto LABEL_14;
  v25 = sub_2460B4A34();
  swift_release();
  if (v25)
  {
    if (v25 >> 62)
    {
      swift_bridgeObjectRetain();
      v26 = sub_2460D5028();
      swift_bridgeObjectRelease();
    }
    else
    {
      v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    LOBYTE(v25) = v26 != 0;
  }
LABEL_15:
  v18(v12, v5);
  return v25;
}

Swift::Bool __swiftcall AudioIntent.isPlayRequest()()
{
  uint64_t v0;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(uint64_t *__return_ptr, uint64_t);
  int v22;
  void (*v23)(char *, uint64_t, uint64_t);
  void (*v24)(char *, uint64_t);
  char *v25;
  char *v26;
  char v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  void (*v50)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v51;
  char *v52;
  char *v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  uint64_t v62;

  v3 = v2;
  v4 = v1;
  v5 = v0;
  v6 = *(_QWORD *)(v0 - 8);
  v7 = ((uint64_t (*)())MEMORY[0x24BDAC7A8])();
  v52 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v53 = (char *)&v50 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v50 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v50 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v50 - v18;
  v21 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v20 + 296);
  v21((uint64_t *)((char *)&v62 + 4), v17);
  v22 = BYTE4(v62);
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v23(v19, v3, v5);
  if (v22 == 18)
    goto LABEL_2;
  v50 = (void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v21;
  v51 = v4;
  ((void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v21)((uint64_t *)((char *)&v62 + 3), v5, v4);
  if (BYTE3(v62) == 18)
  {
    v24 = *(void (**)(char *, uint64_t))(v6 + 8);
    v24(v19, v5);
    v23(v16, v3, v5);
    goto LABEL_11;
  }
  v55 = BYTE3(v62);
  v54 = 0;
  v30 = CommonAudio.Verb.rawValue.getter();
  v32 = v31;
  if (v30 != CommonAudio.Verb.rawValue.getter() || v32 != v33)
  {
    v38 = sub_2460D5058();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v24 = *(void (**)(char *, uint64_t))(v6 + 8);
    v24(v19, v5);
    v23(v16, v3, v5);
    if ((v38 & 1) != 0)
      goto LABEL_3;
LABEL_11:
    v50((uint64_t *)((char *)&v62 + 2), v5, v51);
    if (BYTE2(v62) == 18)
    {
      v24(v16, v5);
      v23(v13, v3, v5);
    }
    else
    {
      v57 = BYTE2(v62);
      v56 = 5;
      v34 = CommonAudio.Verb.rawValue.getter();
      v36 = v35;
      if (v34 == CommonAudio.Verb.rawValue.getter() && v36 == v37)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_3;
      }
      v43 = sub_2460D5058();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v24(v16, v5);
      v23(v13, v3, v5);
      if ((v43 & 1) != 0)
        goto LABEL_4;
    }
    v50((uint64_t *)((char *)&v62 + 1), v5, v51);
    if (BYTE1(v62) == 18)
    {
      v24(v13, v5);
      v25 = v53;
      v23(v53, v3, v5);
    }
    else
    {
      v59 = BYTE1(v62);
      v58 = 4;
      v39 = CommonAudio.Verb.rawValue.getter();
      v41 = v40;
      if (v39 == CommonAudio.Verb.rawValue.getter() && v41 == v42)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_4;
      }
      v48 = sub_2460D5058();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v24(v13, v5);
      v25 = v53;
      v23(v53, v3, v5);
      if ((v48 & 1) != 0)
      {
        v26 = v52;
        goto LABEL_5;
      }
    }
    v50(&v62, v5, v51);
    if (v62 == 18)
    {
      v24(v25, v5);
      v26 = v52;
      v23(v52, v3, v5);
    }
    else
    {
      v61 = v62;
      v60 = 9;
      v44 = CommonAudio.Verb.rawValue.getter();
      v46 = v45;
      if (v44 == CommonAudio.Verb.rawValue.getter() && v46 == v47)
      {
        swift_bridgeObjectRelease_n();
        v24(v53, v5);
        v26 = v52;
        goto LABEL_6;
      }
      v49 = sub_2460D5058();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v24(v53, v5);
      v26 = v52;
      v23(v52, v3, v5);
      if ((v49 & 1) != 0)
        goto LABEL_7;
    }
    v29 = (*(uint64_t (**)(uint64_t))(v51 + 112))(v5);
    v27 = sub_2460CF3D0(3, v29);
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRelease_n();
LABEL_2:
  v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  v24(v19, v5);
  v23(v16, v3, v5);
LABEL_3:
  v24(v16, v5);
  v23(v13, v3, v5);
LABEL_4:
  v24(v13, v5);
  v26 = v52;
  v25 = v53;
  v23(v53, v3, v5);
LABEL_5:
  v24(v25, v5);
LABEL_6:
  v23(v26, v3, v5);
LABEL_7:
  v27 = 1;
LABEL_8:
  v24(v26, v5);
  return v27 & 1;
}

Swift::Bool __swiftcall AudioIntent.hasAttribute(_:)(SiriAudioIntentUtils::CommonAudio::Attribute a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(unsigned __int8 *)a1;
  v3 = (*(uint64_t (**)())(v1 + 112))();
  LOBYTE(v2) = sub_2460CF3D0(v2, v3);
  swift_bridgeObjectRelease();
  return v2 & 1;
}

Swift::Bool __swiftcall AudioIntent.isAddToUpNext()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint64_t *__return_ptr, uint64_t);
  void (*v14)(char *, uint64_t, uint64_t);
  void (*v15)(char *, uint64_t);
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v28;
  uint64_t v29;
  char v30;
  char v31;
  char v32;
  char v33;
  uint64_t v34;

  v3 = v1;
  v4 = v0;
  v5 = *(_QWORD *)(v0 - 8);
  v6 = ((uint64_t (*)())MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v29 - v10;
  v13 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v12 + 296);
  v13((uint64_t *)((char *)&v34 + 1), v9);
  v29 = v2;
  if (BYTE1(v34) == 18)
  {
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v14(v11, v2, v4);
  }
  else
  {
    v31 = BYTE1(v34);
    v30 = 0;
    v17 = CommonAudio.Verb.rawValue.getter();
    v19 = v18;
    if (v17 == CommonAudio.Verb.rawValue.getter() && v19 == v20)
    {
      swift_bridgeObjectRelease_n();
      v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v14(v11, v29, v4);
      goto LABEL_12;
    }
    v25 = sub_2460D5058();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v14(v11, v29, v4);
    if ((v25 & 1) != 0)
      goto LABEL_12;
  }
  ((void (*)(uint64_t *__return_ptr, uint64_t, uint64_t))v13)(&v34, v4, v3);
  if (v34 != 18)
  {
    v33 = v34;
    v32 = 7;
    v21 = CommonAudio.Verb.rawValue.getter();
    v23 = v22;
    if (v21 != CommonAudio.Verb.rawValue.getter() || v23 != v24)
    {
      v28 = sub_2460D5058();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v15 = *(void (**)(char *, uint64_t))(v5 + 8);
      v15(v11, v4);
      v14(v8, v29, v4);
      v16 = 0;
      if ((v28 & 1) == 0)
        goto LABEL_14;
      goto LABEL_13;
    }
    swift_bridgeObjectRelease_n();
LABEL_12:
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v11, v4);
    v14(v8, v29, v4);
LABEL_13:
    v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 112))(v4, v3);
    v16 = sub_2460CF3D0(3, v26);
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v11, v4);
  v14(v8, v29, v4);
  v16 = 0;
LABEL_14:
  v15(v8, v4);
  return v16 & 1;
}

BOOL AudioIntent.hasAnyAttribute(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 112))(a2, a3);
  LOBYTE(a1) = sub_2460CEB38(a1, v4);
  swift_bridgeObjectRelease();
  return (a1 & 1) == 0;
}

uint64_t sub_2460CEB38(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  int64_t v18;
  uint64_t v19;

  v2 = *(_QWORD *)(a2 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 16);
    if (v3)
    {
      if (v2 >= v3)
        v4 = a1;
      else
        v4 = a2;
      if (v2 >= v3)
        v5 = a2;
      else
        v5 = a1;
      v19 = v4 + 56;
      v6 = -1 << *(_BYTE *)(v4 + 32);
      if (-v6 < 64)
        v7 = ~(-1 << -(char)v6);
      else
        v7 = -1;
      v8 = v7 & *(_QWORD *)(v4 + 56);
      v18 = (unint64_t)(63 - v6) >> 6;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v9 = 0;
      while (1)
      {
        while (1)
        {
          v10 = v9;
          if (!v8)
            break;
          v11 = __clz(__rbit64(v8));
          v8 &= v8 - 1;
          v12 = v11 | (v9 << 6);
          if (*(_QWORD *)(v5 + 16))
            goto LABEL_30;
        }
        v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_34;
        }
        if (v13 >= v18)
          goto LABEL_32;
        v14 = *(_QWORD *)(v19 + 8 * v13);
        ++v9;
        if (!v14)
        {
          v9 = v10 + 2;
          if (v10 + 2 >= v18)
            goto LABEL_32;
          v14 = *(_QWORD *)(v19 + 8 * v9);
          if (!v14)
          {
            v9 = v10 + 3;
            if (v10 + 3 >= v18)
              goto LABEL_32;
            v14 = *(_QWORD *)(v19 + 8 * v9);
            if (!v14)
            {
              v15 = v10 + 4;
              if (v10 + 4 >= v18)
              {
LABEL_32:
                swift_bridgeObjectRelease();
                sub_2460CFA94();
                return 1;
              }
              v14 = *(_QWORD *)(v19 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v9 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    break;
                  if (v9 >= v18)
                    goto LABEL_32;
                  v14 = *(_QWORD *)(v19 + 8 * v9);
                  ++v15;
                  if (v14)
                    goto LABEL_29;
                }
LABEL_34:
                __break(1u);
                JUMPOUT(0x2460CF31CLL);
              }
              v9 = v10 + 4;
            }
          }
        }
LABEL_29:
        v8 = (v14 - 1) & v14;
        v12 = __clz(__rbit64(v14)) + (v9 << 6);
        if (*(_QWORD *)(v5 + 16))
        {
LABEL_30:
          v16 = *(unsigned __int8 *)(*(_QWORD *)(v4 + 48) + v12);
          sub_2460D507C();
          __asm { BR              X8 }
        }
      }
    }
  }
  return 1;
}

uint64_t sub_2460CF3D0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  if (*(_QWORD *)(a2 + 16))
  {
    sub_2460D507C();
    CommonAudio.Attribute.rawValue.getter();
    sub_2460D4EFC();
    swift_bridgeObjectRelease();
    v3 = sub_2460D5094() & ~(-1 << *(_BYTE *)(a2 + 32));
    if (((*(_QWORD *)(a2 + 56 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
      __asm { BR              X9 }
  }
  return 0;
}

Swift::Bool __swiftcall AudioIntent.isAirPlayMusicWithoutAppName()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v13;

  v3 = v1;
  v4 = v0;
  v5 = *(_QWORD *)(v0 - 8);
  v6 = ((uint64_t (*)())MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)((*(uint64_t (**)(uint64_t))(v9 + 304))(v6) + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2, v4);
  if (v10)
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 312))(v4, v3);
  else
    v11 = 0;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v11 & 1;
}

uint64_t dispatch thunk of AudioIntent.activities.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AudioIntent.albums.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AudioIntent.appAudiobookAuthors.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AudioIntent.appAudiobookTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AudioIntent.appMusicArtistNames.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AudioIntent.appName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of AudioIntent.appPlaylistTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of AudioIntent.appShowTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of AudioIntent.applePlaylistTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of AudioIntent.applePodcastTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of AudioIntent.apps.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of AudioIntent.artists.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of AudioIntent.attributes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of AudioIntent.dateTime.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of AudioIntent.decade.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of AudioIntent.entities.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of AudioIntent.frequency.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t dispatch thunk of AudioIntent.genres.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of AudioIntent.mediaIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t dispatch thunk of AudioIntent.mediaType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 168))();
}

uint64_t dispatch thunk of AudioIntent.targetMediaType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of AudioIntent.modifiers.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 184))();
}

uint64_t dispatch thunk of AudioIntent.moods.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 192))();
}

uint64_t dispatch thunk of AudioIntent.musicTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 200))();
}

uint64_t dispatch thunk of AudioIntent.noun.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 208))();
}

uint64_t dispatch thunk of AudioIntent.playlistTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 216))();
}

uint64_t dispatch thunk of AudioIntent.podcastTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 224))();
}

uint64_t dispatch thunk of AudioIntent.newsPodcastTopicId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 232))();
}

uint64_t dispatch thunk of AudioIntent.newsPodcastIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 240))();
}

uint64_t dispatch thunk of AudioIntent.radioStationNames.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 248))();
}

uint64_t dispatch thunk of AudioIntent.radioType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 256))();
}

uint64_t dispatch thunk of AudioIntent.reference.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 264))();
}

uint64_t dispatch thunk of AudioIntent.resolvedReference.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 272))();
}

uint64_t dispatch thunk of AudioIntent.showTitles.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 280))();
}

uint64_t dispatch thunk of AudioIntent.sort.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 288))();
}

uint64_t dispatch thunk of AudioIntent.verb.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 296))();
}

uint64_t dispatch thunk of AudioIntent.audioSettingNames.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 304))();
}

uint64_t dispatch thunk of AudioIntent.appInferred.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 312))();
}

uint64_t sub_2460CFA94()
{
  return swift_release();
}

char *UsoEntity_common_Setting.usoMediaSettingNames()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unint64_t, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD v40[2];
  uint8_t *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v0 = sub_2460D4B90();
  v44 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v40 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2460D4EB4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v40 - v8;
  if (qword_2575406C8 != -1)
    swift_once();
  v10 = sub_2460D4BE4();
  if (!v10)
  {
    if (qword_2575406D8 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v3, (uint64_t)qword_257542C08);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v23, v3);
    v24 = sub_2460D4EA8();
    v25 = sub_2460D4F68();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_2460B0000, v24, v25, "UsoMediaSettingNames: Found no identifiers for name", v26, 2u);
      MEMORY[0x24954F7D0](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return (char *)MEMORY[0x24BEE4AF8];
  }
  v11 = v10;
  if (qword_2575406D8 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v3, (uint64_t)qword_257542C08);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v12, v3);
  swift_bridgeObjectRetain_n();
  v13 = sub_2460D4EA8();
  v14 = sub_2460D4F68();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v46 = v42;
    v41 = v15;
    *(_DWORD *)v15 = 136315138;
    v40[1] = v15 + 4;
    v16 = swift_bridgeObjectRetain();
    v17 = MEMORY[0x24954F458](v16, v0);
    v43 = (char *)v4;
    v18 = v17;
    v20 = v19;
    swift_bridgeObjectRelease();
    v45 = sub_2460D2344(v18, v20, &v46);
    sub_2460D4F80();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v21 = v41;
    _os_log_impl(&dword_2460B0000, v13, v14, "UsoMediaSettingNames: Found identifiers for name: %s", v41, 0xCu);
    v22 = v42;
    swift_arrayDestroy();
    MEMORY[0x24954F7D0](v22, -1, -1);
    MEMORY[0x24954F7D0](v21, -1, -1);

    (*((void (**)(char *, uint64_t))v43 + 1))(v9, v3);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  v27 = *(_QWORD *)(v11 + 16);
  if (!v27)
  {
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  v28 = v11 + ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80));
  v29 = *(_QWORD *)(v44 + 72);
  v30 = *(void (**)(char *, unint64_t, uint64_t))(v44 + 16);
  v42 = v11;
  swift_bridgeObjectRetain();
  v31 = (char *)MEMORY[0x24BEE4AF8];
  v43 = "with negative count";
  do
  {
    v30(v2, v28, v0);
    v32 = sub_2460D4B84();
    if (!v33)
    {
LABEL_16:
      (*(void (**)(char *, uint64_t))(v44 + 8))(v2, v0);
      goto LABEL_17;
    }
    if (v32 == 0xD000000000000010 && v33 == 0x80000002460D7980)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v34 = sub_2460D5058();
      swift_bridgeObjectRelease();
      if ((v34 & 1) == 0)
        goto LABEL_16;
    }
    sub_2460D4B78();
    v35 = sub_2460D504C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v2, v0);
    if (!v35)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v31 = sub_2460CC384(0, *((_QWORD *)v31 + 2) + 1, 1, v31);
      v37 = *((_QWORD *)v31 + 2);
      v36 = *((_QWORD *)v31 + 3);
      v38 = v37 + 1;
      if (v37 >= v36 >> 1)
        v31 = sub_2460CC384((char *)(v36 > 1), v37 + 1, 1, v31);
      *((_QWORD *)v31 + 2) = v38;
    }
LABEL_17:
    v28 += v29;
    --v27;
  }
  while (v27);
  swift_bridgeObjectRelease_n();
  return v31;
}

SiriAudioIntentUtils::CommonAudio::Verb_optional __swiftcall CommonAudio.Verb.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriAudioIntentUtils::CommonAudio::Verb_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2460D5064();
  result.value = swift_bridgeObjectRelease();
  v5 = 18;
  if (v3 < 0x12)
    v5 = v3;
  *v2 = v5;
  return result;
}

SiriAudioIntentUtils::CommonAudio::UsoEntity_optional __swiftcall CommonAudio.UsoEntity.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (SiriAudioIntentUtils::CommonAudio::UsoEntity_optional)sub_2460D14D4(v1);
}

uint64_t static CommonAudio.MediaType.from(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  char v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v33 = a2;
  v3 = sub_2460D4EB4();
  v34 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  v6 = MEMORY[0x24BDAC7A8](v32);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v31 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v31 - v12;
  v14 = sub_2460D4D34();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2460C784C(a1, (uint64_t)v13, &qword_257540740);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_2460D2304((uint64_t)v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
    if (qword_2575406A0 != -1)
      swift_once();
    v18 = qword_257542C00;
    if (*(_QWORD *)(qword_257542C00 + 16))
    {
      v19 = sub_2460D2994((uint64_t)v17);
      if ((v20 & 1) != 0)
      {
        v21 = *(_BYTE *)(*(_QWORD *)(v18 + 56) + v19);
        result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
        goto LABEL_15;
      }
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  v23 = v34;
  if (qword_2575406D8 != -1)
    swift_once();
  v24 = __swift_project_value_buffer(v3, (uint64_t)qword_257542C08);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v5, v24, v3);
  sub_2460C784C(a1, (uint64_t)v11, &qword_257540740);
  v25 = sub_2460D4EA8();
  v26 = sub_2460D4F50();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    v36 = v28;
    *(_DWORD *)v27 = 136315138;
    sub_2460C784C((uint64_t)v11, (uint64_t)v8, &qword_257540740);
    v29 = sub_2460D4EE4();
    v35 = sub_2460D2344(v29, v30, &v36);
    sub_2460D4F80();
    swift_bridgeObjectRelease();
    sub_2460D2304((uint64_t)v11);
    _os_log_impl(&dword_2460B0000, v25, v26, "AudioUsoIntent#MediaType#from received unregistered type: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954F7D0](v28, -1, -1);
    MEMORY[0x24954F7D0](v27, -1, -1);

    result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v5, v3);
  }
  else
  {
    sub_2460D2304((uint64_t)v11);

    result = (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v5, v3);
  }
  v21 = 29;
LABEL_15:
  *v33 = v21;
  return result;
}

uint64_t static CommonAudio.Decade.from(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  uint64_t result;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  _QWORD v25[2];
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = sub_2460D4EB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v10 = qword_257540698;
    swift_bridgeObjectRetain();
    if (v10 != -1)
      swift_once();
    v11 = qword_257542BF8;
    if (*(_QWORD *)(qword_257542BF8 + 16))
    {
      v12 = sub_2460D29F8(a1, a2);
      if ((v13 & 1) != 0)
      {
        v14 = *(_BYTE *)(*(_QWORD *)(v11 + 56) + v12);
        result = swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRelease();
  }
  if (qword_2575406D8 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v6, (uint64_t)qword_257542C08);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
  swift_bridgeObjectRetain_n();
  v17 = sub_2460D4EA8();
  v18 = sub_2460D4F50();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v26 = a3;
    v20 = (uint8_t *)v19;
    v21 = swift_slowAlloc();
    v28 = a2;
    v29 = v21;
    *(_DWORD *)v20 = 136315138;
    v25[1] = v20 + 4;
    v27 = a1;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575411D8);
    v22 = sub_2460D4EE4();
    v27 = sub_2460D2344(v22, v23, &v29);
    sub_2460D4F80();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2460B0000, v17, v18, "CommonAudio#Decade#from received unregistered decade: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954F7D0](v21, -1, -1);
    v24 = v20;
    a3 = v26;
    MEMORY[0x24954F7D0](v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v14 = 11;
LABEL_14:
  *a3 = v14;
  return result;
}

SiriAudioIntentUtils::CommonAudio::RadioType_optional __swiftcall CommonAudio.RadioType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (SiriAudioIntentUtils::CommonAudio::RadioType_optional)sub_2460D14D4(v1);
}

uint64_t CommonAudio.Attribute.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2460D06DC + 4 * byte_2460D5990[*v0]))(0xD000000000000018, 0x80000002460D6CA0);
}

uint64_t sub_2460D06DC()
{
  return 0x697472416D6F7266;
}

uint64_t sub_2460D06F8()
{
  return 0x676E6F536D6F7266;
}

uint64_t sub_2460D0710()
{
  return 0x75626C416D6F7266;
}

uint64_t sub_2460D072C()
{
  return 0x7478654E79616C70;
}

uint64_t sub_2460D0744()
{
  return 0x776F4E79616C70;
}

uint64_t sub_2460D075C()
{
  return 0x7473614C79616C70;
}

uint64_t sub_2460D0774()
{
  return 0x7974696E69666661;
}

uint64_t sub_2460D078C()
{
  return 0x6E656D6D6F636572;
}

uint64_t sub_2460D07AC()
{
  return 0x7265766F63736964;
}

uint64_t sub_2460D07CC()
{
  return 1954047342;
}

uint64_t sub_2460D07DC()
{
  return 0x64656D616ELL;
}

uint64_t sub_2460D07F0()
{
  return 0x73756F6976657270;
}

uint64_t sub_2460D0808()
{
  return 0x44657361656C6572;
}

uint64_t sub_2460D0828()
{
  return 0x6E6F697461727564;
}

void sub_2460D0840()
{
  qword_2575411B8 = 0x31207374616542;
  unk_2575411C0 = 0xE700000000000000;
}

uint64_t static CommonAudio.beatsOne.getter()
{
  return sub_2460D08D4(&qword_257540688, &qword_2575411B8);
}

void sub_2460D0884()
{
  strcpy((char *)&qword_2575411C8, "disambiguation");
  unk_2575411D7 = -18;
}

uint64_t static CommonAudio.disambiguationRole.getter()
{
  return sub_2460D08D4(&qword_257540690, &qword_2575411C8);
}

uint64_t sub_2460D08D4(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t CommonAudio.Verb.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2460D0958 + 4 * byte_2460D599F[*v0]))(0xD000000000000012, 0x80000002460D6980);
}

uint64_t sub_2460D0958()
{
  return 2036427888;
}

uint64_t sub_2460D0968()
{
  return 0x6269726373627573;
}

uint64_t sub_2460D0A64()
{
  return 6579297;
}

uint64_t sub_2460D0A74()
{
  return 0x656C62616E65;
}

uint64_t sub_2460D0A88()
{
  return 0x656C6261736964;
}

uint64_t sub_2460D0AA0()
{
  return 0x796669646F6DLL;
}

uint64_t sub_2460D0AB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2460CD48C(*a1, *a2);
}

uint64_t sub_2460D0AC0(uint64_t a1, uint64_t a2)
{
  return sub_2460D1FEC(a1, a2, (void (*)(uint64_t))CommonAudio.Verb.rawValue.getter);
}

uint64_t sub_2460D0ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2460D2060(a1, a2, a3, (void (*)(void))CommonAudio.Verb.rawValue.getter);
}

uint64_t sub_2460D0AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2460D20BC(a1, a2, a3, (void (*)(uint64_t))CommonAudio.Verb.rawValue.getter);
}

SiriAudioIntentUtils::CommonAudio::Verb_optional sub_2460D0AE4(Swift::String *a1)
{
  return CommonAudio.Verb.init(rawValue:)(*a1);
}

uint64_t sub_2460D0AF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.Verb.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t CommonAudio.UsoEntity.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000010;
  else
    return 0x6E456F4E5F6F7375;
}

uint64_t sub_2460D0B5C(char *a1, char *a2)
{
  return sub_2460CD1B4(*a1, *a2);
}

uint64_t sub_2460D0B68()
{
  return sub_2460D3B00();
}

uint64_t sub_2460D0B70()
{
  return sub_2460D3DD8();
}

uint64_t sub_2460D0B78()
{
  return sub_2460D425C();
}

SiriAudioIntentUtils::CommonAudio::UsoEntity_optional sub_2460D0B80(Swift::String *a1)
{
  return CommonAudio.UsoEntity.init(rawValue:)(*a1);
}

uint64_t sub_2460D0B8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.UsoEntity.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Attribute_optional __swiftcall CommonAudio.Attribute.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriAudioIntentUtils::CommonAudio::Attribute_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2460D504C();
  result.value = swift_bridgeObjectRelease();
  v5 = 15;
  if (v3 < 0xF)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_2460D0C08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2460CD374(*a1, *a2);
}

uint64_t sub_2460D0C14(uint64_t a1, uint64_t a2)
{
  return sub_2460D1FEC(a1, a2, (void (*)(uint64_t))CommonAudio.Attribute.rawValue.getter);
}

uint64_t sub_2460D0C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2460D2060(a1, a2, a3, (void (*)(void))CommonAudio.Attribute.rawValue.getter);
}

uint64_t sub_2460D0C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2460D20BC(a1, a2, a3, (void (*)(uint64_t))CommonAudio.Attribute.rawValue.getter);
}

SiriAudioIntentUtils::CommonAudio::Attribute_optional sub_2460D0C38(Swift::String *a1)
{
  return CommonAudio.Attribute.init(rawValue:)(*a1);
}

uint64_t sub_2460D0C44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.Attribute.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Modifier_optional __swiftcall CommonAudio.Modifier.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (SiriAudioIntentUtils::CommonAudio::Modifier_optional)sub_2460D14D4(v1);
}

uint64_t CommonAudio.Modifier.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6E65726566666964;
  else
    return 0x664F65726F6DLL;
}

uint64_t sub_2460D0CB8(char *a1, char *a2)
{
  return sub_2460CD380(*a1, *a2);
}

uint64_t sub_2460D0CC4()
{
  return sub_2460D3B8C();
}

uint64_t sub_2460D0CCC()
{
  return sub_2460D3EC4();
}

uint64_t sub_2460D0CD4()
{
  return sub_2460D4100();
}

SiriAudioIntentUtils::CommonAudio::Modifier_optional sub_2460D0CDC(Swift::String *a1)
{
  return CommonAudio.Modifier.init(rawValue:)(*a1);
}

uint64_t sub_2460D0CE8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.Modifier.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Noun_optional __swiftcall CommonAudio.Noun.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (SiriAudioIntentUtils::CommonAudio::Noun_optional)sub_2460D14D4(v1);
}

uint64_t CommonAudio.Noun.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x317374616562;
  else
    return 0x7972617262696CLL;
}

uint64_t sub_2460D0D50(char *a1, char *a2)
{
  return sub_2460CD5B4(*a1, *a2);
}

uint64_t sub_2460D0D5C()
{
  return sub_2460D3C14();
}

uint64_t sub_2460D0D64()
{
  return sub_2460D3F90();
}

uint64_t sub_2460D0D6C()
{
  return sub_2460D4088();
}

SiriAudioIntentUtils::CommonAudio::Noun_optional sub_2460D0D74(Swift::String *a1)
{
  return CommonAudio.Noun.init(rawValue:)(*a1);
}

uint64_t sub_2460D0D80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.Noun.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t CommonAudio.RadioType.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 28001;
  else
    return 28006;
}

uint64_t sub_2460D0DC0(char *a1, char *a2)
{
  return sub_2460CD304(*a1, *a2);
}

uint64_t sub_2460D0DCC()
{
  return sub_2460D3C90();
}

uint64_t sub_2460D0DD4()
{
  return sub_2460D3E98();
}

uint64_t sub_2460D0DDC()
{
  return sub_2460D4184();
}

SiriAudioIntentUtils::CommonAudio::RadioType_optional sub_2460D0DE4(Swift::String *a1)
{
  return CommonAudio.RadioType.init(rawValue:)(*a1);
}

uint64_t sub_2460D0DF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.RadioType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Confirmation_optional __swiftcall CommonAudio.Confirmation.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriAudioIntentUtils::CommonAudio::Confirmation_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2460D504C();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CommonAudio.Confirmation.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aYes_1[8 * *v0];
}

uint64_t sub_2460D0E90(char *a1, char *a2)
{
  return sub_2460CD650(*a1, *a2);
}

uint64_t sub_2460D0E9C()
{
  return sub_2460D3CEC();
}

uint64_t sub_2460D0EA4()
{
  return sub_2460D3FE4();
}

uint64_t sub_2460D0EAC()
{
  return sub_2460D4024();
}

SiriAudioIntentUtils::CommonAudio::Confirmation_optional sub_2460D0EB4(Swift::String *a1)
{
  return CommonAudio.Confirmation.init(rawValue:)(*a1);
}

uint64_t sub_2460D0EC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.Confirmation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_2460D0EE4()
{
  uint64_t inited;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257541240);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2460D6530;
  *(_QWORD *)(inited + 32) = 0x7330323931;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  *(_BYTE *)(inited + 48) = 0;
  *(_QWORD *)(inited + 56) = 0x7330333931;
  *(_QWORD *)(inited + 64) = 0xE500000000000000;
  *(_BYTE *)(inited + 72) = 1;
  *(_QWORD *)(inited + 80) = 0x7330343931;
  *(_QWORD *)(inited + 88) = 0xE500000000000000;
  *(_BYTE *)(inited + 96) = 2;
  *(_QWORD *)(inited + 104) = 0x7330353931;
  *(_QWORD *)(inited + 112) = 0xE500000000000000;
  *(_BYTE *)(inited + 120) = 3;
  *(_QWORD *)(inited + 128) = 0x7330363931;
  *(_QWORD *)(inited + 136) = 0xE500000000000000;
  *(_BYTE *)(inited + 144) = 4;
  *(_QWORD *)(inited + 152) = 0x7330373931;
  *(_QWORD *)(inited + 160) = 0xE500000000000000;
  *(_BYTE *)(inited + 168) = 5;
  *(_QWORD *)(inited + 176) = 0x7330383931;
  *(_QWORD *)(inited + 184) = 0xE500000000000000;
  *(_BYTE *)(inited + 192) = 6;
  *(_QWORD *)(inited + 200) = 0x7330393931;
  *(_QWORD *)(inited + 208) = 0xE500000000000000;
  *(_BYTE *)(inited + 216) = 7;
  *(_QWORD *)(inited + 224) = 0x7330303032;
  *(_QWORD *)(inited + 232) = 0xE500000000000000;
  *(_BYTE *)(inited + 240) = 8;
  *(_QWORD *)(inited + 248) = 0x7330313032;
  *(_QWORD *)(inited + 256) = 0xE500000000000000;
  *(_BYTE *)(inited + 264) = 9;
  *(_QWORD *)(inited + 272) = 0x7330323032;
  *(_QWORD *)(inited + 280) = 0xE500000000000000;
  *(_BYTE *)(inited + 288) = 10;
  result = sub_2460D1188(inited);
  qword_257542BF8 = result;
  return result;
}

unint64_t sub_2460D0FF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541260);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257541268);
  v6 = sub_2460D5034();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2460C784C(v12, (uint64_t)v5, &qword_257541260);
    result = sub_2460D2994((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_2460D4D34();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_BYTE *)(v7[7] + v16) = v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_2460D1188(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257541248);
  v2 = (_QWORD *)sub_2460D5034();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_2460D29F8(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
    v2[2] = v13;
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

SiriAudioIntentUtils::CommonAudio::Decade_optional __swiftcall CommonAudio.Decade.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriAudioIntentUtils::CommonAudio::Decade_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2460D504C();
  result.value = swift_bridgeObjectRelease();
  v5 = 11;
  if (v3 < 0xB)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CommonAudio.Decade.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&a1920s_2[8 * *v0];
}

uint64_t sub_2460D1308(char *a1, char *a2)
{
  return sub_2460CD428(*a1, *a2);
}

uint64_t sub_2460D1314(uint64_t a1, uint64_t a2)
{
  return sub_2460D13F8(a1, a2, (void (*)(_BYTE *, uint64_t))sub_2460D3F24);
}

uint64_t sub_2460D1320()
{
  return sub_2460D3F24();
}

uint64_t sub_2460D1328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2460D1454(a1, a2, a3, (void (*)(_BYTE *, uint64_t))sub_2460D3F24);
}

SiriAudioIntentUtils::CommonAudio::Decade_optional sub_2460D1334(Swift::String *a1)
{
  return CommonAudio.Decade.init(rawValue:)(*a1);
}

uint64_t sub_2460D1340@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.Decade.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Sort_optional __swiftcall CommonAudio.Sort.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriAudioIntentUtils::CommonAudio::Sort_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2460D504C();
  result.value = swift_bridgeObjectRelease();
  v5 = 9;
  if (v3 < 9)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CommonAudio.Sort.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aPopular_2[8 * *v0];
}

uint64_t sub_2460D13E0(char *a1, char *a2)
{
  return sub_2460CD530(*a1, *a2);
}

uint64_t sub_2460D13EC(uint64_t a1, uint64_t a2)
{
  return sub_2460D13F8(a1, a2, (void (*)(_BYTE *, uint64_t))sub_2460D3F50);
}

uint64_t sub_2460D13F8(uint64_t a1, uint64_t a2, void (*a3)(_BYTE *, uint64_t))
{
  unsigned __int8 *v3;
  uint64_t v5;
  _BYTE v7[72];

  v5 = *v3;
  sub_2460D507C();
  a3(v7, v5);
  return sub_2460D5094();
}

uint64_t sub_2460D1440()
{
  return sub_2460D3F50();
}

uint64_t sub_2460D1448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2460D1454(a1, a2, a3, (void (*)(_BYTE *, uint64_t))sub_2460D3F50);
}

uint64_t sub_2460D1454(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *, uint64_t))
{
  unsigned __int8 *v4;
  uint64_t v6;
  _BYTE v8[72];

  v6 = *v4;
  sub_2460D507C();
  a4(v8, v6);
  return sub_2460D5094();
}

SiriAudioIntentUtils::CommonAudio::Sort_optional sub_2460D1498(Swift::String *a1)
{
  return CommonAudio.Sort.init(rawValue:)(*a1);
}

uint64_t sub_2460D14A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.Sort.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

SiriAudioIntentUtils::CommonAudio::Reference_optional __swiftcall CommonAudio.Reference.init(rawValue:)(Swift::String rawValue)
{
  char *v1;

  return (SiriAudioIntentUtils::CommonAudio::Reference_optional)sub_2460D14D4(v1);
}

uint64_t sub_2460D14D4@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_2460D504C();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t CommonAudio.Reference.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x696E696665646E69;
  else
    return 0x6574696E69666564;
}

uint64_t sub_2460D1570(char *a1, char *a2)
{
  return sub_2460CD260(*a1, *a2);
}

uint64_t sub_2460D157C()
{
  return sub_2460D3D54();
}

uint64_t sub_2460D1584()
{
  return sub_2460D3E3C();
}

uint64_t sub_2460D158C()
{
  return sub_2460D41DC();
}

SiriAudioIntentUtils::CommonAudio::Reference_optional sub_2460D1594(Swift::String *a1)
{
  return CommonAudio.Reference.init(rawValue:)(*a1);
}

uint64_t sub_2460D15A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.Reference.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_2460D15C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(unint64_t, uint64_t, uint64_t);
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
  unint64_t v40;
  uint64_t v41;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257541258);
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257541260);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2460D6540;
  v5 = v4 + v3;
  v6 = *(int *)(v0 + 48);
  v7 = *MEMORY[0x24BEA1690];
  v8 = sub_2460D4D34();
  v9 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 104);
  v9(v5, v7, v8);
  *(_BYTE *)(v5 + v6) = 0;
  v10 = *(int *)(v0 + 48);
  v9(v5 + v2, *MEMORY[0x24BEA16B0], v8);
  *(_BYTE *)(v5 + v2 + v10) = 1;
  v11 = *(int *)(v0 + 48);
  v9(v5 + 2 * v2, *MEMORY[0x24BEA16A8], v8);
  *(_BYTE *)(v5 + 2 * v2 + v11) = 2;
  v12 = *(int *)(v0 + 48);
  v9(v5 + 3 * v2, *MEMORY[0x24BEA1700], v8);
  *(_BYTE *)(v5 + 3 * v2 + v12) = 3;
  v13 = *(int *)(v0 + 48);
  v9(v5 + 4 * v2, *MEMORY[0x24BEA16F8], v8);
  *(_BYTE *)(v5 + 4 * v2 + v13) = 4;
  v14 = *(int *)(v0 + 48);
  v9(v5 + 5 * v2, *MEMORY[0x24BEA1658], v8);
  *(_BYTE *)(v5 + 5 * v2 + v14) = 5;
  v15 = *(int *)(v0 + 48);
  v9(v5 + 6 * v2, *MEMORY[0x24BEA1620], v8);
  *(_BYTE *)(v5 + 6 * v2 + v15) = 6;
  v16 = *(int *)(v0 + 48);
  v9(v5 + 7 * v2, *MEMORY[0x24BEA1680], v8);
  *(_BYTE *)(v5 + 7 * v2 + v16) = 7;
  v17 = *(int *)(v0 + 48);
  v9(v5 + 8 * v2, *MEMORY[0x24BEA16E0], v8);
  *(_BYTE *)(v5 + 8 * v2 + v17) = 8;
  v18 = *(int *)(v0 + 48);
  v9(v5 + 9 * v2, *MEMORY[0x24BEA16F0], v8);
  *(_BYTE *)(v5 + 9 * v2 + v18) = 9;
  v19 = *(int *)(v0 + 48);
  v9(v5 + 10 * v2, *MEMORY[0x24BEA1628], v8);
  *(_BYTE *)(v5 + 10 * v2 + v19) = 10;
  v20 = *(int *)(v0 + 48);
  v9(v5 + 11 * v2, *MEMORY[0x24BEA16A0], v8);
  *(_BYTE *)(v5 + 11 * v2 + v20) = 11;
  v21 = *(int *)(v0 + 48);
  v9(v5 + 12 * v2, *MEMORY[0x24BEA1670], v8);
  *(_BYTE *)(v5 + 12 * v2 + v21) = 12;
  v22 = *(int *)(v0 + 48);
  v9(v5 + 13 * v2, *MEMORY[0x24BEA16C8], v8);
  *(_BYTE *)(v5 + 13 * v2 + v22) = 13;
  v23 = *(int *)(v0 + 48);
  v9(v5 + 14 * v2, *MEMORY[0x24BEA1688], v8);
  *(_BYTE *)(v5 + 14 * v2 + v23) = 14;
  v24 = *(int *)(v0 + 48);
  v9(v5 + 15 * v2, *MEMORY[0x24BEA1708], v8);
  *(_BYTE *)(v5 + 15 * v2 + v24) = 15;
  v25 = *(int *)(v0 + 48);
  v9(v5 + 16 * v2, *MEMORY[0x24BEA1668], v8);
  *(_BYTE *)(v5 + 16 * v2 + v25) = 16;
  v26 = *(int *)(v0 + 48);
  v9(v5 + 17 * v2, *MEMORY[0x24BEA1678], v8);
  *(_BYTE *)(v5 + 17 * v2 + v26) = 17;
  v27 = *(int *)(v0 + 48);
  v9(v5 + 18 * v2, *MEMORY[0x24BEA1638], v8);
  *(_BYTE *)(v5 + 18 * v2 + v27) = 18;
  v28 = *(int *)(v0 + 48);
  v9(v5 + 19 * v2, *MEMORY[0x24BEA1660], v8);
  *(_BYTE *)(v5 + 19 * v2 + v28) = 19;
  v29 = *(int *)(v0 + 48);
  v9(v5 + 20 * v2, *MEMORY[0x24BEA16B8], v8);
  *(_BYTE *)(v5 + 20 * v2 + v29) = 20;
  v30 = *(int *)(v0 + 48);
  v9(v5 + 21 * v2, *MEMORY[0x24BEA16D8], v8);
  *(_BYTE *)(v5 + 21 * v2 + v30) = 21;
  v31 = *(int *)(v0 + 48);
  v9(v5 + 22 * v2, *MEMORY[0x24BEA1648], v8);
  *(_BYTE *)(v5 + 22 * v2 + v31) = 22;
  v32 = *(int *)(v0 + 48);
  v9(v5 + 23 * v2, *MEMORY[0x24BEA16C0], v8);
  *(_BYTE *)(v5 + 23 * v2 + v32) = 23;
  v33 = *(int *)(v0 + 48);
  v9(v5 + 24 * v2, *MEMORY[0x24BEA1630], v8);
  *(_BYTE *)(v5 + 24 * v2 + v33) = 24;
  v34 = *(int *)(v0 + 48);
  v9(v5 + 25 * v2, *MEMORY[0x24BEA1698], v8);
  *(_BYTE *)(v5 + 25 * v2 + v34) = 25;
  v35 = *(int *)(v0 + 48);
  v9(v5 + 26 * v2, *MEMORY[0x24BEA1618], v8);
  *(_BYTE *)(v5 + 26 * v2 + v35) = 26;
  v36 = *(int *)(v0 + 48);
  v9(v5 + 27 * v2, *MEMORY[0x24BEA1640], v8);
  *(_BYTE *)(v5 + 27 * v2 + v36) = 27;
  v37 = *(int *)(v0 + 48);
  v9(v5 + 28 * v2, *MEMORY[0x24BEA16D0], v8);
  *(_BYTE *)(v5 + 28 * v2 + v37) = 29;
  v38 = *(int *)(v0 + 48);
  v9(v5 + 29 * v2, *MEMORY[0x24BEA16E8], v8);
  *(_BYTE *)(v5 + 29 * v2 + v38) = 29;
  v39 = *(int *)(v0 + 48);
  v9(v5 + 30 * v2, *MEMORY[0x24BEA1650], v8);
  *(_BYTE *)(v5 + 30 * v2 + v39) = 29;
  v40 = v5 + 31 * v2;
  v41 = *(int *)(v0 + 48);
  v9(v40, *MEMORY[0x24BEA1710], v8);
  *(_BYTE *)(v40 + v41) = 29;
  result = sub_2460D0FF4(v4);
  qword_257542C00 = result;
  return result;
}

Swift::Bool __swiftcall CommonAudio.MediaType.isStation()()
{
  _BYTE *v0;

  return (*v0 < 0x17uLL) & (0x440010u >> *v0);
}

SiriAudioIntentUtils::CommonAudio::MediaType_optional __swiftcall CommonAudio.MediaType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  SiriAudioIntentUtils::CommonAudio::MediaType_optional result;
  char v5;
  char v6;

  v2 = v1;
  v3 = sub_2460D5064();
  result.value = swift_bridgeObjectRelease();
  v5 = 0;
  v6 = 11;
  switch(v3)
  {
    case 0:
      goto LABEL_13;
    case 1:
      v5 = 1;
      goto LABEL_13;
    case 2:
      v5 = 2;
      goto LABEL_13;
    case 3:
      v5 = 3;
      goto LABEL_13;
    case 4:
      v5 = 4;
      goto LABEL_13;
    case 5:
      v5 = 5;
      goto LABEL_13;
    case 6:
      v5 = 6;
      goto LABEL_13;
    case 7:
      v5 = 7;
      goto LABEL_13;
    case 8:
      v5 = 8;
      goto LABEL_13;
    case 9:
      v5 = 9;
      goto LABEL_13;
    case 10:
      v5 = 10;
LABEL_13:
      v6 = v5;
      break;
    case 11:
      break;
    case 12:
      v6 = 12;
      break;
    case 13:
      v6 = 13;
      break;
    case 14:
      v6 = 14;
      break;
    case 15:
      v6 = 15;
      break;
    case 16:
      v6 = 16;
      break;
    case 17:
      v6 = 17;
      break;
    case 18:
      v6 = 18;
      break;
    case 19:
      v6 = 19;
      break;
    case 20:
      v6 = 20;
      break;
    case 21:
      v6 = 21;
      break;
    case 22:
      v6 = 22;
      break;
    case 23:
      v6 = 23;
      break;
    case 24:
      v6 = 24;
      break;
    case 25:
      v6 = 25;
      break;
    case 26:
      v6 = 26;
      break;
    case 27:
      v6 = 27;
      break;
    case 28:
      v6 = 28;
      break;
    default:
      v6 = 29;
      break;
  }
  *v2 = v6;
  return result;
}

uint64_t CommonAudio.MediaType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2460D1D50 + 4 * byte_2460D59CE[*v0]))(0xD000000000000015, 0x80000002460D6DF0);
}

uint64_t sub_2460D1D50()
{
  return 0x65726E6567;
}

uint64_t sub_2460D1D64()
{
  return 0x747369747261;
}

uint64_t sub_2460D1D78()
{
  return 0x6F65646976;
}

uint64_t sub_2460D1D8C()
{
  return 0x7473696C79616C70;
}

uint64_t sub_2460D1DA4()
{
  return 0x6E6F6974617473;
}

uint64_t sub_2460D1DBC()
{
  return 0x6F68536F69646172;
}

uint64_t sub_2460D1DDC()
{
  return 1735290739;
}

uint64_t sub_2460D1DEC()
{
  return 0x5573656E755469;
}

uint64_t sub_2460D1E04()
{
  return 0x74736163646F70;
}

uint64_t sub_2460D1E1C()
{
  return 0x646956636973756DLL;
}

uint64_t sub_2460D1E38()
{
  return 0x636973756DLL;
}

uint64_t sub_2460D1E4C()
{
  return 1937204590;
}

uint64_t sub_2460D1E5C()
{
  return 0x776F68537674;
}

uint64_t sub_2460D1E70()
{
  return 0x6D75626C61;
}

uint64_t sub_2460D1E84()
{
  return 0x656E6F74676E6972;
}

uint64_t sub_2460D1E9C()
{
  return 28780;
}

uint64_t sub_2460D1EA8()
{
  return 2003789939;
}

uint64_t sub_2460D1EB8()
{
  return 0x6174536F69646172;
}

uint64_t sub_2460D1ED8()
{
  return 28773;
}

uint64_t sub_2460D1EE4()
{
  return 0x656C676E6973;
}

uint64_t sub_2460D1EF8()
{
  return 0x65646F73697065;
}

uint64_t sub_2460D1F10()
{
  return 0x5374736163646F70;
}

uint64_t sub_2460D1F34()
{
  return 0x73646E756F73;
}

uint64_t sub_2460D1F48()
{
  return 0x74616C69706D6F63;
}

uint64_t sub_2460D1F68()
{
  return 0x6569766F6DLL;
}

uint64_t sub_2460D1F7C()
{
  return 0x6F6F426F69647561;
}

uint64_t sub_2460D1F98()
{
  return 0x616C50636973756DLL;
}

uint64_t sub_2460D1FBC()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_2460D1FD4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2460CD368(*a1, *a2);
}

uint64_t sub_2460D1FE0(uint64_t a1, uint64_t a2)
{
  return sub_2460D1FEC(a1, a2, (void (*)(uint64_t))CommonAudio.MediaType.rawValue.getter);
}

uint64_t sub_2460D1FEC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = sub_2460D507C();
  a3(v4);
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D2054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2460D2060(a1, a2, a3, (void (*)(void))CommonAudio.MediaType.rawValue.getter);
}

uint64_t sub_2460D2060(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  sub_2460D4EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460D20B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2460D20BC(a1, a2, a3, (void (*)(uint64_t))CommonAudio.MediaType.rawValue.getter);
}

uint64_t sub_2460D20BC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = sub_2460D507C();
  a4(v5);
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

SiriAudioIntentUtils::CommonAudio::MediaType_optional sub_2460D2120(Swift::String *a1)
{
  return CommonAudio.MediaType.init(rawValue:)(*a1);
}

uint64_t sub_2460D212C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.MediaType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t CommonAudio.MediaSettingName.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2460D504C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t CommonAudio.MediaSettingName.rawValue.getter()
{
  return 0x79616C70726961;
}

uint64_t sub_2460D21CC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2460D504C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2460D221C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CommonAudio.MediaSettingName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2460D2240(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2460D2274(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2460D2294(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2460D2344(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2460D4F80();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2460D2304(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257540740);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2460D2344(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2460D2414(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2460D3AB8((uint64_t)v12, *a3);
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
      sub_2460D3AB8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2460D2414(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2460D4F8C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2460D25CC(a5, a6);
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
  v8 = sub_2460D4FE0();
  if (!v8)
  {
    sub_2460D501C();
    __break(1u);
LABEL_17:
    result = sub_2460D5040();
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

uint64_t sub_2460D25CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2460D2660(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2460D2838(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2460D2838(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2460D2660(uint64_t a1, unint64_t a2)
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
      v3 = sub_2460D27D4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2460D4FBC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2460D501C();
      __break(1u);
LABEL_10:
      v2 = sub_2460D4F08();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2460D5040();
    __break(1u);
LABEL_14:
    result = sub_2460D501C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2460D27D4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257541270);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2460D2838(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257541270);
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
  result = sub_2460D5040();
  __break(1u);
  return result;
}

_BYTE **sub_2460D2984(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

unint64_t sub_2460D2994(uint64_t a1)
{
  uint64_t v2;

  sub_2460D4D34();
  sub_2460D3A58(&qword_257541250, MEMORY[0x24BEA1730]);
  v2 = sub_2460D4ECC();
  return sub_2460D3840(a1, v2);
}

unint64_t sub_2460D29F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2460D507C();
  sub_2460D4EFC();
  v4 = sub_2460D5094();
  return sub_2460D3978(a1, a2, v4);
}

unint64_t sub_2460D2A60()
{
  unint64_t result;

  result = qword_2575411E0;
  if (!qword_2575411E0)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.Verb, &type metadata for CommonAudio.Verb);
    atomic_store(result, (unint64_t *)&qword_2575411E0);
  }
  return result;
}

unint64_t sub_2460D2AA8()
{
  unint64_t result;

  result = qword_2575411E8;
  if (!qword_2575411E8)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.UsoEntity, &type metadata for CommonAudio.UsoEntity);
    atomic_store(result, (unint64_t *)&qword_2575411E8);
  }
  return result;
}

unint64_t sub_2460D2AF0()
{
  unint64_t result;

  result = qword_2575411F0;
  if (!qword_2575411F0)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.Attribute, &type metadata for CommonAudio.Attribute);
    atomic_store(result, (unint64_t *)&qword_2575411F0);
  }
  return result;
}

unint64_t sub_2460D2B38()
{
  unint64_t result;

  result = qword_2575411F8;
  if (!qword_2575411F8)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.Modifier, &type metadata for CommonAudio.Modifier);
    atomic_store(result, (unint64_t *)&qword_2575411F8);
  }
  return result;
}

unint64_t sub_2460D2B80()
{
  unint64_t result;

  result = qword_257541200;
  if (!qword_257541200)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.Noun, &type metadata for CommonAudio.Noun);
    atomic_store(result, (unint64_t *)&qword_257541200);
  }
  return result;
}

unint64_t sub_2460D2BC8()
{
  unint64_t result;

  result = qword_257541208;
  if (!qword_257541208)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.RadioType, &type metadata for CommonAudio.RadioType);
    atomic_store(result, (unint64_t *)&qword_257541208);
  }
  return result;
}

unint64_t sub_2460D2C10()
{
  unint64_t result;

  result = qword_257541210;
  if (!qword_257541210)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.Confirmation, &type metadata for CommonAudio.Confirmation);
    atomic_store(result, (unint64_t *)&qword_257541210);
  }
  return result;
}

unint64_t sub_2460D2C58()
{
  unint64_t result;

  result = qword_257541218;
  if (!qword_257541218)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.Decade, &type metadata for CommonAudio.Decade);
    atomic_store(result, (unint64_t *)&qword_257541218);
  }
  return result;
}

unint64_t sub_2460D2CA0()
{
  unint64_t result;

  result = qword_257541220;
  if (!qword_257541220)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.Sort, &type metadata for CommonAudio.Sort);
    atomic_store(result, (unint64_t *)&qword_257541220);
  }
  return result;
}

unint64_t sub_2460D2CE8()
{
  unint64_t result;

  result = qword_257541228;
  if (!qword_257541228)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.Reference, &type metadata for CommonAudio.Reference);
    atomic_store(result, (unint64_t *)&qword_257541228);
  }
  return result;
}

unint64_t sub_2460D2D30()
{
  unint64_t result;

  result = qword_257541230;
  if (!qword_257541230)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.MediaType, &type metadata for CommonAudio.MediaType);
    atomic_store(result, (unint64_t *)&qword_257541230);
  }
  return result;
}

unint64_t sub_2460D2D78()
{
  unint64_t result;

  result = qword_257541238;
  if (!qword_257541238)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for CommonAudio.MediaSettingName, &type metadata for CommonAudio.MediaSettingName);
    atomic_store(result, (unint64_t *)&qword_257541238);
  }
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio()
{
  return &type metadata for CommonAudio;
}

uint64_t getEnumTagSinglePayload for CommonAudio.Verb(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEF)
    goto LABEL_17;
  if (a2 + 17 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 17) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 17;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 17;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 17;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x12;
  v8 = v6 - 18;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CommonAudio.Verb(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 17 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 17) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEE)
    return ((uint64_t (*)(void))((char *)&loc_2460D2EA8 + 4 * byte_2460D59F0[v4]))();
  *a1 = a2 + 17;
  return ((uint64_t (*)(void))((char *)sub_2460D2EDC + 4 * byte_2460D59EB[v4]))();
}

uint64_t sub_2460D2EDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D2EE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2460D2EECLL);
  return result;
}

uint64_t sub_2460D2EF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2460D2F00);
  *(_BYTE *)result = a2 + 17;
  return result;
}

uint64_t sub_2460D2F04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D2F0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Verb()
{
  return &type metadata for CommonAudio.Verb;
}

ValueMetadata *type metadata accessor for CommonAudio.UsoEntity()
{
  return &type metadata for CommonAudio.UsoEntity;
}

uint64_t getEnumTagSinglePayload for CommonAudio.Attribute(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF2)
    goto LABEL_17;
  if (a2 + 14 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 14) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 14;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 14;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 14;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v8 = v6 - 15;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CommonAudio.Attribute(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_2460D301C + 4 * byte_2460D59FA[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_2460D3050 + 4 * byte_2460D59F5[v4]))();
}

uint64_t sub_2460D3050(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D3058(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2460D3060);
  return result;
}

uint64_t sub_2460D306C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2460D3074);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_2460D3078(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D3080(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Attribute()
{
  return &type metadata for CommonAudio.Attribute;
}

ValueMetadata *type metadata accessor for CommonAudio.Modifier()
{
  return &type metadata for CommonAudio.Modifier;
}

_BYTE *sub_2460D30AC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Noun()
{
  return &type metadata for CommonAudio.Noun;
}

ValueMetadata *type metadata accessor for CommonAudio.RadioType()
{
  return &type metadata for CommonAudio.RadioType;
}

uint64_t getEnumTagSinglePayload for CommonAudio.Confirmation(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CommonAudio.Confirmation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_2460D31B4 + 4 * byte_2460D5A04[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2460D31E8 + 4 * byte_2460D59FF[v4]))();
}

uint64_t sub_2460D31E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D31F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2460D31F8);
  return result;
}

uint64_t sub_2460D3204(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2460D320CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2460D3210(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D3218(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Confirmation()
{
  return &type metadata for CommonAudio.Confirmation;
}

uint64_t getEnumTagSinglePayload for CommonAudio.Decade(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CommonAudio.Decade(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_2460D3310 + 4 * byte_2460D5A0E[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_2460D3344 + 4 * byte_2460D5A09[v4]))();
}

uint64_t sub_2460D3344(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D334C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2460D3354);
  return result;
}

uint64_t sub_2460D3360(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2460D3368);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_2460D336C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D3374(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Decade()
{
  return &type metadata for CommonAudio.Decade;
}

uint64_t getEnumTagSinglePayload for CommonAudio.Sort(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CommonAudio.Sort(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_2460D346C + 4 * byte_2460D5A18[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_2460D34A0 + 4 * byte_2460D5A13[v4]))();
}

uint64_t sub_2460D34A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D34A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2460D34B0);
  return result;
}

uint64_t sub_2460D34BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2460D34C4);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_2460D34C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D34D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Sort()
{
  return &type metadata for CommonAudio.Sort;
}

uint64_t _s20SiriAudioIntentUtils11CommonAudioV9UsoEntityOwet_0(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s20SiriAudioIntentUtils11CommonAudioV9UsoEntityOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2460D35C8 + 4 * byte_2460D5A22[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2460D35FC + 4 * byte_2460D5A1D[v4]))();
}

uint64_t sub_2460D35FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D3604(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2460D360CLL);
  return result;
}

uint64_t sub_2460D3618(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2460D3620);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2460D3624(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D362C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.Reference()
{
  return &type metadata for CommonAudio.Reference;
}

uint64_t getEnumTagSinglePayload for CommonAudio.MediaType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE4)
    goto LABEL_17;
  if (a2 + 28 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 28) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 28;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 28;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 28;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1D;
  v8 = v6 - 29;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CommonAudio.MediaType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 28 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 28) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE3)
    return ((uint64_t (*)(void))((char *)&loc_2460D3724 + 4 * byte_2460D5A2C[v4]))();
  *a1 = a2 + 28;
  return ((uint64_t (*)(void))((char *)sub_2460D3758 + 4 * byte_2460D5A27[v4]))();
}

uint64_t sub_2460D3758(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D3760(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2460D3768);
  return result;
}

uint64_t sub_2460D3774(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2460D377CLL);
  *(_BYTE *)result = a2 + 28;
  return result;
}

uint64_t sub_2460D3780(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2460D3788(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.MediaType()
{
  return &type metadata for CommonAudio.MediaType;
}

uint64_t storeEnumTagSinglePayload for CommonAudio.MediaSettingName(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2460D37E4 + 4 * byte_2460D5A31[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2460D3804 + 4 * byte_2460D5A36[v4]))();
}

_BYTE *sub_2460D37E4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2460D3804(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2460D380C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2460D3814(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2460D381C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2460D3824(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CommonAudio.MediaSettingName()
{
  return &type metadata for CommonAudio.MediaSettingName;
}

unint64_t sub_2460D3840(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_2460D4D34();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_2460D3A58(&qword_257541108, MEMORY[0x24BEA1738]);
      v14 = sub_2460D4ED8();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_2460D3978(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2460D5058() & 1) == 0)
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
      while (!v14 && (sub_2460D5058() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2460D3A58(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2460D4D34();
    result = MEMORY[0x24954F74C](a2, v5);
    atomic_store(result, a1);
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

uint64_t sub_2460D3AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2460D3B00()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D3B8C()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D3C14()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D3C90()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D3CEC()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D3D54()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D3DD8()
{
  sub_2460D4EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460D3E3C()
{
  sub_2460D4EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460D3E98()
{
  sub_2460D4EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460D3EC4()
{
  sub_2460D4EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460D3F24()
{
  sub_2460D4EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460D3F50()
{
  sub_2460D4EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460D3F90()
{
  sub_2460D4EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460D3FE4()
{
  sub_2460D4EFC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2460D4024()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D4088()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D4100()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D4184()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D41DC()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t sub_2460D425C()
{
  sub_2460D507C();
  sub_2460D4EFC();
  swift_bridgeObjectRelease();
  return sub_2460D5094();
}

uint64_t UsoMediaSettingName.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_2460D4614(a1);
}

void sub_2460D42F0()
{
  strcpy((char *)&qword_257541278, "uso_NoEntity");
  unk_257541285 = 0;
  unk_257541286 = -5120;
}

uint64_t static UsoEntity.noEntity.getter()
{
  return sub_2460D08D4(&qword_2575406A8, &qword_257541278);
}

void sub_2460D433C()
{
  qword_257541288 = 2036427888;
  unk_257541290 = 0xE400000000000000;
}

uint64_t static UsoVerb.play.getter()
{
  return sub_2460D08D4(&qword_2575406B0, &qword_257541288);
}

void sub_2460D4378()
{
  qword_257541298 = 1701538156;
  unk_2575412A0 = 0xE400000000000000;
}

uint64_t static UsoVerb.like.getter()
{
  return sub_2460D08D4(&qword_2575406B8, &qword_257541298);
}

void sub_2460D43B4()
{
  qword_2575412A8 = 0x656B696C6E75;
  unk_2575412B0 = 0xE600000000000000;
}

uint64_t static UsoVerb.unlike.getter()
{
  return sub_2460D08D4(&qword_2575406C0, &qword_2575412A8);
}

uint64_t Domain.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_2460D4614(a1);
}

uint64_t Domain.rawValue.getter()
{
  return 0x6F635F616964656DLL;
}

uint64_t sub_2460D4424()
{
  return sub_2460D4980();
}

uint64_t sub_2460D445C()
{
  return sub_2460D4920();
}

uint64_t sub_2460D4490@<X0>(BOOL *a1@<X8>)
{
  return sub_2460D47B4(a1);
}

uint64_t sub_2460D449C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Domain.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_2460D44C0()
{
  qword_2575412B8 = 1701667182;
  unk_2575412C0 = 0xE400000000000000;
}

uint64_t static UsoMediaSettingName.settingNameField.getter()
{
  return sub_2460D08D4(&qword_2575406C8, &qword_2575412B8);
}

unint64_t static UsoMediaSettingName.namespace.getter()
{
  return 0xD000000000000010;
}

uint64_t UsoMediaSettingName.rawValue.getter()
{
  return 0x79616C70726961;
}

uint64_t sub_2460D4530()
{
  return sub_2460D4980();
}

uint64_t sub_2460D4558()
{
  return sub_2460D4920();
}

uint64_t sub_2460D4580@<X0>(BOOL *a1@<X8>)
{
  return sub_2460D47B4(a1);
}

uint64_t sub_2460D458C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = UsoMediaSettingName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_2460D45B0()
{
  qword_2575412C8 = 1701667182;
  unk_2575412D0 = 0xE400000000000000;
}

uint64_t static UsoMediaPlayerAttributes.mediaPlayerNameField.getter()
{
  return sub_2460D08D4(&qword_2575406D0, &qword_2575412C8);
}

unint64_t static UsoMediaPlayerAttributes.namespace.getter()
{
  return 0xD000000000000015;
}

uint64_t UsoMediaPlayerAttributes.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  return sub_2460D4614(a1);
}

uint64_t sub_2460D4614@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2460D504C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t UsoMediaPlayerAttributes.rawValue.getter()
{
  return 0x64656C6666756873;
}

unint64_t sub_2460D4680()
{
  unint64_t result;

  result = qword_2575412D8;
  if (!qword_2575412D8)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for Domain, &type metadata for Domain);
    atomic_store(result, (unint64_t *)&qword_2575412D8);
  }
  return result;
}

unint64_t sub_2460D46C8()
{
  unint64_t result;

  result = qword_2575412E0;
  if (!qword_2575412E0)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for UsoMediaSettingName, &type metadata for UsoMediaSettingName);
    atomic_store(result, (unint64_t *)&qword_2575412E0);
  }
  return result;
}

unint64_t sub_2460D4710()
{
  unint64_t result;

  result = qword_2575412E8;
  if (!qword_2575412E8)
  {
    result = MEMORY[0x24954F74C](&protocol conformance descriptor for UsoMediaPlayerAttributes, &type metadata for UsoMediaPlayerAttributes);
    atomic_store(result, (unint64_t *)&qword_2575412E8);
  }
  return result;
}

uint64_t sub_2460D4754()
{
  return sub_2460D4980();
}

uint64_t sub_2460D4780()
{
  return sub_2460D4920();
}

uint64_t sub_2460D47A8@<X0>(BOOL *a1@<X8>)
{
  return sub_2460D47B4(a1);
}

uint64_t sub_2460D47B4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2460D504C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2460D4800@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = UsoMediaPlayerAttributes.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for UsoEntity()
{
  return &type metadata for UsoEntity;
}

ValueMetadata *type metadata accessor for UsoVerb()
{
  return &type metadata for UsoVerb;
}

ValueMetadata *type metadata accessor for Domain()
{
  return &type metadata for Domain;
}

ValueMetadata *type metadata accessor for UsoMediaSettingName()
{
  return &type metadata for UsoMediaSettingName;
}

uint64_t _s20SiriAudioIntentUtils19UsoMediaSettingNameOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2460D48AC + 4 * byte_2460D6550[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2460D48CC + 4 * byte_2460D6555[v4]))();
}

_BYTE *sub_2460D48AC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2460D48CC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2460D48D4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2460D48DC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2460D48E4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2460D48EC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UsoMediaPlayerAttributes()
{
  return &type metadata for UsoMediaPlayerAttributes;
}

uint64_t sub_2460D4908()
{
  return sub_2460D4920();
}

uint64_t sub_2460D4920()
{
  sub_2460D507C();
  sub_2460D4EFC();
  return sub_2460D5094();
}

uint64_t sub_2460D4968()
{
  return sub_2460D4980();
}

uint64_t sub_2460D4980()
{
  sub_2460D507C();
  sub_2460D4EFC();
  return sub_2460D5094();
}

uint64_t sub_2460D49CC()
{
  return sub_2460D4EFC();
}

uint64_t sub_2460D49F0()
{
  return sub_2460D4EFC();
}

uint64_t sub_2460D4A08()
{
  return sub_2460D4EFC();
}

uint64_t dispatch thunk of ConfirmableIntent.confirmationState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2460D4A28()
{
  uint64_t v0;
  id v1;

  v0 = sub_2460D4EB4();
  __swift_allocate_value_buffer(v0, qword_257542C08);
  __swift_project_value_buffer(v0, (uint64_t)qword_257542C08);
  if (qword_257540680 != -1)
    swift_once();
  v1 = (id)qword_257542BF0;
  return sub_2460D4EC0();
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

uint64_t sub_2460D4AE8()
{
  return MEMORY[0x24BE9C710]();
}

uint64_t sub_2460D4AF4()
{
  return MEMORY[0x24BE9C720]();
}

uint64_t sub_2460D4B00()
{
  return MEMORY[0x24BE9C728]();
}

uint64_t sub_2460D4B0C()
{
  return MEMORY[0x24BE9C740]();
}

uint64_t sub_2460D4B18()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_2460D4B24()
{
  return MEMORY[0x24BE9E008]();
}

uint64_t sub_2460D4B30()
{
  return MEMORY[0x24BE9EB38]();
}

uint64_t sub_2460D4B3C()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_2460D4B48()
{
  return MEMORY[0x24BE9F750]();
}

uint64_t sub_2460D4B54()
{
  return MEMORY[0x24BE9F8E8]();
}

uint64_t sub_2460D4B60()
{
  return MEMORY[0x24BE9F928]();
}

uint64_t sub_2460D4B6C()
{
  return MEMORY[0x24BE9F948]();
}

uint64_t sub_2460D4B78()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_2460D4B84()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_2460D4B90()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_2460D4B9C()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_2460D4BA8()
{
  return MEMORY[0x24BE9FF28]();
}

uint64_t sub_2460D4BB4()
{
  return MEMORY[0x24BE9FF30]();
}

uint64_t sub_2460D4BC0()
{
  return MEMORY[0x24BE9FF38]();
}

uint64_t sub_2460D4BCC()
{
  return MEMORY[0x24BE9FF40]();
}

uint64_t sub_2460D4BD8()
{
  return MEMORY[0x24BE9FF50]();
}

uint64_t sub_2460D4BE4()
{
  return MEMORY[0x24BE9FF60]();
}

uint64_t sub_2460D4BF0()
{
  return MEMORY[0x24BEA00D8]();
}

uint64_t sub_2460D4BFC()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_2460D4C08()
{
  return MEMORY[0x24BEA08B0]();
}

uint64_t sub_2460D4C14()
{
  return MEMORY[0x24BEA08C0]();
}

uint64_t sub_2460D4C20()
{
  return MEMORY[0x24BEA08D8]();
}

uint64_t sub_2460D4C2C()
{
  return MEMORY[0x24BEA0A10]();
}

uint64_t sub_2460D4C38()
{
  return MEMORY[0x24BEA0A18]();
}

uint64_t sub_2460D4C44()
{
  return MEMORY[0x24BEA0A28]();
}

uint64_t sub_2460D4C50()
{
  return MEMORY[0x24BEA0A30]();
}

uint64_t sub_2460D4C5C()
{
  return MEMORY[0x24BEA0A38]();
}

uint64_t sub_2460D4C68()
{
  return MEMORY[0x24BEA0A40]();
}

uint64_t sub_2460D4C74()
{
  return MEMORY[0x24BEA0A48]();
}

uint64_t sub_2460D4C80()
{
  return MEMORY[0x24BEA0B08]();
}

uint64_t sub_2460D4C8C()
{
  return MEMORY[0x24BEA0B20]();
}

uint64_t sub_2460D4C98()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_2460D4CA4()
{
  return MEMORY[0x24BEA0C18]();
}

uint64_t sub_2460D4CB0()
{
  return MEMORY[0x24BEA0C60]();
}

uint64_t sub_2460D4CBC()
{
  return MEMORY[0x24BEA0C88]();
}

uint64_t sub_2460D4CC8()
{
  return MEMORY[0x24BEA0C98]();
}

uint64_t sub_2460D4CD4()
{
  return MEMORY[0x24BEA0D30]();
}

uint64_t sub_2460D4CE0()
{
  return MEMORY[0x24BEA0D68]();
}

uint64_t sub_2460D4CEC()
{
  return MEMORY[0x24BEA1138]();
}

uint64_t sub_2460D4CF8()
{
  return MEMORY[0x24BEA1250]();
}

uint64_t sub_2460D4D04()
{
  return MEMORY[0x24BEA1380]();
}

uint64_t sub_2460D4D10()
{
  return MEMORY[0x24BEA13A8]();
}

uint64_t sub_2460D4D1C()
{
  return MEMORY[0x24BEA13D0]();
}

uint64_t sub_2460D4D28()
{
  return MEMORY[0x24BEA1610]();
}

uint64_t sub_2460D4D34()
{
  return MEMORY[0x24BEA1720]();
}

uint64_t sub_2460D4D40()
{
  return MEMORY[0x24BEA17F0]();
}

uint64_t sub_2460D4D4C()
{
  return MEMORY[0x24BEA1808]();
}

uint64_t sub_2460D4D58()
{
  return MEMORY[0x24BEA1828]();
}

uint64_t sub_2460D4D64()
{
  return MEMORY[0x24BEA1878]();
}

uint64_t sub_2460D4D70()
{
  return MEMORY[0x24BEA18F0]();
}

uint64_t sub_2460D4D7C()
{
  return MEMORY[0x24BEA1C30]();
}

uint64_t sub_2460D4D88()
{
  return MEMORY[0x24BEA1C48]();
}

uint64_t sub_2460D4D94()
{
  return MEMORY[0x24BEA1C58]();
}

uint64_t sub_2460D4DA0()
{
  return MEMORY[0x24BEA1C78]();
}

uint64_t sub_2460D4DAC()
{
  return MEMORY[0x24BEA1CB8]();
}

uint64_t sub_2460D4DB8()
{
  return MEMORY[0x24BEA1CC8]();
}

uint64_t sub_2460D4DC4()
{
  return MEMORY[0x24BEA1EE0]();
}

uint64_t sub_2460D4DD0()
{
  return MEMORY[0x24BEA1EE8]();
}

uint64_t sub_2460D4DDC()
{
  return MEMORY[0x24BEA1F00]();
}

uint64_t sub_2460D4DE8()
{
  return MEMORY[0x24BEA1F18]();
}

uint64_t sub_2460D4DF4()
{
  return MEMORY[0x24BEA1FB8]();
}

uint64_t sub_2460D4E00()
{
  return MEMORY[0x24BEA1FF0]();
}

uint64_t sub_2460D4E0C()
{
  return MEMORY[0x24BEA2040]();
}

uint64_t sub_2460D4E18()
{
  return MEMORY[0x24BEA2048]();
}

uint64_t sub_2460D4E24()
{
  return MEMORY[0x24BEA2050]();
}

uint64_t sub_2460D4E30()
{
  return MEMORY[0x24BEA2058]();
}

uint64_t sub_2460D4E3C()
{
  return MEMORY[0x24BEA2060]();
}

uint64_t sub_2460D4E48()
{
  return MEMORY[0x24BEA2068]();
}

uint64_t sub_2460D4E54()
{
  return MEMORY[0x24BEA2310]();
}

uint64_t sub_2460D4E60()
{
  return MEMORY[0x24BEA2320]();
}

uint64_t sub_2460D4E6C()
{
  return MEMORY[0x24BEA2328]();
}

uint64_t sub_2460D4E78()
{
  return MEMORY[0x24BEA2518]();
}

uint64_t sub_2460D4E84()
{
  return MEMORY[0x24BEA2528]();
}

uint64_t sub_2460D4E90()
{
  return MEMORY[0x24BEA3638]();
}

uint64_t sub_2460D4E9C()
{
  return MEMORY[0x24BEA3640]();
}

uint64_t sub_2460D4EA8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2460D4EB4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2460D4EC0()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2460D4ECC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2460D4ED8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2460D4EE4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2460D4EF0()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2460D4EFC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2460D4F08()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2460D4F14()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2460D4F20()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2460D4F2C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2460D4F38()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2460D4F44()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2460D4F50()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2460D4F5C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2460D4F68()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2460D4F74()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2460D4F80()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2460D4F8C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2460D4F98()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2460D4FA4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2460D4FB0()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_2460D4FBC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2460D4FC8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2460D4FD4()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2460D4FE0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2460D4FEC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2460D4FF8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2460D5004()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2460D5010()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2460D501C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2460D5028()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2460D5034()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2460D5040()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2460D504C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2460D5058()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2460D5064()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_2460D5070()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2460D507C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2460D5088()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2460D5094()
{
  return MEMORY[0x24BEE4328]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

