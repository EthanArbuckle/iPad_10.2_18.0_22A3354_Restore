@implementation SUToolbarAppearance

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUToolbarAppearance;
  -[SUToolbarAppearance dealloc](&v3, sel_dealloc);
}

+ (id)defaultToolbarAppearance
{
  SUToolbarAppearance *v2;
  uint64_t v3;

  v2 = objc_alloc_init(SUToolbarAppearance);
  v3 = objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  -[SUToolbarAppearance setBackgroundImage:forPosition:barMetrics:](v2, "setBackgroundImage:forPosition:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UIBottomBarDefaultBackground"), v3), 0, 0);
  -[SUToolbarAppearance setBackgroundImage:forPosition:barMetrics:](v2, "setBackgroundImage:forPosition:barMetrics:", objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("UIBottomBarMiniDefaultBackground"), v3), 0, 1);
  return v2;
}

- (id)backgroundImageForPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%ld:%ld"), a3, a4);
  v6 = (id)-[NSMutableDictionary objectForKey:](self->_backgroundImages, "objectForKey:", v5);

  return v6;
}

- (void)enumerateBackgroundImagesUsingBlock:(id)a3
{
  NSMutableDictionary *backgroundImages;
  _QWORD v4[5];

  backgroundImages = self->_backgroundImages;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__SUToolbarAppearance_enumerateBackgroundImagesUsingBlock___block_invoke;
  v4[3] = &unk_24DE7E2E8;
  v4[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](backgroundImages, "enumerateKeysAndObjectsUsingBlock:", v4);
}

uint64_t __59__SUToolbarAppearance_enumerateBackgroundImagesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;

  v3 = (void *)objc_msgSend(a2, "componentsSeparatedByString:", CFSTR(":"));
  result = objc_msgSend(v3, "count");
  if (result == 2)
  {
    objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 0), "integerValue");
    objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", 1), "integerValue");
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

- (void)enumerateShadowImagesUsingBlock:(id)a3
{
  NSMutableDictionary *shadowImages;
  _QWORD v4[5];

  shadowImages = self->_shadowImages;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SUToolbarAppearance_enumerateShadowImagesUsingBlock___block_invoke;
  v4[3] = &unk_24DE7E310;
  v4[4] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](shadowImages, "enumerateKeysAndObjectsUsingBlock:", v4);
}

uint64_t __55__SUToolbarAppearance_enumerateShadowImagesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3, objc_msgSend(a2, "integerValue"));
}

- (void)setBackgroundImage:(id)a3 forPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  uint64_t v7;
  NSMutableDictionary *backgroundImages;
  id v9;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%ld:%ld"), a4, a5);
  backgroundImages = self->_backgroundImages;
  v9 = (id)v7;
  if (a3)
  {
    if (!backgroundImages)
    {
      backgroundImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_backgroundImages = backgroundImages;
    }
    -[NSMutableDictionary setObject:forKey:](backgroundImages, "setObject:forKey:", a3, v9);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](backgroundImages, "removeObjectForKey:");
  }

}

- (void)setShadowImage:(id)a3 forPosition:(int64_t)a4
{
  uint64_t v6;
  NSMutableDictionary *shadowImages;
  id v8;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a4);
  shadowImages = self->_shadowImages;
  v8 = (id)v6;
  if (a3)
  {
    if (!shadowImages)
    {
      shadowImages = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      self->_shadowImages = shadowImages;
    }
    -[NSMutableDictionary setObject:forKey:](shadowImages, "setObject:forKey:", a3, v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](shadowImages, "removeObjectForKey:");
  }

}

- (id)shadowImageForPosition:(int64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  v5 = (id)-[NSMutableDictionary objectForKey:](self->_shadowImages, "objectForKey:", v4);

  return v5;
}

- (void)styleToolbar:(id)a3
{
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  objc_msgSend(a3, "setTintColor:", self->_tintColor);
  v5 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__SUToolbarAppearance_styleToolbar___block_invoke;
  v7[3] = &unk_24DE7E338;
  v7[4] = a3;
  -[SUToolbarAppearance enumerateBackgroundImagesUsingBlock:](self, "enumerateBackgroundImagesUsingBlock:", v7);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __36__SUToolbarAppearance_styleToolbar___block_invoke_2;
  v6[3] = &unk_24DE7E360;
  v6[4] = a3;
  -[SUToolbarAppearance enumerateShadowImagesUsingBlock:](self, "enumerateShadowImagesUsingBlock:", v6);
}

uint64_t __36__SUToolbarAppearance_styleToolbar___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundImage:forToolbarPosition:barMetrics:", a2, a3, a4);
}

uint64_t __36__SUToolbarAppearance_styleToolbar___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShadowImage:forToolbarPosition:", a2, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = -[NSMutableDictionary mutableCopyWithZone:](self->_backgroundImages, "mutableCopyWithZone:", a3);
  v5[2] = -[NSMutableDictionary mutableCopyWithZone:](self->_shadowImages, "mutableCopyWithZone:", a3);
  v5[3] = self->_tintColor;
  return v5;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
