@implementation MSStickerDragPreviewContainerViewClass

Class __get_MSStickerDragPreviewContainerViewClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!qword_1ECD79D40)
    qword_1ECD79D40 = _sl_dlopen();
  result = objc_getClass("_MSStickerDragPreviewContainerView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1ECD79D38 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
