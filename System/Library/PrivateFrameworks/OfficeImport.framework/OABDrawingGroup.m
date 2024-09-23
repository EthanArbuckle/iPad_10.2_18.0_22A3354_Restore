@implementation OABDrawingGroup

+ (void)readBlipsFromDrawingGroup:(id)a3 toDocument:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  objc_msgSend(a3, "firstChildOfType:", 61441);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBstoreContainerHolder:", v8);
  v9 = objc_msgSend(v8, "childCount");
  if (v9)
  {
    v10 = 0;
    do
    {
      objc_msgSend(v8, "childAt:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "blips");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OABBlip readBlipFromBse:](OABBlip, "readBlipFromBse:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addBlip:", v13);

      ++v10;
    }
    while (v9 != v10);
  }

}

+ (void)readGraphicalDefaultsFromDrawingGroup:(id)a3 toTheme:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  const void *v10;
  char *v11;
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
  void *v22;
  void *v23;
  void *v24;
  char *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v40 = a4;
  v7 = a5;
  objc_msgSend(a3, "firstChildOfType:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (const void *)objc_msgSend(v8, "eshObject");
    if (v10)
    else
      v11 = 0;
    objc_msgSend(v40, "drawableDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lineDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shapeProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABShape readGraphicDefaults:to:state:](OABShape, "readGraphicDefaults:to:state:", v9, v14, v7);

    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "drawableDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lineDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shapeProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFill:", v15);

    objc_msgSend(v40, "drawableDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shapeDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "shapeProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABShape readGraphicDefaults:to:state:](OABShape, "readGraphicDefaults:to:state:", v9, v21, v7);

    objc_msgSend(v40, "drawableDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shapeDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textBodyProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v11 + 272;
    +[OABTextBodyProperties readTextBodyProperties:textBox:useDefaults:state:](OABTextBodyProperties, "readTextBodyProperties:textBox:useDefaults:state:", v24, v25, 1, v7);

    objc_msgSend(v40, "drawableDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "textDefaults");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shapeProperties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABShape readGraphicDefaults:to:state:](OABShape, "readGraphicDefaults:to:state:", v9, v28, v7);

    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "drawableDefaults");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "textDefaults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "shapeProperties");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFill:", v29);

    +[OADStroke nullStroke](OADStroke, "nullStroke");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "drawableDefaults");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "textDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "shapeProperties");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setStroke:", v33);

    objc_msgSend(v40, "drawableDefaults");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "textDefaults");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "textBodyProperties");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABTextBodyProperties readTextBodyProperties:textBox:useDefaults:state:](OABTextBodyProperties, "readTextBodyProperties:textBox:useDefaults:state:", v39, v25, 1, v7);

  }
}

@end
