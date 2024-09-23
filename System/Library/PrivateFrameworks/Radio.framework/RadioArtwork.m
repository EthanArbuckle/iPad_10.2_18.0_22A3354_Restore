@implementation RadioArtwork

- (RadioArtwork)initWithArtworkDictionary:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  RadioArtwork *v12;
  void *v13;
  char isKindOfClass;
  RadioArtwork *v15;
  RadioArtwork *v16;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("height"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "doubleValue");
    v6 = v7;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("width"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ((objc_msgSend(v8, "doubleValue"), v10 = v9, v9 >= 0.00000011920929) ? (v11 = v6 < 0.00000011920929) : (v11 = 1),
        v11))
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("url"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
      v12 = (RadioArtwork *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v18.receiver = self;
        v18.super_class = (Class)RadioArtwork;
        v15 = -[RadioArtwork init](&v18, sel_init);
        v16 = v15;
        if (v15)
        {
          v15->_pixelSize.width = v6;
          v15->_pixelSize.height = v10;
          objc_storeStrong((id *)&v15->_URL, v12);
        }
        self = v16;

        v12 = self;
      }
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (RadioArtwork)initWithArtworkURL:(id)a3 pixelSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  RadioArtwork *v9;
  RadioArtwork *v10;
  RadioArtwork *v11;
  objc_super v13;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)RadioArtwork;
    v9 = -[RadioArtwork init](&v13, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_pixelSize.width = width;
      v9->_pixelSize.height = height;
      objc_storeStrong((id *)&v9->_URL, a3);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p pixelSize:(%g, %g) URL: '%@'>"), objc_opt_class(), self, *(_QWORD *)&self->_pixelSize.width, *(_QWORD *)&self->_pixelSize.height, self->_URL);
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = (unint64_t)self->_pixelSize.height ^ (unint64_t)self->_pixelSize.width;
  return v2 ^ -[NSURL hash](self->_URL, "hash");
}

- (BOOL)isEqual:(id)a3
{
  RadioArtwork *v4;
  uint64_t v5;
  double v6;
  double v7;
  char v9;

  v4 = (RadioArtwork *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[RadioArtwork URL](v4, "URL");
      v5 = objc_claimAutoreleasedReturnValue();
      -[RadioArtwork pixelSize](v4, "pixelSize");
      if (v7 == self->_pixelSize.width && v6 == self->_pixelSize.height)
      {
        if ((uint64_t)self->_URL | v5)
          v9 = objc_msgSend((id)v5, "isEqual:");
        else
          v9 = 1;
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (CGSize)pointSize
{
  double v3;
  double v4;
  CGSize result;

  if (pointSize___onceToken != -1)
    dispatch_once(&pointSize___onceToken, &__block_literal_global_1174);
  v3 = self->_pixelSize.width / *(float *)&pointSize___screenScale;
  v4 = self->_pixelSize.height / *(float *)&pointSize___screenScale;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)pixelSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pixelSize.width;
  height = self->_pixelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

uint64_t __25__RadioArtwork_pointSize__block_invoke()
{
  uint64_t result;
  int v1;

  result = GSMainScreenScaleFactor();
  pointSize___screenScale = v1;
  return result;
}

@end
