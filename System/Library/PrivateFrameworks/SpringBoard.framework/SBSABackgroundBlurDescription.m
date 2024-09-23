@implementation SBSABackgroundBlurDescription

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  CGSize size;

  result = objc_alloc_init((Class)objc_opt_class());
  *((_BYTE *)result + 8) = self->_blurHidden;
  size = self->_blurFrame.size;
  *((_OWORD *)result + 1) = self->_blurFrame.origin;
  *((CGSize *)result + 2) = size;
  return result;
}

- (NSUUID)interfaceElementIdentifier
{
  if (interfaceElementIdentifier___onceToken != -1)
    dispatch_once(&interfaceElementIdentifier___onceToken, &__block_literal_global_410);
  return (NSUUID *)(id)interfaceElementIdentifier___backgroundBlurInterfaceElementUUID;
}

- (BOOL)isBlurHidden
{
  return self->_blurHidden;
}

- (CGRect)blurFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_blurFrame.origin.x;
  y = self->_blurFrame.origin.y;
  width = self->_blurFrame.size.width;
  height = self->_blurFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)copyBySettingBlurHidden:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SBSABackgroundBlurDescription_copyBySettingBlurHidden___block_invoke;
  v4[3] = &__block_descriptor_33_e46_v16__0__SBSABackgroundBlurDescriptionMutator_8l;
  v5 = a3;
  return -[SBSABackgroundBlurDescription copyWithBlock:](self, "copyWithBlock:", v4);
}

- (id)copyBySettingBlurFrame:(CGRect)a3
{
  _QWORD v4[4];
  CGRect v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SBSABackgroundBlurDescription_copyBySettingBlurFrame___block_invoke;
  v4[3] = &__block_descriptor_64_e46_v16__0__SBSABackgroundBlurDescriptionMutator_8l;
  v5 = a3;
  return -[SBSABackgroundBlurDescription copyWithBlock:](self, "copyWithBlock:", v4);
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSABackgroundBlurDescription copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithBackgroundBlurDescription:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

uint64_t __57__SBSABackgroundBlurDescription_copyBySettingBlurHidden___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBlurHidden:", *(unsigned __int8 *)(a1 + 32));
}

uint64_t __56__SBSABackgroundBlurDescription_copyBySettingBlurFrame___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setBlurFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_setBlurHidden:(BOOL)a3
{
  self->_blurHidden = a3;
}

- (void)_setBlurFrame:(CGRect)a3
{
  self->_blurFrame = a3;
}

void __59__SBSABackgroundBlurDescription_interfaceElementIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)interfaceElementIdentifier___backgroundBlurInterfaceElementUUID;
  interfaceElementIdentifier___backgroundBlurInterfaceElementUUID = v0;

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

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 blurHidden;
  uint64_t v7;
  id v8;
  void *v9;
  double x;
  double y;
  double width;
  double height;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  blurHidden = self->_blurHidden;
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __41__SBSABackgroundBlurDescription_isEqual___block_invoke;
  v22[3] = &unk_1E8EA3E78;
  v8 = v4;
  v23 = v8;
  objc_msgSend(v5, "appendBool:counterpart:", blurHidden, v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  v18 = 3221225472;
  v19 = __41__SBSABackgroundBlurDescription_isEqual___block_invoke_2;
  v20 = &unk_1E8EA6AD8;
  v21 = v8;
  x = self->_blurFrame.origin.x;
  y = self->_blurFrame.origin.y;
  width = self->_blurFrame.size.width;
  height = self->_blurFrame.size.height;
  v14 = v8;
  objc_msgSend(v9, "appendCGRect:counterpart:", &v17, x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v15, "isEqual", v17, v18, v19, v20);

  return v7;
}

uint64_t __41__SBSABackgroundBlurDescription_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isBlurHidden");
}

uint64_t __41__SBSABackgroundBlurDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "blurFrame");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBool:", self->_blurHidden);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCGRect:", self->_blurFrame.origin.x, self->_blurFrame.origin.y, self->_blurFrame.size.width, self->_blurFrame.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  return v6;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_blurFrame);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; blurHidden: %@; blurFrame: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

@end
