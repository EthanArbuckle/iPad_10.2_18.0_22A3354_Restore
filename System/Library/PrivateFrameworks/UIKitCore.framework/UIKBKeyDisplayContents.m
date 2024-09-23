@implementation UIKBKeyDisplayContents

- (NSArray)variantDisplayContents
{
  return self->_variantDisplayContents;
}

- (NSArray)secondaryDisplayStrings
{
  return self->_secondaryDisplayStrings;
}

- (int64_t)displayPathType
{
  return self->_displayPathType;
}

- (NSString)displayString
{
  return self->_displayString;
}

+ (id)displayContents
{
  return objc_alloc_init(UIKBKeyDisplayContents);
}

- (void)setDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
  self->_displayPathType = 0;
  self->_fillPath = 0;
}

- (void)setFallbackContents:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackContents, a3);
}

- (void)setDisplayStringImage:(id)a3
{
  objc_storeStrong((id *)&self->_displayStringImage, a3);
  self->_fillPath = 0;
}

- (void)setSecondaryDisplayStrings:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryDisplayStrings, a3);
}

- (UIKBKeyDisplayContents)fallbackContents
{
  return self->_fallbackContents;
}

- (void)setStringKeycapOverImage:(BOOL)a3
{
  self->_stringKeycapOverImage = a3;
}

- (void)setDisplayPathType:(int64_t)a3
{
  NSString *displayString;
  NSArray *secondaryDisplayStrings;

  self->_displayPathType = a3;
  displayString = self->_displayString;
  self->_displayString = 0;

  secondaryDisplayStrings = self->_secondaryDisplayStrings;
  self->_secondaryDisplayStrings = 0;

}

- (void)setFlipImageHorizontally:(BOOL)a3
{
  self->_flipImageHorizontally = a3;
}

- (NSString)displayStringImage
{
  return self->_displayStringImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayImage, 0);
  objc_storeStrong((id *)&self->_bundlePathOverride, 0);
  objc_storeStrong((id *)&self->_fallbackContents, 0);
  objc_storeStrong((id *)&self->_highlightedVariantsList, 0);
  objc_storeStrong((id *)&self->_variantDisplayContents, 0);
  objc_storeStrong((id *)&self->_secondaryDisplayStringImages, 0);
  objc_storeStrong((id *)&self->_secondaryDisplayStrings, 0);
  objc_storeStrong((id *)&self->_displayStringImage, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  const __CFString *v17;
  _BOOL4 v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[UIKBKeyDisplayContents displayString](self, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBKeyDisplayContents displayString](self, "displayString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; displayString = %@"), v5);

  }
  -[UIKBKeyDisplayContents displayStringImage](self, "displayStringImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKBKeyDisplayContents displayStringImage](self, "displayStringImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; displayStringImage = %@"), v7);

  }
  -[UIKBKeyDisplayContents secondaryDisplayStrings](self, "secondaryDisplayStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIKBKeyDisplayContents secondaryDisplayStrings](self, "secondaryDisplayStrings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; secondaryDisplayStrings = %@"), v9);

  }
  -[UIKBKeyDisplayContents secondaryDisplayStringImages](self, "secondaryDisplayStringImages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIKBKeyDisplayContents secondaryDisplayStringImages](self, "secondaryDisplayStringImages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; secondaryDisplayStrings = %@"), v11);

  }
  -[UIKBKeyDisplayContents variantDisplayContents](self, "variantDisplayContents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UIKBKeyDisplayContents variantDisplayContents](self, "variantDisplayContents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; variantDisplayContents = %@"), v13);

  }
  -[UIKBKeyDisplayContents highlightedVariantsList](self, "highlightedVariantsList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIKBKeyDisplayContents highlightedVariantsList](self, "highlightedVariantsList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; highlightedVariantList = %@"), v15);

  }
  if (-[UIKBKeyDisplayContents displayPathType](self, "displayPathType"))
  {
    v16 = -[UIKBKeyDisplayContents displayPathType](self, "displayPathType");
    v17 = CFSTR("Delete");
    if (v16 == 1)
      v17 = CFSTR("Shift");
    objc_msgSend(v3, "appendFormat:", CFSTR("; displayPathType = %@"), v17);
    v18 = -[UIKBKeyDisplayContents fillPath](self, "fillPath");
    v19 = "NO";
    if (v18)
      v19 = "YES";
    objc_msgSend(v3, "appendFormat:", CFSTR("; fillPath = %s"), v19);
  }
  if (-[UIKBKeyDisplayContents force1xImages](self, "force1xImages"))
    objc_msgSend(v3, "appendString:", CFSTR("; force1xImages"));
  -[UIKBKeyDisplayContents fallbackContents](self, "fallbackContents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[UIKBKeyDisplayContents fallbackContents](self, "fallbackContents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; fallbackContents = %@"), v21);

  }
  if (-[UIKBKeyDisplayContents stringKeycapOverImage](self, "stringKeycapOverImage"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; stringKeycapOverImage"));
  if (-[UIKBKeyDisplayContents flipImageHorizontally](self, "flipImageHorizontally"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; flipImageHorizontally"));
  -[UIKBKeyDisplayContents bundlePathOverride](self, "bundlePathOverride");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[UIKBKeyDisplayContents bundlePathOverride](self, "bundlePathOverride");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; bundlePathOverride = %@"), v23);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (NSArray)secondaryDisplayStringImages
{
  return self->_secondaryDisplayStringImages;
}

- (void)setSecondaryDisplayStringImages:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryDisplayStringImages, a3);
}

- (void)setVariantDisplayContents:(id)a3
{
  objc_storeStrong((id *)&self->_variantDisplayContents, a3);
}

- (NSArray)highlightedVariantsList
{
  return self->_highlightedVariantsList;
}

- (void)setHighlightedVariantsList:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedVariantsList, a3);
}

- (BOOL)fillPath
{
  return self->_fillPath;
}

- (void)setFillPath:(BOOL)a3
{
  self->_fillPath = a3;
}

- (BOOL)force1xImages
{
  return self->_force1xImages;
}

- (void)setForce1xImages:(BOOL)a3
{
  self->_force1xImages = a3;
}

- (BOOL)stringKeycapOverImage
{
  return self->_stringKeycapOverImage;
}

- (BOOL)flipImageHorizontally
{
  return self->_flipImageHorizontally;
}

- (NSString)bundlePathOverride
{
  return self->_bundlePathOverride;
}

- (void)setBundlePathOverride:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePathOverride, a3);
}

- (UIImage)displayImage
{
  return self->_displayImage;
}

- (void)setDisplayImage:(id)a3
{
  objc_storeStrong((id *)&self->_displayImage, a3);
}

- (BOOL)forceImageKeycap
{
  return self->_forceImageKeycap;
}

- (void)setForceImageKeycap:(BOOL)a3
{
  self->_forceImageKeycap = a3;
}

@end
