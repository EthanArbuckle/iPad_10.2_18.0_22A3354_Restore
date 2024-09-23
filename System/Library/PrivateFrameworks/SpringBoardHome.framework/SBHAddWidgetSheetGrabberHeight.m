@implementation SBHAddWidgetSheetGrabberHeight

void ___SBHAddWidgetSheetGrabberHeight_block_invoke()
{
  uint64_t v0;
  id v1;

  v1 = objc_alloc_init(MEMORY[0x1E0DC4190]);
  objc_msgSend(v1, "sizeToFit");
  objc_msgSend(v1, "bounds");
  _SBHAddWidgetSheetGrabberHeight_grabberHeight = v0;

}

@end
