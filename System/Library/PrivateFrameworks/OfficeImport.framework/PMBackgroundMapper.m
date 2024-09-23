@implementation PMBackgroundMapper

- (PMBackgroundMapper)initWithOadBackground:(id)a3 parent:(id)a4
{
  id v7;
  PMBackgroundMapper *v8;
  PMBackgroundMapper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMBackgroundMapper;
  v8 = -[CMMapper initWithParent:](&v11, sel_initWithParent_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->mBackground, a3);

  return v9;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CMDrawableStyle *v16;
  CMImageFillMapper *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  -[PMBackgroundMapper slideRect](self, "slideRect");
  if (self->mBackground)
  {
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[OADBackground fill](self->mBackground, "fill");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc_init(CMDrawableStyle);
      v17 = -[CMImageFillMapper initWithOadFill:bounds:parent:]([CMImageFillMapper alloc], "initWithOadFill:bounds:parent:", v15, self, v11, v12, v13, v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v15, "technique"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            isKindOfClass = objc_opt_isKindOfClass(),
            v18,
            (isKindOfClass & 1) != 0))
      {
        +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMImageFillMapper mapImageFillAt:toStyle:withState:](v17, "mapImageFillAt:toStyle:withState:", v20, v16, v6);
      }
      else
      {
        +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMImageFillMapper mapNonImageFillAt:toStyle:withState:](v17, "mapNonImageFillAt:toStyle:withState:", v21, v16, v6);
      }
      -[CMStyle appendPositionInfoFromRect:](v16, "appendPositionInfoFromRect:", v11, v12, v13, v14);
      -[CMStyle appendPropertyForName:stringValue:](v16, "appendPropertyForName:stringValue:", 0x24F3D4B58, 0x24F3DCD38);
      -[CMMapper addStyleUsingGlobalCacheTo:style:](self, "addStyleUsingGlobalCacheTo:style:", v20, v16);
      objc_msgSend(v21, "addChild:", v20);

    }
  }

}

- (CGRect)slideRect
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
  CGRect result;

  -[CMMapper root](self, "root");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "slideSize");
    v4 = v3;
    v6 = v5;
    v7 = 0.0;
    v8 = 0.0;
  }
  else
  {
    v7 = *MEMORY[0x24BDBF090];
    v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v9 = v7;
  v10 = v8;
  v11 = v4;
  v12 = v6;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBackground, 0);
}

@end
