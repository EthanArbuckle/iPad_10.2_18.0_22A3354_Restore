@implementation LiveSpeechCategory

- (LiveSpeechCategory)init
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  objc_super v6;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___LiveSpeechCategory_name);
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___LiveSpeechCategory_symbol);
  *v3 = 0;
  v3[1] = 0xE000000000000000;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___LiveSpeechCategory_categoryID);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)LiveSpeechCategory;
  return -[LiveSpeechCategory init](&v6, sel_init);
}

- (NSString)categoryID
{
  return (NSString *)sub_248780338();
}

- (void)setCategoryID:(id)a3
{
  sub_2487803A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___LiveSpeechCategory_categoryID);
}

- (NSString)name
{
  return (NSString *)sub_248780338();
}

- (void)setName:(id)a3
{
  sub_2487803A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___LiveSpeechCategory_name);
}

- (NSString)symbol
{
  return (NSString *)sub_248780338();
}

- (void)setSymbol:(id)a3
{
  sub_2487803A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___LiveSpeechCategory_symbol);
}

- (BOOL)isSaved
{
  LiveSpeechCategory *v2;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = self;
  v3 = -[LiveSpeechCategory categoryID](v2, sel_categoryID);
  v4 = sub_2487B5528();
  v6 = v5;

  if (v4 == 0x6465766153 && v6 == 0xE500000000000000)
  {

    swift_bridgeObjectRelease();
    v8 = 1;
  }
  else
  {
    v8 = sub_2487B5CE4();

    swift_bridgeObjectRelease();
  }
  return v8 & 1;
}

- (BOOL)isRecents
{
  LiveSpeechCategory *v2;
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = self;
  v3 = -[LiveSpeechCategory categoryID](v2, sel_categoryID);
  v4 = sub_2487B5528();
  v6 = v5;

  if (v4 == 0x73746E65636552 && v6 == 0xE700000000000000)
  {

    swift_bridgeObjectRelease();
    v8 = 1;
  }
  else
  {
    v8 = sub_2487B5CE4();

    swift_bridgeObjectRelease();
  }
  return v8 & 1;
}

- (NSString)localizedName
{
  LiveSpeechCategory *v2;
  void *v3;

  v2 = self;
  sub_2487805E4();

  v3 = (void *)sub_2487B5504();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)phrases
{
  LiveSpeechCategory *v2;
  char v3;
  id v4;
  uint64_t v5;
  LiveSpeechCategory *v6;
  uint64_t v7;
  void *v8;

  v2 = self;
  v3 = -[LiveSpeechCategory isSaved](v2, sel_isSaved);
  if (qword_25778E050 != -1)
    swift_once();
  v4 = (id)qword_25778E058;
  v5 = _sSo14NSUserDefaultsC31TextToSpeechVoiceBankingSupportE15favoritePhrasesSaySDySSypGGvg_0();

  v6 = v2;
  sub_248784410(v5, v6, v3);
  swift_bridgeObjectRelease();

  type metadata accessor for LiveSpeechPhrase(v7);
  v8 = (void *)sub_2487B566C();
  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)addPhrase:(id)a3 inputID:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  LiveSpeechCategory *v12;

  v7 = sub_2487B5528();
  v9 = v8;
  if (a4)
  {
    v10 = sub_2487B5528();
    a4 = v11;
  }
  else
  {
    v10 = 0;
  }
  v12 = self;
  sub_248780850(v7, v9, v10, (uint64_t)a4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)deletePhrase:(id)a3 error:(id *)a4
{
  id v5;
  LiveSpeechCategory *v6;

  v5 = a3;
  v6 = self;
  sub_248781708(v5);

  return 1;
}

+ (id)makeEmptyCategory
{
  return sub_2487847C4();
}

+ (NSArray)categories
{
  return (NSArray *)sub_248781CD0((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_2487848A8, (void (*)(void))type metadata accessor for LiveSpeechCategory);
}

+ (id)categoryForID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;

  v3 = sub_2487B5528();
  v5 = sub_248784F80(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)addCategoryWithName:(id)a3 symbol:(id)a4 error:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;

  v5 = sub_2487B5528();
  v7 = v6;
  v8 = sub_2487B5528();
  v10 = sub_248785550(v5, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

+ (void)deleteCategory:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(v4, sel_categoryID);
  if (!v5)
  {
    sub_2487B5528();
    v6 = (id)sub_2487B5504();
    swift_bridgeObjectRelease();
    v5 = v6;
  }
  v7 = v5;
  objc_msgSend(a1, sel_deleteCategoryWithID_);

}

+ (void)deleteCategoryWithID:(id)a3
{
  uint64_t v3;
  unint64_t v4;

  v3 = sub_2487B5528();
  sub_248785800(v3, v4);
  swift_bridgeObjectRelease();
}

+ (BOOL)renameCategoryWithID:(id)a3 name:(id)a4 error:(id *)a5
{
  return sub_248782218((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, sub_24878642C);
}

+ (BOOL)updateCategorySymbolWithID:(id)a3 symbol:(id)a4 error:(id *)a5
{
  return sub_248782218((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_248786804);
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
  *(_QWORD *)(v6 + 16) = sub_24878737C;
  *(_QWORD *)(v6 + 24) = v4;
  v7 = v5;
  swift_retain();
  v8 = (void *)sub_2487B4FA0();
  swift_release();
  swift_release();
  swift_release();

  return v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
