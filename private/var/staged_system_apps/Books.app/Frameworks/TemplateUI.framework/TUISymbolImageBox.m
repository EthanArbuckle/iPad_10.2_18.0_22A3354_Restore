@implementation TUISymbolImageBox

- (TUISymbolImageBox)init
{
  TUISymbolImageBox *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUISymbolImageBox;
  result = -[TUIBox init](&v3, "init");
  if (result)
    *(_BYTE *)&result->_flags = 0;
  return result;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUISymbolImageLayout, a2);
}

- (void)setBaseline:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)baseline
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)setHflipForRTL:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hflipForRTL
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

+ (int64_t)scaleFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (qword_2CB828 != -1)
    dispatch_once(&qword_2CB828, &stru_2423E0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB820, "objectForKeyedSubscript:", v3));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v6 = &dword_0 + 2;

  return (int64_t)v6;
}

+ (int64_t)weightFromString:(id)a3 withDefault:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  if (qword_2CB838 != -1)
    dispatch_once(&qword_2CB838, &stru_242400);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB830, "objectForKeyedSubscript:", v5));
  v7 = v6;
  if (v6)
    a4 = (int64_t)objc_msgSend(v6, "unsignedIntegerValue");

  return a4;
}

+ (unint64_t)renderingModeFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (qword_2CB848 != -1)
    dispatch_once(&qword_2CB848, &stru_242420);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB840, "objectForKeyedSubscript:", v3));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "unsignedIntegerValue");
  else
    v6 = 0;

  return (unint64_t)v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)scale
{
  return self->_scale;
}

- (void)setScale:(int64_t)a3
{
  self->_scale = a3;
}

- (int64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(int64_t)a3
{
  self->_weight = a3;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (NSString)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(id)a3
{
  objc_storeStrong((id *)&self->_blendMode, a3);
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (void)setRenderingMode:(unint64_t)a3
{
  self->_renderingMode = a3;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_blendMode, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
