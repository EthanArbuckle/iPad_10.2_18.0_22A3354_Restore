@implementation FRNewsActivityInteractionSerializer

- (id)intentForActivityData:(id)a3
{
  id v3;
  id v4;
  TodayIntent *v5;
  Tag *v6;
  void *v7;
  void *v8;
  Tag *v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "activity");
  if (v4 == (id)4)
  {
    v5 = objc_opt_new(TodayIntent);
  }
  else if (v4 == (id)2)
  {
    v5 = objc_opt_new(TagIntent);
    v6 = [Tag alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));
    v9 = -[Tag initWithIdentifier:displayString:](v6, "initWithIdentifier:displayString:", v7, v8);
    -[TodayIntent setTag:](v5, "setTag:", v9);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
