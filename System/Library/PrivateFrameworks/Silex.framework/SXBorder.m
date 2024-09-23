@implementation SXBorder

- (id)defaultStrokeStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SXBorder all](self, "all");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXBorder all](self, "all");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SXBorder left](self, "left");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SXBorder left](self, "left");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SXBorder right](self, "right");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[SXBorder right](self, "right");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[SXBorder top](self, "top");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          -[SXBorder top](self, "top");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[SXBorder bottom](self, "bottom");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            -[SXBorder bottom](self, "bottom");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v4 = 0;
          }
        }
      }
    }
  }
  return v4;
}

- (BOOL)shouldBeDotted
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SXBorder all](self, "all");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "style") == 3)
  {
    v4 = 1;
  }
  else
  {
    -[SXBorder top](self, "top");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "style") == 3)
    {
      v4 = 1;
    }
    else
    {
      -[SXBorder bottom](self, "bottom");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "style") == 3)
      {
        v4 = 1;
      }
      else
      {
        -[SXBorder left](self, "left");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "style") == 3)
        {
          v4 = 1;
        }
        else
        {
          -[SXBorder right](self, "right");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v8, "style") == 3;

        }
      }

    }
  }

  return v4;
}

- (BOOL)isSolid
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SXBorder all](self, "all");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "style") == 1)
  {
    v4 = 1;
  }
  else
  {
    -[SXBorder top](self, "top");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "style") == 1)
    {
      v4 = 1;
    }
    else
    {
      -[SXBorder bottom](self, "bottom");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "style") == 1)
      {
        v4 = 1;
      }
      else
      {
        -[SXBorder left](self, "left");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "style") == 1)
        {
          v4 = 1;
        }
        else
        {
          -[SXBorder right](self, "right");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v8, "style") == 1;

        }
      }

    }
  }

  return v4;
}

@end
