@implementation PUWallpaperNightlySuggestionsPosterConfiguration

- (PUWallpaperNightlySuggestionsPosterConfiguration)initWithName:(id)a3 personLocalIdentifiers:(id)a4 includePets:(BOOL)a5 includeLandscapes:(BOOL)a6 includeCityscapes:(BOOL)a7
{
  id v13;
  id v14;
  PUWallpaperNightlySuggestionsPosterConfiguration *v15;
  PUWallpaperNightlySuggestionsPosterConfiguration *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PUWallpaperNightlySuggestionsPosterConfiguration;
  v15 = -[PUWallpaperNightlySuggestionsPosterConfiguration init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_personLocalIdentifiers, a4);
    v16->_includePets = a5;
    v16->_includeLandscapes = a6;
    v16->_includeCityscapes = a7;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:personLocalIdentifiers:includePets:includeLandscapes:includeCityscapes:", self->_name, self->_personLocalIdentifiers, self->_includePets, self->_includeLandscapes, self->_includeCityscapes);
}

- (NSString)name
{
  return self->_name;
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (void)setPersonLocalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_personLocalIdentifiers, a3);
}

- (BOOL)includePets
{
  return self->_includePets;
}

- (void)setIncludePets:(BOOL)a3
{
  self->_includePets = a3;
}

- (BOOL)includeLandscapes
{
  return self->_includeLandscapes;
}

- (void)setIncludeLandscapes:(BOOL)a3
{
  self->_includeLandscapes = a3;
}

- (BOOL)includeCityscapes
{
  return self->_includeCityscapes;
}

- (void)setIncludeCityscapes:(BOOL)a3
{
  self->_includeCityscapes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
