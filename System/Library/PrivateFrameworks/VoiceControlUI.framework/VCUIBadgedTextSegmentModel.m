@implementation VCUIBadgedTextSegmentModel

- (NSAttributedString)text
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VCUIBadgedTextSegmentModel_text);
  swift_beginAccess();
  return (NSAttributedString *)*v2;
}

- (void)setText:(id)a3
{
  sub_24A26187C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___VCUIBadgedTextSegmentModel_text);
}

- (NSAttributedString)label
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___VCUIBadgedTextSegmentModel_label);
  swift_beginAccess();
  return (NSAttributedString *)*v2;
}

- (void)setLabel:(id)a3
{
  sub_24A26187C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___VCUIBadgedTextSegmentModel_label);
}

- (BOOL)isWhiteSpace
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___VCUIBadgedTextSegmentModel_isWhiteSpace;
  swift_beginAccess();
  return *v2;
}

- (void)setIsWhiteSpace:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___VCUIBadgedTextSegmentModel_isWhiteSpace;
  swift_beginAccess();
  *v4 = a3;
}

- (_NSRange)nsRange
{
  VCUIBadgedTextSegmentModel *v3;
  NSAttributedString *v4;
  NSString *v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  swift_beginAccess();
  v3 = self;
  v4 = -[VCUIBadgedTextSegmentModel text](v3, sel_text);
  v5 = -[NSAttributedString string](v4, sel_string);

  sub_24A266814();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791E858);
  sub_24A261C18();
  sub_24A25F018();
  v6 = sub_24A2668A4();
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (NSAttributedString)representedText
{
  VCUIBadgedTextSegmentModel *v2;
  NSAttributedString *v3;
  id v4;
  uint64_t v5;
  NSAttributedString *v6;

  v2 = self;
  v3 = -[VCUIBadgedTextSegmentModel text](v2, sel_text);
  v4 = -[VCUIBadgedTextSegmentModel nsRange](v2, sel_nsRange);
  v6 = -[NSAttributedString attributedSubstringFromRange:](v3, sel_attributedSubstringFromRange_, v4, v5);

  return v6;
}

- (NSAttributedString)displayedText
{
  VCUIBadgedTextSegmentModel *v2;
  id v3;

  v2 = self;
  v3 = VCUIBadgedTextSegmentModel.displayedText.getter();

  return (NSAttributedString *)v3;
}

- (void).cxx_destruct
{

}

@end
