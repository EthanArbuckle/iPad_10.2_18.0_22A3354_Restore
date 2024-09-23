@implementation PFCShuffle

- (PFCShuffle)initWithPeople:(id)a3 pets:(BOOL)a4 nature:(BOOL)a5 cityscape:(BOOL)a6
{
  id v11;
  PFCShuffle *v12;
  PFCShuffle *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PFCShuffle;
  v12 = -[PFCShuffle init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_people, a3);
    v13->_pets = a4;
    v13->_nature = a5;
    v13->_cityscape = a6;
  }

  return v13;
}

- (id)description
{
  const char *v2;
  const char *v3;
  const char *v4;

  v2 = "YES";
  if (self->_pets)
    v3 = "YES";
  else
    v3 = "NO";
  if (self->_nature)
    v4 = "YES";
  else
    v4 = "NO";
  if (!self->_cityscape)
    v2 = "NO";
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[PFCShuffle people = (%@), pets=%s, nature=%s, city=%s]"), self->_people, v3, v4, v2);
}

- (NSSet)people
{
  return self->_people;
}

- (BOOL)pets
{
  return self->_pets;
}

- (BOOL)nature
{
  return self->_nature;
}

- (BOOL)cityscape
{
  return self->_cityscape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_people, 0);
}

@end
