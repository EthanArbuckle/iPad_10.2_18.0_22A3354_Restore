@implementation _BCPPTImageSet

- (id)imageColor
{
  if (qword_30D510 != -1)
    dispatch_once(&qword_30D510, &stru_28BEF0);
  return objc_msgSend((id)qword_30D508, "objectAtIndexedSubscript:", arc4random() % (unint64_t)objc_msgSend((id)qword_30D508, "count"));
}

+ (id)imageSetWithEntry:(id)a3
{
  id v3;
  _BCPPTImageSet *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;

  v3 = a3;
  v4 = objc_opt_new(_BCPPTImageSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  -[_BCPPTImageSet setIdentifier:](v4, "setIdentifier:", v6);

  v10 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

  -[_BCPPTImageSet setImageEntries:](v4, "setImageEntries:", v8);
  return v4;
}

- (id)primaryEntry
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BCPPTImageSet imageEntries](self, "imageEntries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

- (int)requestCount
{
  return self->requestCount;
}

- (void)setRequestCount:(int)a3
{
  self->requestCount = a3;
}

- (BOOL)actualAspectRatio
{
  return self->actualAspectRatio;
}

- (void)setActualAspectRatio:(BOOL)a3
{
  self->actualAspectRatio = a3;
}

- (float)heightForAspectRatio
{
  return self->heightForAspectRatio;
}

- (void)setHeightForAspectRatio:(float)a3
{
  self->heightForAspectRatio = a3;
}

- (float)widthForAspectRatio
{
  return self->widthForAspectRatio;
}

- (void)setWidthForAspectRatio:(float)a3
{
  self->widthForAspectRatio = a3;
}

- (int64_t)imageColorARGBHex
{
  return self->imageColorARGBHex;
}

- (void)setImageColorARGBHex:(int64_t)a3
{
  self->imageColorARGBHex = a3;
}

- (NSDate)dateRequested
{
  return self->dateRequested;
}

- (void)setDateRequested:(id)a3
{
  objc_storeStrong((id *)&self->dateRequested, a3);
}

- (NSSet)imageEntries
{
  return self->imageEntries;
}

- (void)setImageEntries:(id)a3
{
  objc_storeStrong((id *)&self->imageEntries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imageEntries, 0);
  objc_storeStrong((id *)&self->dateRequested, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
