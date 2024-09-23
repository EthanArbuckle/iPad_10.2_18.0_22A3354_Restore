@implementation VUIMediaEntityType

+ (id)episode
{
  if (episode___onceToken != -1)
    dispatch_once(&episode___onceToken, &__block_literal_global_3_2);
  return (id)episode___type;
}

+ (id)movie
{
  if (movie___onceToken != -1)
    dispatch_once(&movie___onceToken, &__block_literal_global_128);
  return (id)movie___type;
}

+ (id)movieRental
{
  if (movieRental___onceToken != -1)
    dispatch_once(&movieRental___onceToken, &__block_literal_global_1_1);
  return (id)movieRental___type;
}

+ (id)homeVideo
{
  if (homeVideo___onceToken != -1)
    dispatch_once(&homeVideo___onceToken, &__block_literal_global_2_1);
  return (id)homeVideo___type;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  uint64_t v7;

  v3 = -[VUIMediaEntityType subtype](self, "subtype");
  v4 = v3 ^ (2 * -[VUIMediaEntityType mediaCategoryType](self, "mediaCategoryType"));
  v5 = v4 ^ (4 * -[VUIMediaEntityType mediaCollectionType](self, "mediaCollectionType"));
  v6 = -[VUIMediaEntityType isRental](self, "isRental");
  v7 = 8;
  if (!v6)
    v7 = 0;
  return v5 ^ v7;
}

- (unint64_t)mediaCategoryType
{
  return self->_mediaCategoryType;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (unint64_t)mediaCollectionType
{
  return self->_mediaCollectionType;
}

- (BOOL)isRental
{
  return self->_rental;
}

+ (id)show
{
  if (show___onceToken != -1)
    dispatch_once(&show___onceToken, &__block_literal_global_4_2);
  return (id)show___type;
}

void __29__VUIMediaEntityType_episode__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIMediaEntityType _initWithMediaItemCategoryType:isRental:]([VUIMediaEntityType alloc], "_initWithMediaItemCategoryType:isRental:", 1, 0);
  v1 = (void *)episode___type;
  episode___type = (uint64_t)v0;

}

void __31__VUIMediaEntityType_homeVideo__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIMediaEntityType _initWithMediaItemCategoryType:isRental:]([VUIMediaEntityType alloc], "_initWithMediaItemCategoryType:isRental:", 2, 0);
  v1 = (void *)homeVideo___type;
  homeVideo___type = (uint64_t)v0;

}

void __27__VUIMediaEntityType_movie__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIMediaEntityType _initWithMediaItemCategoryType:isRental:]([VUIMediaEntityType alloc], "_initWithMediaItemCategoryType:isRental:", 0, 0);
  v1 = (void *)movie___type;
  movie___type = (uint64_t)v0;

}

void __33__VUIMediaEntityType_movieRental__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIMediaEntityType _initWithMediaItemCategoryType:isRental:]([VUIMediaEntityType alloc], "_initWithMediaItemCategoryType:isRental:", 0, 1);
  v1 = (void *)movieRental___type;
  movieRental___type = (uint64_t)v0;

}

- (id)_initWithMediaItemCategoryType:(unint64_t)a3 isRental:(BOOL)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIMediaEntityType;
  result = -[VUIMediaEntityType init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 2) = 0;
    *((_QWORD *)result + 3) = a3;
    *((_BYTE *)result + 8) = a4;
  }
  return result;
}

void __28__VUIMediaEntityType_season__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIMediaEntityType _initWithMediaCollectionType:mediaCategoryType:]([VUIMediaEntityType alloc], "_initWithMediaCollectionType:mediaCategoryType:", 1, 1);
  v1 = (void *)season___type;
  season___type = (uint64_t)v0;

}

void __26__VUIMediaEntityType_show__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIMediaEntityType _initWithMediaCollectionType:mediaCategoryType:]([VUIMediaEntityType alloc], "_initWithMediaCollectionType:mediaCategoryType:", 2, 1);
  v1 = (void *)show___type;
  show___type = (uint64_t)v0;

}

