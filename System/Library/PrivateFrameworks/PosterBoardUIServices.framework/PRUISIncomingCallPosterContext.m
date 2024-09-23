@implementation PRUISIncomingCallPosterContext

- (PRUISIncomingCallPosterContext)init
{
  return -[PRUISIncomingCallPosterContext initWithTitleString:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:](self, "initWithTitleString:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", 0, 0, 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24), *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (PRUISIncomingCallPosterContext)initWithNameVariations:(id)a3 preferredNameStyle:(int64_t)a4 horizontalTitleBoundingRect:(CGRect)a5 verticalTitleBoundingRect:(CGRect)a6 imageAssetID:(id)a7 personalPoster:(BOOL)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v21;
  id v22;
  PRUISIncomingCallPosterContext *v23;
  PRUISIncomingCallPosterContext *v24;
  objc_super v26;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a5.size.height;
  v15 = a5.size.width;
  v16 = a5.origin.y;
  v17 = a5.origin.x;
  v21 = a3;
  v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PRUISIncomingCallPosterContext;
  v23 = -[PRUISIncomingCallPosterContext init](&v26, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_nameVariations, a3);
    v24->_preferredNameStyle = a4;
    v24->_horizontalTitleBoundingRect.origin.x = v17;
    v24->_horizontalTitleBoundingRect.origin.y = v16;
    v24->_horizontalTitleBoundingRect.size.width = v15;
    v24->_horizontalTitleBoundingRect.size.height = v14;
    v24->_verticalTitleBoundingRect.origin.x = x;
    v24->_verticalTitleBoundingRect.origin.y = y;
    v24->_verticalTitleBoundingRect.size.width = width;
    v24->_verticalTitleBoundingRect.size.height = height;
    objc_storeStrong((id *)&v24->_imageAssetID, a7);
    v24->_personalPoster = a8;
  }

  return v24;
}

- (PRUISIncomingCallPosterContext)initWithTitleString:(id)a3 horizontalTitleBoundingRect:(CGRect)a4 verticalTitleBoundingRect:(CGRect)a5 imageAssetID:(id)a6 personalPoster:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  id v18;
  id v19;
  PRUISIncomingCallPosterContextNameVariations *v20;
  void *v21;
  PRUISIncomingCallPosterContext *v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v7 = a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a4.size.height;
  v13 = a4.size.width;
  v14 = a4.origin.y;
  v15 = a4.origin.x;
  v25[2] = *MEMORY[0x24BDAC8D0];
  v18 = a6;
  if (a3)
  {
    v19 = a3;
    v20 = [PRUISIncomingCallPosterContextNameVariations alloc];
    v24[0] = &unk_2515430C8;
    v24[1] = &unk_2515430E0;
    v25[0] = v19;
    v25[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    a3 = -[PRUISIncomingCallPosterContextNameVariations initWithNamesDictionary:](v20, "initWithNamesDictionary:", v21);
  }
  v22 = -[PRUISIncomingCallPosterContext initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:](self, "initWithNameVariations:preferredNameStyle:horizontalTitleBoundingRect:verticalTitleBoundingRect:imageAssetID:personalPoster:", a3, 0, v18, v7, v15, v14, v13, v12, x, y, width, height);

  return v22;
}

- (NSString)preferredTitleString
{
  return (NSString *)-[PRUISIncomingCallPosterContextNameVariations nameForStyle:](self->_nameVariations, "nameForStyle:", self->_preferredNameStyle);
}

- (id)identifierForSnapshotting
{
  return -[PRUISIncomingCallPosterContext identifierForSnapshottingWithNameStyle:](self, "identifierForSnapshottingWithNameStyle:", self->_preferredNameStyle);
}

