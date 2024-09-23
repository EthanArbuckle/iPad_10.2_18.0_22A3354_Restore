@implementation SSItemContentRating

- (SSItemContentRating)init
{
  SSItemContentRating *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSItemContentRating;
  v2 = -[SSItemContentRating init](&v4, sel_init);
  if (v2)
    v2->_dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (SSItemContentRating)initWithDictionary:(id)a3
{
  SSItemContentRating *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSItemContentRating;
  v4 = -[SSItemContentRating init](&v6, sel_init);
  if (v4)
    v4->_dictionary = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemContentRating;
  -[SSItemContentRating dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = -[NSMutableDictionary mutableCopyWithZone:](self->_dictionary, "mutableCopyWithZone:", a3);
  return v5;
}

- (BOOL)isExplicitContent
{
  int64_t v3;

  v3 = -[SSItemContentRating ratingSystem](self, "ratingSystem");
  return (v3 == 14 || v3 == 1) && -[SSItemContentRating rank](self, "rank") == 200;
}

- (BOOL)isRestricted
{
  int64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v3 = -[SSItemContentRating ratingSystem](self, "ratingSystem");
  if (-[SSItemContentRating _isRatingSystemForApps:](self, "_isRatingSystemForApps:", v3))
  {
    v4 = 0;
  }
  else if (-[SSItemContentRating _isRatingSystemForMovies:](self, "_isRatingSystemForMovies:", v3))
  {
    v4 = 1;
  }
  else
  {
    if (!-[SSItemContentRating _isRatingSystemForTV:](self, "_isRatingSystemForTV:", v3))
      goto LABEL_9;
    v4 = 2;
  }
  v5 = SSRestrictionsCopyRankForMediaType(v4);
  if (v5)
  {
    v6 = v5;
    v7 = -[SSItemContentRating rank](self, "rank");
    v8 = v7 > objc_msgSend(v6, "integerValue");

    return v8;
  }
LABEL_9:
  if (-[SSItemContentRating isExplicitContent](self, "isExplicitContent"))
    return SSRestrictionsShouldRestrictExplicitContent();
  return 0;
}

- (int64_t)rank
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("rank"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (int)objc_msgSend(v2, "intValue");
  else
    return 0;
}

- (NSString)ratingDescription
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("description"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (NSString)ratingLabel
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("label"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)v2;
  else
    return 0;
}

- (int64_t)ratingSystem
{
  uint64_t v2;

  v2 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("system"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend((id)objc_opt_class(), "ratingSystemFromString:", v2);
  else
    return 0;
}

- (void)setRank:(int64_t)a3
{
  -[SSItemContentRating _setValue:forProperty:](self, "_setValue:forProperty:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), CFSTR("rank"));
}

- (void)setRatingDescription:(id)a3
{
  -[SSItemContentRating _setValueCopy:forProperty:](self, "_setValueCopy:forProperty:", a3, CFSTR("description"));
}

- (void)setRatingLabel:(id)a3
{
  -[SSItemContentRating _setValueCopy:forProperty:](self, "_setValueCopy:forProperty:", a3, CFSTR("label"));
}

- (void)setRatingSystem:(int64_t)a3
{
  -[SSItemContentRating _setValue:forProperty:](self, "_setValue:forProperty:", objc_msgSend((id)objc_opt_class(), "stringForRatingSystem:", a3), CFSTR("system"));
}

- (void)setShouldHideWhenRestricted:(BOOL)a3
{
  -[SSItemContentRating _setValue:forProperty:](self, "_setValue:forProperty:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3), CFSTR("hide-item-if-restricted"));
}

- (BOOL)shouldHideWhenRestricted
{
  void *v2;

  v2 = (void *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("hide-item-if-restricted"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

+ (int64_t)ratingSystemFromString:(id)a3
{
  uint64_t v4;

  v4 = 0;
  while (-[__CFString caseInsensitiveCompare:](*(__CFString **)((char *)&kRatingSystems + v4), "caseInsensitiveCompare:", a3))
  {
    v4 += 16;
    if (v4 == 1536)
      return 0;
  }
  return *(int64_t *)((char *)&kRatingSystems + v4 + 8);
}

+ (id)stringForRatingSystem:(int64_t)a3
{
  uint64_t v3;

  v3 = 0;
  while (*(__CFString **)((char *)&kRatingSystems + v3 + 8) != (__CFString *)a3)
  {
    v3 += 16;
    if (v3 == 1536)
      return 0;
  }
  return *(__CFString **)((char *)&kRatingSystems + v3);
}

- (NSDictionary)contentRatingDictionary
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_dictionary, "copy");
}

- (SSItemArtworkImage)ratingSystemLogo
{
  uint64_t v2;
  SSItemArtworkImage *v3;

  v2 = -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("logo-artwork-url"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  v3 = -[SSItemArtworkImage initWithArtworkDictionary:]([SSItemArtworkImage alloc], "initWithArtworkDictionary:", v2);
  if (!-[SSItemArtworkImage URL](v3, "URL"))
  {

LABEL_4:
    v3 = 0;
  }
  return v3;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_dictionary);
  return v3;
}

- (SSItemContentRating)initWithXPCEncoding:(id)a3
{
  SSItemContentRating *v5;
  objc_super v7;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSItemContentRating;
    v5 = -[SSItemContentRating init](&v7, sel_init);
    if (v5)
    {
      objc_opt_class();
      v5->_dictionary = (NSMutableDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (BOOL)_isRatingSystemForApps:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_isRatingSystemForMovies:(int64_t)a3
{
  return (unint64_t)(a3 - 4) < 0xA || (unint64_t)(a3 - 23) < 0x49;
}

- (BOOL)_isRatingSystemForMusic:(int64_t)a3
{
  return a3 == 14;
}

- (BOOL)_isRatingSystemForTV:(int64_t)a3
{
  return (unint64_t)(a3 - 15) < 8;
}

- (void)_setValueCopy:(id)a3 forProperty:(id)a4
{
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[SSItemContentRating _setValue:forProperty:](self, "_setValue:forProperty:", v6, a4);

}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](dictionary, "removeObjectForKey:", a4);
}

@end
