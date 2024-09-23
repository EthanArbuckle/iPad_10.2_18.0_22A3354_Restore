@implementation PXRenameMemoryAction

- (PXRenameMemoryAction)initWithMemory:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  PXRenameMemoryAction *v22;
  void *v23;
  PXRenameMemoryAction *v24;
  __CFString *obj;
  __CFString *v27;
  id v28;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "canPerformEditOperation:", 7))
  {
    v28 = v10;
    v12 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v9, "localizedTitle");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = &stru_1E5149688;
    obj = v15;
    v16 = v15;

    v17 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v9, "subtitle");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (__CFString *)v18;
    else
      v20 = &stru_1E5149688;
    v21 = v20;

    v27 = v21;
    if (objc_msgSend(v12, "isEqualToString:", v16)
      && (objc_msgSend(v17, "isEqualToString:", v21) & 1) != 0)
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend(v9, "photoLibrary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29.receiver = self;
      v29.super_class = (Class)PXRenameMemoryAction;
      v24 = -[PXPhotosAction initWithPhotoLibrary:](&v29, sel_initWithPhotoLibrary_, v23);

      if (v24)
      {
        objc_storeStrong((id *)&v24->_memory, a3);
        objc_storeStrong((id *)&v24->_redoTitle, v12);
        objc_storeStrong((id *)&v24->_undoTitle, obj);
        objc_storeStrong((id *)&v24->_redoSubtitle, v17);
        objc_storeStrong((id *)&v24->_undoSubtitle, v20);
      }
      self = v24;
      v22 = self;
    }
    v10 = v28;

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)actionIdentifier
{
  return CFSTR("RenameMemory");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXRenameMemoryActionName");
}

- (void)performAction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__PXRenameMemoryAction_performAction___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (void)performUndo:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__PXRenameMemoryAction_performUndo___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (PHMemory)memory
{
  return self->_memory;
}

- (NSString)redoTitle
{
  return self->_redoTitle;
}

- (NSString)undoTitle
{
  return self->_undoTitle;
}

- (NSString)redoSubtitle
{
  return self->_redoSubtitle;
}

- (NSString)undoSubtitle
{
  return self->_undoSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoSubtitle, 0);
  objc_storeStrong((id *)&self->_redoSubtitle, 0);
  objc_storeStrong((id *)&self->_undoTitle, 0);
  objc_storeStrong((id *)&self->_redoTitle, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

void __36__PXRenameMemoryAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CD1640];
  objc_msgSend(*(id *)(a1 + 32), "memory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForMemory:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "undoTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

  objc_msgSend(*(id *)(a1 + 32), "undoSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubtitle:", v5);

}

void __38__PXRenameMemoryAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CD1640];
  objc_msgSend(*(id *)(a1 + 32), "memory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeRequestForMemory:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "redoTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

  objc_msgSend(*(id *)(a1 + 32), "redoSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSubtitle:", v5);

}

@end
