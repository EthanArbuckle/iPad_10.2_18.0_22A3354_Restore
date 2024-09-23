@implementation PMSlideMapper

- (PMSlideMapper)initWithPDSlide:(id)a3 slideRect:(CGRect)a4 parent:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  PMSlideMapper *v13;
  PMSlideMapper *v14;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PMSlideMapper;
  v13 = -[CMMapper initWithParent:](&v16, sel_initWithParent_, a5);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mSlide, a3);
    v14->mRect.origin.x = x;
    v14->mRect.origin.y = y;
    v14->mRect.size.width = width;
    v14->mRect.size.height = height;
  }

  return v14;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CMStyle *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PDSlideChild colorMap](self->mSlide, "colorMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setColorMap:", v5);

    -[PDSlideChild colorScheme](self->mSlide, "colorScheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setColorScheme:", v6);

  }
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("class"), CFSTR("slide"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:", v8);

  v9 = objc_alloc_init(CMStyle);
  -[CMStyle appendOriginInfoFromPoint:](v9, "appendOriginInfoFromPoint:", self->mRect.origin.x, self->mRect.origin.y);
  -[CMMapper addStyleUsingGlobalCacheTo:style:embedStyle:](self, "addStyleUsingGlobalCacheTo:style:embedStyle:", v7, v9, 1);
  -[PMSlideMapper mapMasterSlideAt:withState:](self, "mapMasterSlideAt:withState:", v7, v15);
  -[PMSlideMapper mapDrawablesAt:withState:](self, "mapDrawablesAt:withState:", v7, v15);
  -[CMMapper archiver](self, "archiver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isProgressive");

  if (v11)
  {
    -[CMMapper archiver](self, "archiver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushCssToPath:", 0);

    -[CMMapper archiver](self, "archiver");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "XMLString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushText:toPath:", v14, 0);

  }
}

- (void)mapMasterSlideAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  PMMasterSlideMapper *v9;
  PMMasterSlideMapper *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[PMSlideMapper mapBackgroundAt:recursive:withState:](self, "mapBackgroundAt:recursive:withState:", v11, 1, v6);
  if (-[PDSlideChild showMasterShapes](self->mSlide, "showMasterShapes"))
  {
    -[PDSlide slideLayout](self->mSlide, "slideLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "showMasterShapes"))
    {
      objc_msgSend(v7, "slideMaster");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[PMMasterSlideMapper initWithPDSlide:parent:]([PMMasterSlideMapper alloc], "initWithPDSlide:parent:", v8, self);
        -[PMMasterSlideMapper mapMasterGraphicsAt:withState:](v9, "mapMasterGraphicsAt:withState:", v11, v6);

      }
      if (!v7)
        goto LABEL_9;
    }
    else
    {
      v8 = 0;
      if (!v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    v10 = -[PMMasterSlideMapper initWithPDSlide:parent:]([PMMasterSlideMapper alloc], "initWithPDSlide:parent:", v7, self);
    -[PMMasterSlideMapper mapMasterGraphicsAt:withState:](v10, "mapMasterGraphicsAt:withState:", v11, v6);

    goto LABEL_9;
  }
LABEL_10:

}

- (void)mapBackgroundAt:(id)a3 recursive:(BOOL)a4 withState:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  PDSlide *v10;
  PDSlide *v11;
  uint64_t v12;
  PMBackgroundMapper *v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v8 = a5;
  -[PDSlide background](self->mSlide, "background");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->mSlide;
  if (v6)
  {
    if (!v9)
      goto LABEL_5;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1 | (v10 == 0))
        goto LABEL_9;
      while (1)
      {
        -[PDSlide parentSlideBase](v10, "parentSlideBase");
        v11 = (PDSlide *)objc_claimAutoreleasedReturnValue();

        -[PDSlide background](v11, "background");
        v12 = objc_claimAutoreleasedReturnValue();

        v10 = v11;
        v9 = (void *)v12;
        if (v12)
          break;
LABEL_5:
        if (!v10)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
    }
  }
  if (v9)
  {
LABEL_9:
    v13 = -[PMBackgroundMapper initWithOadBackground:parent:]([PMBackgroundMapper alloc], "initWithOadBackground:parent:", v9, self);
    -[PMBackgroundMapper mapAt:withState:](v13, "mapAt:withState:", v14, v8);

  }
LABEL_11:

}

- (void)mapDrawablesAt:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PMDrawableMapper *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[PDSlideBase drawables](self->mSlide, "drawables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    objc_msgSend(v8, "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      break;
    v10 = -[CMDrawableMapper initWithOadDrawable:parent:]([PMDrawableMapper alloc], "initWithOadDrawable:parent:", v9, self);
    -[PMDrawableMapper mapAt:withState:](v10, "mapAt:withState:", v11, v6);

  }
}

- (id)defaultTheme
{
  return -[PDSlide defaultTheme](self->mSlide, "defaultTheme");
}

- (id)styleMatrix
{
  return -[PDSlideChild styleMatrix](self->mSlide, "styleMatrix");
}

- (id)slideName
{
  return -[PDSlideBase name](self->mSlide, "name");
}

- (CGRect)slideRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mRect.origin.x;
  y = self->mRect.origin.y;
  width = self->mRect.size.width;
  height = self->mRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSlide, 0);
}

@end
