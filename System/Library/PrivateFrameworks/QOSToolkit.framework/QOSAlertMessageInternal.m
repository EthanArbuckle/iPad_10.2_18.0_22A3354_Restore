@implementation QOSAlertMessageInternal

- (NSString)title
{
  return (NSString *)sub_244E8FE14((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___QOSAlertMessageInternal_title);
}

- (NSString)body
{
  return (NSString *)sub_244E8FE14((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___QOSAlertMessageInternal_body);
}

- (QOSAlertMessageInternal)initWithTitle:(id)a3 body:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  objc_super v14;

  if (!a3)
  {
    v6 = 0;
    v8 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  v6 = sub_244EA11C4();
  v8 = v7;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v9 = sub_244EA11C4();
LABEL_6:
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___QOSAlertMessageInternal_title);
  *v11 = v6;
  v11[1] = v8;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___QOSAlertMessageInternal_body);
  *v12 = v9;
  v12[1] = v10;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for QOSAlertMessage();
  return -[QOSAlertMessageInternal init](&v14, sel_init);
}

- (QOSAlertMessageInternal)init
{
  QOSAlertMessageInternal *result;

  result = (QOSAlertMessageInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
