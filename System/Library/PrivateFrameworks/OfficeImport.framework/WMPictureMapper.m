@implementation WMPictureMapper

- (WMPictureMapper)initWithWDPicture:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WMPictureMapper *v9;
  WMPictureMapper *v10;
  OADDrawable *mDrawable;
  WMPictureMapper *v12;
  objc_super v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "drawable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)WMPictureMapper;
  v9 = -[CMDrawableMapper initWithOadDrawable:parent:](&v15, sel_initWithOadDrawable_parent_, v8, v7);
  v10 = v9;
  if (v9)
  {
    -[WMPictureMapper setBoundingBox](v9, "setBoundingBox");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      mDrawable = v10->super.mDrawable;
      v14.receiver = v10;
      v14.super_class = (Class)WMPictureMapper;
      -[CMDrawableMapper setWithOadImage:](&v14, sel_setWithOadImage_, mDrawable);
    }
    v12 = v10;
  }

  return v10;
}

- (void)setBoundingBox
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  id v7;

  -[OADDrawable clientData](self->super.mDrawable, "clientData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasBounds"))
  {
    objc_msgSend(v7, "bounds");
    self->super.mBox.origin.x = v3;
    self->super.mBox.origin.y = v4;
    self->super.mBox.size.width = v5;
    self->super.mBox.size.height = v6;
  }

}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  NSData *mImageBinaryData;
  uint64_t mResourceType;
  void *v17;
  objc_super v18;

  v5 = a3;
  -[WMPictureMapper mapBounds](self, "mapBounds");
  -[OADOrientedBounds bounds](self->super.mOrientedBounds, "bounds");
  v10 = v9;
  if (v9 != 0.0)
  {
    v11 = v6;
    v12 = v7;
    v13 = v8;
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addChild:", v14);
    -[CMStyle appendSizeInfoFromRect:](self->super.mStyle, "appendSizeInfoFromRect:", v11, v12, v10, v13);
    if (self->super.mIsSupported && (mImageBinaryData = self->super.mImageBinaryData) != 0)
    {
      mResourceType = self->super.mResourceType;
      v18.receiver = self;
      v18.super_class = (Class)WMPictureMapper;
      -[CMDrawableMapper saveResourceAndReturnPath:withType:](&v18, sel_saveResourceAndReturnPath_withType_, mImageBinaryData, mResourceType);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C78, v14, v17);

    }
    else
    {
      -[CMStyle appendDefaultBorderStyle](self->super.mStyle, "appendDefaultBorderStyle");
    }
    -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v14, self->super.mStyle);

  }
}

- (void)mapBounds
{
  void *v3;
  OADOrientedBounds *v4;
  OADOrientedBounds *mOrientedBounds;
  OADOrientedBounds *v6;
  id v7;

  -[OADDrawable clientData](self->super.mDrawable, "clientData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[OADDrawable drawableProperties](self->super.mDrawable, "drawableProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "orientedBounds");
    v4 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
    mOrientedBounds = self->super.mOrientedBounds;
    self->super.mOrientedBounds = v4;

LABEL_5:
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "hasBounds"))
  {
    objc_msgSend(v7, "bounds");
    +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
    v6 = (OADOrientedBounds *)objc_claimAutoreleasedReturnValue();
    v3 = self->super.mOrientedBounds;
    self->super.mOrientedBounds = v6;
    goto LABEL_5;
  }
LABEL_6:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->wdPicture, 0);
}

@end
