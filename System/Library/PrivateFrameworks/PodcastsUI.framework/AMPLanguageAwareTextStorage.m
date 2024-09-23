@implementation AMPLanguageAwareTextStorage

- (NSTextStorage)textStorage
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareTextStorage_textStorage);
  swift_beginAccess();
  return (NSTextStorage *)*v2;
}

- (void)setTextStorage:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareTextStorage_textStorage);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (AMPLanguageAwareTextStorage)initWithTextStorage:(id)a3
{
  return (AMPLanguageAwareTextStorage *)LanguageAwareTextStorage.init(_:)(a3);
}

- (void)textStorage:(id)a3 willProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  void *v6;
  NSUInteger length;
  NSUInteger location;

  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareTextStorage_originalTextStorageDelegate);
  if (v6)
  {
    length = a5.length;
    location = a5.location;
    if ((objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR___AMPLanguageAwareTextStorage_originalTextStorageDelegate), sel_respondsToSelector_, sel_textStorage_willProcessEditing_range_changeInLength_) & 1) != 0)objc_msgSend(v6, sel_textStorage_willProcessEditing_range_changeInLength_, a3, a4, location, length, a6);
  }
}

- (void)textStorage:(id)a3 didProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  AMPLanguageAwareTextStorage *v12;

  length = a5.length;
  location = a5.location;
  v11 = a3;
  v12 = self;
  sub_1DA64CD14(v11, a4, location, length, a6);

}

- (id)writingDirectionsQuantities
{
  return objc_retainAutoreleaseReturnValue(*(id *)(*(char **)((char *)&self->super.isa
                                                            + OBJC_IVAR___AMPLanguageAwareTextStorage_languageAwareString)
                                                 + OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections));
}

- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7
{
  void *v12;
  AMPLanguageAwareTextStorage *v13;
  id v14;
  int64_t v15;
  int64_t v16;

  v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareTextStorage_languageAwareString);
  v13 = self;
  v14 = v12;
  sub_1DA64C300(a3, (id)a4, (id)a6, a7, a5);
  v16 = v15;

  return v16;
}

- (AMPLanguageAwareTextStorage)init
{
  AMPLanguageAwareTextStorage *result;

  result = (AMPLanguageAwareTextStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
