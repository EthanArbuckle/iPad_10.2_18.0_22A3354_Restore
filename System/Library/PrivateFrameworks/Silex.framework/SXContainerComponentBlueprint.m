@implementation SXContainerComponentBlueprint

- (void)setParentLayoutBlueprint:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXContainerComponentBlueprint;
  v4 = a3;
  -[SXComponentBlueprint setParentLayoutBlueprint:](&v6, sel_setParentLayoutBlueprint_, v4);
  -[SXContainerComponentBlueprint layoutBlueprint](self, "layoutBlueprint", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setParentLayoutBlueprint:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXContainerComponentBlueprint;
  v5 = -[SXComponentBlueprint copyWithZone:](&v10, sel_copyWithZone_);
  -[SXContainerComponentBlueprint layoutBlueprint](self, "layoutBlueprint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[48];
  v5[48] = v7;

  return v5;
}

- (SXLayoutBlueprint)layoutBlueprint
{
  return self->_layoutBlueprint;
}

- (void)setLayoutBlueprint:(id)a3
{
  objc_storeStrong((id *)&self->_layoutBlueprint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutBlueprint, 0);
}

@end
