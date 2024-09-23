@implementation MFNanoBridgeSettingsSharedMailbox

- (MFNanoBridgeSettingsSharedMailbox)initWithType:(unint64_t)a3
{
  MFNanoBridgeSettingsSharedMailbox *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFNanoBridgeSettingsSharedMailbox;
  result = -[MFNanoBridgeSettingsSharedMailbox init](&v5, "init");
  if (result)
    result->_type = a3;
  return result;
}

- (unint64_t)mailboxFilterType
{
  if ((id)-[MFNanoBridgeSettingsSharedMailbox type](self, "type") == (id)1)
    return 2;
  if ((id)-[MFNanoBridgeSettingsSharedMailbox type](self, "type") == (id)2)
    return 4;
  if ((id)-[MFNanoBridgeSettingsSharedMailbox type](self, "type") == (id)3)
    return 8;
  if ((id)-[MFNanoBridgeSettingsSharedMailbox type](self, "type") == (id)6)
    return 32;
  if ((id)-[MFNanoBridgeSettingsSharedMailbox type](self, "type") == (id)4)
    return 16;
  return (unint64_t)((id)-[MFNanoBridgeSettingsSharedMailbox type](self, "type") == (id)7) << 6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_type));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kNSCodingKeyType"));

}

- (MFNanoBridgeSettingsSharedMailbox)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  MFNanoBridgeSettingsSharedMailbox *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("kNSCodingKeyType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = -[MFNanoBridgeSettingsSharedMailbox initWithType:](self, "initWithType:", v7);
  return v8;
}

- (id)displayName
{
  void *v2;
  NSBundle *v3;
  void *v4;
  uint64_t v5;
  NSBundle *v6;
  NSBundle *v7;
  NSBundle *v8;
  NSBundle *v9;
  NSBundle *v10;

  v2 = 0;
  switch(self->_type)
  {
    case 1uLL:
      v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VIP"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_8;
    case 2uLL:
      v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v4 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FLAGGED"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_8;
    case 3uLL:
      v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v4 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNREAD"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_8;
    case 4uLL:
      v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v4 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TO_OR_CC"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_8;
    case 6uLL:
      v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v4 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("IMPORTANT_THREADS"), &stru_100531B00, CFSTR("Main")));
      goto LABEL_8;
    case 7uLL:
      v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v4 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TODAY"), &stru_100531B00, CFSTR("Main")));
LABEL_8:
      v2 = (void *)v5;

      break;
    default:
      return v2;
  }
  return v2;
}

- (id)icon
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = 0;
  switch(self->_type)
  {
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphFavoriteVIPMailbox, 7));
      v4 = off_1005A2840();
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithTintColor:", v5));
      goto LABEL_8;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphFavoriteFlaggedMailbox, 7));
      v7 = off_1005A2840();
      v5 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithTintColor:", v5));
      goto LABEL_8;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphFavoriteUnreadMailbox, 7));
      v8 = off_1005A2840();
      v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithTintColor:", v5));
      goto LABEL_8;
    case 4uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFNanoBridgeSettingsSharedMailbox _includesMeIconImage](self, "_includesMeIconImage"));
      v9 = off_1005A2840();
      v5 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithTintColor:", v5));
      goto LABEL_8;
    case 6uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphFavoriteNotifydMailbox, 7));
      v10 = off_1005A2840();
      v5 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithTintColor:", v5));
      goto LABEL_8;
    case 7uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mf_systemImageNamed:forView:](UIImage, "mf_systemImageNamed:forView:", MFImageGlyphFavoriteTodayMailbox, 7));
      v11 = off_1005A2840();
      v5 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithTintColor:", v5));
LABEL_8:
      v2 = (void *)v6;

      break;
    default:
      return v2;
  }
  return v2;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFNanoBridgeSettingsSharedMailbox;
  if (-[MFNanoBridgeSettingsMailbox isEqual:](&v7, "isEqual:", v4))
    v5 = objc_msgSend(v4, "type") == (id)self->_type;
  else
    v5 = 0;

  return v5;
}

- (id)_includesMeIconImage
{
  void *v3;
  NSString *v4;
  NSBundle *v5;
  void *v6;
  double v7;
  NSBundle *v8;
  void *v9;
  double v10;
  NSBundle *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSBundle *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double y;
  double v29;
  UIImage *ImageFromCurrentImageContext;
  uint64_t v31;
  void *v32;
  CGSize v34;

  v3 = (void *)qword_1005AA268;
  if (!qword_1005AA268)
  {
    v4 = UIContentSizeCategoryLarge;
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = sub_10010A3BC(2, v4, v6, 35.0);

    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = sub_10010A3BC(3, v4, v9, 35.0);

    if (v7 < v10)
      v7 = v10;
    v11 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    v14 = sub_100109D80(2, v4, v12, v13, 0, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    v19 = sub_100109D80(3, v4, v17, v18, 0, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    objc_msgSend(v15, "size");
    v22 = v21;
    objc_msgSend(v20, "size");
    v34.height = v22 + v23 + 2.0;
    v34.width = v7;
    UIGraphicsBeginImageContextWithOptions(v34, 0, 0.0);
    objc_msgSend(v15, "size");
    v25 = v24;
    v27 = v26;
    y = CGRectZero.origin.y;
    objc_msgSend(v15, "drawInRect:", CGRectZero.origin.x, y, v24, v26);
    objc_msgSend(v15, "size");
    objc_msgSend(v20, "drawInRect:", CGRectZero.origin.x, y + v29 + 2.0, v25, v27);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v31 = objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    v32 = (void *)qword_1005AA268;
    qword_1005AA268 = v31;

    UIGraphicsEndImageContext();
    v3 = (void *)qword_1005AA268;
  }
  return v3;
}

- (unint64_t)type
{
  return self->_type;
}

@end
