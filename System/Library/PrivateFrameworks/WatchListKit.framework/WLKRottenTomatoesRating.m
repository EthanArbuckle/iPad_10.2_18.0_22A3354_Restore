@implementation WLKRottenTomatoesRating

+ (unint64_t)freshnessForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("Rotten")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("Fresh")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("CertifiedFresh")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (WLKRottenTomatoesRating)initWithFreshness:(unint64_t)a3 freshnessPercentage:(id)a4
{
  id v7;
  WLKRottenTomatoesRating *v8;
  WLKRottenTomatoesRating *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WLKRottenTomatoesRating;
  v8 = -[WLKRottenTomatoesRating init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_freshness = a3;
    objc_storeStrong((id *)&v8->_freshnessPercentage, a4);
  }

  return v9;
}

- (WLKRottenTomatoesRating)init
{
  return -[WLKRottenTomatoesRating initWithFreshness:freshnessPercentage:](self, "initWithFreshness:freshnessPercentage:", 0, 0);
}

- (unint64_t)freshness
{
  return self->_freshness;
}

- (NSNumber)freshnessPercentage
{
  return self->_freshnessPercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freshnessPercentage, 0);
}

@end
