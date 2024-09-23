@implementation _UITransformToReasonAssociation

+ (id)association:(id)a3 reason:(id)a4
{
  id v5;
  id v6;
  _UITransformToReasonAssociation *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_UITransformToReasonAssociation initWithTransform:reason:]([_UITransformToReasonAssociation alloc], "initWithTransform:reason:", v6, v5);

  return v7;
}

- (_UITransformToReasonAssociation)initWithTransform:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  _UITransformToReasonAssociation *v9;
  _UITransformToReasonAssociation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UITransformToReasonAssociation;
  v9 = -[_UITransformToReasonAssociation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transform, a3);
    objc_storeStrong((id *)&v10->_reason, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[UITransform hash](self->_transform, "hash");
  return 11 * v3 * -[NSString hash](self->_reason, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _UITransformToReasonAssociation *v4;
  _UITransformToReasonAssociation *v5;
  char v6;

  v4 = (_UITransformToReasonAssociation *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && BSEqualObjects())
    v6 = BSEqualObjects();
  else
LABEL_6:
    v6 = 0;
LABEL_8:

  return v6;
}

- (UITransform)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
  objc_storeStrong((id *)&self->_transform, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_transform, 0);
}

@end
