@implementation BKLibraryStarRating

- (BKLibraryStarRating)initWithFrame:(CGRect)a3
{
  BKLibraryStarRating *v3;
  uint64_t v4;
  UIColor *fillColor;
  uint64_t v6;
  UIColor *frameColor;
  uint64_t v8;
  UIColor *emptyColor;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKLibraryStarRating;
  v3 = -[BKLibraryStarRating initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    fillColor = v3->_fillColor;
    v3->_fillColor = (UIColor *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    frameColor = v3->_frameColor;
    v3->_frameColor = (UIColor *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    emptyColor = v3->_emptyColor;
    v3->_emptyColor = (UIColor *)v8;

    v3->_numberOfStars = 5.0;
    v3->_starSize = 0;
    v3->_allowHalfStars = 1;
  }
  return v3;
}

- (id)templateStar:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[BKLibraryStarRating starSize](self, "starSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageResourceCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating _screen](self, "_screen"));
  objc_msgSend(v8, "scale");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRatingsBox starRatingImage:size:fromCache:withScale:](TUIRatingsBox, "starRatingImage:size:fromCache:withScale:", a3, v5, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithRenderingMode:", 2));
  return v10;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  float v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BKLibraryStarRating bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v24.receiver = self;
  v24.super_class = (Class)BKLibraryStarRating;
  -[BKLibraryStarRating setFrame:](&v24, "setFrame:", x, y, width, height);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v12 = CGRectGetWidth(v25);
  if (v12 > 0.0)
  {
    if (v12 <= -3.40282347e38)
    {
      v15 = 0x7FC00000FF7FFFFFLL;
    }
    else
    {
      v13 = v12 < 3.40282347e38;
      v14 = v12;
      if (v13)
        v15 = LODWORD(v14) | 0x7FC0000000000000;
      else
        v15 = 0x7FC000007F7FFFFFLL;
    }
    v16 = +[TUIRatingsBox sizeFromWidth:](TUIRatingsBox, "sizeFromWidth:", v15, 0x1700007FC00000);
    if (v16 != (id)-[BKLibraryStarRating starSize](self, "starSize")
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating fullStar](self, "fullStar")),
          v17,
          !v17))
    {
      -[BKLibraryStarRating setStarSize:](self, "setStarSize:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating templateStar:](self, "templateStar:", 0));
      -[BKLibraryStarRating setOutlineStar:](self, "setOutlineStar:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating templateStar:](self, "templateStar:", 1));
      -[BKLibraryStarRating setHalfStar:](self, "setHalfStar:", v19);

      if (-[BKLibraryStarRating isRTL](self, "isRTL"))
      {
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating halfStar](self, "halfStar")));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v20, "CGImage"), 4, 1.0));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "imageWithRenderingMode:", 2));
        -[BKLibraryStarRating setHalfStar:](self, "setHalfStar:", v22);

      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating templateStar:](self, "templateStar:", 2));
      -[BKLibraryStarRating setFullStar:](self, "setFullStar:", v23);

    }
    if (v9 != width || v11 != height)
    {
      v26.origin.x = x;
      v26.origin.y = y;
      v26.size.width = width;
      v26.size.height = height;
      if (CGRectGetHeight(v26) != 0.0)
        -[BKLibraryStarRating updateStars](self, "updateStars");
    }
  }
}

- (void)setIsRTL:(BOOL)a3
{
  if (self->_isRTL != a3)
  {
    self->_isRTL = a3;
    -[BKLibraryStarRating setupStarShapes](self, "setupStarShapes");
  }
}

- (unint64_t)starKindForIndex:(int64_t)a3
{
  double v5;
  double v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  double v19;

  -[BKLibraryStarRating rating](self, "rating");
  if (v5 <= 0.0)
    return 0;
  v6 = v5;
  v7 = -[BKLibraryStarRating isRTL](self, "isRTL");
  v8 = 1.0 - v6;
  if (!v7)
    v8 = v6;
  -[BKLibraryStarRating roundRatingForStars:](self, "roundRatingForStars:", v8);
  v10 = v9;
  -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
  v12 = v10 * v11;
  v13 = ceil(v12);
  v14 = floor(v12);
  if (-[BKLibraryStarRating isRTL](self, "isRTL"))
  {
    v15 = (double)a3;
    if (v13 <= (double)a3)
      return 2;
    v16 = 0;
    if (v14 > v15)
      return v16;
LABEL_13:
    v19 = fmod(v12, v14);
    if (v14 == 0.0)
      v19 = v12;
    if (v19 <= 0.7)
    {
      if (v19 <= 0.2)
        return v16;
      if (-[BKLibraryStarRating allowHalfStars](self, "allowHalfStars"))
      {
        if (-[BKLibraryStarRating allowHalfStars](self, "allowHalfStars"))
          return 1;
        return v16;
      }
    }
    return 2;
  }
  v17 = (double)(a3 + 1);
  v16 = 2 * (v14 >= v17);
  if (v14 < v17 && v13 >= v17)
    goto LABEL_13;
  return v16;
}

