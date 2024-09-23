@implementation PXUILabelTile

- (UIView)view
{
  PXUILabel *label;
  PXUILabel *v4;
  PXUILabel *v5;

  label = self->_label;
  if (!label)
  {
    v4 = objc_alloc_init(PXUILabel);
    v5 = self->_label;
    self->_label = v4;

    -[PXUILabel setUserInteractionEnabled:](self->_label, "setUserInteractionEnabled:", 0);
    -[PXUILabel setText:](self->_label, "setText:", self->_text);
    -[PXUILabel setSpec:](self->_label, "setSpec:", self->_spec);
    label = self->_label;
  }
  return (UIView *)label;
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  id v5;

  objc_msgSend(a4, "viewSpec", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUILabelTile _setSpec:](self, "_setSpec:", v5);

}

- (void)becomeReusable
{
  -[PXUILabelTile setText:](self, "setText:", 0);
  -[PXUILabel setHidden:](self->_label, "setHidden:", 1);
}

- (void)prepareForReuse
{
  -[PXUILabel setHidden:](self->_label, "setHidden:", 0);
}

- (void)setText:(id)a3
{
  NSString *v4;
  NSString *text;

  if (self->_text != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    text = self->_text;
    self->_text = v4;

    -[PXUILabel setText:](self->_label, "setText:", self->_text);
  }
}

- (void)_setSpec:(id)a3
{
  PXLabelSpec *v5;
  PXLabelSpec *v6;

  v5 = (PXLabelSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXUILabel setSpec:](self->_label, "setSpec:", self->_spec);
    v5 = v6;
  }

}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
