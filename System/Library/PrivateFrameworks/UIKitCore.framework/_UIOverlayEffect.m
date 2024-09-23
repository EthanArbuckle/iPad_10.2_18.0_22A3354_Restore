@implementation _UIOverlayEffect

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (self->_image)
  {
    v8 = +[_UIOverlayEffectViewEntry newEntryWithFilterType:image:alpha:](_UIOverlayEffectViewEntry, "newEntryWithFilterType:image:alpha:", self->_filterType, self->_alpha);
  }
  else
  {
    if (!self->_color)
      goto LABEL_7;
    v8 = +[_UIOverlayEffectViewEntry newEntryWithFilterType:color:alpha:](_UIOverlayEffectViewEntry, "newEntryWithFilterType:color:alpha:", self->_filterType, self->_alpha);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v10, "addOverlay:", v8);

  }
LABEL_7:

}

- (void)setFilterType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (_UIOverlayEffect)init
{
  _UIOverlayEffect *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIOverlayEffect;
  result = -[_UIOverlayEffect init](&v3, sel_init);
  if (result)
    result->_alpha = 1.0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

- (_UIOverlayEffect)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIOverlayEffect;
  return -[UIVisualEffect initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIOverlayEffect;
  -[UIVisualEffect encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSString)filterType
{
  return self->_filterType;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (double)alpha
{
  return self->_alpha;
}

@end
