@implementation VUIMediaItemCredits

- (NSOrderedSet)cast
{
  NSOrderedSet *cast;
  NSOrderedSet *v4;
  NSOrderedSet *v5;

  cast = self->_cast;
  if (!cast)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v4 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cast;
    self->_cast = v4;

    cast = self->_cast;
  }
  return cast;
}

- (NSOrderedSet)directors
{
  NSOrderedSet *directors;
  NSOrderedSet *v4;
  NSOrderedSet *v5;

  directors = self->_directors;
  if (!directors)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v4 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_directors;
    self->_directors = v4;

    directors = self->_directors;
  }
  return directors;
}

- (NSOrderedSet)producers
{
  NSOrderedSet *producers;
  NSOrderedSet *v4;
  NSOrderedSet *v5;

  producers = self->_producers;
  if (!producers)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v4 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_producers;
    self->_producers = v4;

    producers = self->_producers;
  }
  return producers;
}

- (NSOrderedSet)screenwriters
{
  NSOrderedSet *screenwriters;
  NSOrderedSet *v4;
  NSOrderedSet *v5;

  screenwriters = self->_screenwriters;
  if (!screenwriters)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v4 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_screenwriters;
    self->_screenwriters = v4;

    screenwriters = self->_screenwriters;
  }
  return screenwriters;
}

- (BOOL)hasCredits
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  -[VUIMediaItemCredits cast](self, "cast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[VUIMediaItemCredits directors](self, "directors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;
  -[VUIMediaItemCredits producers](self, "producers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "count");
  -[VUIMediaItemCredits screenwriters](self, "screenwriters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  return v8 + v10 != 0;
}

- (VUIMediaItemCredits)initWithStringRepresentation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  VUIMediaItemCredits *v16;
  uint64_t v17;
  NSOrderedSet *cast;
  uint64_t v19;
  NSOrderedSet *directors;
  uint64_t v21;
  NSOrderedSet *producers;
  uint64_t v23;
  NSOrderedSet *screenwriters;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "characterSetWithCharactersInString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") != 4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The string representation must contain exactly four components"));
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_arrayFromStringRepresentation:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_arrayFromStringRepresentation:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_arrayFromStringRepresentation:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_arrayFromStringRepresentation:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[VUIMediaItemCredits init](self, "init");
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v9);
    v17 = objc_claimAutoreleasedReturnValue();
    cast = v16->_cast;
    v16->_cast = (NSOrderedSet *)v17;

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v11);
    v19 = objc_claimAutoreleasedReturnValue();
    directors = v16->_directors;
    v16->_directors = (NSOrderedSet *)v19;

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v13);
    v21 = objc_claimAutoreleasedReturnValue();
    producers = v16->_producers;
    v16->_producers = (NSOrderedSet *)v21;

    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v15);
    v23 = objc_claimAutoreleasedReturnValue();
    screenwriters = v16->_screenwriters;
    v16->_screenwriters = (NSOrderedSet *)v23;

  }
  return v16;
}

- (id)stringRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_opt_class();
  -[VUIMediaItemCredits cast](self, "cast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_stringRepresentationFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  -[VUIMediaItemCredits directors](self, "directors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_stringRepresentationFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_class();
  -[VUIMediaItemCredits producers](self, "producers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_stringRepresentationFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_class();
  -[VUIMediaItemCredits screenwriters](self, "screenwriters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_stringRepresentationFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,%@,%@,%@"), v6, v10, v14, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VUIMediaItemCredits *v4;
  uint64_t v5;
  NSOrderedSet *cast;
  uint64_t v7;
  NSOrderedSet *directors;
  uint64_t v9;
  NSOrderedSet *producers;
  uint64_t v11;
  NSOrderedSet *screenwriters;

  v4 = objc_alloc_init(VUIMediaItemCredits);
  v5 = -[NSOrderedSet copy](self->_cast, "copy");
  cast = v4->_cast;
  v4->_cast = (NSOrderedSet *)v5;

  v7 = -[NSOrderedSet copy](self->_directors, "copy");
  directors = v4->_directors;
  v4->_directors = (NSOrderedSet *)v7;

  v9 = -[NSOrderedSet copy](self->_producers, "copy");
  producers = v4->_producers;
  v4->_producers = (NSOrderedSet *)v9;

  v11 = -[NSOrderedSet copy](self->_screenwriters, "copy");
  screenwriters = v4->_screenwriters;
  v4->_screenwriters = (NSOrderedSet *)v11;

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[VUIMediaItemCredits cast](self, "cast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VUIMediaItemCredits directors](self, "directors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[VUIMediaItemCredits producers](self, "producers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[VUIMediaItemCredits screenwriters](self, "screenwriters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  VUIMediaItemCredits *v4;
  VUIMediaItemCredits *v5;
  VUIMediaItemCredits *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  id v24;

  v4 = (VUIMediaItemCredits *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[VUIMediaItemCredits cast](self, "cast");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaItemCredits cast](v6, "cast");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          v12 = 0;
          if (!v9 || !v10)
            goto LABEL_29;
          v13 = objc_msgSend(v9, "isEqual:", v10);

          if ((v13 & 1) == 0)
            goto LABEL_22;
        }
        -[VUIMediaItemCredits directors](self, "directors");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaItemCredits directors](v6, "directors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
        v16 = v15;
        if (v9 == v16)
        {

        }
        else
        {
          v11 = v16;
          v12 = 0;
          if (!v9 || !v16)
            goto LABEL_29;
          v17 = objc_msgSend(v9, "isEqual:", v16);

          if ((v17 & 1) == 0)
            goto LABEL_22;
        }
        -[VUIMediaItemCredits producers](self, "producers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaItemCredits producers](v6, "producers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v18;
        v20 = v19;
        if (v9 == v20)
        {

LABEL_24:
          -[VUIMediaItemCredits screenwriters](self, "screenwriters");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIMediaItemCredits screenwriters](v6, "screenwriters");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v22;
          v24 = v23;
          v11 = v24;
          if (v9 == v24)
          {
            v12 = 1;
          }
          else
          {
            v12 = 0;
            if (v9 && v24)
              v12 = objc_msgSend(v9, "isEqual:", v24);
          }
          goto LABEL_29;
        }
        v11 = v20;
        v12 = 0;
        if (v9 && v20)
        {
          v21 = objc_msgSend(v9, "isEqual:", v20);

          if ((v21 & 1) == 0)
          {
LABEL_22:
            v12 = 0;
LABEL_30:

            goto LABEL_31;
          }
          goto LABEL_24;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    v12 = 0;
  }
LABEL_31:

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21.receiver = self;
  v21.super_class = (Class)VUIMediaItemCredits;
  -[VUIMediaItemCredits description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItemCredits cast](self, "cast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("cast"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItemCredits directors](self, "directors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("directors"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItemCredits producers](self, "producers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("producers"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaItemCredits screenwriters](self, "screenwriters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("screenwriters"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@>"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_arrayFromStringRepresentation:(id)a3
{
  return (id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|"));
}

+ (id)_stringRepresentationFromArray:(id)a3
{
  return (id)objc_msgSend(a3, "componentsJoinedByString:", CFSTR("|"));
}

- (void)setCast:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDirectors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setProducers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setScreenwriters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenwriters, 0);
  objc_storeStrong((id *)&self->_producers, 0);
  objc_storeStrong((id *)&self->_directors, 0);
  objc_storeStrong((id *)&self->_cast, 0);
}

@end