- (id)identifierForSnapshottingWithNameStyle:(int64_t)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendCGRect:", self->_horizontalTitleBoundingRect.origin.x, self->_horizontalTitleBoundingRect.origin.y, self->_horizontalTitleBoundingRect.size.width, self->_horizontalTitleBoundingRect.size.height);
  v6 = (id)objc_msgSend(v4, "appendCGRect:", self->_verticalTitleBoundingRect.origin.x, self->_verticalTitleBoundingRect.origin.y, self->_verticalTitleBoundingRect.size.width, self->_verticalTitleBoundingRect.size.height);
  -[PRUISIncomingCallPosterContextNameVariations nameForStyle:](self->_nameVariations, "nameForStyle:", self->_preferredNameStyle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
    v9 = (id)objc_msgSend(v4, "appendObject:", v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "nameVariations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISIncomingCallPosterContext nameVariations](self, "nameVariations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSEqualObjects();

    if (!v8)
      goto LABEL_8;
    objc_msgSend(v5, "horizontalTitleBoundingRect");
    -[PRUISIncomingCallPosterContext horizontalTitleBoundingRect](self, "horizontalTitleBoundingRect");
    if (!BSRectEqualToRect())
      goto LABEL_8;
    objc_msgSend(v5, "verticalTitleBoundingRect");
    -[PRUISIncomingCallPosterContext verticalTitleBoundingRect](self, "verticalTitleBoundingRect");
    if (!BSRectEqualToRect())
      goto LABEL_8;
    objc_msgSend(v5, "imageAssetID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISIncomingCallPosterContext imageAssetID](self, "imageAssetID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = BSEqualStrings();

    if (v11)
    {
      v12 = objc_msgSend(v5, "isPersonalPoster");
      v13 = v12 ^ -[PRUISIncomingCallPosterContext isPersonalPoster](self, "isPersonalPoster") ^ 1;
    }
    else
    {
LABEL_8:
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_nameVariations);
  v5 = (id)objc_msgSend(v3, "appendCGRect:", self->_horizontalTitleBoundingRect.origin.x, self->_horizontalTitleBoundingRect.origin.y, self->_horizontalTitleBoundingRect.size.width, self->_horizontalTitleBoundingRect.size.height);
  v6 = (id)objc_msgSend(v3, "appendCGRect:", self->_verticalTitleBoundingRect.origin.x, self->_verticalTitleBoundingRect.origin.y, self->_verticalTitleBoundingRect.size.width, self->_verticalTitleBoundingRect.size.height);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_imageAssetID);
  v8 = (id)objc_msgSend(v3, "appendBool:", self->_personalPoster);
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (void)applyContextToScene:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__PRUISIncomingCallPosterContext_applyContextToScene___block_invoke;
  v3[3] = &unk_251534D10;
  v3[4] = self;
  objc_msgSend(a3, "performUpdate:", v3);
}

void __54__PRUISIncomingCallPosterContext_applyContextToScene___block_invoke(uint64_t a1, void *a2)
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = *(double **)(a1 + 32);
  v4 = v3[5];
  v5 = v3[6];
  v6 = v3[7];
  v7 = v3[8];
  v8 = a2;
  objc_msgSend(v8, "pr_setHorizontalTitleBoundingRect:", v4, v5, v6, v7);
  objc_msgSend(v8, "pr_setVerticalTitleBoundingRect:", *(double *)(*(_QWORD *)(a1 + 32) + 72), *(double *)(*(_QWORD *)(a1 + 32) + 80), *(double *)(*(_QWORD *)(a1 + 32) + 88), *(double *)(*(_QWORD *)(a1 + 32) + 96));

}

- (void)applyContextToEditingSceneViewController:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  id v8;
  id v9;

  x = self->_horizontalTitleBoundingRect.origin.x;
  y = self->_horizontalTitleBoundingRect.origin.y;
  width = self->_horizontalTitleBoundingRect.size.width;
  height = self->_horizontalTitleBoundingRect.size.height;
  v8 = a3;
  objc_msgSend(v8, "setHorizontalTitleBoundingRect:", x, y, width, height);
  objc_msgSend(v8, "setVerticalTitleBoundingRect:", self->_verticalTitleBoundingRect.origin.x, self->_verticalTitleBoundingRect.origin.y, self->_verticalTitleBoundingRect.size.width, self->_verticalTitleBoundingRect.size.height);
  -[PRUISIncomingCallPosterContext preferredTitleString](self, "preferredTitleString");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleString:", v9);

}

- (PRUISIncomingCallPosterContextNameVariations)nameVariations
{
  return self->_nameVariations;
}

- (int64_t)preferredNameStyle
{
  return self->_preferredNameStyle;
}

- (CGRect)horizontalTitleBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_horizontalTitleBoundingRect.origin.x;
  y = self->_horizontalTitleBoundingRect.origin.y;
  width = self->_horizontalTitleBoundingRect.size.width;
  height = self->_horizontalTitleBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)verticalTitleBoundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_verticalTitleBoundingRect.origin.x;
  y = self->_verticalTitleBoundingRect.origin.y;
  width = self->_verticalTitleBoundingRect.size.width;
  height = self->_verticalTitleBoundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)imageAssetID
{
  return self->_imageAssetID;
}

- (BOOL)isPersonalPoster
{
  return self->_personalPoster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAssetID, 0);
  objc_storeStrong((id *)&self->_nameVariations, 0);
}

@end
