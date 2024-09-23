@implementation PVMotionEffectSceneManagerComponent

- (PVMotionEffectSceneManagerComponent)initWithMotionEffect:(id)a3
{
  id v4;
  PVMotionEffectSceneManagerComponent *v5;
  uint64_t v6;
  NSMutableDictionary *handleToOZID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PVMotionEffectSceneManagerComponent;
  v5 = -[PVMotionEffectComponent initWithMotionEffect:](&v9, sel_initWithMotionEffect_, v4);
  if (v5)
  {
    v6 = objc_opt_new();
    handleToOZID = v5->_handleToOZID;
    v5->_handleToOZID = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (void)add3DObject:(id)a3 handle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__PVMotionEffectSceneManagerComponent_add3DObject_handle___block_invoke;
  v11[3] = &unk_1E64D4E50;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "runEnsuringDocumentReadyAndLockingDocument:", v11);

}

uint64_t __58__PVMotionEffectSceneManagerComponent_add3DObject_handle___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "add3DObject_noLock:handle:documentInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

- (void)deleteObjectsWithHandles:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PVMotionEffectSceneManagerComponent_deleteObjectsWithHandles___block_invoke;
  v7[3] = &unk_1E64D5D28;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v7);

}

uint64_t __64__PVMotionEffectSceneManagerComponent_deleteObjectsWithHandles___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObjects_noLock:documentInfo:", *(_QWORD *)(a1 + 40), a2);
}

- (id)handleForOZID:(unsigned int)a3
{
  NSMutableDictionary *handleToOZID;
  void *v4;
  void *v5;
  void *v6;

  handleToOZID = self->_handleToOZID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeysForObject:](handleToOZID, "allKeysForObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)handleToOZID
{
  return self->_handleToOZID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleToOZID, 0);
}

@end
