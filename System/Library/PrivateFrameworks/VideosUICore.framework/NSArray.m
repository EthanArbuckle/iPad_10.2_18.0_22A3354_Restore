@implementation NSArray

uint64_t __91__NSArray_VideosUICore__vui_arrayByApplyingChangeSet_destinationObjects_updateObjectBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectsAtIndexes:", a2);
}

void __61__NSArray_VideosUICore__vui_arrayByMappingObjectsUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);
    v2 = v3;
  }

}

@end
