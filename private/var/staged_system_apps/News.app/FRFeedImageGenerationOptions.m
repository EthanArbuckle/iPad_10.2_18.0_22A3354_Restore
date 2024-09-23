@implementation FRFeedImageGenerationOptions

+ (id)imageCacheName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageCacheDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));

  return v3;
}

+ (id)imageCachePrefix
{
  return CFSTR("TagCache-");
}

+ (id)imageCacheDirectory
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C5AC;
  block[3] = &unk_1000DBA48;
  block[4] = a1;
  if (qword_10010A530 != -1)
    dispatch_once(&qword_10010A530, block);
  return (id)qword_10010A528;
}

+ (void)prewarm
{
  id v2;

  v2 = objc_msgSend(a1, "topicColorsMapping");
}

+ (id)topicColorsMapping
{
  if (qword_10010A520 != -1)
    dispatch_once(&qword_10010A520, &stru_1000DBA28);
  return (id)qword_10010A518;
}

+ (id)backgroundColorForFeed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  double v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  float v25;
  uint64_t v26;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "theme"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backingTag"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ne_color"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.047, 0.376, 0.996, 1.0));
  v11 = v10;

  v30 = 0.0;
  v31 = 0;
  v28 = 0;
  v29 = 0.0;
  objc_msgSend(v11, "getHue:saturation:brightness:alpha:", &v31, &v30, &v29, &v28);
  v12 = v29;
  if (v29 > 0.9)
  {
    v12 = v30;
    if (v30 < 0.1)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor", v30));

      v11 = (void *)v13;
    }
  }
  if (objc_msgSend(v6, "tagType", v12) == (id)1
    || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundColor")), v14, !v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_topicGradientColorsFromHashedIdentifier:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("bottom")));
    if ((unint64_t)objc_msgSend(v17, "count") >= 3)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v18, "floatValue");
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 1));
      objc_msgSend(v21, "floatValue");
      v23 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 2));
      objc_msgSend(v24, "floatValue");
      v26 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v20, v23, v25, 1.0));

      v11 = (void *)v26;
    }

  }
  return v11;
}

+ (id)_topicGradientColorsFromHashedIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unint64_t v8;
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
  BOOL v19;
  id v20;
  void *v21;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(a1, v5), "topicColorsMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (unint64_t)objc_msgSend(v4, "hash");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v8 % (unint64_t)objc_msgSend(v7, "count")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("top")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_colorComponentsFromString:](UIColor, "fr_colorComponentsFromString:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bottom")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_colorComponentsFromString:](UIColor, "fr_colorComponentsFromString:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("text")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_colorComponentsFromString:](UIColor, "fr_colorComponentsFromString:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("stroke")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_colorComponentsFromString:](UIColor, "fr_colorComponentsFromString:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("alpha2")));
  if (v11)
    v19 = v13 == 0;
  else
    v19 = 1;
  if (v19)
  {
    v20 = 0;
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 4));
    objc_msgSend(v21, "setObject:forKey:", v11, CFSTR("top"));
    objc_msgSend(v21, "setObject:forKey:", v13, CFSTR("bottom"));
    if (v15)
      objc_msgSend(v21, "setObject:forKey:", v15, CFSTR("text"));
    if (v17)
      objc_msgSend(v21, "setObject:forKey:", v17, CFSTR("stroke"));
    if (v18)
      objc_msgSend(v21, "setObject:forKey:", v18, CFSTR("alpha2"));
    v20 = objc_msgSend(v21, "copy");

  }
  return v20;
}

+ (id)pathForIdentifier:(id)a3 size:(CGSize)a4 cornerRadius:(double)a5 punchThroughBanner:(BOOL)a6 scale:(double)a7 sizeCategory:(id)a8 parentBackgroundColor:(id)a9
{
  void *v10;
  void *v11;
  void *v12;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keyForIdentifier:size:cornerRadius:punchThroughBanner:scale:sizeCategory:parentBackgroundColor:", a3, a6, a8, a9, a4.width, a4.height, a5, a7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageCacheDirectory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v10));

  return v12;
}

+ (id)keyForIdentifier:(id)a3 size:(CGSize)a4 cornerRadius:(double)a5 punchThroughBanner:(BOOL)a6 scale:(double)a7 sizeCategory:(id)a8 parentBackgroundColor:(id)a9
{
  _BOOL4 v11;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v11 = a6;
  height = a4.height;
  width = a4.width;
  v17 = objc_retainAutorelease(a9);
  v18 = a8;
  v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%ld,%ld-%ld-%ld-%ld-%@-%lu"), v19, (uint64_t)width, (uint64_t)height, (uint64_t)a7, (uint64_t)a5, v11, v18, objc_msgSend(a1, "keyForColor:", objc_msgSend(v17, "CGColor"))));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v20, "hash")));
  return v21;
}

