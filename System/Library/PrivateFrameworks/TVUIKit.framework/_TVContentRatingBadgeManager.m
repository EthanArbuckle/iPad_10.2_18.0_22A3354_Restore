@implementation _TVContentRatingBadgeManager

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_0);
  return (id)sharedInstance___sharedInstance;
}

- (void)setCachesImages:(BOOL)a3
{
  id v4;

  if (self->_cachesImages != a3)
  {
    self->_cachesImages = a3;
    if (a3)
    {
      v4 = objc_alloc_init(MEMORY[0x24BDBCE40]);
      objc_msgSend(v4, "setCountLimit:", 20);
      objc_msgSend(v4, "setName:", CFSTR("_TVContentRatingBadgeManagerCache"));
    }
    else
    {
      v4 = 0;
    }
    -[_TVContentRatingBadgeManager setImageCache:](self, "setImageCache:", v4);

  }
}

- (id)badgeForContentRating:(id)a3 drawUnknownRatingBadge:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "ratingLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "ratingSystem");

  -[_TVContentRatingBadgeManager badgeForRatingLabel:inRatingSystem:drawUnknownRatingBadge:](self, "badgeForRatingLabel:inRatingSystem:drawUnknownRatingBadge:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)badgeForRatingLabel:(id)a3 inRatingSystem:(int64_t)a4 drawUnknownRatingBadge:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a5;
  v8 = a3;
  -[_TVContentRatingBadgeManager imageCache](self, "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_imageLookupKeyWithRatingLabel:inRatingSystem:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_13;
  -[_TVContentRatingBadgeManager _badgeDescriptorForRatingLabel:inRatingSystem:](self, "_badgeDescriptorForRatingLabel:inRatingSystem:", v8, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v11 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v12, "isTemplatedImage");
  objc_msgSend(v13, "resourceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x24BDF6AC8];
    +[TVUIKitUtilities TVUIKitBundle](TVUIKitUtilities, "TVUIKitBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageNamed:inBundle:", v14, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  if (!v11)
  {
LABEL_8:
    if (v5)
    {
      objc_msgSend((id)objc_opt_class(), "_imageForUnknownRatingLabel:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v11)
    objc_msgSend(v9, "setObject:forKey:", v11, v10);

LABEL_13:
  return v11;
}

- (BOOL)isTemplatedBadgeForContentRating:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[_TVContentRatingBadgeManager _badgeDescriptorForContentRating:](self, "_badgeDescriptorForContentRating:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isTemplatedImage");
  else
    v5 = 1;

  return v5;
}

- (NSDictionary)badgeDescriptors
{
  NSDictionary *badgeDescriptors;
  id v4;
  NSDictionary *v5;
  NSDictionary *v6;

  badgeDescriptors = self->_badgeDescriptors;
  if (!badgeDescriptors)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("g"), CFSTR("mpaa-g"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("pg"), CFSTR("mpaa-pg"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("pg13"), CFSTR("mpaa-pg13"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("r"), CFSTR("mpaa-r"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("nc17"), CFSTR("mpaa-nc17"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("nr"), CFSTR("nr"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("unrated"), CFSTR("unrated"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("ur"), CFSTR("unrated"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("tvy"), CFSTR("tv-y"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("tvy7"), CFSTR("tv-y7"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("tvy7fv"), CFSTR("tv-y7fv"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("tvg"), CFSTR("tv-g"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("tvpg"), CFSTR("tv-pg"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("tv14"), CFSTR("tv-14"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("tvma"), CFSTR("tv-ma"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("unrated"), CFSTR("unrated"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("ur"), CFSTR("unrated"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 92, CFSTR("g"), CFSTR("NZ-g"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 92, CFSTR("pg"), CFSTR("NZ-pg"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 92, CFSTR("m"), CFSTR("NZ-m"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 92, CFSTR("r13"), CFSTR("NZ-r13"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 92, CFSTR("r15"), CFSTR("NZ-r15"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 92, CFSTR("r16"), CFSTR("NZ-r16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 92, CFSTR("r18"), CFSTR("NZ-r18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 92, CFSTR("rp13"), CFSTR("NZ-rp13"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 92, CFSTR("rp16"), CFSTR("NZ-rp16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 92, CFSTR("r"), CFSTR("NZ-r"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 148, CFSTR("g"), CFSTR("NZ-g"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 148, CFSTR("pg"), CFSTR("NZ-pg"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 148, CFSTR("m"), CFSTR("NZ-m"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 148, CFSTR("r13"), CFSTR("NZ-r13"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 148, CFSTR("r15"), CFSTR("NZ-r15"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 148, CFSTR("r16"), CFSTR("NZ-r16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 148, CFSTR("r18"), CFSTR("NZ-r18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 148, CFSTR("rp13"), CFSTR("NZ-rp13"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 148, CFSTR("rp16"), CFSTR("NZ-rp16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 148, CFSTR("r"), CFSTR("NZ-r"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("l"), CFSTR("bars-l"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("10"), CFSTR("bars-10"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("12"), CFSTR("bars-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("14"), CFSTR("bars-14"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("16"), CFSTR("bars-16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("18"), CFSTR("bars-18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("l"), CFSTR("bars-l"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("10"), CFSTR("bars-10"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("12"), CFSTR("bars-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("14"), CFSTR("bars-14"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("16"), CFSTR("bars-16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("18"), CFSTR("bars-18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("u"), CFSTR("bbfc-u"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("pg"), CFSTR("bbfc-pg"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("12"), CFSTR("bbfc-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("12a"), CFSTR("bbfc-12a"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("15"), CFSTR("bbfc-15"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("18"), CFSTR("bbfc-18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("r18"), CFSTR("bbfc-r18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 116, CFSTR("12세 이상 관람가"), CFSTR("kr_movies-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 116, CFSTR("15세 이상 관람가"), CFSTR("kr_movies-15"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 116, CFSTR("청소년 관람불가"), CFSTR("kr_movies-18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 116, CFSTR("전체관람가"), CFSTR("kr_movies-all"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 150, CFSTR("7"), CFSTR("kr_tv-7"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 150, CFSTR("12"), CFSTR("kr_tv-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 150, CFSTR("15"), CFSTR("kr_tv-15"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 150, CFSTR("19"), CFSTR("kr_tv-19"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 150, CFSTR("all"), CFSTR("kr_tv-all"), 0);
    v5 = (NSDictionary *)objc_msgSend(v4, "copy");
    v6 = self->_badgeDescriptors;
    self->_badgeDescriptors = v5;

    badgeDescriptors = self->_badgeDescriptors;
  }
  return badgeDescriptors;
}

- (id)_badgeDescriptorForContentRating:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "ratingLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ratingSystem");

  -[_TVContentRatingBadgeManager _badgeDescriptorForRatingLabel:inRatingSystem:](self, "_badgeDescriptorForRatingLabel:inRatingSystem:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_badgeDescriptorForRatingLabel:(id)a3 inRatingSystem:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_badgeDescriptorLookupKeyWithRatingLabel:inRatingSystem:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVContentRatingBadgeManager badgeDescriptors](self, "badgeDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_badgeDescriptorLookupKeyWithRatingLabel:(id)a3 inRatingSystem:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v6 = a3;
    +[_TVContentRatingSystemUtilities stringForRatingSystem:](_TVContentRatingSystemUtilities, "stringForRatingSystem:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_cleanedRatingLabel:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)_cleanedRatingLabel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24FD41578);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_24FD41578);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_24FD41578);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)_addImageDescriptorToDictionary:(id)a3 ratingSystem:(int64_t)a4 ratingLabel:(id)a5 resourceName:(id)a6 isTemplatedImage:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  _TVContentRatingBadgeDescriptor *v13;
  void *v14;
  id v15;

  v7 = a7;
  v15 = a3;
  v11 = a6;
  v12 = a5;
  v13 = -[_TVContentRatingBadgeDescriptor initWithResourceName:isTemplatedImage:]([_TVContentRatingBadgeDescriptor alloc], "initWithResourceName:isTemplatedImage:", v11, v7);

  objc_msgSend((id)objc_opt_class(), "_badgeDescriptorLookupKeyWithRatingLabel:inRatingSystem:", v12, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v15, "setObject:forKey:", v13, v14);

}

+ (id)_imageLookupKeyWithRatingLabel:(id)a3 inRatingSystem:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(a1, "_badgeDescriptorLookupKeyWithRatingLabel:inRatingSystem:", v6, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

+ (id)_imageForUnknownRatingLabel:(id)a3
{
  return +[_TVContentRatingTextBadgeView _badgeImageWithAttributedRatingText:andColor:](_TVContentRatingTextBadgeView, "_badgeImageWithAttributedRatingText:andColor:", a3, 0);
}

- (BOOL)cachesImages
{
  return self->_cachesImages;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void)setBadgeDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_badgeDescriptors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeDescriptors, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
