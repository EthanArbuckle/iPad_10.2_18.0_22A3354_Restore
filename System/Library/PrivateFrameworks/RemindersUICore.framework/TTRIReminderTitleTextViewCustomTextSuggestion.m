@implementation TTRIReminderTitleTextViewCustomTextSuggestion

- (TTRIReminderTitleTextViewCustomTextSuggestion)initWithCoder:(id)a3
{
  return (TTRIReminderTitleTextViewCustomTextSuggestion *)TTRIReminderTitleTextViewCustomTextSuggestion.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v8.receiver;
  -[UITextSuggestion encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  v6 = (void *)sub_1B490380C();
  v7 = (void *)sub_1B4906A34();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7, v8.receiver, v8.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TTRIReminderTitleTextViewCustomTextSuggestion)init
{
  TTRIReminderTitleTextViewCustomTextSuggestion *result;

  result = (TTRIReminderTitleTextViewCustomTextSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___TTRIReminderTitleTextViewCustomTextSuggestion_textEditingSuggestionUUID;
  v3 = sub_1B4903848();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
