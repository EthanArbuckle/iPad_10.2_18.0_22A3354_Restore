@implementation MOEventPhoto

+ (id)descriptionOfPhotoMomentSource:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Invalid");
  else
    return off_1002AFAA0[a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MOEventExtendedAttributes *extendedAttributes;
  id v5;

  extendedAttributes = self->_extendedAttributes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", extendedAttributes, CFSTR("extendedAttributes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_photoMomentSource, CFSTR("photoMomentSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoMemoryTitle, CFSTR("photoMemoryTitle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_photoMemoryCategory, CFSTR("photoMemoryCategory"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_photoMemorySubCategory, CFSTR("photoMemorySubCategory"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_photoMemoryRelevanceScore, CFSTR("photoMemoryRelevanceScore"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_photoMemoryIsFavorite, CFSTR("photoMemoryIsFavorite"));

}

- (MOEventPhoto)initWithCoder:(id)a3
{
  id v4;
  MOEventPhoto *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  MOEventExtendedAttributes *extendedAttributes;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *photoMemoryTitle;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MOEventPhoto;
  v5 = -[MOEventPhoto init](&v15, "init");
  if (v5)
  {
    v5->_photoMomentSource = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("photoMomentSource"));
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOEventExtendedAttributes, v6), CFSTR("extendedAttributes"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    extendedAttributes = v5->_extendedAttributes;
    v5->_extendedAttributes = (MOEventExtendedAttributes *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("photoMemoryTitle"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    photoMemoryTitle = v5->_photoMemoryTitle;
    v5->_photoMemoryTitle = (NSString *)v12;

    v5->_photoMemoryCategory = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("photoMemoryCategory"));
    v5->_photoMemorySubCategory = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("photoMemorySubCategory"));
    v5->_photoMemoryRelevanceScore = (double)(uint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("photoMemoryRelevanceScore"));
    v5->_photoMemoryIsFavorite = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("photoMemoryIsFavorite")) != 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventPhoto *v4;

  v4 = objc_alloc_init(MOEventPhoto);
  v4->_photoMomentSource = self->_photoMomentSource;
  objc_storeStrong((id *)&v4->_extendedAttributes, self->_extendedAttributes);
  objc_storeStrong((id *)&v4->_photoMemoryTitle, self->_photoMemoryTitle);
  v4->_photoMemoryCategory = self->_photoMemoryCategory;
  v4->_photoMemorySubCategory = self->_photoMemorySubCategory;
  v4->_photoMemoryRelevanceScore = self->_photoMemoryRelevanceScore;
  v4->_photoMemoryIsFavorite = self->_photoMemoryIsFavorite;
  objc_storeStrong((id *)&v4->_photoAsset, self->_photoAsset);
  objc_storeStrong((id *)&v4->_photoMemoryAssets, self->_photoMemoryAssets);
  return v4;
}

- (id)description
{
  id v3;
  MOEventExtendedAttributes *extendedAttributes;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)NSString);
  extendedAttributes = self->_extendedAttributes;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventPhoto descriptionOfPhotoMomentSource:](MOEventPhoto, "descriptionOfPhotoMomentSource:", self->_photoMomentSource));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString mask](self->_photoMemoryTitle, "mask"));
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("extendedAttributes, %@, photo source,%@, photoMemoryTitle, %@, photoMemoryCategory,%lu, photoMemorySubCategory,%lu, photoMemoryRelevanceScore, %f, photoMemoryIsFavorite, %d"), extendedAttributes, v5, v6, self->_photoMemoryCategory, self->_photoMemorySubCategory, *(_QWORD *)&self->_photoMemoryRelevanceScore, self->_photoMemoryIsFavorite);

  return v7;
}

- (unint64_t)photoMomentSource
{
  return self->_photoMomentSource;
}

- (void)setPhotoMomentSource:(unint64_t)a3
{
  self->_photoMomentSource = a3;
}

- (MOEventExtendedAttributes)extendedAttributes
{
  return self->_extendedAttributes;
}

- (void)setExtendedAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_extendedAttributes, a3);
}

- (PHAsset)photoAsset
{
  return self->_photoAsset;
}

- (void)setPhotoAsset:(id)a3
{
  objc_storeStrong((id *)&self->_photoAsset, a3);
}

- (NSString)photoMemoryTitle
{
  return self->_photoMemoryTitle;
}

- (void)setPhotoMemoryTitle:(id)a3
{
  objc_storeStrong((id *)&self->_photoMemoryTitle, a3);
}

- (NSArray)photoMemoryAssets
{
  return self->_photoMemoryAssets;
}

- (void)setPhotoMemoryAssets:(id)a3
{
  objc_storeStrong((id *)&self->_photoMemoryAssets, a3);
}

- (unint64_t)photoMemoryCategory
{
  return self->_photoMemoryCategory;
}

- (void)setPhotoMemoryCategory:(unint64_t)a3
{
  self->_photoMemoryCategory = a3;
}

- (unint64_t)photoMemorySubCategory
{
  return self->_photoMemorySubCategory;
}

- (void)setPhotoMemorySubCategory:(unint64_t)a3
{
  self->_photoMemorySubCategory = a3;
}

- (BOOL)photoMemoryIsFavorite
{
  return self->_photoMemoryIsFavorite;
}

- (void)setPhotoMemoryIsFavorite:(BOOL)a3
{
  self->_photoMemoryIsFavorite = a3;
}

- (double)photoMemoryRelevanceScore
{
  return self->_photoMemoryRelevanceScore;
}

- (void)setPhotoMemoryRelevanceScore:(double)a3
{
  self->_photoMemoryRelevanceScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoMemoryAssets, 0);
  objc_storeStrong((id *)&self->_photoMemoryTitle, 0);
  objc_storeStrong((id *)&self->_photoAsset, 0);
  objc_storeStrong((id *)&self->_extendedAttributes, 0);
}

@end