- (id)starForIndex:(int64_t)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[BKLibraryStarRating starKindForIndex:](self, "starKindForIndex:", a3);
  if (v4 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating fullStar](self, "fullStar"));
  }
  else if (v4 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating halfStar](self, "halfStar"));
  }
  else if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating outlineStar](self, "outlineStar"));
  }
  return v5;
}

- (void)setFrameColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_frameColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_frameColor, a3);
    -[BKLibraryStarRating tintStarViews](self, "tintStarViews");
  }

}

- (void)setFillColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_fillColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    -[BKLibraryStarRating tintStarViews](self, "tintStarViews");
  }

}

- (void)setEmptyColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_emptyColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_emptyColor, a3);
    -[BKLibraryStarRating tintStarViews](self, "tintStarViews");
  }

}

- (void)clearStars
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating stars](self, "stars"));
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &stru_1008E8C28);

  -[BKLibraryStarRating setStars:](self, "setStars:", 0);
}

- (void)updateStars
{
  void *v3;
  double v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating stars](self, "stars"));
  v4 = (double)(unint64_t)objc_msgSend(v3, "count");
  -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
  v6 = v5;

  if (v6 != v4)
    -[BKLibraryStarRating setupStarShapes](self, "setupStarShapes");
  -[BKLibraryStarRating tintStarViews](self, "tintStarViews");
}

- (void)tintStarViews
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;

  -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
  if (v3 > 0.0)
  {
    v4 = 1;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating starForIndex:](self, "starForIndex:", v4 - 1));
      if (v5)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating stars](self, "stars"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v4 - 1));

        objc_msgSend(v7, "setImage:", v5);
        -[BKLibraryStarRating rating](self, "rating");
        if (v8 == 0.0)
        {
          v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating emptyColor](self, "emptyColor"));
        }
        else if (-[BKLibraryStarRating starKindForIndex:](self, "starKindForIndex:", v4 - 1))
        {
          v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating fillColor](self, "fillColor"));
        }
        else
        {
          v9 = objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating frameColor](self, "frameColor"));
        }
        v10 = (void *)v9;
        objc_msgSend(v7, "setTintColor:", v9);

        objc_msgSend(v7, "setNeedsLayout");
      }

      v11 = (double)v4;
      -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
      ++v4;
    }
    while (v12 > v11);
  }
}

