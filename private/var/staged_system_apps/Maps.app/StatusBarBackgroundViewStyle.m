@implementation StatusBarBackgroundViewStyle

+ (id)defaultBlurredStyleWithDefaultColorProvider:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v4 = MapsConfig_StatusBarBackgroundViewUsesVariableBlur;
  v5 = off_1014B4D58;
  v6 = a3;
  if (GEOConfigGetBOOL(v4, v5))
    v7 = objc_msgSend(objc_alloc((Class)a1), "initWithVariableBlurRadius:defaultColorProvider:disableBlur:", v6, 0, GEOConfigGetDouble(MapsConfig_StatusBarBackgroundViewVariableBlurRadius, off_1014B4E28));
  else
    v7 = objc_msgSend(objc_alloc((Class)a1), "initWithGaussianBlurRadius:defaultColorProvider:disableBlur:", v6, 0, 10.0);
  v8 = v7;

  return v8;
}

- (StatusBarBackgroundViewStyle)initWithColor:(id)a3
{
  id v5;
  StatusBarBackgroundViewStyle *v6;
  StatusBarBackgroundViewStyle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)StatusBarBackgroundViewStyle;
  v6 = -[StatusBarBackgroundViewStyle init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    objc_storeStrong((id *)&v6->_color, a3);
  }

  return v7;
}

- (StatusBarBackgroundViewStyle)initWithBlurStyle:(int64_t)a3 groupName:(id)a4 defaultColorProvider:(id)a5 disableBlur:(BOOL)a6
{
  id v11;
  id v12;
  StatusBarBackgroundViewStyle *v13;
  StatusBarBackgroundViewStyle *v14;
  id v15;
  id defaultColorProvider;
  objc_super v18;

  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)StatusBarBackgroundViewStyle;
  v13 = -[StatusBarBackgroundViewStyle init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    v13->_type = 1;
    v13->_blurStyle = a3;
    objc_storeStrong((id *)&v13->_groupName, a4);
    v15 = objc_retainBlock(v12);
    defaultColorProvider = v14->_defaultColorProvider;
    v14->_defaultColorProvider = v15;

    v14->_disableBlur = a6;
  }

  return v14;
}

- (StatusBarBackgroundViewStyle)initWithGaussianBlurRadius:(double)a3 defaultColorProvider:(id)a4 disableBlur:(BOOL)a5
{
  id v8;
  StatusBarBackgroundViewStyle *v9;
  StatusBarBackgroundViewStyle *v10;
  id v11;
  id defaultColorProvider;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)StatusBarBackgroundViewStyle;
  v9 = -[StatusBarBackgroundViewStyle init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_type = 2;
    v9->_blurRadius = a3;
    v11 = objc_retainBlock(v8);
    defaultColorProvider = v10->_defaultColorProvider;
    v10->_defaultColorProvider = v11;

    v10->_disableBlur = a5;
  }

  return v10;
}

- (StatusBarBackgroundViewStyle)initWithVariableBlurRadius:(double)a3 defaultColorProvider:(id)a4 disableBlur:(BOOL)a5
{
  id v8;
  StatusBarBackgroundViewStyle *v9;
  StatusBarBackgroundViewStyle *v10;
  id v11;
  id defaultColorProvider;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)StatusBarBackgroundViewStyle;
  v9 = -[StatusBarBackgroundViewStyle init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    v9->_type = 3;
    v9->_blurRadius = a3;
    v11 = objc_retainBlock(v8);
    defaultColorProvider = v10->_defaultColorProvider;
    v10->_defaultColorProvider = v11;

    v10->_disableBlur = a5;
  }

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  int64_t blurStyle;
  NSString *groupName;
  unint64_t type;
  UIColor *color;
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)StatusBarBackgroundViewStyle;
  v3 = -[StatusBarBackgroundViewStyle description](&v12, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  blurStyle = self->_blurStyle;
  groupName = self->_groupName;
  type = self->_type;
  color = self->_color;
  v9 = objc_retainBlock(self->_defaultColorProvider);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (type: %lu, blurStyle: %lu, groupName: %@, color: %@, defaultColorProvider: %@ disableBlur: %d)"), v4, type, blurStyle, groupName, color, v9, self->_disableBlur));

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  StatusBarBackgroundViewStyle *v4;
  uint64_t v5;
  StatusBarBackgroundViewStyle *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;

  v4 = (StatusBarBackgroundViewStyle *)a3;
  if (self == v4)
  {
    LOBYTE(v20) = 1;
  }
  else
  {
    v5 = objc_opt_class(StatusBarBackgroundViewStyle);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[StatusBarBackgroundViewStyle type](self, "type");
      if (v7 == (id)-[StatusBarBackgroundViewStyle type](v6, "type"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundViewStyle color](self, "color"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundViewStyle color](v6, "color"));
        v10 = v8;
        v11 = v9;
        if ((!(v10 | v11)
           || (v12 = objc_msgSend((id)v10, "isEqual:", v11),
               (id)v11,
               (id)v10,
               v12))
          && (v13 = -[StatusBarBackgroundViewStyle blurStyle](self, "blurStyle"),
              v13 == (id)-[StatusBarBackgroundViewStyle blurStyle](v6, "blurStyle")))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundViewStyle groupName](self, "groupName"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundViewStyle groupName](v6, "groupName"));
          v16 = v14;
          v17 = v15;
          if (v16 | v17
            && (v18 = objc_msgSend((id)v16, "isEqual:", v17),
                (id)v17,
                (id)v16,
                !v18))
          {
            LOBYTE(v20) = 0;
          }
          else
          {
            v19 = -[StatusBarBackgroundViewStyle disableBlur](self, "disableBlur");
            v20 = v19 ^ -[StatusBarBackgroundViewStyle disableBlur](v6, "disableBlur");
          }

        }
        else
        {
          LOBYTE(v20) = 0;
        }

      }
      else
      {
        LOBYTE(v20) = 0;
      }

    }
    else
    {
      LOBYTE(v20) = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[StatusBarBackgroundViewStyle type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundViewStyle color](self, "color"));
  v5 = (unint64_t)objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[StatusBarBackgroundViewStyle blurStyle](self, "blurStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StatusBarBackgroundViewStyle groupName](self, "groupName"));
  v8 = v6 ^ (unint64_t)objc_msgSend(v7, "hash");
  v9 = v8 ^ -[StatusBarBackgroundViewStyle disableBlur](self, "disableBlur");

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (UIColor)color
{
  return self->_color;
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (id)defaultColorProvider
{
  return self->_defaultColorProvider;
}

- (BOOL)disableBlur
{
  return self->_disableBlur;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultColorProvider, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
