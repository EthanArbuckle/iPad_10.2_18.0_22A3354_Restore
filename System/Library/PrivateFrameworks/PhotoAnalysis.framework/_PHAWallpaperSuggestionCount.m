@implementation _PHAWallpaperSuggestionCount

- (_PHAWallpaperSuggestionCount)initWithPersonLocalIdentifier:(id)a3 count:(id)a4
{
  id v7;
  id v8;
  _PHAWallpaperSuggestionCount *v9;
  _PHAWallpaperSuggestionCount *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PHAWallpaperSuggestionCount;
  v9 = -[_PHAWallpaperSuggestionCount init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personLocalIdentifer, a3);
    objc_storeStrong((id *)&v10->_count, a4);
  }

  return v10;
}

- (NSString)personLocalIdentifer
{
  return self->_personLocalIdentifer;
}

- (void)setPersonLocalIdentifer:(id)a3
{
  objc_storeStrong((id *)&self->_personLocalIdentifer, a3);
}

- (NSNumber)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
  objc_storeStrong((id *)&self->_count, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_count, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifer, 0);
}

@end
