@implementation NSArray(VideosUICore)

- (id)vui_deepCopy
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", a1, 1);
}

- (uint64_t)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjects:
{
  return objc_msgSend(a1, "vui_arrayByApplyingChangeSet:destinationObjects:updateObjectBlock:", a3, a4, 0);
}

- (id)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjects:updateObjectBlock:
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__NSArray_VideosUICore__vui_arrayByApplyingChangeSet_destinationObjects_updateObjectBlock___block_invoke;
  v12[3] = &unk_1E9F2BD30;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a1, "vui_arrayByApplyingChangeSet:destinationObjectsBlock:updateObjectBlock:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjectsBlock:
{
  return objc_msgSend(a1, "vui_arrayByApplyingChangeSet:destinationObjectsBlock:updateObjectBlock:", a3, a4, 0);
}

- (id)vui_arrayByApplyingChangeSet:()VideosUICore destinationObjectsBlock:updateObjectBlock:
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v11, "vui_applyChangeSet:destinationObjectsBlock:updateObjectBlock:", v10, v9, v8);

  return v11;
}

- (id)vui_arrayByMappingObjectsUsingBlock:()VideosUICore
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __61__NSArray_VideosUICore__vui_arrayByMappingObjectsUsingBlock___block_invoke;
  v13 = &unk_1E9F2BD58;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v10);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
