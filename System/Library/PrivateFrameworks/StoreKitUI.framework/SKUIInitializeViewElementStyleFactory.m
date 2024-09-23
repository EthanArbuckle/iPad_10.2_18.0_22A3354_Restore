@implementation SKUIInitializeViewElementStyleFactory

uint64_t __SKUIInitializeViewElementStyleFactory_block_invoke()
{
  objc_msgSend(MEMORY[0x1E0D3A780], "registerStyle:withType:inherited:", CFSTR("itml-lockup-min-width"), 1, 0);
  objc_msgSend(MEMORY[0x1E0D3A780], "registerStyle:withType:inherited:", CFSTR("itml-shelf-layout"), 3, 0);
  objc_msgSend(MEMORY[0x1E0D3A780], "registerStyle:withType:inherited:", CFSTR("itml-shelf-zooming-layout-peeking-item-width"), 1, 0);
  objc_msgSend(MEMORY[0x1E0D3A780], "registerStyle:withType:inherited:", CFSTR("itml-shelf-zooming-layout-inter-item-spacing"), 1, 0);
  objc_msgSend(MEMORY[0x1E0D3A780], "registerStyle:withType:inherited:", CFSTR("itml-shelf-zooming-layout-item-width"), 1, 0);
  objc_msgSend(MEMORY[0x1E0D3A780], "registerStyle:withType:inherited:", CFSTR("itml-shelf-zooming-layout-zoomed-item-width"), 1, 0);
  objc_msgSend(MEMORY[0x1E0D3A780], "registerStyle:withType:inherited:", CFSTR("itml-shelf-zooming-layout-element-placement"), 3, 0);
  return objc_msgSend(MEMORY[0x1E0D3A780], "registerStyle:withType:inherited:", CFSTR("itml-segmented-control-width"), 3, 0);
}

@end
