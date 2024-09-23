@implementation UIIndexBarEntry

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (void)setIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

+ (UIIndexBarEntry)entryWithTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "entryWithType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  return (UIIndexBarEntry *)v5;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

+ (UIIndexBarEntry)entryWithType:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setType:", a3);
  return (UIIndexBarEntry *)v4;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

+ (id)entryForNumbers
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "entryWithType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIImageWithName(CFSTR("UISectionListPoundSign"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  return v2;
}

+ (id)entryForSearch
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "entryWithType:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UIImageWithName(CFSTR("UITableViewIndexSearchGlyph"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  return v2;
}

+ (id)entryForDotInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "entryWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dotImageInView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setImage:", v6);
  return v5;
}

+ (id)_dotImageInView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 3)
    objc_msgSend(a1, "_externalDotImageInView:", v4);
  else
    _UIImageWithName(CFSTR("UITableViewIndexDot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_externalDotImageInView:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__UIIndexBarEntry__externalDotImageInView___block_invoke;
  block[3] = &unk_1E16B1B28;
  v11 = v3;
  v4 = _MergedGlobals_1323;
  v5 = v3;
  v6 = v5;
  if (v4 == -1)
  {
    v7 = v5;
  }
  else
  {
    dispatch_once(&_MergedGlobals_1323, block);
    v7 = v11;
  }
  v8 = (id)qword_1ECD824D0;

  return v8;
}

void __43__UIIndexBarEntry__externalDotImageInView___block_invoke(uint64_t a1)
{
  double v1;
  _QWORD *ContextStack;
  CGContext *v3;
  uint64_t v4;
  void *v5;
  CGRect v6;

  objc_msgSend(*(id *)(a1 + 32), "_currentScreenScale");
  _UIGraphicsBeginImageContextWithOptions(0, 0, 4.0, 4.0, v1);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v3 = 0;
  else
    v3 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 4.0;
  v6.size.height = 4.0;
  CGContextFillEllipseInRect(v3, v6);
  _UIGraphicsGetImageFromCurrentImageContext(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECD824D0;
  qword_1ECD824D0 = v4;

  UIGraphicsEndImageContext();
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; title='%@'"), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("; shortTitle='%@'"), self->_shortTitle);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)effectiveShortTitle
{
  void *v3;

  -[UIIndexBarEntry shortTitle](self, "shortTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[UIIndexBarEntry shortTitle](self, "shortTitle");
  else
    -[UIIndexBarEntry title](self, "title");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasPoundTitle
{
  void *v2;
  void *v3;
  char v4;

  -[UIIndexBarEntry title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEqualToString:", CFSTR("#"));
  else
    v4 = 0;

  return v4;
}

- (NSString)shortTitle
{
  return self->_shortTitle;
}

- (void)setShortTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_shortTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
