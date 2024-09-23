@implementation SBSAViewDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceElementIdentifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithViewDescription:", self);
}

- (SBSAViewDescription)initWithViewDescription:(id)a3
{
  id v4;
  SBSAViewDescription *v5;
  uint64_t v6;
  NSUUID *interfaceElementIdentifier;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBSAViewDescription;
  v5 = -[SBSAViewDescription init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "interfaceElementIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    interfaceElementIdentifier = v5->_interfaceElementIdentifier;
    v5->_interfaceElementIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "center");
    v5->_center.x = v8;
    v5->_center.y = v9;
    objc_msgSend(v4, "bounds");
    v5->_bounds.origin.x = v10;
    v5->_bounds.origin.y = v11;
    v5->_bounds.size.width = v12;
    v5->_bounds.size.height = v13;
    objc_msgSend(v4, "cornerRadius");
    v5->_cornerRadius = v14;
    objc_msgSend(v4, "alpha");
    v5->_alpha = v15;
    objc_msgSend(v4, "scale");
    v5->_scale.width = v16;
    v5->_scale.height = v17;
    objc_msgSend(v4, "boundsVelocity");
    v5->_boundsVelocity.origin.x = v18;
    v5->_boundsVelocity.origin.y = v19;
    v5->_boundsVelocity.size.width = v20;
    v5->_boundsVelocity.size.height = v21;
  }

  return v5;
}

- (NSUUID)interfaceElementIdentifier
{
  return self->_interfaceElementIdentifier;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGSize)scale
{
  double width;
  double height;
  CGSize result;

  width = self->_scale.width;
  height = self->_scale.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)alpha
{
  return self->_alpha;
}

- (CGRect)boundsVelocity
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundsVelocity.origin.x;
  y = self->_boundsVelocity.origin.y;
  width = self->_boundsVelocity.size.width;
  height = self->_boundsVelocity.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)copyByPixelAligningGeometryWithScale:(double)a3
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__SBSAViewDescription_copyByPixelAligningGeometryWithScale___block_invoke;
  v4[3] = &unk_1E8EA2CC8;
  v4[4] = self;
  v4[5] = a2;
  *(double *)&v4[6] = a3;
  return -[SBSAViewDescription copyWithBlock:](self, "copyWithBlock:", v4);
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSAViewDescription copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithViewDescription:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

void __60__SBSAViewDescription_copyByPixelAligningGeometryWithScale___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = NSClassFromString(CFSTR("SBSAViewDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAViewDescription.m"), 64, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "center");
  SBUnintegralizedRectCenteredAboutPoint();
  UIRectRoundToScale();
  BSRectWithSize();
  objc_msgSend(v6, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");

}

- (void)_setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (void)_setInterfaceElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)_setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)_setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void)_setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void)_setScale:(CGSize)a3
{
  self->_scale = a3;
}

- (void)_setBoundsVelocity:(CGRect)a3
{
  self->_boundsVelocity = a3;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *interfaceElementIdentifier;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double cornerRadius;
  id v14;
  void *v15;
  double alpha;
  id v17;
  void *v18;
  id v19;
  void *v20;
  double x;
  double y;
  double width;
  double height;
  id v25;
  void *v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  interfaceElementIdentifier = self->_interfaceElementIdentifier;
  v6 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __31__SBSAViewDescription_isEqual___block_invoke;
  v41[3] = &unk_1E8EA4320;
  v7 = v4;
  v42 = v7;
  objc_msgSend(v28, "appendObject:counterpart:", interfaceElementIdentifier, v41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v6;
  v39[1] = 3221225472;
  v39[2] = __31__SBSAViewDescription_isEqual___block_invoke_2;
  v39[3] = &unk_1E8E9EA78;
  v9 = v7;
  v40 = v9;
  objc_msgSend(v8, "appendCGPoint:counterpart:", v39, self->_center.x, self->_center.y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v6;
  v37[1] = 3221225472;
  v37[2] = __31__SBSAViewDescription_isEqual___block_invoke_3;
  v37[3] = &unk_1E8EA6AD8;
  v11 = v9;
  v38 = v11;
  objc_msgSend(v10, "appendCGRect:counterpart:", v37, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  cornerRadius = self->_cornerRadius;
  v35[0] = v6;
  v35[1] = 3221225472;
  v35[2] = __31__SBSAViewDescription_isEqual___block_invoke_4;
  v35[3] = &unk_1E8EA8460;
  v14 = v11;
  v36 = v14;
  objc_msgSend(v12, "appendCGFloat:counterpart:", v35, cornerRadius);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  alpha = self->_alpha;
  v33[0] = v6;
  v33[1] = 3221225472;
  v33[2] = __31__SBSAViewDescription_isEqual___block_invoke_5;
  v33[3] = &unk_1E8EA8460;
  v17 = v14;
  v34 = v17;
  objc_msgSend(v15, "appendCGFloat:counterpart:", v33, alpha);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v6;
  v31[1] = 3221225472;
  v31[2] = __31__SBSAViewDescription_isEqual___block_invoke_6;
  v31[3] = &unk_1E8EB5E60;
  v19 = v17;
  v32 = v19;
  objc_msgSend(v18, "appendCGSize:counterpart:", v31, self->_scale.width, self->_scale.height);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v29[1] = 3221225472;
  v29[2] = __31__SBSAViewDescription_isEqual___block_invoke_7;
  v29[3] = &unk_1E8EA6AD8;
  v30 = v19;
  x = self->_boundsVelocity.origin.x;
  y = self->_boundsVelocity.origin.y;
  width = self->_boundsVelocity.size.width;
  height = self->_boundsVelocity.size.height;
  v25 = v19;
  objc_msgSend(v20, "appendCGRect:counterpart:", v29, x, y, width, height);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v26, "isEqual");

  return (char)v19;
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interfaceElementIdentifier");
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "center");
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bounds");
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "alpha");
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scale");
}

uint64_t __31__SBSAViewDescription_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "boundsVelocity");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_interfaceElementIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCGPoint:", self->_center.x, self->_center.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendCGRect:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendCGFloat:", self->_cornerRadius);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendCGSize:", self->_scale.width, self->_scale.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendCGRect:", self->_boundsVelocity.origin.x, self->_boundsVelocity.origin.y, self->_boundsVelocity.size.width, self->_boundsVelocity.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSUUID *interfaceElementIdentifier;
  void *v6;
  void *v7;
  double cornerRadius;
  double alpha;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  interfaceElementIdentifier = self->_interfaceElementIdentifier;
  NSStringFromCGPoint(self->_center);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_bounds);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  cornerRadius = self->_cornerRadius;
  alpha = self->_alpha;
  NSStringFromCGSize(self->_scale);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_boundsVelocity);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; interfaceElementIdentifier: %@; center: %@; bounds: %@; cornerRadius: %f; alpha: %f; scale: %@; boundsVelocity: %@>"),
    v4,
    self,
    interfaceElementIdentifier,
    v6,
    v7,
    *(_QWORD *)&cornerRadius,
    *(_QWORD *)&alpha,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

@end
