@implementation GetSuggestionsIntentResponse

- (int64_t)code
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___GetSuggestionsIntentResponse_code);
  swift_beginAccess();
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___GetSuggestionsIntentResponse_code);
  swift_beginAccess();
  *v4 = a3;
}

- (GetSuggestionsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6;
  GetSuggestionsIntentResponse *v7;
  int64_t *v8;
  GetSuggestionsIntentResponse *v9;

  v6 = a4;
  v7 = -[GetSuggestionsIntentResponse init](self, sel_init);
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___GetSuggestionsIntentResponse_code);
  swift_beginAccess();
  *v8 = a3;
  v9 = v7;
  -[GetSuggestionsIntentResponse setUserActivity:](v9, sel_setUserActivity_, v6);

  return v9;
}

- (GetSuggestionsIntentResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___GetSuggestionsIntentResponse_code) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GetSuggestionsIntentResponse();
  return -[GetSuggestionsIntentResponse init](&v3, sel_init);
}

- (GetSuggestionsIntentResponse)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___GetSuggestionsIntentResponse_code) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GetSuggestionsIntentResponse();
  return -[GetSuggestionsIntentResponse initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
