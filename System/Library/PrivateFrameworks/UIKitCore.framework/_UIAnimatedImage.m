@implementation _UIAnimatedImage

- (void)_setAlignmentRectInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_images;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "_setAlignmentRectInsets:", top, left, bottom, right, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (double)duration
{
  return self->_duration;
}

- (_UIAnimatedImage)initWithImages:(id)a3 duration:(double)a4
{
  id v6;
  void *v7;
  _UIAnimatedImage *v8;
  uint64_t v9;
  NSArray *images;
  objc_super v12;

  v6 = a3;
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)_UIAnimatedImage;
  v8 = -[UIImage _initWithOtherImage:](&v12, sel__initWithOtherImage_, v7);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    images = v8->_images;
    v8->_images = (NSArray *)v9;

    if (a4 <= 0.0)
      a4 = (double)(unint64_t)objc_msgSend(v6, "count") * 0.0333333333;
    v8->_duration = a4;
  }

  return v8;
}

- (id)_initWithOtherImage:(id)a3
{
  id v4;
  void *v5;
  double v6;
  _UIAnimatedImage *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "images");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "duration");
  }
  else
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0.0;
  }
  v7 = -[_UIAnimatedImage initWithImages:duration:](self, "initWithImages:duration:", v5, v6);

  if (v7)
    objc_msgSend(v4, "_configureImage:assumePreconfigured:", v7, 0);

  return v7;
}

- (BOOL)_isPDFVector
{
  return 0;
}

- (BOOL)_isSVGVector
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIAnimatedImage)initWithCoder:(id)a3
{
  id v4;
  _UIAnimatedImage *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *images;
  double v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIAnimatedImage;
  v5 = -[UIImage initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("UIImages"));
    v8 = objc_claimAutoreleasedReturnValue();
    images = v5->_images;
    v5->_images = (NSArray *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("UIDuration"));
    v5->_duration = v10;
    if (v10 == 0.0)
      v5->_duration = (double)-[NSArray count](v5->_images, "count") * 0.0333333333;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIAnimatedImage;
  -[UIImage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_images, CFSTR("UIImages"));
  if (fabs(self->_duration + (double)-[NSArray count](self->_images, "count") * -0.0333333333) >= 2.22044605e-16)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIDuration"), self->_duration);

}

- (id)images
{
  return self->_images;
}