- (void)setupStarShapes
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  id v19;
  double Width;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double Height;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  id v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating stars](self, "stars"));
  v4 = (double)(unint64_t)objc_msgSend(v3, "count");
  -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
  v6 = v5;

  if (v6 != v4)
  {
    -[BKLibraryStarRating clearStars](self, "clearStars");
    -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (unint64_t)v7));
    -[BKLibraryStarRating setStars:](self, "setStars:", v8);

    -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
    if (v9 > 0.0)
    {
      v10 = 0;
      v11 = 0.0;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating starForIndex:](self, "starForIndex:", v10));
        if (v12)
        {
          v13 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v12);
          +[TUIRatingsBox spacingForSize:](TUIRatingsBox, "spacingForSize:", -[BKLibraryStarRating starSize](self, "starSize"));
          v15 = v11 + v14 + 20.0;
          objc_msgSend(v13, "setFrame:", v11, 0.0, 20.0, 20.0);
          objc_msgSend(v13, "setContentMode:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating stars](self, "stars"));
          objc_msgSend(v16, "addObject:", v13);

          -[BKLibraryStarRating addSubview:](self, "addSubview:", v13);
          v11 = v15;
        }

        ++v10;
        -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
      }
      while (v17 > (double)v10);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating stars](self, "stars"));
    v19 = objc_msgSend(v18, "count");

    if (!v19)
      -[BKLibraryStarRating setStars:](self, "setStars:", 0);
  }
  -[BKLibraryStarRating frame](self, "frame");
  Width = CGRectGetWidth(v46);
  if (Width > 0.0)
  {
    v21 = Width;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating stars](self, "stars"));
    v23 = (double)(unint64_t)objc_msgSend(v22, "count");
    -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
    v25 = v24;

    if (v25 == v23)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating stars](self, "stars"));
      v45 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));

      objc_msgSend(v45, "frame");
      v27 = CGRectGetWidth(v47);
      -[BKLibraryStarRating frame](self, "frame");
      Height = CGRectGetHeight(v48);
      v29 = Height;
      if (v27 >= Height)
        v27 = Height;
      +[TUIRatingsBox spacingForSize:](TUIRatingsBox, "spacingForSize:", -[BKLibraryStarRating starSize](self, "starSize"));
      v31 = v30;
      -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
      v32 = v31;
      if (v33 > 1.0)
      {
        -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
        v35 = v21 - v27 * v34;
        -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
        v32 = v35 / (v36 + -1.0);
      }
      -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
      if (v37 > 0.0)
      {
        v38 = 0;
        if (v31 >= v32)
          v39 = v32;
        else
          v39 = v31;
        v40 = v27 + v39;
        v41 = 0.0;
        do
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating stars](self, "stars"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectAtIndexedSubscript:", v38));

          objc_msgSend(v43, "setFrame:", v41, 0.0, v27, v29);
          ++v38;
          -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
          v41 = v40 + v41;
        }
        while (v44 > (double)v38);
      }

    }
  }
}

- (double)roundRatingForStars:(double)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  if (-[BKLibraryStarRating allowHalfStars](self, "allowHalfStars"))
    v5 = 2.0;
  else
    v5 = 1.0;
  -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", llround(v5 * (v6 * a3))));
  objc_msgSend(v7, "doubleValue");
  v9 = v8 / v5;

  -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
  return v9 / v10;
}

- (void)setRating:(double)a3
{
  double v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[BKLibraryStarRating roundRatingForStars:](self, "roundRatingForStars:", a3);
  v5 = v4;
  if (self->_rating != v4)
  {
    self->_rating = v4;
    -[BKLibraryStarRating updateStars](self, "updateStars");
  }
  if (!qword_1009F4E60)
  {
    v6 = objc_alloc_init((Class)NSNumberFormatter);
    v7 = (void *)qword_1009F4E60;
    qword_1009F4E60 = (uint64_t)v6;

    objc_msgSend((id)qword_1009F4E60, "setMinimumFractionDigits:", 0);
    objc_msgSend((id)qword_1009F4E60, "setMaximumFractionDigits:", 1);
  }
  -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
  v9 = v5 * v8;
  v10 = (void *)qword_1009F4E60;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromNumber:", v11));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("%1$.1f %2$@ star(s)"), &stru_10091C438, 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, *(_QWORD *)&v9, v15));
  -[BKLibraryStarRating setAccessibilityValue:](self, "setAccessibilityValue:", v14);

}

