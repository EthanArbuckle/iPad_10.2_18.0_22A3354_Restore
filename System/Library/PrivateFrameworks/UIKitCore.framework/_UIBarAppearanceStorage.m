@implementation _UIBarAppearanceStorage

- (BOOL)hasAnyCustomBackgroundImage
{
  return -[NSMutableDictionary count](self->_backgroundImages, "count") != 0;
}

- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  NSMutableDictionary *backgroundImages;
  void *v5;
  void *v6;

  backgroundImages = self->_backgroundImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4 + 1000 * a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](backgroundImages, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *backgroundImages;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5 + 1000 * a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "typicalBarPosition"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (!v17)
    {
      if (v9)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImages, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImages, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v12)
          -[NSMutableDictionary removeObjectForKey:](self->_backgroundImages, "removeObjectForKey:", v10);
      }
      goto LABEL_12;
    }
  }
  else
  {
    v10 = 0;
    if (!v17)
    {
LABEL_12:
      -[NSMutableDictionary removeObjectForKey:](self->_backgroundImages, "removeObjectForKey:", v8);
      goto LABEL_13;
    }
  }
  backgroundImages = self->_backgroundImages;
  if (!backgroundImages)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = self->_backgroundImages;
    self->_backgroundImages = v14;

    backgroundImages = self->_backgroundImages;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](backgroundImages, "setObject:forKeyedSubscript:");
  if (v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundImages, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backgroundImages, "setObject:forKeyedSubscript:", v17, v10);
  }
LABEL_13:

}

+ (int64_t)typicalBarPosition
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIBarCommon.m"), 72, CFSTR("Abstract method requires overriding in subclasses"));

  return 0;
}

- (void)setAllBackgroundImages:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *backgroundImages;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  backgroundImages = self->_backgroundImages;
  self->_backgroundImages = v4;

}

- (id)allBackgroundImages
{
  return (id)-[NSMutableDictionary copy](self->_backgroundImages, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImages, 0);
}

@end