+ (unint64_t)keyForColor:(CGColor *)a3
{
  size_t NumberOfComponents;
  const CGFloat *Components;
  double *v6;
  unint64_t result;
  double v8;

  if (!a3)
    return 0;
  NumberOfComponents = CGColorGetNumberOfComponents(a3);
  Components = CGColorGetComponents(a3);
  if (!NumberOfComponents)
    return 0;
  v6 = (double *)Components;
  result = 0;
  do
  {
    v8 = *v6++;
    result = (unint64_t)((double)(result << 8) + v8 * 255.0);
    --NumberOfComponents;
  }
  while (NumberOfComponents);
  return result;
}

- (FRFeedImageGenerationOptions)initWithFeed:(id)a3 size:(CGSize)a4 punchThroughEffect:(BOOL)a5 cornerRadius:(double)a6 scale:(double)a7 sizeCategory:(id)a8 parentBackgroundColor:(id)a9
{
  _BOOL8 v13;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  FRFeedImageGenerationOptions *v20;
  FCFeedDescriptor *v21;
  FCFeedDescriptor *feed;
  NSString *v23;
  NSString *sizeCategory;
  void *v25;
  void *v26;
  NSString *v27;
  NSString *cachedImagePath;
  uint64_t v29;
  UIColor *feedBackgroundColor;
  objc_super v32;

  v13 = a5;
  height = a4.height;
  width = a4.width;
  v17 = a3;
  v18 = a8;
  v19 = a9;
  v32.receiver = self;
  v32.super_class = (Class)FRFeedImageGenerationOptions;
  v20 = -[FRFeedImageGenerationOptions init](&v32, "init");
  if (v20)
  {
    v21 = (FCFeedDescriptor *)objc_msgSend(v17, "copy");
    feed = v20->_feed;
    v20->_feed = v21;

    v23 = (NSString *)objc_msgSend(v18, "copy");
    sizeCategory = v20->_sizeCategory;
    v20->_sizeCategory = v23;

    v20->_size.width = width;
    v20->_size.height = height;
    v20->_scale = a7;
    v20->_punchThroughEffect = v13;
    v20->_cornerRadius = a6;
    objc_storeStrong((id *)&v20->_parentBackgroundColor, a9);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[FRFeedImageGenerationOptions pathForIdentifier:size:cornerRadius:punchThroughBanner:scale:sizeCategory:parentBackgroundColor:](FRFeedImageGenerationOptions, "pathForIdentifier:size:cornerRadius:punchThroughBanner:scale:sizeCategory:parentBackgroundColor:", v25, v13, v18, v19, width, height, a6, a7));
    v27 = (NSString *)objc_msgSend(v26, "copy");
    cachedImagePath = v20->_cachedImagePath;
    v20->_cachedImagePath = v27;

    v29 = objc_claimAutoreleasedReturnValue(+[FRFeedImageGenerationOptions backgroundColorForFeed:](FRFeedImageGenerationOptions, "backgroundColorForFeed:", v17));
    feedBackgroundColor = v20->_feedBackgroundColor;
    v20->_feedBackgroundColor = (UIColor *)v29;

  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v4 = objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOptions feed](self, "feed"));
  -[FRFeedImageGenerationOptions size](self, "size");
  v7 = v6;
  v9 = v8;
  v10 = -[FRFeedImageGenerationOptions punchThroughEffect](self, "punchThroughEffect");
  -[FRFeedImageGenerationOptions cornerRadius](self, "cornerRadius");
  v12 = v11;
  -[FRFeedImageGenerationOptions scale](self, "scale");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOptions sizeCategory](self, "sizeCategory"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOptions parentBackgroundColor](self, "parentBackgroundColor"));
  v17 = objc_msgSend(v4, "initWithFeed:size:punchThroughEffect:cornerRadius:scale:sizeCategory:parentBackgroundColor:", v5, v10, v15, v16, v7, v9, v12, v14);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOptions cachedImagePath](self, "cachedImagePath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cachedImagePath"));

    v10 = objc_msgSend(v8, "isEqualToString:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedImageGenerationOptions cachedImagePath](self, "cachedImagePath"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (FCFeedDescriptor)feed
{
  return self->_feed;
}

- (BOOL)punchThroughEffect
{
  return self->_punchThroughEffect;
}

- (NSString)sizeCategory
{
  return self->_sizeCategory;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (NSString)cachedImagePath
{
  return self->_cachedImagePath;
}

- (UIColor)feedBackgroundColor
{
  return self->_feedBackgroundColor;
}

- (UIColor)parentBackgroundColor
{
  return self->_parentBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_feedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_cachedImagePath, 0);
  objc_storeStrong((id *)&self->_sizeCategory, 0);
  objc_storeStrong((id *)&self->_feed, 0);
}

@end
