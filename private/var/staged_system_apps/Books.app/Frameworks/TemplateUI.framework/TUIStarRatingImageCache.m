@implementation TUIStarRatingImageCache

+ (id)sharedInstance
{
  if (qword_2CB4D0 != -1)
    dispatch_once(&qword_2CB4D0, &stru_23FED8);
  return (id)qword_2CB4C8;
}

- (TUIStarRatingImageCache)init
{
  TUIStarRatingImageCache *v2;
  NSCache *v3;
  NSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIStarRatingImageCache;
  v2 = -[TUIStarRatingImageCache init](&v6, "init");
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

- (id)ratingStarsImageWithName:(id)a3 starSize:(double)a4 starCount:(unint64_t)a5 starPadding:(double)a6 traitCollection:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a3;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStarRatingImageCache _cacheKeyFromRatingStarsImageName:starSize:starCount:starPadding:traitCollection:](self, "_cacheKeyFromRatingStarsImageName:starSize:starCount:starPadding:traitCollection:", v12, a5, v13, a4, a6));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSCache objectForKey:](self->_cache, "objectForKey:", v14));
  if (!v15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIStarRatingImageCache _generateImageForRatingStarsImageName:starSize:starCount:starPadding:traitCollection:](self, "_generateImageForRatingStarsImageName:starSize:starCount:starPadding:traitCollection:", v12, a5, v13, a4, a6));
    -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v15, v14);
  }

  return v15;
}

- (id)_cacheKeyFromRatingStarsImageName:(id)a3 starSize:(double)a4 starCount:(unint64_t)a5 starPadding:(double)a6 traitCollection:(id)a7
{
  id v11;
  uint64_t v12;
  void *v13;

  v11 = a3;
  objc_msgSend(a7, "displayScale");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("img%@-starSize%f-starCount%lu-starPadding%f-contentsScale%f"), v11, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, v12));

  return v13;
}

- (id)_generateImageForRatingStarsImageName:(id)a3 starSize:(double)a4 starCount:(int64_t)a5 starPadding:(double)a6 traitCollection:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v37[4];
  id v38;
  int64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;

  v11 = a7;
  v12 = a3;
  if (UIAccessibilityIsBoldTextEnabled())
    v13 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 7, a4));
  else
    v13 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", a4));
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v12));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageWithConfiguration:", v14));
  if (v16)
  {
    objc_msgSend(v16, "size");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v16, "contentInsets");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v29 = v18 - v23 - v27;
    v30 = v20 - v21 - v25;
    v31 = objc_alloc((Class)UIGraphicsImageRenderer);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat formatForTraitCollection:](UIGraphicsImageRendererFormat, "formatForTraitCollection:", v11));
    v33 = objc_msgSend(v31, "initWithSize:format:", v32, ceil((double)(a5 - 1) * a6 + v29 * (double)a5), v30);

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_79E98;
    v37[3] = &unk_23FF00;
    v39 = a5;
    v38 = v16;
    v40 = v22;
    v41 = v24;
    v42 = v26;
    v43 = v28;
    v44 = v29;
    v45 = v30;
    v46 = a6;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "imageWithActions:", v37));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "imageWithRenderingMode:", 2));

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
