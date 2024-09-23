@implementation SUPageSectionGroup

- (SUPageSectionGroup)initWithSectionsDictionary:(id)a3
{
  SUPageSectionGroup *v4;
  SUPageSectionGroup *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUPageSectionGroup;
  v4 = -[SUPageSectionGroup init](&v7, sel_init);
  v5 = v4;
  if (v4 && !-[SUPageSectionGroup loadFromDictionary:](v4, "loadFromDictionary:", a3))
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_sections = 0;
  self->_tintColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUPageSectionGroup;
  -[SUPageSectionGroup dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_defaultSectionIndex;
  v5[2] = -[NSArray copyWithZone:](self->_sections, "copyWithZone:", a3);
  v5[3] = self->_style;
  v5[4] = -[UIColor copyWithZone:](self->_tintColor, "copyWithZone:", a3);
  v5[5] = self->_tintStyle;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v5;
  NSArray *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[SUPageSectionGroup style](self, "style"), v5 == objc_msgSend(a3, "style")))
  {
    v6 = -[SUPageSectionGroup sections](self, "sections");
    v7 = (void *)objc_msgSend(a3, "sections");
    v8 = -[NSArray count](v6, "count");
    LOBYTE(v9) = v8 == objc_msgSend(v7, "count");
    if ((_BYTE)v9 && v8 >= 1)
    {
      v10 = 1;
      do
      {
        v9 = objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", v10 - 1), "isEqual:", objc_msgSend(v7, "objectAtIndex:", v10 - 1));
        if (!v9)
          break;
      }
      while (v10++ < v8);
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)loadFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CGColorRef v7;
  CGColor *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  SUPageSection *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F70]), "initWithDictionary:", a3);
  v5 = (void *)objc_msgSend(v4, "dictionaryByEvaluatingConditions");

  -[SUPageSectionGroup setDefaultSectionIndex:](self, "setDefaultSectionIndex:", 0);
  -[SUPageSectionGroup setStyle:](self, "setStyle:", -[SUPageSectionGroup _sectionStyleForString:](self, "_sectionStyleForString:", objc_msgSend(v5, "objectForKey:", CFSTR("type"))));
  v6 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("tint-color"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = SUCreateColorFromStyleString(v6);
    if (v7)
    {
      v8 = v7;
      -[SUPageSectionGroup setTintColor:](self, "setTintColor:", objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v7));
      CGColorRelease(v8);
    }
  }
  v9 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("tint-style"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("dark"));
  else
    v10 = 1;
  -[SUPageSectionGroup setTintStyle:](self, "setTintStyle:", v10);
  v11 = (void *)objc_msgSend(v5, "objectForKey:", CFSTR("tabs"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v18 = (void *)objc_msgSend(v17, "objectForKey:", CFSTR("active-tab"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "integerValue") >= 1)
            -[SUPageSectionGroup setDefaultSectionIndex:](self, "setDefaultSectionIndex:", objc_msgSend(v12, "count"));
          v19 = objc_alloc_init(SUPageSection);
          if (-[SUPageSection loadFromDictionary:](v19, "loadFromDictionary:", v17))
            objc_msgSend(v12, "addObject:", v19);

        }
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }
    -[SUPageSectionGroup setSections:](self, "setSections:", v12);

  }
  return -[NSArray count](-[SUPageSectionGroup sections](self, "sections"), "count") != 0;
}

- (int64_t)_sectionStyleForString:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a3, "isEqualToString:", CFSTR("body"));
  else
    return 0;
}

- (int64_t)defaultSectionIndex
{
  return self->_defaultSectionIndex;
}

- (void)setDefaultSectionIndex:(int64_t)a3
{
  self->_defaultSectionIndex = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (void)setTintStyle:(int64_t)a3
{
  self->_tintStyle = a3;
}

@end