- (id)_initWithMediaCollectionType:(unint64_t)a3 mediaCategoryType:(unint64_t)a4
{
  VUIMediaEntityType *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The mediaCollectionType argument cannot be VUIMediaCollectionTypeNone"));
  v17.receiver = self;
  v17.super_class = (Class)VUIMediaEntityType;
  v7 = -[VUIMediaEntityType init](&v17, sel_init);
  if (v7)
  {
    +[VUIMediaCategory mediaCatgeoryForType:](VUIMediaCategory, "mediaCatgeoryForType:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supportedMediaCollectionTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99778];
      VUIMediaCollectionTypeLogString(a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      VUIMediaCategoryTypeLogString(a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "raise:format:", v13, CFSTR("The mediaCollectionType (%@) is not supported for the supplied mediaCategoryType (%@)"), v14, v15);

    }
    v7->_subtype = 1;
    v7->_mediaCategoryType = a4;
    v7->_mediaCollectionType = a3;

  }
  return v7;
}

+ (id)season
{
  if (season___onceToken != -1)
    dispatch_once(&season___onceToken, &__block_literal_global_5_2);
  return (id)season___type;
}

- (VUIMediaEntityType)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  VUIMediaEntityType *v4;
  VUIMediaEntityType *v5;
  VUIMediaEntityType *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;

  v4 = (VUIMediaEntityType *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUIMediaEntityType subtype](self, "subtype");
    if (v7 == -[VUIMediaEntityType subtype](v6, "subtype")
      && (v8 = -[VUIMediaEntityType mediaCategoryType](self, "mediaCategoryType"),
          v8 == -[VUIMediaEntityType mediaCategoryType](v6, "mediaCategoryType"))
      && (v9 = -[VUIMediaEntityType mediaCollectionType](self, "mediaCollectionType"),
          v9 == -[VUIMediaEntityType mediaCollectionType](v6, "mediaCollectionType")))
    {
      v10 = -[VUIMediaEntityType isRental](self, "isRental");
      v11 = v10 ^ -[VUIMediaEntityType isRental](v6, "isRental") ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)stringDescription
{
  VUIMediaEntityType *v3;
  VUIMediaEntityType *v4;
  VUIMediaEntityType *v5;
  VUIMediaEntityType *v6;
  VUIMediaEntityType *v7;
  VUIMediaEntityType *v8;
  __CFString *v9;

  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v3 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    v9 = CFSTR("Movie");
  }
  else
  {
    +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
    v4 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

    if (v4 == self)
    {
      v9 = CFSTR("MovieRental");
    }
    else
    {
      +[VUIMediaEntityType show](VUIMediaEntityType, "show");
      v5 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

      if (v5 == self)
      {
        v9 = CFSTR("TVShow");
      }
      else
      {
        +[VUIMediaEntityType season](VUIMediaEntityType, "season");
        v6 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

        if (v6 == self)
        {
          v9 = CFSTR("Season");
        }
        else
        {
          +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
          v7 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

          if (v7 == self)
          {
            v9 = CFSTR("HomeVideo");
          }
          else
          {
            +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
            v8 = (VUIMediaEntityType *)objc_claimAutoreleasedReturnValue();

            if (v8 == self)
            {
              v9 = CFSTR("Episode");
            }
            else
            {
              -[VUIMediaEntityType description](self, "description");
              v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
          }
        }
      }
    }
  }
  return v9;
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
  v21.super_class = (Class)VUIMediaEntityType;
  -[VUIMediaEntityType description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  VUIMediaEntitySubtypeLogString(-[VUIMediaEntityType subtype](self, "subtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("subtype"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  VUIMediaCategoryTypeLogString(-[VUIMediaEntityType mediaCategoryType](self, "mediaCategoryType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("mediaCategoryType"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  VUIMediaCollectionTypeLogString(-[VUIMediaEntityType mediaCollectionType](self, "mediaCollectionType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("mediaCollectionType"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityType isRental](self, "isRental");
  VUIBoolLogString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("isRental"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@>"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)setSubtype:(unint64_t)a3
{
  self->_subtype = a3;
}

- (void)setMediaCategoryType:(unint64_t)a3
{
  self->_mediaCategoryType = a3;
}

- (void)setMediaCollectionType:(unint64_t)a3
{
  self->_mediaCollectionType = a3;
}

- (void)setRental:(BOOL)a3
{
  self->_rental = a3;
}

@end
