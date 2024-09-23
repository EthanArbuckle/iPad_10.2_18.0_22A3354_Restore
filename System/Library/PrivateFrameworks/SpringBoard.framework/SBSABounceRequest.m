@implementation SBSABounceRequest

- (SBSABounceRequest)initWithStyle:(int64_t)a3 triggeredBlock:(id)a4
{
  id v6;
  SBSABounceRequest *v7;
  SBSABounceRequest *v8;
  uint64_t v9;
  id triggeredBlock;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSABounceRequest;
  v7 = -[SBSABounceRequest init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_style = a3;
    v9 = objc_msgSend(v6, "copy");
    triggeredBlock = v8->_triggeredBlock;
    v8->_triggeredBlock = (id)v9;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t style;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __29__SBSABounceRequest_isEqual___block_invoke;
  v20[3] = &unk_1E8EA3AB0;
  v8 = v4;
  v21 = v8;
  objc_msgSend(v5, "appendInteger:counterpart:", style, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1D17E5550](self->_triggeredBlock);
  v15 = v7;
  v16 = 3221225472;
  v17 = __29__SBSABounceRequest_isEqual___block_invoke_2;
  v18 = &unk_1E8EA4320;
  v19 = v8;
  v11 = v8;
  objc_msgSend(v9, "appendObject:counterpart:", v10, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual", v15, v16, v17, v18);

  return v13;
}

uint64_t __29__SBSABounceRequest_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "style");
}

uint64_t __29__SBSABounceRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggeredBlock");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendInteger:", self->_style);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1D17E5550](self->_triggeredBlock);
  objc_msgSend(v4, "appendObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  int64_t style;
  id triggeredBlock;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR("up");
  style = self->_style;
  triggeredBlock = self->_triggeredBlock;
  if (style == 1)
    v5 = CFSTR("left");
  if (style == 2)
    v5 = CFSTR("right");
  v8 = v5;
  v9 = (void *)MEMORY[0x1D17E5550](triggeredBlock);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; style: %@, triggeredBlock: %@>"), v4, self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStyle:triggeredBlock:", self->_style, self->_triggeredBlock);
}

- (int64_t)style
{
  return self->_style;
}

- (id)triggeredBlock
{
  return self->_triggeredBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_triggeredBlock, 0);
}

@end
