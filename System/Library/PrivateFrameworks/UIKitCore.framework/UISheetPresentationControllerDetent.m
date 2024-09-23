@implementation UISheetPresentationControllerDetent

- (UISheetPresentationControllerDetentIdentifier)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__internalBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int64_t)_type
{
  return self->__type;
}

+ (UISheetPresentationControllerDetent)largeDetent
{
  return (UISheetPresentationControllerDetent *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:identifier:internalBlock:constant:", 1, CFSTR("com.apple.UIKit.large"), &__block_literal_global_12_8, 0.0);
}

- (UISheetPresentationControllerDetent)initWithType:(int64_t)a3 identifier:(id)a4 internalBlock:(id)a5 constant:(double)a6
{
  id v10;
  id v11;
  UISheetPresentationControllerDetent *v12;
  UISheetPresentationControllerDetent *v13;
  uint64_t v14;
  void *identifier;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *v19;
  void *v20;
  id internalBlock;
  objc_super v23;

  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)UISheetPresentationControllerDetent;
  v12 = -[UISheetPresentationControllerDetent init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->__type = a3;
    if (v10)
    {
      v14 = objc_msgSend(v10, "copy");
      identifier = v13->_identifier;
      v13->_identifier = (NSString *)v14;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("com.apple.UIKit.dynamic.%@"), v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v13->_identifier;
      v13->_identifier = (NSString *)v18;

    }
    v20 = _Block_copy(v11);
    internalBlock = v13->__internalBlock;
    v13->__internalBlock = v20;

    v13->__constant = a6;
  }

  return v13;
}

- (CGFloat)resolvedValueInContext:(id)context
{
  id v4;
  double (**v5)(_QWORD, _QWORD);
  double v6;

  v4 = context;
  -[UISheetPresentationControllerDetent _internalBlock](self, "_internalBlock");
  v5 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = ((double (**)(_QWORD, id))v5)[2](v5, v4);

  return v6;
}

- (id)_internalBlock
{
  return self->__internalBlock;
}

+ (UISheetPresentationControllerDetent)mediumDetent
{
  return (UISheetPresentationControllerDetent *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:identifier:internalBlock:constant:", 2, CFSTR("com.apple.UIKit.medium"), &__block_literal_global_13_8, 0.0);
}

+ (id)_fullDetent
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:identifier:internalBlock:constant:", 3, CFSTR("com.apple.UIKit.full"), &__block_literal_global_15_4, 0.0);
}

+ (UISheetPresentationControllerDetent)customDetentWithIdentifier:(UISheetPresentationControllerDetentIdentifier)identifier resolver:(void *)resolver
{
  void *v6;
  NSString *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = resolver;
  v7 = identifier;
  v8 = objc_alloc((Class)a1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__UISheetPresentationControllerDetent_customDetentWithIdentifier_resolver___block_invoke;
  v12[3] = &unk_1E16E51B0;
  v13 = v6;
  v9 = v6;
  v10 = (void *)objc_msgSend(v8, "initWithType:identifier:internalBlock:constant:", 0, v7, v12, 0.0);

  return (UISheetPresentationControllerDetent *)v10;
}

uint64_t __75__UISheetPresentationControllerDetent_customDetentWithIdentifier_resolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_detentWithIdentifier:(id)a3 constant:(double)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___UISheetDetentInternalBlockForType_block_invoke;
  aBlock[3] = &__block_descriptor_40_e65_d16__0____UISheetPresentationControllerDetentResolutionContext__8l;
  *(double *)&aBlock[4] = a4;
  v8 = _Block_copy(aBlock);
  v9 = (void *)objc_msgSend(v7, "initWithType:identifier:internalBlock:constant:", 4, v6, v8, a4);

  return v9;
}

+ (id)_detentWithResolutionContextBlock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _BYTE *v8;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_detentWithIdentifier:resolutionContextBlock:", v7, v5);
  v8 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  v8[8] = 1;
  return v8;
}

+ (id)_detentWithIdentifier:(id)a3 containerViewBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__UISheetPresentationControllerDetent__detentWithIdentifier_containerViewBlock___block_invoke;
  v12[3] = &unk_1E16E51B0;
  v13 = v6;
  v9 = v6;
  v10 = (void *)objc_msgSend(v8, "initWithType:identifier:internalBlock:constant:", 0, v7, v12, 0.0);

  return v10;
}

double __80__UISheetPresentationControllerDetent__detentWithIdentifier_containerViewBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  double v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "_containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(double (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

