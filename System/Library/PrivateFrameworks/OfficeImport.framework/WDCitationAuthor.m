@implementation WDCitationAuthor

- (WDCitationAuthor)initWithFirst:(id)a3 last:(id)a4
{
  id v7;
  id v8;
  WDCitationAuthor *v9;
  WDCitationAuthor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WDCitationAuthor;
  v9 = -[WDCitationAuthor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mFirst, a3);
    objc_storeStrong((id *)&v10->mLast, a4);
  }

  return v10;
}

- (NSString)first
{
  return self->mFirst;
}

- (void)setFirst:(id)a3
{
  objc_storeStrong((id *)&self->mFirst, a3);
}

- (NSString)last
{
  return self->mLast;
}

- (void)setLast:(id)a3
{
  objc_storeStrong((id *)&self->mLast, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLast, 0);
  objc_storeStrong((id *)&self->mFirst, 0);
}

@end
