@implementation CHDAxesCollection

- (void)adjustAxesPositionForHorizontalChart
{
  unint64_t v3;
  unint64_t v4;
  uint64_t i;
  void *v6;

  v3 = -[EDCollection count](self, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[EDCollection objectAtIndex:](self, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "adjustAxisPositionForHorizontalChart");

    }
  }
}

- (id)axesAtPosition:(int)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EDCollection count](self, "count");
  if (v6)
  {
    v7 = 0;
    do
    {
      -[EDCollection objectAtIndex:](self, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "axisPosition") == a3)
        objc_msgSend(v5, "addObject:", v8);

      ++v7;
    }
    while (v6 != v7);
  }
  return v5;
}

- (id)axisAtPosition:(int)a3
{
  void *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  void *v15;

  -[CHDAxesCollection axesAtPosition:](self, "axesAtPosition:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = a3 & 0xFFFFFFFE;
  if (v6)
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((((v7 == 2) ^ objc_msgSend(v10, "isSecondary")) & 1) == 0)
        break;
      ++v8;
      v9 = v10;
      if (v6 == v8)
        goto LABEL_7;
    }
    v12 = v5;
    goto LABEL_16;
  }
  v10 = 0;
LABEL_7:
  if (a3 >= 4)
    v11 = a3;
  else
    v11 = (3 - a3);
  -[CHDAxesCollection axesAtPosition:](self, "axesAtPosition:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = objc_msgSend(v12, "count");
  if (v14)
  {
    while (1)
    {
      objc_msgSend(v12, "objectAtIndex:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((((v7 == 2) ^ objc_msgSend(v15, "isSecondary")) & 1) == 0)
        break;
      ++v13;
      v10 = v15;
      if ((char *)v14 == v13)
      {
        v13 = 0;
        v10 = v15;
        goto LABEL_17;
      }
    }
    v10 = v15;
LABEL_16:
    v13 = v10;
    v10 = v13;
  }
LABEL_17:

  return v13;
}

@end
