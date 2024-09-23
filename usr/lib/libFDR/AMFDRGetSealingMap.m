@implementation AMFDRGetSealingMap

void __AMFDRGetSealingMap_block_invoke()
{
  if (!fileSystemSealingMap)
    fileSystemSealingMap = copyFDRSealingMapFromFilesystem();
}

@end
