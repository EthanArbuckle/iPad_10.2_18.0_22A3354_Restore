@implementation SUItemContentRating

- (SUItemContentRating)initWithDictionary:(id)a3
{
  SUItemContentRating *v4;
  NSDictionary *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  SSItemArtworkImage *v11;
  id v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SUItemContentRating;
  v4 = -[SUItemContentRating init](&v14, sel_init);
  if (v4)
  {
    v5 = (NSDictionary *)objc_msgSend(a3, "copy");
    v4->_dictionary = v5;
    v6 = -[NSDictionary objectForKey:](v5, "objectForKey:", CFSTR("rank"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4->_rank = (int)objc_msgSend(v6, "intValue");
    v7 = -[NSDictionary objectForKey:](v4->_dictionary, "objectForKey:", CFSTR("description"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_ratingDescription = (NSString *)v7;
    v8 = -[NSDictionary objectForKey:](v4->_dictionary, "objectForKey:", CFSTR("label"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_ratingLabel = (NSString *)(id)objc_msgSend(v8, "uppercaseString");
    v9 = -[NSDictionary objectForKey:](v4->_dictionary, "objectForKey:", CFSTR("system"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_ratingSystem = objc_msgSend((id)objc_opt_class(), "ratingSystemFromString:", v9);
    v10 = -[NSDictionary objectForKey:](v4->_dictionary, "objectForKey:", CFSTR("logo-artwork-url"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (SSItemArtworkImage *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1E50]), "initWithArtworkDictionary:", v10);
      v4->_ratingSystemLogo = v11;
      if (!-[SSItemArtworkImage URL](v11, "URL"))
      {

        v4->_ratingSystemLogo = 0;
      }
    }
    v12 = -[NSDictionary objectForKey:](v4->_dictionary, "objectForKey:", CFSTR("hide-item-if-restricted"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4->_shouldHideWhenRestricted = objc_msgSend(v12, "BOOLValue");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUItemContentRating;
  -[SUItemContentRating dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(_QWORD *)(v5 + 8) = -[NSDictionary copyWithZone:](self->_dictionary, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = self->_rank;
  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_ratingDescription, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_ratingLabel, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = self->_ratingSystem;
  *(_QWORD *)(v5 + 48) = -[SSItemArtworkImage copyWithZone:](self->_ratingSystemLogo, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 56) = self->_shouldHideWhenRestricted;
  return (id)v5;
}

+ (int64_t)ratingSystemFromString:(id)a3
{
  uint64_t v4;

  v4 = 0;
  while (-[__CFString caseInsensitiveCompare:](*(__CFString **)((char *)&kRatingSystems + v4), "caseInsensitiveCompare:", a3))
  {
    v4 += 16;
    if (v4 == 576)
      return 0;
  }
  return *(int64_t *)((char *)&kRatingSystems + v4 + 8);
}

- (BOOL)isExplicitContent
{
  int64_t ratingSystem;

  ratingSystem = self->_ratingSystem;
  return (ratingSystem == 14 || ratingSystem == 1) && self->_rank == 200;
}

- (BOOL)isRestricted
{
  void *v3;
  void *v4;
  int64_t rank;
  BOOL v6;

  if ((-[SUItemContentRating _isRatingSystemForApps:](self, "_isRatingSystemForApps:", self->_ratingSystem)
     || -[SUItemContentRating _isRatingSystemForMovies:](self, "_isRatingSystemForMovies:", self->_ratingSystem)
     || -[SUItemContentRating _isRatingSystemForTV:](self, "_isRatingSystemForTV:", self->_ratingSystem))
    && (v3 = (void *)SSRestrictionsCopyRankForMediaType()) != 0)
  {
    v4 = v3;
    rank = self->_rank;
    v6 = rank > objc_msgSend(v3, "integerValue");

  }
  else
  {
    if (-[SUItemContentRating isExplicitContent](self, "isExplicitContent"))
      return SSRestrictionsShouldRestrictExplicitContent();
    return 0;
  }
  return v6;
}

- (id)valueForProperty:(id)a3
{
  return -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

- (BOOL)_isRatingSystemForApps:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_isRatingSystemForMovies:(int64_t)a3
{
  return (unint64_t)(a3 - 4) < 0xA || (unint64_t)(a3 - 23) < 0xD;
}

- (BOOL)_isRatingSystemForMusic:(int64_t)a3
{
  return a3 == 14;
}

- (BOOL)_isRatingSystemForTV:(int64_t)a3
{
  return (unint64_t)(a3 - 15) < 8;
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (void)setRatingDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)ratingSystem
{
  return self->_ratingSystem;
}

- (void)setRatingSystem:(int64_t)a3
{
  self->_ratingSystem = a3;
}

- (SSItemArtworkImage)ratingSystemLogo
{
  return self->_ratingSystemLogo;
}

- (void)setRatingSystemLogo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)shouldHideWhenRestricted
{
  return self->_shouldHideWhenRestricted;
}

- (void)setShouldHideWhenRestricted:(BOOL)a3
{
  self->_shouldHideWhenRestricted = a3;
}

@end
