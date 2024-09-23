@implementation CHAutoStyling

- (int)defaultMarkerStyleForSeriesIndex:(unint64_t)a3
{
  return -[CHAutoStyling defaultMarkerStyleForSeriesIndex:]::markerStyleArray[a3 % 9];
}

- (void)replaceStrokeAndFillInEmptyMarker:(id)a3 withSeriesGraphicProperties:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "hasStroke"))
  {
    objc_msgSend(v5, "stroke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "fill");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v12, "graphicProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v8, "setStroke:", v9);

  objc_msgSend(v12, "graphicProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v10, "setFill:", v11);

}

+ (id)autoStylingWithChart:(id)a3 drawingTheme:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "isBinary");
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithChart:drawingTheme:", v5, v6);

  return v7;
}

- (CHAutoStyling)initWithChart:(id)a3 drawingTheme:(id)a4
{
  id v7;
  id v8;
  CHAutoStyling *v9;
  CHAutoStyling *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHAutoStyling;
  v9 = -[CHAutoStyling init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mChart, a3);
    objc_storeStrong((id *)&v10->mDrawingTheme, a4);
  }

  return v10;
}

- (id)drawingTheme
{
  return self->mDrawingTheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawingTheme, 0);
  objc_storeStrong((id *)&self->mChart, 0);
}

@end
