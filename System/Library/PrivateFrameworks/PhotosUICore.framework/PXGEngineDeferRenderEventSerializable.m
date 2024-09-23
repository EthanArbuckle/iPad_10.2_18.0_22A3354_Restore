@implementation PXGEngineDeferRenderEventSerializable

- (PXGEngineDeferRenderEventSerializable)initWithSerializableObject:(id)a3
{
  id v4;
  PXGEngineDeferRenderEventSerializable *v5;
  id v6;
  id v7;
  char v8;
  void *v9;
  id v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXGEngineDeferRenderEventSerializable;
  v5 = -[PXGEngineDeferRenderEventSerializable init](&v12, sel_init);
  if (v5)
  {
    v6 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shouldDeferRenderUntilNextFrame"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    v5->_shouldDeferRenderUntilNextFrame = v8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("delegateAllowsRender"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    LOBYTE(v9) = objc_msgSend(v10, "BOOLValue");

    v5->_delegateAllowsRender = (char)v9;
  }

  return v5;
}

- (id)createSerializableObject
{
  _BOOL8 v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("shouldDeferRenderUntilNextFrame");
  v3 = -[PXGEngineDeferRenderEventSerializable shouldDeferRenderUntilNextFrame](self, "shouldDeferRenderUntilNextFrame");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("delegateAllowsRender");
  v10[0] = v4;
  v5 = -[PXGEngineDeferRenderEventSerializable delegateAllowsRender](self, "delegateAllowsRender");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldDeferRenderUntilNextFrame
{
  return self->_shouldDeferRenderUntilNextFrame;
}

- (void)setShouldDeferRenderUntilNextFrame:(BOOL)a3
{
  self->_shouldDeferRenderUntilNextFrame = a3;
}

- (BOOL)delegateAllowsRender
{
  return self->_delegateAllowsRender;
}

- (void)setDelegateAllowsRender:(BOOL)a3
{
  self->_delegateAllowsRender = a3;
}

@end
