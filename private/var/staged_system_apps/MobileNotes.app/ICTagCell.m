@implementation ICTagCell

- (NSString)displayText
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->displayText[OBJC_IVAR___ICTagCell_displayText];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->displayText[OBJC_IVAR___ICTagCell_displayText]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setDisplayText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICTagCell_displayText);
  v7 = *(_QWORD *)&self->displayText[OBJC_IVAR___ICTagCell_displayText];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)includeSymbolPrefix
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_includeSymbolPrefix);
}

- (void)setIncludeSymbolPrefix:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_includeSymbolPrefix) = a3;
}

- (UIImage)displayImage
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR___ICTagCell_displayImage));
}

- (void)setDisplayImage:(id)a3
{
  ICTagCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1003B9AFC(a3);

}

- (BOOL)hasGroupInset
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_hasGroupInset);
}

- (void)setHasGroupInset:(BOOL)a3
{
  sub_1003B8528(self, (uint64_t)a2, a3, &OBJC_IVAR___ICTagCell_hasGroupInset, sub_1003B7138);
}

+ (UIFont)font
{
  UIFont *result;
  UIFont *v3;
  id v4;

  result = (UIFont *)objc_msgSend((id)objc_opt_self(UIFont), "ic_preferredFontForStyle:symbolicTraits:", UIFontTextStyleSubheadline, 2);
  if (result)
  {
    v3 = result;
    v4 = -[UIFont ic_fontWithSingleLineA](result, "ic_fontWithSingleLineA");

    if (v4)
      return (UIFont *)v4;
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (BOOL)isPreviewing
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_isPreviewing);
}

- (void)setIsPreviewing:(BOOL)a3
{
  sub_1003B8528(self, (uint64_t)a2, a3, &OBJC_IVAR___ICTagCell_isPreviewing, sub_1003B747C);
}

+ (double)textLabelHorizontalPadding
{
  return 12.0;
}

- (ICItemIdentifier)identifier
{
  return (ICItemIdentifier *)objc_autoreleaseReturnValue((id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                                                                                + OBJC_IVAR___ICTagCell_identifier)));
}

- (void)setIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_identifier);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_identifier) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3, v4);
}

- (BOOL)isNewTagCell
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_identifier);
  if (v2)
  {
    v3 = objc_opt_self(ICTagNewTagItemIdentifier);
    v4 = (void *)swift_dynamicCastObjCClass(v2, v3);
    if (v4)
      swift_unknownObjectRetain(v2);
  }
  else
  {
    v4 = 0;
  }

  return v4 != 0;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1003B7FAC(self, (uint64_t)a2, (void (*)(void))TagCell.accessibilityLabel.getter);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1003B7FAC(self, (uint64_t)a2, (void (*)(void))TagCell.accessibilityValue.getter);
}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v3;
  UIAccessibilityTraits v4;
  unint64_t v5;
  UIAccessibilityTraits v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  v2 = v8.receiver;
  v3 = -[ICTagCell accessibilityTraits](&v8, "accessibilityTraits");
  v4 = UIAccessibilityTraitButton;
  if ((UIAccessibilityTraitButton & ~v3) == 0)
    v4 = 0;
  v5 = v4 | v3;
  if (*((_BYTE *)v2 + OBJC_IVAR___ICTagCell_isExcluded) == 1)
  {
    v6 = UIAccessibilityTraitSelected;

    v5 &= ~v6;
  }
  else
  {

  }
  return v5;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  -[ICTagCell setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1003B7FAC(self, (uint64_t)a2, (void (*)(void))TagCell.accessibilityHint.getter);
}

- (BOOL)isExcluded
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_isExcluded);
}

- (void)setIsExcluded:(BOOL)a3
{
  sub_1003B8528(self, (uint64_t)a2, a3, &OBJC_IVAR___ICTagCell_isExcluded, sub_1003B747C);
}

- (ICTagCell)initWithFrame:(CGRect)a3
{
  return (ICTagCell *)TagCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICTagCell)initWithCoder:(id)a3
{
  return (ICTagCell *)TagCell.init(coder:)(a3);
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[ICTagCell layoutSubviews](&v3, "layoutSubviews");
  sub_1003B7138();

}

- (void)setDisplayText:(id)a3 includeSymbolPrefix:(BOOL)a4 hasGroupInset:(BOOL)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ICTagCell *v11;

  if (a3)
  {
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = self;
  sub_1003B6F34(v8, v10, a4, a5);

  swift_bridgeObjectRelease(v10);
}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  ICTagCell *v7;
  Class isa;
  uint64_t v10;

  v3 = type metadata accessor for UICellConfigurationState(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  TagCell.configurationState.getter();

  isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (UICellConfigurationState *)isa;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  ICTagCell *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  TagCell.updateConfiguration(using:)((uint64_t)v8, v10);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  objc_class *ObjectType;
  id v6;
  ICTagCell *v7;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = a3;
  v7 = self;
  sub_1003B7138();
  v10.receiver = v7;
  v10.super_class = ObjectType;
  v8 = -[ICTagCell preferredLayoutAttributesFittingAttributes:](&v10, "preferredLayoutAttributesFittingAttributes:", v6);

  return v8;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  ICTagCell *v5;
  uint64_t v6;
  uint64_t v7;
  ICTagCell *v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v8 = self;
  }
  sub_1003B8EB4();

  sub_100012DDC((uint64_t)v9, &qword_1005CF190);
}

- (void)updateColors
{
  ICTagCell *v2;

  v2 = self;
  sub_1003B747C();

}

- (void)updateWidthConstraints
{
  ICTagCell *v2;

  v2 = self;
  sub_1003B7138();

}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(_QWORD *)&self->displayText[OBJC_IVAR___ICTagCell_displayText]);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagCell_identifier), v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagCell_unemphasizedBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagCell_excludedBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagCell____lazy_storage___imageViewBackgroundColor));

}

+ (void)newTagImage
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  NSString v5;

  v0 = objc_msgSend((id)objc_opt_self(UIFont), "ic_preferredFontForStyle:symbolicTraits:", UIFontTextStyleSubheadline, 2);
  if (v0)
  {
    v1 = v0;
    v2 = objc_msgSend(v0, "ic_fontWithSingleLineA");

    if (v2)
    {
      v3 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithFont:scale:", v2, 2);

      v4 = v3;
      v5 = String._bridgeToObjectiveC()();
      objc_msgSend((id)objc_opt_self(UIImage), "systemImageNamed:withConfiguration:", v5, v4);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

@end
