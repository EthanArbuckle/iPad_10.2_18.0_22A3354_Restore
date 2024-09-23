@implementation WLKBasicMovieMetadata

- (WLKBasicMovieMetadata)initWithDictionary:(id)a3
{
  id v4;
  WLKBasicMovieMetadata *v5;
  void *v6;
  uint64_t v7;
  NSString *studio;
  void *v9;
  void *v10;
  WLKRottenTomatoesRating *v11;
  WLKRottenTomatoesRating *rottenTomatoesRating;
  void *v13;
  double v14;
  uint64_t v15;
  NSDate *releaseDate;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WLKBasicMovieMetadata;
  v5 = -[WLKBasicContentMetadata initWithDictionary:](&v18, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("studio"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    studio = v5->_studio;
    v5->_studio = (NSString *)v7;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("tomatometerFreshness"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wlk_numberForKey:", CFSTR("tomatometerPercentage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WLKRottenTomatoesRating initWithFreshness:freshnessPercentage:]([WLKRottenTomatoesRating alloc], "initWithFreshness:freshnessPercentage:", +[WLKRottenTomatoesRating freshnessForString:](WLKRottenTomatoesRating, "freshnessForString:", v9), v10);
    rottenTomatoesRating = v5->_rottenTomatoesRating;
    v5->_rottenTomatoesRating = v11;

    objc_msgSend(v4, "wlk_numberForKey:", CFSTR("duration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v5->_duration = v14;

    objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("releaseDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v15;

  }
  return v5;
}

- (NSString)studio
{
  return self->_studio;
}

- (WLKRottenTomatoesRating)rottenTomatoesRating
{
  return self->_rottenTomatoesRating;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_rottenTomatoesRating, 0);
  objc_storeStrong((id *)&self->_studio, 0);
}

@end
