@implementation PXCMMActionManager

- (PXCMMActionManager)init
{
  PXCMMActionManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *performerClassByType;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXCMMActionManager;
  v2 = -[PXCMMActionManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    performerClassByType = v2->_performerClassByType;
    v2->_performerClassByType = v3;

  }
  return v2;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[PXCMMActionManager actionPerformerClassForActionType:](self, "actionPerformerClassForActionType:", v4);
  if (v5)
  {
    v6 = (void *)objc_msgSend([v5 alloc], "initWithActionType:", v4);
    -[PXCMMActionManager performerDelegate](self, "performerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v7);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (Class)actionPerformerClassForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXCMMActionManager performerClassByType](self, "performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  return (Class)v6;
}

- (id)publishActionPerformer
{
  return 0;
}

- (id)messageComposeActionPerformer
{
  return 0;
}

- (id)photosPickerActionPerformer
{
  return 0;
}

- (PXCMMActionPerformerDelegate)performerDelegate
{
  return (PXCMMActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_performerDelegate);
}

- (void)setPerformerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_performerDelegate, a3);
}

- (NSMutableDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerClassByType, 0);
  objc_destroyWeak((id *)&self->_performerDelegate);
}

@end
