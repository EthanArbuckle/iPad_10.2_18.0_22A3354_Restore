@implementation OADTableCellBorderStyle

- (void)setLeftStroke:(id)a3
{
  objc_storeStrong((id *)&self->mLeftStroke, a3);
}

- (void)setRightStroke:(id)a3
{
  objc_storeStrong((id *)&self->mRightStroke, a3);
}

- (void)setTopStroke:(id)a3
{
  objc_storeStrong((id *)&self->mTopStroke, a3);
}

- (void)setBottomStroke:(id)a3
{
  objc_storeStrong((id *)&self->mBottomStroke, a3);
}

- (void)setHorzInsideStroke:(id)a3
{
  objc_storeStrong((id *)&self->mHorzInsideStroke, a3);
}

- (void)setVertInsideStroke:(id)a3
{
  objc_storeStrong((id *)&self->mVertInsideStroke, a3);
}

- (id)topStroke
{
  return self->mTopStroke;
}

- (id)bottomStroke
{
  return self->mBottomStroke;
}

- (id)horzInsideStroke
{
  return self->mHorzInsideStroke;
}

- (id)leftStroke
{
  return self->mLeftStroke;
}

- (id)rightStroke
{
  return self->mRightStroke;
}

- (id)vertInsideStroke
{
  return self->mVertInsideStroke;
}

