@implementation UITextAttachmentInteractionHandler

void __70___UITextAttachmentInteractionHandler__defaultMenuForInteractableItem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v1);

}

void __70___UITextAttachmentInteractionHandler__defaultMenuForInteractableItem__block_invoke_2(uint64_t a1)
{
  UIImageWriteToSavedPhotosAlbum(*(UIImage **)(a1 + 32), 0, 0, 0);
}

@end
