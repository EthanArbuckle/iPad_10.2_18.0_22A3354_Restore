@implementation SREMusicModelQuery

- (SREMusicModelQuery)initWithGenreID:(id)a3
{
  id v5;
  SREMusicModelQuery *v6;
  SREMusicModelQuery *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SREMusicModelQuery;
  v6 = -[SREMusicModelQuery init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_genreID, a3);

  return v7;
}

- (NSString)genreID
{
  return self->_genreID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreID, 0);
}

@end
