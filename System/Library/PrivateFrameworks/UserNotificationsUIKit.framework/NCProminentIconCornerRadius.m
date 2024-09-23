@implementation NCProminentIconCornerRadius

void __NCProminentIconCornerRadius_block_invoke()
{
  uint64_t v0;
  id v1;

  v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 38.0, 38.0, _NCMainScreenScale());
  objc_msgSend(v1, "continuousCornerRadius");
  NCProminentIconCornerRadius___prominentIconCornerRadius = v0;

}

@end
