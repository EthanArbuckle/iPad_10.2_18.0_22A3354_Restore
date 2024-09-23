@implementation TRAArbitrationDeviceOrientationInputs

- (BOOL)isEqual:(id)a3
{
  TRAArbitrationDeviceOrientationInputs *v4;
  BOOL v5;

  v4 = (TRAArbitrationDeviceOrientationInputs *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TRAArbitrationDeviceOrientationInputs isEqualToDeviceOrientationInputs:](self, "isEqualToDeviceOrientationInputs:", v4);
  }

  return v5;
}

- (BOOL)isEqualToDeviceOrientationInputs:(id)a3
{
  TRAArbitrationDeviceOrientationInputs *v5;
  int64_t currentDeviceOrientation;
  int64_t nonFlatDeviceOrientation;
  BOOL v8;
  void *v10;

  v5 = (TRAArbitrationDeviceOrientationInputs *)a3;
  if (!v5)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAArbitration.m"), 510, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deviceOrientationInputs == nil || [deviceOrientationInputs isKindOfClass:[TRAArbitrationDeviceOrientationInputs class]]"));

  }
  if (self == v5)
  {
    v8 = 1;
    goto LABEL_9;
  }
  currentDeviceOrientation = self->_currentDeviceOrientation;
  if (currentDeviceOrientation == -[TRAArbitrationDeviceOrientationInputs currentDeviceOrientation](v5, "currentDeviceOrientation"))
  {
    nonFlatDeviceOrientation = self->_nonFlatDeviceOrientation;
    v8 = nonFlatDeviceOrientation == -[TRAArbitrationDeviceOrientationInputs nonFlatDeviceOrientation](v5, "nonFlatDeviceOrientation");
  }
  else
  {
LABEL_7:
    v8 = 0;
  }
LABEL_9:

  return v8;
}

- (int64_t)currentDeviceOrientation
{
  return self->_currentDeviceOrientation;
}

- (int64_t)nonFlatDeviceOrientation
{
  return self->_nonFlatDeviceOrientation;
}

- (TRAArbitrationDeviceOrientationInputs)initWithCurrentDeviceOrientation:(int64_t)a3 nonFlatDeviceOrientation:(int64_t)a4
{
  TRAArbitrationDeviceOrientationInputs *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TRAArbitrationDeviceOrientationInputs;
  result = -[TRAArbitrationDeviceOrientationInputs init](&v7, sel_init);
  if (result)
  {
    result->_currentDeviceOrientation = a3;
    result->_nonFlatDeviceOrientation = a4;
  }
  return result;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAArbitrationDeviceOrientationInputs succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  TRAArbitrationDeviceOrientationInputs *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__TRAArbitrationDeviceOrientationInputs_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_251A06D68;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, CFSTR("\t\t"), v7);
  v5 = v4;

  return v5;
}

void __67__TRAArbitrationDeviceOrientationInputs_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  TRAStringForBSDeviceOrientation(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("current"));

  v4 = *(void **)(a1 + 32);
  TRAStringForBSDeviceOrientation(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("nonFlat"));

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAArbitrationDeviceOrientationInputs descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
