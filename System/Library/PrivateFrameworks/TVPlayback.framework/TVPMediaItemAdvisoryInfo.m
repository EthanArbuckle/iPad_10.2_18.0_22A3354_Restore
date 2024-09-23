@implementation TVPMediaItemAdvisoryInfo

- (TVPMediaItemAdvisoryInfo)initWithRatingDescription:(id)a3
{
  id v5;
  TVPMediaItemAdvisoryInfo *v6;
  TVPMediaItemAdvisoryInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPMediaItemAdvisoryInfo;
  v6 = -[TVPMediaItemAdvisoryInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ratingDescription, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TVPMediaItemAdvisoryInfo ratingName](self, "ratingName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPMediaItemAdvisoryInfo ratingDescription](self, "ratingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ratingName - %@, ratingDescription - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)ratingName
{
  return self->_ratingName;
}

- (void)setRatingName:(id)a3
{
  objc_storeStrong((id *)&self->_ratingName, a3);
}

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingDescription, 0);
  objc_storeStrong((id *)&self->_ratingName, 0);
}

@end
