@implementation CMImageFillMapper

- (CMImageFillMapper)initWithOadFill:(id)a3 bounds:(CGRect)a4 parent:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  CMImageFillMapper *v13;
  CMImageFillMapper *v14;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMImageFillMapper;
  v13 = -[CMMapper initWithParent:](&v16, sel_initWithParent_, a5);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->mFill, a3);
    v14->mBounds.origin.x = x;
    v14->mBounds.origin.y = y;
    v14->mBounds.size.width = width;
    v14->mBounds.size.height = height;
  }

  return v14;
}

- (void)mapNonImageFillAt:(id)a3 toStyle:(id)a4 withState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if (self->mFill)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[OADFill color](self->mFill, "color");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[CMColorProperty nsColorFromOADColor:state:](CMColorProperty, "nsColorFromOADColor:state:", v10, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        +[CMColorProperty cssStringFromTSUColor:](CMColorProperty, "cssStringFromTSUColor:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendPropertyForName:stringWithColons:", 0x24F3E6CB8, v12);
        goto LABEL_5;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[CMColorProperty cssStringFromOADGradientFill:state:](CMColorProperty, "cssStringFromOADGradientFill:state:", self->mFill, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v8, "appendPropertyForName:stringWithColons:", 0x24F3E6CD8, v11);
          goto LABEL_6;
        }
        +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", self->mFill, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[CMColorProperty cssStringFromTSUColor:](CMColorProperty, "cssStringFromTSUColor:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendPropertyForName:stringWithColons:", 0x24F3E6CB8, v13);

LABEL_5:
LABEL_6:

        goto LABEL_7;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CMImageFillMapper mapImageFill:withState:](self, "mapImageFill:withState:", v14, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(":url(%@);"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendPropertyForName:stringWithColons:", 0x24F3E6CD8, v12);
          goto LABEL_5;
        }
      }
    }
  }
LABEL_7:

}

- (BOOL)isCropped
{
  OADFill *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;
  float v7;
  float v8;
  BOOL v9;

  v2 = self->mFill;
  if ((-[OADFill isSourceRectOverridden](v2, "isSourceRectOverridden") & 1) != 0)
  {
    -[OADFill sourceRect](v2, "sourceRect");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v9 = 0;
    if (v3)
    {
      objc_msgSend(v3, "left");
      if (v5 != 0.0
        || (objc_msgSend(v4, "right"), v6 != 0.0)
        || (objc_msgSend(v4, "top"), v7 != 0.0)
        || (objc_msgSend(v4, "bottom"), v8 != 0.0))
      {
        v9 = 1;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)mapImageFill:(id)a3 withState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a4;
  -[CMMapper archiver](self, "archiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedPathForDrawable:", self->mFill);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[CMImageFillMapper mainSubBlip](self, "mainSubBlip");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "load") & 1) != 0)
    {
      v11 = objc_msgSend(v10, "type");
      objc_msgSend(v10, "data");
      if ((v11 & 0xFFFFFFFE) == 4)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMImageFillMapper convertMetafileToPdf:state:](self, "convertMetafileToPdf:state:", v12, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "addResourceForDrawable:withType:drawable:", v13, +[CMArchiveManager blipTypeToResourceType:](CMArchiveManager, "blipTypeToResourceType:", v11), self->mFill);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)mainSubBlip
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[OADFill isBlipRefOverridden](self->mFill, "isBlipRefOverridden"))
  {
    -[OADFill blipRef](self->mFill, "blipRef");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "blip");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      || (v6 = objc_msgSend(v3, "index"), (int)v6 >= 1)
      && (-[CMImageFillMapper blipAtIndex:](self, "blipAtIndex:", v6),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v4, "mainSubBlip");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  -[CMMapper root](self, "root");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_255B56AE8);

  if (v6)
  {
    -[CMMapper root](self, "root");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "blipAtIndex:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (CGRect)uncroppedBox
{
  void *v3;
  CGRect *p_mBounds;
  double width;
  float v6;
  float v7;
  float v8;
  float v9;
  double height;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  double v18;
  double x;
  float v20;
  double y;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  if (-[CMImageFillMapper isCropped](self, "isCropped"))
  {
    -[OADFill sourceRect](self->mFill, "sourceRect");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    p_mBounds = &self->mBounds;
    width = p_mBounds->size.width;
    objc_msgSend(v3, "left");
    v7 = v6;
    objc_msgSend(v3, "right");
    v9 = v8;
    height = p_mBounds->size.height;
    objc_msgSend(v3, "top");
    v12 = v11;
    objc_msgSend(v3, "bottom");
    v14 = v13;
    objc_msgSend(v3, "left");
    v16 = v15;
    objc_msgSend(v3, "top");
    v17 = width / (float)((float)(1.0 - v7) - v9);
    v18 = height / (float)((float)(1.0 - v12) - v14);
    x = v17 * (float)-v16;
    y = v18 * (float)-v20;

  }
  else
  {
    x = self->mBounds.origin.x;
    y = self->mBounds.origin.y;
    v17 = self->mBounds.size.width;
    v18 = self->mBounds.size.height;
  }
  v22 = x;
  v23 = y;
  v24 = v17;
  v25 = v18;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)convertMetafileToPdf:(id)a3 state:(id)a4
{
  +[MFConverter play:frame:colorMap:fillMap:](MFConverter, "play:frame:colorMap:fillMap:", a3, 0, 0, self->mBounds.origin.x, self->mBounds.origin.y, self->mBounds.size.width, self->mBounds.size.height);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)mapImageFillAt:(id)a3 toStyle:(id)a4 withState:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  -[CMImageFillMapper mapImageFill:withState:](self, "mapImageFill:withState:", v10, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C78, v10, v9);
  else
    objc_msgSend(v8, "appendPropertyForName:stringWithColons:", 0x24F3E6CF8, CFSTR(":1px solid black;"));

}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (self->mFill)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = -[CMImageFillMapper mapImageFill:withState:](self, "mapImageFill:withState:", v8, v6);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFill, 0);
}

@end
