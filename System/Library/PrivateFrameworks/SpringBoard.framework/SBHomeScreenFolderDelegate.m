@implementation SBHomeScreenFolderDelegate

uint64_t __76___SBHomeScreenFolderDelegate_backgroundViewForDockForRootFolderController___block_invoke(uint64_t a1, void *a2)
{
  _BOOL4 v2;

  v2 = objc_msgSend(a2, "userInterfaceStyle") == 2;
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", dbl_1D0E8B090[v2], 0.6);
}

@end
