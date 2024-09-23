@implementation PlaceSummaryTemplateFactory

+ (id)autocompleteTemplateWithSearchResult:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 3)
    v4 = sub_10014843C();
  else
    v4 = sub_1001475BC(0);
  v5 = v4;

  return v5;
}

+ (id)autocompleteTemplateWithCompletion:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  char *v7;

  v5 = a3;
  v6 = a4;
  v7 = sub_100147AC0(v5, a4);

  return v7;
}

- (_TtC4Maps27PlaceSummaryTemplateFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaceSummaryTemplateFactory();
  return -[PlaceSummaryTemplateFactory init](&v3, "init");
}

@end
