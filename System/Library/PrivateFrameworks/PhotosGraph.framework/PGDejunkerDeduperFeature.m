@implementation PGDejunkerDeduperFeature

- (PGDejunkerDeduperFeature)initWithPersonLocalIdentifiers:(id)a3 peopleScenes:(id)a4 isVideo:(BOOL)a5
{
  id v9;
  id v10;
  PGDejunkerDeduperFeature *v11;
  PGDejunkerDeduperFeature *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGDejunkerDeduperFeature;
  v11 = -[PGDejunkerDeduperFeature init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_personLocalIdentifiers, a3);
    objc_storeStrong((id *)&v12->_peopleScenes, a4);
    v12->_isVideo = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSSet hash](self->_personLocalIdentifiers, "hash");
  v4 = -[NSSet hash](self->_peopleScenes, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVideo);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PGDejunkerDeduperFeature *v4;
  uint64_t v5;
  BOOL v6;
  PGDejunkerDeduperFeature *v7;
  NSSet *personLocalIdentifiers;
  NSSet *peopleScenes;

  v4 = (PGDejunkerDeduperFeature *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      personLocalIdentifiers = self->_personLocalIdentifiers;
      v6 = (personLocalIdentifiers == v7->_personLocalIdentifiers
         || -[NSSet isEqualToSet:](personLocalIdentifiers, "isEqualToSet:"))
        && ((peopleScenes = self->_peopleScenes, peopleScenes == v7->_peopleScenes)
         || -[NSSet isEqualToSet:](peopleScenes, "isEqualToSet:"))
        && self->_isVideo == v7->_isVideo;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)identicalSimilarity
{
  return -[NSSet count](self->_personLocalIdentifiers, "count") || -[NSSet count](self->_peopleScenes, "count") != 0;
}

- (BOOL)hasPersons
{
  return -[NSSet count](self->_personLocalIdentifiers, "count") != 0;
}

- (BOOL)hasPeopleScenes
{
  return -[NSSet count](self->_peopleScenes, "count") != 0;
}

- (id)description
{
  NSSet **p_personLocalIdentifiers;
  NSSet **p_peopleScenes;
  NSSet *peopleScenes;
  void *v6;
  void *v7;
  __CFString *v8;

  p_personLocalIdentifiers = &self->_personLocalIdentifiers;
  if (!-[NSSet count](self->_personLocalIdentifiers, "count"))
  {
    peopleScenes = self->_peopleScenes;
    p_peopleScenes = &self->_peopleScenes;
    if (!-[NSSet count](peopleScenes, "count"))
    {
      v8 = CFSTR("nobody");
      return v8;
    }
    p_personLocalIdentifiers = p_peopleScenes;
  }
  -[NSSet allObjects](*p_personLocalIdentifiers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)personLocalIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)peopleScenes
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleScenes, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

@end
