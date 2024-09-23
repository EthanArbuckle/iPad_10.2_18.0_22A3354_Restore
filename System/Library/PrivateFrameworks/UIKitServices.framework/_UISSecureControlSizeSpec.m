@implementation _UISSecureControlSizeSpec

+ (id)specWithStyle:(id)a3 tag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _UISSecureControlSizeSpec *v16;
  _BOOL4 v18;
  _UISSecureControlSizeSpec *v19;

  v5 = a4;
  v6 = a3;
  v19 = [_UISSecureControlSizeSpec alloc];
  objc_msgSend(v5, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "imagePlacement") == 1 || objc_msgSend(v5, "imagePlacement") == 4;
  v18 = v8;
  v9 = objc_msgSend(v6, "accessibilityContrast");
  v10 = objc_msgSend(v6, "displayScale");
  v11 = objc_msgSend(v6, "layoutDirection");
  v12 = objc_msgSend(v6, "legibilityWeight");
  objc_msgSend(v6, "localization");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v6, "preferredContentSizeCategory");
  v15 = objc_msgSend(v6, "userInterfaceIdiom");

  v16 = -[_UISSecureControlSizeSpec initWithCategory:arrangeVertically:accessibilityContrast:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:userInterfaceIdiom:](v19, "initWithCategory:arrangeVertically:accessibilityContrast:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:userInterfaceIdiom:", v7, v18, v9, v10, v11, v12, v13, v14, v15);
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISSecureControlSizeSpec)initWithCategory:(id)a3 arrangeVertically:(BOOL)a4 accessibilityContrast:(unint64_t)a5 displayScale:(unsigned __int8)a6 layoutDirection:(unint64_t)a7 legibilityWeight:(unint64_t)a8 localization:(id)a9 preferredContentSizeCategory:(unint64_t)a10 userInterfaceIdiom:(unint64_t)a11
{
  char v11;
  char v12;
  char v14;
  __int16 v15;
  id v18;
  id v19;
  _UISSecureControlSizeSpec *v20;
  _UISSecureControlSizeSpec *v21;
  objc_super v23;

  v11 = a8;
  v12 = a7;
  v14 = a5;
  v15 = a4;
  v18 = a3;
  v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)_UISSecureControlSizeSpec;
  v20 = -[_UISSecureControlSizeSpec init](&v23, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_category, a3);
    objc_storeStrong((id *)&v21->_localization, a9);
    v21->_fields.all = v15 & 0xC001 | (2 * (v14 & 1)) & 3 | (4 * (a6 & 7)) & 0x1F | (32 * (v12 & 1)) & 0x3F | ((v11 & 1) << 6) & 0x7F | ((a10 & 0xF) << 7) & 0xC7FF | ((a11 & 7) << 11) | v21->_fields.all & 0xC000;
  }

  return v21;
}

- (_UISSecureControlSizeSpec)initWithCoder:(id)a3
{
  id v4;
  _UISSecureControlSizeSpec *v5;
  uint64_t v6;
  _UISSecureControlCategory *category;
  uint64_t v8;
  NSString *localization;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISSecureControlSizeSpec;
  v5 = -[_UISSecureControlSizeSpec init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v6 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (_UISSecureControlCategory *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localization"));
    v8 = objc_claimAutoreleasedReturnValue();
    localization = v5->_localization;
    v5->_localization = (NSString *)v8;

    v5->_fields.all = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("fieldsAll"));
  }

  return v5;
}

- (BOOL)arrangeVertically
{
  return self->_fields.all & 1;
}

- (void)encodeWithCoder:(id)a3
{
  _UISSecureControlCategory *category;
  id v5;

  category = self->_category;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localization, CFSTR("localization"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_fields.all, CFSTR("fieldsAll"));

}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = +[_UISSecureControlSizeSpec hash](_UISSecureControlSizeSpec, "hash");
  v4 = -[_UISSecureControlCategory hash](self->_category, "hash");
  return v4 ^ -[NSString hash](self->_localization, "hash") ^ v3 ^ self->_fields.all;
}

- (BOOL)isEqual:(id)a3
{
  _UISSecureControlCategory **v4;
  _UISSecureControlCategory *category;
  NSString *localization;
  BOOL v7;

  v4 = (_UISSecureControlCategory **)a3;
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) != 0
    && ((category = self->_category, category == v4[3]) || -[_UISSecureControlCategory isEqual:](category, "isEqual:"))
    && ((localization = self->_localization, localization == (NSString *)v4[1])
     || -[NSString isEqual:](localization, "isEqual:"))
    && self->_fields.all == *((unsigned __int16 *)v4 + 8);

  return v7;
}

- (BOOL)isEquivalentToStyle:(id)a3 tag:(id)a4
{
  id v6;
  id v7;
  _UISSecureControlCategory *category;
  _UISSecureControlCategory *v9;
  NSString *localization;
  NSString *v11;
  int v12;
  int v13;
  BOOL v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v6 = a3;
  v7 = a4;
  category = self->_category;
  objc_msgSend(v7, "category");
  v9 = (_UISSecureControlCategory *)objc_claimAutoreleasedReturnValue();
  if (category == v9 || -[_UISSecureControlCategory isEqual:](category, "isEqual:", v9))
  {
    localization = self->_localization;
    objc_msgSend(v6, "localization");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    if ((localization == v11 || -[NSString isEqual:](localization, "isEqual:", v11))
      && ((v12 = self->_fields.all & 1, objc_msgSend(v7, "imagePlacement") != 1)
        ? (v13 = objc_msgSend(v7, "imagePlacement") == 4)
        : (v13 = 1),
          v13 == v12
       && (v15 = ((unint64_t)self->_fields.all >> 1) & 1, objc_msgSend(v6, "accessibilityContrast") == v15)
       && (v16 = (self->_fields.all >> 2) & 7, v16 == objc_msgSend(v6, "displayScale"))
       && (v17 = ((unint64_t)self->_fields.all >> 5) & 1, objc_msgSend(v6, "layoutDirection") == v17)
       && (v18 = ((unint64_t)self->_fields.all >> 6) & 1, objc_msgSend(v6, "legibilityWeight") == v18)
       && (v19 = ((unint64_t)self->_fields.all >> 7) & 0xF,
           objc_msgSend(v6, "preferredContentSizeCategory") == v19)))
    {
      v20 = ((unint64_t)self->_fields.all >> 11) & 7;
      v14 = objc_msgSend(v6, "userInterfaceIdiom") == v20;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (UISSlotStyle)style
{
  unint64_t all;

  all = self->_fields.all;
  return +[UISSlotStyle slotStyleWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:](UISSlotStyle, "slotStyleWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:", 0, (all >> 1) & 1, 1, (all >> 2) & 7, (all >> 5) & 1, (all >> 6) & 1, self->_localization, (all >> 7) & 0xF, CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E0C9DA30]), (all >> 11) & 7, 0);
}

- (_UISSecureControlCategory)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_localization, 0);
}

@end
