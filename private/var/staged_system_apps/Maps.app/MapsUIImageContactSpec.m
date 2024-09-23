@implementation MapsUIImageContactSpec

- (MapsUIImageContactSpec)init
{
  MapsUIImageContactSpec *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsUIImageContactSpec;
  result = -[MapsUIImageContactSpec init](&v3, "init");
  if (result)
    result->_contact = 0;
  return result;
}

- (double)size
{
  double result;

  result = *(double *)&self->_style;
  if (result <= 0.0)
    return 32.0;
  return result;
}

- (BOOL)useSearchImageFallback
{
  return 0;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int64_t v17;
  void *v18;
  void *v20;

  if (-[MapsUIImageContactSpec useAvatarImageRendered](self, "useAvatarImageRendered", a4, a3))
  {
    -[MapsUIImageContactSpec size](self, "size");
    v6 = v5;
    -[MapsUIImageContactSpec size](self, "size");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    objc_msgSend(v9, "screenScale");
    v11 = (id)objc_claimAutoreleasedReturnValue(+[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, v6, v8, v10));

    v12 = objc_alloc_init((Class)CNAvatarImageRenderer);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec contact](self, "contact"));
    v20 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "avatarImageForContacts:scope:", v14, v11));

  }
  else
  {
    v16 = objc_alloc((Class)CNMonogrammer);
    v17 = -[MapsUIImageContactSpec style](self, "style");
    -[MapsUIImageContactSpec size](self, "size");
    v11 = objc_msgSend(v16, "initWithStyle:diameter:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec tintColor](self, "tintColor"));
    objc_msgSend(v11, "monogramsWithTint:", v18);

    v12 = (id)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec contact](self, "contact"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "monogramForContact:", v12));
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MapsUIImageContactSpec *v4;
  void *v5;
  void *v6;

  v4 = objc_opt_new(MapsUIImageContactSpec);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec contact](self, "contact"));
  -[MapsUIImageContactSpec setContact:](v4, "setContact:", v5);

  -[MapsUIImageContactSpec setStyle:](v4, "setStyle:", -[MapsUIImageContactSpec style](self, "style"));
  -[MapsUIImageContactSpec size](self, "size");
  -[MapsUIImageContactSpec setSize:](v4, "setSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec tintColor](self, "tintColor"));
  -[MapsUIImageContactSpec setTintColor:](v4, "setTintColor:", v6);

  -[MapsUIImageContactSpec setUseAvatarImageRendered:](v4, "setUseAvatarImageRendered:", -[MapsUIImageContactSpec useAvatarImageRendered](self, "useAvatarImageRendered"));
  return v4;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec contact](self, "contact"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MapsUIImageContactSpec style](self, "style")));
  v6 = v4 ^ ((_QWORD)objc_msgSend(v5, "hash") << 8);
  -[MapsUIImageContactSpec size](self, "size");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v8 = v6 ^ ((_QWORD)objc_msgSend(v7, "hash") << 16);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec tintColor](self, "tintColor"));
  v10 = v8 ^ (unint64_t)objc_msgSend(v9, "hash");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MapsUIImageContactSpec useAvatarImageRendered](self, "useAvatarImageRendered")));
  v12 = v10 ^ ((_QWORD)objc_msgSend(v11, "hash") << 24);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v18;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec contact](self, "contact"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contact"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (!v9)
      goto LABEL_6;
    v10 = -[MapsUIImageContactSpec style](self, "style");
    if (v10 != objc_msgSend(v6, "style"))
      goto LABEL_6;
    -[MapsUIImageContactSpec size](self, "size");
    v12 = v11;
    objc_msgSend(v6, "size");
    if (v12 == v13
      && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec tintColor](self, "tintColor")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tintColor")),
          v15,
          v14,
          v14 == v15))
    {
      v18 = -[MapsUIImageContactSpec useAvatarImageRendered](self, "useAvatarImageRendered");
      v16 = v18 ^ objc_msgSend(v6, "useAvatarImageRendered") ^ 1;
    }
    else
    {
LABEL_6:
      LOBYTE(v16) = 0;
    }

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  double v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec contact](self, "contact"));
  v5 = -[MapsUIImageContactSpec style](self, "style");
  -[MapsUIImageContactSpec size](self, "size");
  v7 = (unint64_t)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageContactSpec tintColor](self, "tintColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p contact=%@ style=%lu size=%lu tintColor=%@ useAvatarImageRendered=%d>"), v3, self, v4, v5, v7, v8, -[MapsUIImageContactSpec useAvatarImageRendered](self, "useAvatarImageRendered")));

  return v9;
}

- (CNContact)contact
{
  return *(CNContact **)&self->_useAvatarImageRendered;
}

- (void)setContact:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)style
{
  return (int64_t)self->_contact;
}

- (void)setStyle:(int64_t)a3
{
  self->_contact = (CNContact *)a3;
}

- (void)setSize:(double)a3
{
  *(double *)&self->_style = a3;
}

- (UIColor)tintColor
{
  return *(UIColor **)&self->_size;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (BOOL)useAvatarImageRendered
{
  return *(&self->super._isRTL + 1);
}

- (void)setUseAvatarImageRendered:(BOOL)a3
{
  *(&self->super._isRTL + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_useAvatarImageRendered, 0);
}

@end
