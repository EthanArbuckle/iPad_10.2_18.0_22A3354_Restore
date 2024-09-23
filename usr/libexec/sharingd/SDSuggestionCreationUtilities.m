@implementation SDSuggestionCreationUtilities

+ (void)retrieveSuggestionForRecipients:(NSArray *)a3 inActivityType:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSArray *v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_100720568, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_100720590, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1007B8350;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1007205B8, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1007B8360;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = sub_1002AE254((uint64_t)v11, (uint64_t)&unk_1007B8370, (uint64_t)v16);
  swift_release(v19);
}

- (_TtC16DaemoniOSLibrary29SDSuggestionCreationUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SDSuggestionCreationUtilities();
  return -[SDSuggestionCreationUtilities init](&v3, "init");
}

@end
