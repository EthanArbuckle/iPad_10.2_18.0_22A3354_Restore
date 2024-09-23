@implementation LiveSpeechPhrase

- (LiveSpeechPhrase)init
{
  return (LiveSpeechPhrase *)sub_24877E3D0();
}

- (NSString)text
{
  return (NSString *)sub_248780338();
}

- (void)setText:(id)a3
{
  sub_2487803A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___LiveSpeechPhrase_text);
}

- (NSString)categoryID
{
  return (NSString *)sub_24877EA80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___LiveSpeechPhrase_categoryID);
}

- (void)setCategoryID:(id)a3
{
  sub_24877EB00((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___LiveSpeechPhrase_categoryID);
}

- (NSString)inputID
{
  return (NSString *)sub_24877EA80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___LiveSpeechPhrase_inputID);
}

- (void)setInputID:(id)a3
{
  sub_24877EB00((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___LiveSpeechPhrase_inputID);
}

- (NSDate)creationDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  LiveSpeechPhrase *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_24877EC3C((uint64_t)v5);

  v7 = sub_2487B51D4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_2487B5174();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (void)setCreationDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  LiveSpeechPhrase *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_2487B51A4();
    v8 = sub_2487B51D4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_2487B51D4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_24877EDE8((uint64_t)v7);

}

+ (id)makeEmptyPhrase
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  type metadata accessor for LiveSpeechPhrase((uint64_t)a1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2487B51D4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  return sub_24877E4D0(0, 0xE000000000000000, 0, 0, 0, 0, (uint64_t)v4);
}

+ (BOOL)updatePhrase:(id)a3 categoryID:(id)a4 withUpdatedText:(id)a5 error:(id *)a6
{
  return sub_24877F7C8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, sub_248783B88);
}

+ (BOOL)updatePhrase:(id)a3 fromCategory:(id)a4 toCategory:(id)a5 error:(id *)a6
{
  return sub_24877F7C8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, sub_248783EE0);
}

+ (NSArray)phrases
{
  return (NSArray *)sub_248781CD0((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_248784298, (void (*)(void))type metadata accessor for LiveSpeechPhrase);
}

+ (id)observeChanges:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v10;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  if (qword_25778E050 != -1)
    swift_once();
  v5 = (void *)qword_25778E058;
  v10 = (void *)qword_25778E058;
  swift_getKeyPath();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_2487874EC;
  *(_QWORD *)(v6 + 24) = v4;
  v7 = v5;
  swift_retain();
  v8 = (void *)sub_2487B4FA0();
  swift_release();
  swift_release();
  swift_release();

  return v8;
}

+ (int64_t)maxPreferredPhraseCount
{
  id v2;
  void *v3;
  id v4;

  if (qword_25778E050 != -1)
    swift_once();
  v2 = (id)qword_25778E058;
  v3 = (void *)sub_2487B5504();
  v4 = objc_msgSend(v2, sel_integerForKey_, v3);

  return (int64_t)v4;
}

+ (void)setMaxPreferredPhraseCount:(int64_t)a3
{
  id v3;
  void *v4;
  id v5;

  if (qword_25778E050 != -1)
    swift_once();
  v3 = (id)qword_25778E058;
  v4 = (void *)sub_2487B5768();
  v5 = (id)sub_2487B5504();
  objc_msgSend(v3, sel_setValue_forKey_, v4, v5);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2486F5008((uint64_t)self + OBJC_IVAR___LiveSpeechPhrase_anyCreationDate, (uint64_t *)&unk_25777CBD0);
}

@end
