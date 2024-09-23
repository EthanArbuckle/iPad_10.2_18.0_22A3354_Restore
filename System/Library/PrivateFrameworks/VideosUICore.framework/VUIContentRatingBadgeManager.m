@implementation VUIContentRatingBadgeManager

+ (id)_badgeDescriptorLookupKeyWithRatingLabel:(id)a3 inRatingSystem:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v6 = a3;
    +[VUIContentRatingSystemUtilities stringForRatingSystem:](VUIContentRatingSystemUtilities, "stringForRatingSystem:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_cleanedRatingLabel:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v7, v8);
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

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E9F2D140);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E9F2D140);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), &stru_1E9F2D140);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("g"), CFSTR("mpaa-g"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("pg"), CFSTR("mpaa-pg"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("pg13"), CFSTR("mpaa-pg13"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("r"), CFSTR("mpaa-r"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("nc17"), CFSTR("mpaa-nc17"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("nr"), CFSTR("nr"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("unrated"), CFSTR("unrated"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 135, CFSTR("ur"), CFSTR("unrated"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 153, CFSTR("tvy"), CFSTR("tv-y"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 153, CFSTR("tvy7"), CFSTR("tv-y7"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 153, CFSTR("tvy7fv"), CFSTR("tv-y7fv"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 153, CFSTR("tvg"), CFSTR("tv-g"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 153, CFSTR("tvpg"), CFSTR("tv-pg"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 153, CFSTR("tv14"), CFSTR("tv-14"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 153, CFSTR("tvma"), CFSTR("tv-ma"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 153, CFSTR("unrated"), CFSTR("unrated"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 153, CFSTR("ur"), CFSTR("unrated"), 1);
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
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 149, CFSTR("g"), CFSTR("NZ-g"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 149, CFSTR("pg"), CFSTR("NZ-pg"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 149, CFSTR("m"), CFSTR("NZ-m"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 149, CFSTR("r13"), CFSTR("NZ-r13"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 149, CFSTR("r15"), CFSTR("NZ-r15"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 149, CFSTR("r16"), CFSTR("NZ-r16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 149, CFSTR("r18"), CFSTR("NZ-r18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 149, CFSTR("rp13"), CFSTR("NZ-rp13"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 149, CFSTR("rp16"), CFSTR("NZ-rp16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 149, CFSTR("r"), CFSTR("NZ-r"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("l"), CFSTR("bars-l"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("10"), CFSTR("bars-10"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("12"), CFSTR("bars-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("14"), CFSTR("bars-14"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("16"), CFSTR("bars-16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("18"), CFSTR("bars-18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("al"), CFSTR("bars-al"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("a10"), CFSTR("bars-a10"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("a12"), CFSTR("bars-a12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("a14"), CFSTR("bars-a14"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("a16"), CFSTR("bars-a16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 21, CFSTR("a18"), CFSTR("bars-a18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("l"), CFSTR("bars-l"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("10"), CFSTR("bars-10"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("12"), CFSTR("bars-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("14"), CFSTR("bars-14"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("16"), CFSTR("bars-16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("18"), CFSTR("bars-18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("al"), CFSTR("bars-al"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("a10"), CFSTR("bars-a10"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("a12"), CFSTR("bars-a12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("a14"), CFSTR("bars-a14"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("a16"), CFSTR("bars-a16"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 143, CFSTR("a18"), CFSTR("bars-a18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 129, CFSTR("genel i̇zleyici"), CFSTR("tr-ga"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 129, CFSTR("6a"), CFSTR("tr-6a"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 129, CFSTR("6+"), CFSTR("tr-6plus"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 129, CFSTR("10a"), CFSTR("tr-10a"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 129, CFSTR("10+"), CFSTR("tr-10plus"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 129, CFSTR("13a"), CFSTR("tr-13a"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 129, CFSTR("13+"), CFSTR("tr-13plus"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 129, CFSTR("16+"), CFSTR("tr-16plus"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 129, CFSTR("18+"), CFSTR("tr-18plus"), 1);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("u"), CFSTR("bbfc-u"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("pg"), CFSTR("bbfc-pg"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("12"), CFSTR("bbfc-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("12a"), CFSTR("bbfc-12a"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("15"), CFSTR("bbfc-15"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("18"), CFSTR("bbfc-18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 134, CFSTR("r18"), CFSTR("bbfc-r18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("u"), CFSTR("bbfc-u"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("pg"), CFSTR("bbfc-pg"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("12"), CFSTR("bbfc-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("12a"), CFSTR("bbfc-12a"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("15"), CFSTR("bbfc-15"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("18"), CFSTR("bbfc-18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 152, CFSTR("r18"), CFSTR("bbfc-r18"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 116, CFSTR("12세 이상 관람가"), CFSTR("kr_movies-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 116, CFSTR("15세 이상 관람가"), CFSTR("kr_movies-15"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 116, CFSTR("청소년 관람불가"), CFSTR("kr_movies-19"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 116, CFSTR("전체관람가"), CFSTR("kr_movies-all"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 151, CFSTR("7"), CFSTR("kr_tv-7"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 151, CFSTR("12"), CFSTR("kr_tv-12"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 151, CFSTR("15"), CFSTR("kr_tv-15"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 151, CFSTR("19"), CFSTR("kr_tv-19"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 151, CFSTR("all"), CFSTR("kr_tv-all"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 65, CFSTR("t"), CFSTR("it-t"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 65, CFSTR("6+"), CFSTR("it-6plus"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 65, CFSTR("14+"), CFSTR("it-14plus"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 65, CFSTR("18+"), CFSTR("it-18plus"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 147, CFSTR("t"), CFSTR("it-t"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 147, CFSTR("6+"), CFSTR("it-6plus"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 147, CFSTR("14+"), CFSTR("it-14plus"), 0);
    objc_msgSend((id)objc_opt_class(), "_addImageDescriptorToDictionary:ratingSystem:ratingLabel:resourceName:isTemplatedImage:", v4, 147, CFSTR("18+"), CFSTR("it-18plus"), 0);
    v5 = (NSDictionary *)objc_msgSend(v4, "copy");
    v6 = self->_badgeDescriptors;
    self->_badgeDescriptors = v5;

    badgeDescriptors = self->_badgeDescriptors;
  }
  return badgeDescriptors;
}

+ (void)_addImageDescriptorToDictionary:(id)a3 ratingSystem:(int64_t)a4 ratingLabel:(id)a5 resourceName:(id)a6 isTemplatedImage:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  VUIContentRatingBadgeDescriptor *v13;
  void *v14;
  id v15;

  v7 = a7;
  v15 = a3;
  v11 = a6;
  v12 = a5;
  v13 = -[VUIContentRatingBadgeDescriptor initWithResourceName:isTemplatedImage:]([VUIContentRatingBadgeDescriptor alloc], "initWithResourceName:isTemplatedImage:", v11, v7);

  objc_msgSend((id)objc_opt_class(), "_badgeDescriptorLookupKeyWithRatingLabel:inRatingSystem:", v12, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v15, "setObject:forKey:", v13, v14);

}

void __46__VUIContentRatingBadgeManager_sharedInstance__block_invoke()
{
  VUIContentRatingBadgeManager *v0;
  void *v1;

  v0 = objc_alloc_init(VUIContentRatingBadgeManager);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

- (NSCache)imageCache
{
  return self->_imageCache;
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
  -[VUIContentRatingBadgeManager imageCache](self, "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_imageLookupKeyWithRatingLabel:inRatingSystem:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_13;
  -[VUIContentRatingBadgeManager _badgeDescriptorForRatingLabel:inRatingSystem:](self, "_badgeDescriptorForRatingLabel:inRatingSystem:", v8, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v11 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v12, "resourceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CEA638];
    +[VUICoreUtilities VideosUICoreBundle](VUICoreUtilities, "VideosUICoreBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "vuiImageNamed:inBundle:", v14, v16);
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

  -[VUIContentRatingBadgeManager badgeForRatingLabel:inRatingSystem:drawUnknownRatingBadge:](self, "badgeForRatingLabel:inRatingSystem:drawUnknownRatingBadge:", v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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

  -[VUIContentRatingBadgeManager badgeDescriptors](self, "badgeDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_13);
  return (id)sharedInstance___sharedInstance_0;
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

- (void)setCachesImages:(BOOL)a3
{
  id v4;

  if (self->_cachesImages != a3)
  {
    self->_cachesImages = a3;
    if (a3)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99D38]);
      objc_msgSend(v4, "setCountLimit:", 20);
      objc_msgSend(v4, "setName:", CFSTR("VUIContentRatingBadgeManagerCache"));
    }
    else
    {
      v4 = 0;
    }
    -[VUIContentRatingBadgeManager setImageCache:](self, "setImageCache:", v4);

  }
}

- (BOOL)isTemplatedBadgeForContentRating:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[VUIContentRatingBadgeManager _badgeDescriptorForContentRating:](self, "_badgeDescriptorForContentRating:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isTemplatedImage");
  else
    v5 = 1;

  return v5;
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

  -[VUIContentRatingBadgeManager _badgeDescriptorForRatingLabel:inRatingSystem:](self, "_badgeDescriptorForRatingLabel:inRatingSystem:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_imageForUnknownRatingLabel:(id)a3
{
  return +[VUIContentRatingTextBadgeView _badgeImageWithAttributedRatingText:andColor:](VUIContentRatingTextBadgeView, "_badgeImageWithAttributedRatingText:andColor:", a3, 0);
}

- (BOOL)cachesImages
{
  return self->_cachesImages;
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
