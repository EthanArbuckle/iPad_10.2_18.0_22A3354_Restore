@implementation SelectPeopleIntentResponse

- (int64_t)code
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___SelectPeopleIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___SelectPeopleIntentResponse_code);
  swift_beginAccess();
  *v4 = a3;
}

- (SelectPeopleIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  SelectPeopleIntentResponse *v7;
  int64_t *v8;
  SelectPeopleIntentResponse *v9;

  v6 = a4;
  v7 = -[SelectPeopleIntentResponse init](self, sel_init);
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___SelectPeopleIntentResponse_code);
  swift_beginAccess();
  *v8 = a3;
  v9 = v7;
  -[SelectPeopleIntentResponse setUserActivity:](v9, sel_setUserActivity_, v6);

  return v9;
}

- (SelectPeopleIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___SelectPeopleIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SelectPeopleIntentResponse();
  return -[SelectPeopleIntentResponse init](&v3, sel_init);
}

- (SelectPeopleIntentResponse)initWithCoder:(id)a3
{
  return (SelectPeopleIntentResponse *)sub_1C0746018((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (SelectPeopleIntentResponse)initWithBackingStore:(id)a3
{
  return (SelectPeopleIntentResponse *)sub_1C0746018((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithBackingStore_);
}

- (SelectPeopleIntentResponse)initWithPropertiesByName:(id)a3
{
  uint64_t v3;

  if (a3)
    v3 = sub_1C07477EC();
  else
    v3 = 0;
  return (SelectPeopleIntentResponse *)SelectPeopleIntentResponse.init(propertiesByName:)(v3);
}

@end