- (void)setRatingWithTouch:(id)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double Width;
  double v9;
  double v10;
  double v11;
  unsigned int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint v17;
  CGRect v18;
  CGRect v19;

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[BKLibraryStarRating bounds](self, "bounds");
  Width = CGRectGetWidth(v18);
  -[BKLibraryStarRating bounds](self, "bounds");
  v17.x = v5;
  v17.y = v7;
  if (CGRectContainsPoint(v19, v17))
  {
    -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
    v10 = 1.0 / v9;
    v11 = v5 / Width;
    v12 = -[BKLibraryStarRating isRTL](self, "isRTL");
    v13 = 1.0 - v11;
    if (!v12)
      v13 = v11;
    if (v10 >= v13)
      v13 = v10;
    if (v13 > 1.0 - v10)
      v13 = 1.0;
    -[BKLibraryStarRating roundRatingForStars:](self, "roundRatingForStars:", v13);
    v15 = v14;
    -[BKLibraryStarRating rating](self, "rating");
    if (v16 != v15)
      -[BKLibraryStarRating setRating:](self, "setRating:", v15);
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;
  double v6;
  BOOL v7;
  CGRect v9;

  v5 = a3;
  -[BKLibraryStarRating bounds](self, "bounds");
  if (CGRectGetWidth(v9) <= 0.0 || (-[BKLibraryStarRating numberOfStars](self, "numberOfStars"), v6 <= 0.0))
  {
    v7 = 0;
  }
  else
  {
    -[BKLibraryStarRating setRatingWithTouch:](self, "setRatingWithTouch:", v5);
    v7 = 1;
  }

  return v7;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  -[BKLibraryStarRating setRatingWithTouch:](self, "setRatingWithTouch:", a3, a4);
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5;

  -[BKLibraryStarRating setRatingWithTouch:](self, "setRatingWithTouch:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating delegate](self, "delegate"));
  -[BKLibraryStarRating rating](self, "rating");
  objc_msgSend(v5, "starRatingDidChange:rating:", self);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)qword_1009F4E68;
  if (!qword_1009F4E68)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Rating"), &stru_10091C438, 0));
    v5 = (void *)qword_1009F4E68;
    qword_1009F4E68 = v4;

    v2 = (void *)qword_1009F4E68;
  }
  return v2;
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v2;
  unsigned int v3;
  UIAccessibilityTraits v4;

  v2 = UIAccessibilityTraitNone;
  v3 = -[BKLibraryStarRating isEnabled](self, "isEnabled");
  v4 = UIAccessibilityTraitAdjustable;
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (void)accessibilityIncrement
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
  if (v3 > 0.0)
  {
    -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
    v5 = 1.0 / v4;
    -[BKLibraryStarRating rating](self, "rating");
    -[BKLibraryStarRating roundRatingForStars:](self, "roundRatingForStars:");
    v7 = v5 + v6;
    if (v7 > 1.0)
      v7 = 1.0;
    -[BKLibraryStarRating setRating:](self, "setRating:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating delegate](self, "delegate"));
    -[BKLibraryStarRating rating](self, "rating");
    objc_msgSend(v8, "starRatingDidChange:rating:", self);

  }
}

- (void)accessibilityDecrement
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
  if (v3 > 0.0)
  {
    -[BKLibraryStarRating numberOfStars](self, "numberOfStars");
    v5 = 1.0 / v4;
    -[BKLibraryStarRating rating](self, "rating");
    -[BKLibraryStarRating roundRatingForStars:](self, "roundRatingForStars:");
    v7 = v6 - v5;
    if (v5 >= v7)
      v7 = v5;
    -[BKLibraryStarRating setRating:](self, "setRating:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryStarRating delegate](self, "delegate"));
    -[BKLibraryStarRating rating](self, "rating");
    objc_msgSend(v8, "starRatingDidChange:rating:", self);

  }
}

- (BKLibraryStarRatingDelegate)delegate
{
  return (BKLibraryStarRatingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)frameColor
{
  return self->_frameColor;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)emptyColor
{
  return self->_emptyColor;
}

- (BOOL)allowHalfStars
{
  return self->_allowHalfStars;
}

- (void)setAllowHalfStars:(BOOL)a3
{
  self->_allowHalfStars = a3;
}

- (double)rating
{
  return self->_rating;
}

- (double)numberOfStars
{
  return self->_numberOfStars;
}

- (void)setNumberOfStars:(double)a3
{
  self->_numberOfStars = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (UIImage)outlineStar
{
  return self->_outlineStar;
}

- (void)setOutlineStar:(id)a3
{
  objc_storeStrong((id *)&self->_outlineStar, a3);
}

- (UIImage)halfStar
{
  return self->_halfStar;
}

- (void)setHalfStar:(id)a3
{
  objc_storeStrong((id *)&self->_halfStar, a3);
}

- (UIImage)fullStar
{
  return self->_fullStar;
}

- (void)setFullStar:(id)a3
{
  objc_storeStrong((id *)&self->_fullStar, a3);
}

- (unint64_t)starSize
{
  return self->_starSize;
}

- (void)setStarSize:(unint64_t)a3
{
  self->_starSize = a3;
}

- (NSMutableArray)stars
{
  return self->_stars;
}

- (void)setStars:(id)a3
{
  objc_storeStrong((id *)&self->_stars, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stars, 0);
  objc_storeStrong((id *)&self->_fullStar, 0);
  objc_storeStrong((id *)&self->_halfStar, 0);
  objc_storeStrong((id *)&self->_outlineStar, 0);
  objc_storeStrong((id *)&self->_emptyColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_frameColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
