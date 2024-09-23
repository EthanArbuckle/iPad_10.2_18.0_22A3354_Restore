@implementation _UICollectionViewOutlineCellDisclosureConfiguration

- (_UICollectionViewOutlineCellDisclosureConfiguration)init
{
  void *v3;
  _UICollectionViewOutlineCellDisclosureConfiguration *v4;

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UICollectionViewOutlineCellDisclosureConfiguration initWithImage:alignment:](self, "initWithImage:alignment:", v3, 2);

  return v4;
}

- (_UICollectionViewOutlineCellDisclosureConfiguration)initWithImage:(id)a3 alignment:(int64_t)a4
{
  return -[_UICollectionViewOutlineCellDisclosureConfiguration initWithImage:alignment:animationRotationAngle:disclosureColor:disclosureWasTappedHandler:](self, "initWithImage:alignment:animationRotationAngle:disclosureColor:disclosureWasTappedHandler:", a3, a4, 0, 0, 1.57079633);
}

- (_UICollectionViewOutlineCellDisclosureConfiguration)initWithImage:(id)a3 alignment:(int64_t)a4 animationRotationAngle:(double)a5 disclosureColor:(id)a6 disclosureWasTappedHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  _UICollectionViewOutlineCellDisclosureConfiguration *v16;
  _UICollectionViewOutlineCellDisclosureConfiguration *v17;
  uint64_t v18;
  id disclosureWasTappedHandler;
  objc_super v21;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_UICollectionViewOutlineCellDisclosureConfiguration;
  v16 = -[_UICollectionViewOutlineCellDisclosureConfiguration init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_image, a3);
    v17->_alignment = a4;
    v17->_animationRotationAngle = a5;
    objc_storeStrong((id *)&v17->_disclosureColor, a6);
    v18 = objc_msgSend(v15, "copy");
    disclosureWasTappedHandler = v17->_disclosureWasTappedHandler;
    v17->_disclosureWasTappedHandler = (id)v18;

  }
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithImage:alignment:animationRotationAngle:disclosureColor:disclosureWasTappedHandler:", self->_image, self->_alignment, self->_disclosureColor, self->_disclosureWasTappedHandler, self->_animationRotationAngle);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (double)animationRotationAngle
{
  return self->_animationRotationAngle;
}

- (void)setAnimationRotationAngle:(double)a3
{
  self->_animationRotationAngle = a3;
}

- (UIColor)disclosureColor
{
  return self->_disclosureColor;
}

- (void)setDisclosureColor:(id)a3
{
  objc_storeStrong((id *)&self->_disclosureColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_disclosureWasTappedHandler, 0);
}

@end