- (id)stroke:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 1:
      -[OADTableCellBorderStyle leftStroke](self, "leftStroke", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[OADTableCellBorderStyle rightStroke](self, "rightStroke", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[OADTableCellBorderStyle topStroke](self, "topStroke", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[OADTableCellBorderStyle bottomStroke](self, "bottomStroke", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[OADTableCellBorderStyle horzInsideStroke](self, "horzInsideStroke", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      -[OADTableCellBorderStyle vertInsideStroke](self, "vertInsideStroke", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      -[OADTableCellBorderStyle topLeftToBottomRightStroke](self, "topLeftToBottomRightStroke", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      -[OADTableCellBorderStyle bottomLeftToTopRightStroke](self, "bottomLeftToTopRightStroke", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (void)setStrokeOfType:(int)a3 toValue:(id)a4
{
  id v6;

  v6 = a4;
  switch(a3)
  {
    case 1:
      -[OADTableCellBorderStyle setLeftStroke:](self, "setLeftStroke:", v6);
      break;
    case 2:
      -[OADTableCellBorderStyle setRightStroke:](self, "setRightStroke:", v6);
      break;
    case 3:
      -[OADTableCellBorderStyle setTopStroke:](self, "setTopStroke:", v6);
      break;
    case 4:
      -[OADTableCellBorderStyle setBottomStroke:](self, "setBottomStroke:", v6);
      break;
    case 5:
      -[OADTableCellBorderStyle setHorzInsideStroke:](self, "setHorzInsideStroke:", v6);
      break;
    case 6:
      -[OADTableCellBorderStyle setVertInsideStroke:](self, "setVertInsideStroke:", v6);
      break;
    case 7:
      -[OADTableCellBorderStyle setTopLeftToBottomRightStroke:](self, "setTopLeftToBottomRightStroke:", v6);
      break;
    case 8:
      -[OADTableCellBorderStyle setBottomLeftToTopRightStroke:](self, "setBottomLeftToTopRightStroke:", v6);
      break;
    default:
      break;
  }

}

- (id)topLeftToBottomRightStroke
{
  return self->mTopLeftToBottomRightStroke;
}

- (void)setTopLeftToBottomRightStroke:(id)a3
{
  objc_storeStrong((id *)&self->mTopLeftToBottomRightStroke, a3);
}

- (id)bottomLeftToTopRightStroke
{
  return self->mBottomLeftToTopRightStroke;
}

- (void)setBottomLeftToTopRightStroke:(id)a3
{
  objc_storeStrong((id *)&self->mBottomLeftToTopRightStroke, a3);
}

+ (id)defaultAxisParallelStroke
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;

  v2 = (void *)+[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke;
  if (!+[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke)
  {
    +[OADStroke blackStroke](OADStroke, "blackStroke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "copy");
    v5 = (void *)+[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke;
    +[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke = v4;

    LODWORD(v6) = 1.0;
    objc_msgSend((id)+[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke, "setWidth:", v6);
    v2 = (void *)+[OADTableCellBorderStyle defaultAxisParallelStroke]::defaultAxisParallelStroke;
  }
  return v2;
}

+ (id)defaultObliqueStroke
{
  return +[OADStroke nullStroke](OADStroke, "nullStroke");
}

+ (id)defaultStyle
{
  void *v3;
  OADTableCellBorderStyle *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
  if (!+[OADTableCellBorderStyle defaultStyle]::defaultStyle)
  {
    v4 = objc_alloc_init(OADTableCellBorderStyle);
    v5 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    +[OADTableCellBorderStyle defaultStyle]::defaultStyle = (uint64_t)v4;

    v6 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultAxisParallelStroke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLeftStroke:", v7);

    v8 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultAxisParallelStroke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightStroke:", v9);

    v10 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultAxisParallelStroke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTopStroke:", v11);

    v12 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultAxisParallelStroke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBottomStroke:", v13);

    v14 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultAxisParallelStroke");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHorzInsideStroke:", v15);

    v16 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultAxisParallelStroke");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setVertInsideStroke:", v17);

    v18 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultObliqueStroke");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTopLeftToBottomRightStroke:", v19);

    v20 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
    objc_msgSend(a1, "defaultObliqueStroke");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBottomLeftToTopRightStroke:", v21);

    v3 = (void *)+[OADTableCellBorderStyle defaultStyle]::defaultStyle;
  }
  return v3;
}

- (id)shallowCopy
{
  OADTableCellBorderStyle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(OADTableCellBorderStyle);
  -[OADTableCellBorderStyle leftStroke](self, "leftStroke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableCellBorderStyle setLeftStroke:](v3, "setLeftStroke:", v4);

  -[OADTableCellBorderStyle rightStroke](self, "rightStroke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableCellBorderStyle setRightStroke:](v3, "setRightStroke:", v5);

  -[OADTableCellBorderStyle topStroke](self, "topStroke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableCellBorderStyle setTopStroke:](v3, "setTopStroke:", v6);

  -[OADTableCellBorderStyle bottomStroke](self, "bottomStroke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableCellBorderStyle setBottomStroke:](v3, "setBottomStroke:", v7);

  -[OADTableCellBorderStyle horzInsideStroke](self, "horzInsideStroke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableCellBorderStyle setHorzInsideStroke:](v3, "setHorzInsideStroke:", v8);

  -[OADTableCellBorderStyle vertInsideStroke](self, "vertInsideStroke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableCellBorderStyle setVertInsideStroke:](v3, "setVertInsideStroke:", v9);

  -[OADTableCellBorderStyle topLeftToBottomRightStroke](self, "topLeftToBottomRightStroke");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableCellBorderStyle setTopLeftToBottomRightStroke:](v3, "setTopLeftToBottomRightStroke:", v10);

  -[OADTableCellBorderStyle bottomLeftToTopRightStroke](self, "bottomLeftToTopRightStroke");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTableCellBorderStyle setBottomLeftToTopRightStroke:](v3, "setBottomLeftToTopRightStroke:", v11);

  return v3;
}

- (void)applyOverridesFrom:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = a3;
  if (v4)
  {
    v21 = v4;
    objc_msgSend(v4, "leftStroke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v21, "leftStroke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellBorderStyle setLeftStroke:](self, "setLeftStroke:", v6);

    }
    objc_msgSend(v21, "rightStroke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v21, "rightStroke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellBorderStyle setRightStroke:](self, "setRightStroke:", v8);

    }
    objc_msgSend(v21, "topStroke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v21, "topStroke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellBorderStyle setTopStroke:](self, "setTopStroke:", v10);

    }
    objc_msgSend(v21, "bottomStroke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v21, "bottomStroke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellBorderStyle setBottomStroke:](self, "setBottomStroke:", v12);

    }
    objc_msgSend(v21, "horzInsideStroke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v21, "horzInsideStroke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellBorderStyle setHorzInsideStroke:](self, "setHorzInsideStroke:", v14);

    }
    objc_msgSend(v21, "vertInsideStroke");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v21, "vertInsideStroke");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellBorderStyle setVertInsideStroke:](self, "setVertInsideStroke:", v16);

    }
    objc_msgSend(v21, "topLeftToBottomRightStroke");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v21, "topLeftToBottomRightStroke");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellBorderStyle setTopLeftToBottomRightStroke:](self, "setTopLeftToBottomRightStroke:", v18);

    }
    objc_msgSend(v21, "bottomLeftToTopRightStroke");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v21;
    if (v19)
    {
      objc_msgSend(v21, "bottomLeftToTopRightStroke");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTableCellBorderStyle setBottomLeftToTopRightStroke:](self, "setBottomLeftToTopRightStroke:", v20);

      v4 = v21;
    }
  }

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTableCellBorderStyle;
  -[OADTableCellBorderStyle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBottomLeftToTopRightStroke, 0);
  objc_storeStrong((id *)&self->mTopLeftToBottomRightStroke, 0);
  objc_storeStrong((id *)&self->mVertInsideStroke, 0);
  objc_storeStrong((id *)&self->mHorzInsideStroke, 0);
  objc_storeStrong((id *)&self->mBottomStroke, 0);
  objc_storeStrong((id *)&self->mTopStroke, 0);
  objc_storeStrong((id *)&self->mRightStroke, 0);
  objc_storeStrong((id *)&self->mLeftStroke, 0);
}

@end