- (void)_mirrorImageOrientation
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_UIAnimatedImage;
  -[UIImage _mirrorImageOrientation](&v12, sel__mirrorImageOrientation);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_images;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_mirrorImageOrientation", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)_horizontallyFlipImageOrientation
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)_UIAnimatedImage;
  -[UIImage _horizontallyFlipImageOrientation](&v12, sel__horizontallyFlipImageOrientation);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_images;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_horizontallyFlipImageOrientation", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (UIEdgeInsets)capInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[NSArray objectAtIndex:](self->_images, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "capInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (int64_t)resizingMode
{
  void *v2;
  int64_t v3;

  -[NSArray objectAtIndex:](self->_images, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resizingMode");

  return v3;
}

- (CGRect)_contentStretchInPixels
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[NSArray objectAtIndex:](self->_images, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentStretchInPixels");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_contentRectInPixels
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[NSArray objectAtIndex:](self->_images, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentRectInPixels");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_isResizable
{
  void *v2;
  char v3;

  -[NSArray objectAtIndex:](self->_images, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isResizable");

  return v3;
}

- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  char v6;

  height = a3.height;
  width = a3.width;
  -[NSArray objectAtIndex:](self->_images, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isTiledWhenStretchedToSize:", width, height);

  return v6;
}

- (void)_setAlwaysStretches:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_images;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "_setAlwaysStretches:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)resizableImageWithCapInsets:(UIEdgeInsets)a3
{
  return -[_UIAnimatedImage resizableImageWithCapInsets:resizingMode:](self, "resizableImageWithCapInsets:resizingMode:", 0, a3.top, a3.left, a3.bottom, a3.right);
}

- (id)resizableImageWithCapInsets:(UIEdgeInsets)a3 resizingMode:(int64_t)a4
{
  double right;
  double bottom;
  double left;
  double top;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  int64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  UIEdgeInsets v32;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v31 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_images, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = self->_images;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v17, "resizableImageWithCapInsets:", top, left, bottom, right);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = a4;
          v32.top = top;
          v32.left = left;
          v32.bottom = bottom;
          v32.right = right;
          NSStringFromUIEdgeInsets(v32);
          v19 = a2;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v19, self, CFSTR("UIImage.m"), 734, CFSTR("Unable to create resizable image from %@ with cap insets %@"), v17, v20);

          a2 = v19;
          a4 = v25;
        }
        objc_msgSend(v11, "addObject:", v18);

      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  +[UIImage animatedImageWithImages:duration:](UIImage, "animatedImageWithImages:duration:", v11, self->_duration);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (a4 == 1)
    objc_msgSend(v21, "_setAlwaysStretches:", 1);

  return v22;
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[NSArray objectAtIndex:](self->_images, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alignmentRectInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)_bezeledImageWithShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 fillRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 drawShadow:(BOOL)a11
{
  _BOOL8 v11;
  void *v21;
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v11 = a11;
  v35 = *MEMORY[0x1E0C80C00];
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_images, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = self->_images;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v31;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v26), "_bezeledImageWithShadowRed:green:blue:alpha:fillRed:green:blue:alpha:drawShadow:", v11, a3, a4, a5, a6, a7, a8, a9, a10, (_QWORD)v30);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v24);
  }

  +[UIImage animatedImageWithImages:duration:](UIImage, "animatedImageWithImages:duration:", v21, self->_duration);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_doubleBezeledImageWithExteriorShadowRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6 interiorShadowRed:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10 fillRed:(double)a11 green:(double)a12 blue:(double)a13 alpha:(double)a14
{
  void *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_images, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v20 = self->_images;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "_doubleBezeledImageWithExteriorShadowRed:green:blue:alpha:interiorShadowRed:green:blue:alpha:fillRed:green:blue:alpha:", a3, a4, a5, a6, a7, a8, a9, a10, *(_QWORD *)&a11, *(_QWORD *)&a12, *(_QWORD *)&a13, *(_QWORD *)&a14);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v22);
  }

  +[UIImage animatedImageWithImages:duration:](UIImage, "animatedImageWithImages:duration:", v19, self->_duration);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_imageScaledToProportion:(double)a3 interpolationQuality:(int)a4
{
  uint64_t v4;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_images, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_images;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "_imageScaledToProportion:interpolationQuality:", v4, a3, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  +[UIImage animatedImageWithImages:duration:](UIImage, "animatedImageWithImages:duration:", v7, self->_duration);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_imageWithStylePresets:(id)a3 tintColor:(id)a4 traitCollection:(id)a5
{
  void *v6;

  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ not yet supported for animated images."), v6);

  return self;
}

- (CGSize)_sizeWithHairlineThickening:(BOOL)a3 forTraitCollection:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v4 = a3;
  v6 = a4;
  -[NSArray firstObject](self->_images, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_sizeWithHairlineThickening:forTraitCollection:", v4, v6);
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  unint64_t v35;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_UIAnimatedImage images](self, "images");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend(v5, "images");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != objc_msgSend(v8, "count"))
      goto LABEL_15;
    -[_UIAnimatedImage duration](self, "duration");
    v10 = v9;
    objc_msgSend(v5, "duration");
    if (v10 != v11)
      goto LABEL_15;
    -[_UIAnimatedImage capInsets](self, "capInsets");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v5, "capInsets");
    if (v15 == v23 && v13 == v20 && v19 == v22 && v17 == v21)
    {
      v24 = -[_UIAnimatedImage resizingMode](self, "resizingMode");
      v25 = objc_msgSend(v5, "resizingMode");

      if (v24 == v25)
      {
        -[_UIAnimatedImage images](self, "images");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (v27)
        {
          v28 = 0;
          do
          {
            -[_UIAnimatedImage images](self, "images");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectAtIndexedSubscript:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "images");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectAtIndexedSubscript:", v28);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            v33 = objc_msgSend(v30, "isEqual:", v32);
            if ((v33 & 1) == 0)
              break;
            ++v28;
            -[_UIAnimatedImage images](self, "images");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "count");

          }
          while (v28 < v35);
        }
        else
        {
          v33 = 1;
        }
        goto LABEL_17;
      }
    }
    else
    {
LABEL_15:

    }
    v33 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v33 = 0;
LABEL_18:

  return v33;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NSArray objectAtIndexedSubscript:](self->_images, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
}

@end
