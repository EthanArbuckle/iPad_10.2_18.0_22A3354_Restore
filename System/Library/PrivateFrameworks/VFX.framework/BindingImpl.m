@implementation BindingImpl

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B2228728();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4;

  *(_QWORD *)self->identifier = sub_1B222874C();
  *(_QWORD *)&self->identifier[8] = v4;
  swift_bridgeObjectRelease();
}

- (int64_t)objectID
{
  return *(_QWORD *)self->objectID;
}

- (void)setObjectID:(int64_t)a3
{
  *(_QWORD *)self->objectID = a3;
}

- (NSString)objectName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B2228728();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setObjectName:(id)a3
{
  uint64_t v4;

  *(_QWORD *)self->objectName = sub_1B222874C();
  *(_QWORD *)&self->objectName[8] = v4;
  swift_bridgeObjectRelease();
}

- (NSString)bindingName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B2228728();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setBindingName:(id)a3
{
  uint64_t v4;

  *(_QWORD *)self->bindingName = sub_1B222874C();
  *(_QWORD *)&self->bindingName[8] = v4;
  swift_bridgeObjectRelease();
}

- (NSString)userManual
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1B2228728();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setUserManual:(id)a3
{
  uint64_t v4;

  *(_QWORD *)self->userManual = sub_1B222874C();
  *(_QWORD *)&self->userManual[8] = v4;
  swift_bridgeObjectRelease();
}

- (int64_t)type
{
  return *(_QWORD *)self->type;
}

- (void)setType:(int64_t)a3
{
  *(_QWORD *)self->type = a3;
}

- (int64_t)semantic
{
  return *(_QWORD *)self->semantic;
}

- (void)setSemantic:(int64_t)a3
{
  *(_QWORD *)self->semantic = a3;
}

- (double)min
{
  return *(double *)self->min;
}

- (void)setMin:(double)a3
{
  *(double *)self->min = a3;
}

- (double)max
{
  return *(double *)self->max;
}

- (void)setMax:(double)a3
{
  *(double *)self->max = a3;
}

- (NSString)enumName
{
  void *v2;

  if (*(_QWORD *)&self->enumName[15])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B2228728();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setEnumName:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = sub_1B222874C();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *(_QWORD *)&self->enumName[7] = v4;
  *(_QWORD *)&self->enumName[15] = v5;
  swift_bridgeObjectRelease();
}

- (NSArray)enumCases
{
  void *v2;

  if (*(_QWORD *)&self->enumCases[7])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B2228AAC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (void)setEnumCases:(id)a3
{
  uint64_t v4;

  if (a3)
    v4 = sub_1B2228AB8();
  else
    v4 = 0;
  *(_QWORD *)&self->enumCases[7] = v4;
  swift_bridgeObjectRelease();
}

- (NSData)rawValue
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;

  swift_retain();
  v2 = sub_1B1A09D8C();
  v4 = v3;
  swift_release();
  if (v4 >> 60 == 15)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)sub_1B2228170();
    sub_1B1A0DAC8(v2, v4);
  }
  return (NSData *)v5;
}

- (void)setRawValue:(id)a3
{
  void *v3;
  id v4;
  unint64_t v5;
  unint64_t v6;

  v3 = a3;
  if (a3)
  {
    swift_retain();
    v4 = v3;
    v3 = (void *)sub_1B222817C();
    v6 = v5;

  }
  else
  {
    swift_retain();
    v6 = 0xF000000000000000;
  }
  sub_1B1A09F5C((uint64_t)v3, v6);
  swift_release();
}

@end