+ (id)_detentWithContainerViewBlock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _BYTE *v8;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_detentWithIdentifier:containerViewBlock:", v7, v5);
  v8 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  v8[8] = 1;
  return v8;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  +[UIDescriptionBuilder descriptionBuilderWithObject:](UIDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UISheetPresentationControllerDetent _type](self, "_type") - 1;
  if (v4 > 3)
    v5 = CFSTR("custom");
  else
    v5 = off_1E16E51F8[v4];
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("_type"), v5);
  NSStringFromSelector(sel__identifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendKey:", v7);

  if (-[UISheetPresentationControllerDetent _type](self, "_type") == 4)
  {
    NSStringFromSelector(sel__constant);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v3, "appendKey:", v9);

  }
  objc_msgSend(v3, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[UISheetPresentationControllerDetent _type](self, "_type");
    if (v6 == objc_msgSend(v5, "_type"))
    {
      -[UISheetPresentationControllerDetent identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      if (v9 == v10)
      {

        goto LABEL_10;
      }
      v11 = v10;
      if (v9 && v10)
      {
        v12 = objc_msgSend(v9, "isEqual:", v10);

        if ((v12 & 1) == 0)
          goto LABEL_13;
LABEL_10:
        if (-[UISheetPresentationControllerDetent _type](self, "_type") == 4)
        {
          -[UISheetPresentationControllerDetent _constant](self, "_constant");
          v15 = v14;
          objc_msgSend(v5, "_constant");
          v13 = v15 == v16;
        }
        else
        {
          -[UISheetPresentationControllerDetent _internalBlock](self, "_internalBlock");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "_internalBlock");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v18 == v19;

        }
        goto LABEL_14;
      }

    }
LABEL_13:
    v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (void)_setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (UISheetPresentationControllerDetent)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  UISheetPresentationControllerDetent *v10;
  UISheetPresentationControllerDetent *v11;
  void *v12;
  id internalBlock;
  UISheetPresentationControllerDetent *v14;
  objc_super v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_constant"));
  v8 = v7;

  _UISheetDetentInternalBlockForType(v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)UISheetPresentationControllerDetent;
    v10 = -[UISheetPresentationControllerDetent init](&v16, sel_init);
    v11 = v10;
    if (v10)
    {
      v10->__type = v5;
      objc_storeStrong((id *)&v10->_identifier, v6);
      v12 = _Block_copy(v9);
      internalBlock = v11->__internalBlock;
      v11->__internalBlock = v12;

      v11->__constant = v8;
    }
    self = v11;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (UISheetPresentationControllerDetent)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  UISheetPresentationControllerDetent *v10;
  UISheetPresentationControllerDetent *v11;
  void *v12;
  id internalBlock;
  UISheetPresentationControllerDetent *v14;
  objc_super v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_constant"));
  v8 = v7;

  _UISheetDetentInternalBlockForType(v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)UISheetPresentationControllerDetent;
    v10 = -[UISheetPresentationControllerDetent init](&v16, sel_init);
    v11 = v10;
    if (v10)
    {
      v10->__type = v5;
      objc_storeStrong((id *)&v10->_identifier, v6);
      v12 = _Block_copy(v9);
      internalBlock = v11->__internalBlock;
      v11->__internalBlock = v12;

      v11->__constant = v8;
    }
    self = v11;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = -[UISheetPresentationControllerDetent _type](self, "_type");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISheetPresentationController.m"), 3589, CFSTR("Custom detent %@ is not encodable. Custom detents are not supported for remote view controllers yet. rdar://65243005 (Custom sheet detents for remote view controllers)"), self);

  }
  objc_msgSend(v8, "encodeInteger:forKey:", v5, CFSTR("_type"));
  -[UISheetPresentationControllerDetent identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("_identifier"));

  -[UISheetPresentationControllerDetent _constant](self, "_constant");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("_constant"));

}

- (void)encodeWithBSXPCCoder:(id)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = -[UISheetPresentationControllerDetent _type](self, "_type");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISheetPresentationController.m"), 3598, CFSTR("Custom detent %@ is not encodable. Custom detents are not supported for remote view controllers yet. rdar://65243005 (Custom sheet detents for remote view controllers)"), self);

  }
  objc_msgSend(v8, "encodeInt64:forKey:", v5, CFSTR("_type"));
  -[UISheetPresentationControllerDetent identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("_identifier"));

  -[UISheetPresentationControllerDetent _constant](self, "_constant");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("_constant"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (double)_constant
{
  return self->__constant;
}

- (BOOL)_createdWithDeprecatedInitializer
{
  return self->__createdWithDeprecatedInitializer;
}

@end
