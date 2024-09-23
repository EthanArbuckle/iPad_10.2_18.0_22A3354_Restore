@implementation EDFontsCollection

- (unint64_t)indexOfObjectWithFontName:(id)a3 color:(id)a4
{
  unint64_t v4;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;

  v7 = a3;
  v8 = a4;
  v9 = -[EDCollection count](self, "count");
  if (v9)
  {
    for (i = 0; v9 != i; ++i)
    {
      -[EDCollection objectAtIndex:](self, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 && (objc_msgSend(v12, "isEqual:", v7) & 1) != 0)
      {
        objc_msgSend(v11, "color");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = objc_msgSend(v14, "isEqual:", v8);
          if (v16)
            v17 = 1;
          else
            v17 = 4;
          if (v16)
            v4 = i;
        }
        else
        {
          v17 = 4;
        }

        if (v17 != 4)
          goto LABEL_17;
      }
      else
      {

      }
    }
  }
  v4 = -1;
LABEL_17:

  return v4;
}

@end
