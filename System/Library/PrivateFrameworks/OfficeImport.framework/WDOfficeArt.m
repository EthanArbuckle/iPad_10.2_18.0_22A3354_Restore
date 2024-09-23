@implementation WDOfficeArt

- (WDOfficeArt)initWithParagraph:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDOfficeArt;
  return -[WDRunWithCharacterProperties initWithParagraph:](&v4, sel_initWithParagraph_, a3);
}

- (void)setDrawable:(id)a3
{
  objc_storeStrong((id *)&self->mDrawable, a3);
}

- (id)drawable
{
  return self->mDrawable;
}

- (void)checkForFloating:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  self->mFloating = 1;
  v12 = v4;
  v5 = objc_msgSend(v4, "runCount");
  v6 = v5;
  v7 = v5 - 3;
  if (v5 >= 3)
  {
    objc_msgSend(v12, "runAt:", v5 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "runType") == 7 && objc_msgSend(v9, "fieldMarkerType") == 20)
    {
      objc_msgSend(v12, "runAt:", v6 - 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (objc_msgSend(v10, "runType"))
        {
          v9 = v10;
        }
        else
        {
          objc_msgSend(v10, "string");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "runAt:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9
            && objc_msgSend(v9, "runType") == 7
            && objc_msgSend(v9, "fieldMarkerType") == 19
            && !objc_msgSend(v11, "compare:", CFSTR(" SHAPE  \\* MERGEFORMAT ")))
          {
            self->mFloating = 0;
          }

        }
      }
      else
      {
        v9 = 0;
      }
    }

  }
}

- (BOOL)isFloating
{
  return self->mFloating;
}

- (int)runType
{
  return 3;
}

- (BOOL)isDrawableOverridden
{
  return self->mDrawable != 0;
}

- (void)setFloating:(BOOL)a3
{
  self->mFloating = a3;
}

- (void)propagateTextTypeToDrawables
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  -[WDRun paragraph](self, "paragraph");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "textType");

  -[WDOfficeArt drawable](self, "drawable");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WDOfficeArt setTextType:recursivelyToDrawable:](self, "setTextType:recursivelyToDrawable:", v4);

}

- (void)setTextType:(int)a3 recursivelyToDrawable:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v11 = a4;
  objc_msgSend(v11, "clientData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setTextType:", v4);
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_255B1D5C8))
  {
    v7 = v11;
    v8 = objc_msgSend(v7, "childCount");
    if (v8)
    {
      v9 = 0;
      do
      {
        objc_msgSend(v7, "childAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDOfficeArt setTextType:recursivelyToDrawable:](self, "setTextType:recursivelyToDrawable:", v4, v10);

        ++v9;
      }
      while (v8 != v9);
    }

  }
}

- (id)overrideDrawable
{
  return 0;
}

- (void)clearDrawable
{
  OADDrawable *mDrawable;

  mDrawable = self->mDrawable;
  self->mDrawable = 0;

}

- (id)imageBlipRef
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[OADDrawable imageProperties](self->mDrawable, "imageProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageFill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blipRef");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setImageBlipRef:(id)a3
{
  OADImage *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[OADImage initWithBlipRef:]([OADImage alloc], "initWithBlipRef:", v6);
  -[OADDrawable createWordClientDataWithTextType:](v4, "createWordClientDataWithTextType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDrawable:", v4);
  -[WDOfficeArt setDrawable:](self, "setDrawable:", v4);

}

- (id)imageData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[OADDrawable imageProperties](self->mDrawable, "imageProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageFill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blipRef");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "blip");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mainSubBlip");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)imageName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[OADDrawable imageProperties](self->mDrawable, "imageProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageFill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blipRef");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (int)textBoxTextTypeForRegularTextType:(int)a3
{
  int v3;

  if (a3 == 2)
    v3 = 7;
  else
    v3 = -1;
  if (a3)
    return v3;
  else
    return 6;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDOfficeArt;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawable, 0);
}

@end
